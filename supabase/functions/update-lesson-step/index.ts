// ============================================================
// update-lesson-step — Supabase Edge Function
// ============================================================
// Qué hace: guarda en qué parte de una lección multi-paso va el
// estudiante (para que, si cierra el navegador, retome donde se
// quedó) — SOLO para los pasos de lectura/navegación que no
// requieren calificación (bienvenida, lecturas, interactivo,
// práctica). Los pasos que sí califican (quiz_readings,
// quiz_interactive) los avanza submit-quiz, y el cierre (done) lo
// avanza submit-closing-form.
//
// Por seguridad, solo permite avanzar UN paso a la vez desde el
// paso actual guardado (no se puede "saltar" pasos llamando esta
// función directamente) — retroceder para repasar no necesita
// guardarse, así que el navegador lo maneja localmente sin llamar
// a esta función.
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

// Orden fijo de los pasos de una lección multi-paso.
const STEP_ORDER = [
  "welcome",
  "reading1",
  "reading2",
  "quiz_readings",
  "interactive",
  "quiz_interactive",
  "practice",
  "closing",
  "done",
];

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
    const newStep = body.step as string;

    if (!enrollmentId || !moduleId || !STEP_ORDER.includes(newStep)) {
      return json({ error: "Paso inválido" }, 400);
    }

    const { data: enrollment } = await supabaseAdmin
      .from("enrollments")
      .select("id, user_id")
      .eq("id", enrollmentId)
      .maybeSingle();

    if (!enrollment || enrollment.user_id !== userId) {
      return json({ error: "Esa matrícula no te pertenece" }, 403);
    }

    const { data: progressRow } = await supabaseAdmin
      .from("progress")
      .select("id, unlocked, current_step")
      .eq("enrollment_id", enrollmentId)
      .eq("module_id", moduleId)
      .maybeSingle();

    if (!progressRow) return json({ error: "Módulo no encontrado en tu matrícula" }, 404);
    if (!progressRow.unlocked) return json({ error: "Este módulo todavía está bloqueado" }, 403);

    const currentIndex = STEP_ORDER.indexOf(progressRow.current_step || "welcome");
    const newIndex = STEP_ORDER.indexOf(newStep);

    // Solo se permite avanzar un paso a la vez, o quedarse en el mismo
    // (retroceder para repasar no se guarda en el servidor).
    if (newIndex > currentIndex + 1) {
      return json({ error: "No puedes saltar pasos de la lección" }, 403);
    }
    if (newIndex <= currentIndex) {
      return json({ ok: true, current_step: progressRow.current_step });
    }

    await supabaseAdmin.from("progress").update({ current_step: newStep }).eq("id", progressRow.id);

    return json({ ok: true, current_step: newStep });
  } catch (err) {
    return json({ error: "Error inesperado: " + String(err) }, 500);
  }
});
