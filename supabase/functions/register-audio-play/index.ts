// ============================================================
// register-audio-play — Supabase Edge Function
// ============================================================
// Qué hace: controla cuántas veces un estudiante puede reproducir
// el audio EVALUATIVO de una pregunta de Listening (máximo 2 veces,
// como en el examen real). El navegador NUNCA reproduce el audio
// directamente: primero le pide permiso a esta función, y solo si
// la respuesta es "allowed: true" crea el <audio> y lo reproduce.
// Así el límite no se puede saltar limpiando el localStorage o
// recargando la página — el conteo vive en la base de datos.
//
// El administrador puede resetear este conteo para un estudiante
// puntual desde el panel (ver Edge Function admin-reset-audio-plays),
// por ejemplo si se le fue el internet a mitad del audio.
//
// Secrets: SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY (compartidos).
// ============================================================

import { serve } from "https://deno.land/std@0.203.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const supabaseAdmin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

const MAX_PLAYS = 2;

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
    const questionId = body.question_id as string;
    if (!enrollmentId || !questionId) return json({ error: "Faltan datos" }, 400);

    // 1. Confirmar que la matrícula es del estudiante que llama
    const { data: enrollment } = await supabaseAdmin
      .from("enrollments")
      .select("id, user_id")
      .eq("id", enrollmentId)
      .maybeSingle();

    if (!enrollment || enrollment.user_id !== userId) {
      return json({ error: "Esa matrícula no te pertenece" }, 403);
    }

    // 2. Confirmar que la pregunta existe y de verdad tiene audio
    const { data: question } = await supabaseAdmin
      .from("quiz_questions")
      .select("id, audio_url")
      .eq("id", questionId)
      .maybeSingle();

    if (!question || !question.audio_url) {
      return json({ error: "Esta pregunta no tiene audio configurado" }, 404);
    }

    // 3. Leer/crear el contador de reproducciones (con bloqueo simple vía upsert)
    const { data: existing } = await supabaseAdmin
      .from("quiz_question_audio_plays")
      .select("id, plays_used")
      .eq("enrollment_id", enrollmentId)
      .eq("question_id", questionId)
      .maybeSingle();

    const playsUsed = existing?.plays_used ?? 0;

    if (playsUsed >= MAX_PLAYS) {
      return json({
        allowed: false,
        plays_used: playsUsed,
        plays_left: 0,
        message: `Ya usaste tus ${MAX_PLAYS} reproducciones para este audio. Si tuviste un problema técnico (se fue el internet, etc.), escríbenos desde "¿Necesitas ayuda?" en tu Campus.`,
      });
    }

    const newCount = playsUsed + 1;
    if (existing) {
      await supabaseAdmin
        .from("quiz_question_audio_plays")
        .update({ plays_used: newCount, updated_at: new Date().toISOString() })
        .eq("id", existing.id);
    } else {
      await supabaseAdmin.from("quiz_question_audio_plays").insert({
        enrollment_id: enrollmentId,
        question_id: questionId,
        plays_used: newCount,
      });
    }

    return json({
      allowed: true,
      audio_url: question.audio_url,
      plays_used: newCount,
      plays_left: MAX_PLAYS - newCount,
    });
  } catch (err) {
    return json({ error: "Error inesperado: " + String(err) }, 500);
  }
});
