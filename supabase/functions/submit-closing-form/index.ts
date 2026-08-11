// ============================================================
// submit-closing-form — Supabase Edge Function
// ============================================================
// Qué hace: guarda el formulario de cierre de una lección nueva
// (multi-paso) — donde el estudiante recopila lo aprendido — y,
// SI ya aprobó los dos cuestionarios del módulo (lecturas +
// interactivo), marca el módulo como completado y desbloquea el
// siguiente, igual que hacía submit-quiz en el formato antiguo.
//
// Solo aplica a módulos del formato nuevo (con dos quizzes: stage
// "readings" y stage "interactive"). Si el módulo no tiene ambas
// etapas, devuelve error — para esos módulos, submit-quiz con
// stage "main" ya completa el módulo directamente.
//
// Secrets: SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY (compartidos).
// ============================================================

import { serve } from "https://deno.land/std@0.203.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const supabaseAdmin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return json({ error: "Método no permitido" }, 405);

  try {
    const authHeader = req.headers.get("Authorization") ?? "";
    const token = authHeader.replace("Bearer ", "");
    if (!token) return json({ error: "No autenticado" }, 401);

    const { data: userData, error: userError } = await supabaseAdmin.auth.getUser(token);
    if (userError || !userData?.user) return json({ error: "Sesión inválida" }, 401);
    const userId = userData.user.id;

    const body = await req.json();
    const enrollmentId = body.enrollment_id as string;
    const moduleId = body.module_id as string;
    const answers = body.answers ?? {};

    if (!enrollmentId || !moduleId || typeof answers !== "object") {
      return json({ error: "Faltan datos del formulario de cierre" }, 400);
    }

    const { data: enrollment } = await supabaseAdmin
      .from("enrollments")
      .select("id, user_id, course_id")
      .eq("id", enrollmentId)
      .maybeSingle();

    if (!enrollment || enrollment.user_id !== userId) {
      return json({ error: "Esa matrícula no te pertenece" }, 403);
    }

    const { data: progressRow } = await supabaseAdmin
      .from("progress")
      .select("id, unlocked, completed")
      .eq("enrollment_id", enrollmentId)
      .eq("module_id", moduleId)
      .maybeSingle();

    if (!progressRow) return json({ error: "Módulo no encontrado en tu matrícula" }, 404);
    if (!progressRow.unlocked) return json({ error: "Este módulo todavía está bloqueado" }, 403);

    // Confirmar que el módulo es del formato nuevo (tiene los dos quizzes)
    const { data: quizzes } = await supabaseAdmin
      .from("quizzes")
      .select("id, stage, passing_score")
      .eq("module_id", moduleId)
      .in("stage", ["readings", "interactive"]);

    const readingsQuiz = quizzes?.find((q) => q.stage === "readings");
    const interactiveQuiz = quizzes?.find((q) => q.stage === "interactive");

    if (!readingsQuiz || !interactiveQuiz) {
      return json({ error: "Este módulo no usa el formulario de cierre (formato antiguo)" }, 400);
    }

    // Confirmar que aprobó AMBOS cuestionarios (el intento más reciente de cada uno)
    async function lastPassedScore(quizId: string): Promise<number | null> {
      const { data } = await supabaseAdmin
        .from("quiz_attempts")
        .select("score, passed")
        .eq("enrollment_id", enrollmentId)
        .eq("quiz_id", quizId)
        .order("attempt_number", { ascending: false })
        .limit(1)
        .maybeSingle();
      return data?.passed ? data.score : null;
    }

    const readingsScore = await lastPassedScore(readingsQuiz.id);
    const interactiveScore = await lastPassedScore(interactiveQuiz.id);

    if (readingsScore === null || interactiveScore === null) {
      return json(
        { error: "Todavía debes aprobar los dos cuestionarios de esta lección antes de cerrar el módulo." },
        403
      );
    }

    // Guardar (o reemplazar) el formulario de cierre
    await supabaseAdmin
      .from("closing_reflections")
      .upsert(
        { enrollment_id: enrollmentId, module_id: moduleId, answers },
        { onConflict: "enrollment_id,module_id" }
      );

    const finalGrade = Math.round((readingsScore + interactiveScore) / 2);

    let nextModuleUnlocked = false;

    if (!progressRow.completed) {
      await supabaseAdmin
        .from("progress")
        .update({
          completed: true,
          completed_at: new Date().toISOString(),
          grade: finalGrade,
          current_step: "done",
          closing_submitted: true,
        })
        .eq("id", progressRow.id);

      const { data: currentModule } = await supabaseAdmin
        .from("modules")
        .select("order_index, course_id")
        .eq("id", moduleId)
        .maybeSingle();

      if (currentModule) {
        const { data: nextModule } = await supabaseAdmin
          .from("modules")
          .select("id")
          .eq("course_id", currentModule.course_id)
          .gt("order_index", currentModule.order_index)
          .order("order_index")
          .limit(1)
          .maybeSingle();

        if (nextModule) {
          await supabaseAdmin
            .from("progress")
            .update({ unlocked: true })
            .eq("enrollment_id", enrollmentId)
            .eq("module_id", nextModule.id);
          nextModuleUnlocked = true;

          await supabaseAdmin.from("notifications").insert({
            user_id: userId,
            message: `¡Completaste la lección con ${finalGrade}/100! Ya desbloqueaste el siguiente módulo.`,
          });
        } else {
          await supabaseAdmin.from("notifications").insert({
            user_id: userId,
            message: `¡Felicitaciones! Completaste todo el curso con ${finalGrade}/100 en el último módulo. Tu certificado ya está disponible.`,
          });
        }
      }
    } else {
      await supabaseAdmin
        .from("progress")
        .update({ closing_submitted: true, current_step: "done" })
        .eq("id", progressRow.id);
    }

    return json({
      ok: true,
      grade: finalGrade,
      next_module_unlocked: nextModuleUnlocked,
    });
  } catch (err) {
    return json({ error: "Error inesperado: " + String(err) }, 500);
  }
});
