// ============================================================
// admin-reset-quiz-attempts — Supabase Edge Function
// ============================================================
// Qué hace: le devuelve a un estudiante puntual la posibilidad de
// volver a presentar un cuestionario (especialmente los que tienen
// max_attempts limitado, como los exámenes finales) borrando su
// historial de intentos para ese quiz. Solo la puede llamar un
// administrador, y solo afecta al estudiante/quiz que el admin elija
// explícitamente desde el panel — pensado para casos como "se le fue
// el internet a mitad del examen" o "reprodujo el quiz por accidente".
//
// No toca el progreso ya aprobado de otros cuestionarios ni
// desbloquea nada por su cuenta — solo borra quiz_attempts, así que
// el próximo intento del estudiante cuenta como el intento #1 otra vez.
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
    // 1. Verificar que quien llama es administrador
    const authHeader = req.headers.get("Authorization") ?? "";
    const token = authHeader.replace("Bearer ", "");
    if (!token) return json({ error: "No autenticado" }, 401);

    const { data: userData, error: userError } = await supabaseAdmin.auth.getUser(token);
    if (userError || !userData?.user) return json({ error: "Sesión inválida" }, 401);

    const { data: callerProfile } = await supabaseAdmin
      .from("profiles")
      .select("role")
      .eq("id", userData.user.id)
      .maybeSingle();

    if (!callerProfile || callerProfile.role !== "admin") {
      return json({ error: "No autorizado — esto es solo para administradores" }, 403);
    }

    // 2. Leer qué matrícula/quiz resetear
    const body = await req.json();
    const enrollmentId = body.enrollment_id as string;
    const quizId = body.quiz_id as string;
    if (!enrollmentId || !quizId) return json({ error: "Faltan datos (enrollment_id, quiz_id)" }, 400);

    const { data: quiz } = await supabaseAdmin
      .from("quizzes")
      .select("id, title")
      .eq("id", quizId)
      .maybeSingle();
    if (!quiz) return json({ error: "No se encontró ese cuestionario" }, 404);

    // 3. Borrar el historial de intentos de ese estudiante para ese quiz
    const { error: deleteError, count } = await supabaseAdmin
      .from("quiz_attempts")
      .delete({ count: "exact" })
      .eq("enrollment_id", enrollmentId)
      .eq("quiz_id", quizId);

    if (deleteError) return json({ error: "No se pudo reiniciar: " + deleteError.message }, 500);

    return json({
      ok: true,
      message: `Se reinició "${quiz.title}" — el estudiante puede volver a presentarlo desde cero.`,
      attempts_removed: count ?? 0,
    });
  } catch (err) {
    return json({ error: "Error inesperado: " + String(err) }, 500);
  }
});
