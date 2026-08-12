// ============================================================
// submit-quiz — Supabase Edge Function
// ============================================================
// Qué hace: recibe las respuestas de un estudiante a un cuestionario,
// las califica en el servidor (nunca en el navegador, para que nadie
// pueda ver las respuestas correctas antes de contestar) y guarda el
// intento.
//
// Ahora soporta DOS formatos de módulo:
//
//   FORMATO ANTIGUO (stage = "main", el de siempre): si aprueba
//   (nota >= passing_score), marca el módulo como completado y
//   desbloquea el siguiente módulo del curso. Igual que antes.
//
//   FORMATO NUEVO (lección multi-paso, stage = "readings" o
//   "interactive"): el módulo tiene DOS cuestionarios. Aprobar uno
//   solo avanza el "current_step" del estudiante (a la lección
//   interactiva o a la lectura de práctica) — el módulo se marca
//   completado y se desbloquea el siguiente SOLO cuando el
//   estudiante llena el formulario de cierre (Edge Function
//   submit-closing-form), habiendo aprobado ambos cuestionarios.
//
// El body que manda el navegador ahora acepta un campo opcional
// "stage" ("readings" | "interactive"). Si no lo manda, se usa "main"
// (así los módulos viejos, que no lo envían, siguen funcionando igual).
//
// Devuelve, por cada pregunta: si acertó, cuál era la opción correcta
// y la retroalimentación de por qué — así el estudiante entiende su
// error y puede volver a intentarlo con más criterio.
//
// Secrets que necesita (ya deberían estar configurados desde el
// despliegue de epayco-webhook — se comparten en el mismo proyecto):
//   SUPABASE_URL
//   SUPABASE_SERVICE_ROLE_KEY
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

// Después de aprobar cada etapa del formato nuevo, a qué "current_step"
// avanza el estudiante.
const NEXT_STEP_AFTER_STAGE: Record<string, string> = {
  readings: "interactive",
  interactive: "practice",
};

serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return json({ error: "Método no permitido" }, 405);

  try {
    // 1. Identificar al estudiante que llama
    const authHeader = req.headers.get("Authorization") ?? "";
    const token = authHeader.replace("Bearer ", "");
    if (!token) return json({ error: "No autenticado" }, 401);

    const { data: userData, error: userError } = await supabaseAdmin.auth.getUser(token);
    if (userError || !userData?.user) return json({ error: "Sesión inválida" }, 401);
    const userId = userData.user.id;

    // 2. Leer lo que mandó el navegador
    const body = await req.json();
    const enrollmentId = body.enrollment_id as string;
    const moduleId = body.module_id as string;
    const stage = (body.stage as string) || "main";
    const answers = (body.answers ?? []) as { question_id: string; choice_id?: string; text_answer?: string }[];

    if (!enrollmentId || !moduleId || !Array.isArray(answers) || answers.length === 0) {
      return json({ error: "Faltan datos para calificar el cuestionario" }, 400);
    }
    if (!["main", "readings", "interactive"].includes(stage)) {
      return json({ error: "Etapa de cuestionario inválida" }, 400);
    }

    // 3. Confirmar que la matrícula es realmente del estudiante que llama
    const { data: enrollment } = await supabaseAdmin
      .from("enrollments")
      .select("id, user_id, course_id")
      .eq("id", enrollmentId)
      .maybeSingle();

    if (!enrollment || enrollment.user_id !== userId) {
      return json({ error: "Esa matrícula no te pertenece" }, 403);
    }

    // 4. Confirmar que el módulo está desbloqueado
    const { data: progressRow } = await supabaseAdmin
      .from("progress")
      .select("id, unlocked, completed, current_step")
      .eq("enrollment_id", enrollmentId)
      .eq("module_id", moduleId)
      .maybeSingle();

    if (!progressRow) return json({ error: "Módulo no encontrado en tu matrícula" }, 404);
    if (!progressRow.unlocked) return json({ error: "Este módulo todavía está bloqueado" }, 403);

    // 5. Buscar el cuestionario de esta etapa del módulo
    const { data: quiz } = await supabaseAdmin
      .from("quizzes")
      .select("id, title, passing_score, is_final, max_attempts, cooldown_hours")
      .eq("module_id", moduleId)
      .eq("stage", stage)
      .maybeSingle();

    if (!quiz) return json({ error: "Este módulo no tiene cuestionario configurado para esta etapa" }, 404);

    // 6. Revisar límite de intentos (solo aplica si max_attempts no es null —
    // los cuestionarios de módulo normales son ilimitados)
    const { data: previousAttempts } = await supabaseAdmin
      .from("quiz_attempts")
      .select("attempt_number, created_at")
      .eq("enrollment_id", enrollmentId)
      .eq("quiz_id", quiz.id)
      .order("attempt_number", { ascending: false });

    const attemptsSoFar = previousAttempts?.length ?? 0;
    const nextAttemptNumber = attemptsSoFar + 1;

    if (quiz.max_attempts !== null && quiz.max_attempts !== undefined) {
      if (nextAttemptNumber > quiz.max_attempts) {
        return json(
          {
            error: `Ya usaste tus ${quiz.max_attempts} intentos para este examen. Escríbenos desde "¿Necesitas ayuda?" en tu Campus si necesitas otra oportunidad.`,
          },
          403
        );
      }
      // Espera obligatoria antes del último intento permitido
      if (nextAttemptNumber === quiz.max_attempts && quiz.cooldown_hours > 0 && previousAttempts && previousAttempts[0]) {
        const last = new Date(previousAttempts[0].created_at).getTime();
        const hoursSince = (Date.now() - last) / (1000 * 60 * 60);
        if (hoursSince < quiz.cooldown_hours) {
          const faltan = Math.ceil(quiz.cooldown_hours - hoursSince);
          return json(
            { error: `Para tu último intento debes esperar ${faltan} hora(s) más desde tu intento anterior.` },
            403
          );
        }
      }
    }

    // 7. Traer preguntas y opciones REALES (con is_correct y feedback)
    const { data: questions } = await supabaseAdmin
      .from("quiz_questions")
      .select("id, order_index, prompt, answer_type")
      .eq("quiz_id", quiz.id)
      .order("order_index");

    const { data: choices } = await supabaseAdmin
      .from("quiz_choices")
      .select("id, question_id, choice_text, is_correct, feedback")
      .in("question_id", (questions ?? []).map((q) => q.id));

    const { data: textAnswers } = await supabaseAdmin
      .from("quiz_text_answers")
      .select("question_id, accepted_answers, feedback")
      .in("question_id", (questions ?? []).map((q) => q.id));

    if (!questions || questions.length === 0) {
      return json({ error: "Este cuestionario no tiene preguntas todavía" }, 404);
    }

    // 8. Calificar — dos tipos de pregunta:
    //   "choice": igual que siempre, se compara el choice_id elegido.
    //   "text": el estudiante escribió una palabra; se compara sin
    //           mayúsculas ni espacios extra contra la lista de
    //           respuestas aceptadas (por si hay variantes válidas,
    //           ej. "colour"/"color").
    let correctCount = 0;
    const feedback = questions.map((q) => {
      const chosen = answers.find((a) => a.question_id === q.id);

      if (q.answer_type === "text") {
        const textConfig = (textAnswers ?? []).find((t) => t.question_id === q.id);
        const accepted = (textConfig?.accepted_answers ?? []).map((a) => a.trim().toLowerCase());
        const given = (chosen?.text_answer ?? "").trim().toLowerCase();
        const isCorrect = given.length > 0 && accepted.includes(given);
        if (isCorrect) correctCount++;

        return {
          question_id: q.id,
          prompt: q.prompt,
          answer_type: "text",
          given_text_answer: chosen?.text_answer ?? "",
          correct_text_answer: textConfig?.accepted_answers?.[0] ?? null,
          is_correct: isCorrect,
          feedback: textConfig?.feedback ?? (isCorrect ? "¡Correcto!" : `La respuesta correcta era: "${textConfig?.accepted_answers?.[0] ?? ""}"`),
        };
      }

      const questionChoices = (choices ?? []).filter((c) => c.question_id === q.id);
      const correctChoice = questionChoices.find((c) => c.is_correct);
      const chosenChoice = questionChoices.find((c) => c.id === chosen?.choice_id);
      const isCorrect = !!chosenChoice?.is_correct;
      if (isCorrect) correctCount++;

      return {
        question_id: q.id,
        prompt: q.prompt,
        answer_type: "choice",
        chosen_choice_id: chosenChoice?.id ?? null,
        correct_choice_id: correctChoice?.id ?? null,
        correct_choice_text: correctChoice?.choice_text ?? null,
        is_correct: isCorrect,
        feedback: chosenChoice?.feedback ?? correctChoice?.feedback ?? "",
      };
    });

    const score = Math.round((correctCount / questions.length) * 100);
    const passed = score >= quiz.passing_score;

    // 9. Guardar el intento
    await supabaseAdmin.from("quiz_attempts").insert({
      enrollment_id: enrollmentId,
      quiz_id: quiz.id,
      attempt_number: nextAttemptNumber,
      score,
      passed,
      answers: feedback,
    });

    let nextModuleUnlocked = false;
    let nextStep: string | null = null;

    if (passed && stage === "main") {
      // ---- Formato antiguo: aprobar el único cuestionario completa el módulo ----
      await supabaseAdmin
        .from("progress")
        .update({ completed: true, completed_at: new Date().toISOString(), grade: score, current_step: "done" })
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
            message: `¡Aprobaste con ${score}/100! Ya desbloqueaste el siguiente módulo.`,
          });
        } else {
          await supabaseAdmin.from("notifications").insert({
            user_id: userId,
            message: `¡Felicitaciones! Completaste todo el curso con ${score}/100 en el último módulo. Tu certificado ya está disponible.`,
          });
        }
      }
    } else if (passed && (stage === "readings" || stage === "interactive")) {
      // ---- Formato nuevo: solo avanza el paso; el módulo se cierra con
      // el formulario de cierre (submit-closing-form) ----
      nextStep = NEXT_STEP_AFTER_STAGE[stage];
      await supabaseAdmin
        .from("progress")
        .update({ current_step: nextStep })
        .eq("id", progressRow.id);
    }

    const attemptsLeft =
      quiz.max_attempts !== null && quiz.max_attempts !== undefined
        ? Math.max(quiz.max_attempts - nextAttemptNumber, 0)
        : null;

    return json({
      ok: true,
      score,
      passed,
      passing_score: quiz.passing_score,
      attempt_number: nextAttemptNumber,
      attempts_left: attemptsLeft,
      next_module_unlocked: nextModuleUnlocked,
      next_step: nextStep,
      stage,
      feedback,
    });
  } catch (err) {
    return json({ error: "Error inesperado: " + String(err) }, 500);
  }
});
