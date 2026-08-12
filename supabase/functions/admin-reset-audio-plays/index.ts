// ============================================================
// admin-reset-audio-plays — Supabase Edge Function
// ============================================================
// Qué hace: le devuelve a un estudiante puntual sus 2 reproducciones
// de un audio de Listening evaluativo (o de todo un módulo/quiz de
// una vez). Pensado para "se le fue el internet a mitad del audio",
// "le dio play sin querer", etc. Solo la puede llamar un administrador.
//
// Acepta CUALQUIERA de estos dos modos:
//   { enrollment_id, question_id }  → resetea una sola pregunta
//   { enrollment_id, quiz_id }      → resetea TODAS las preguntas
//                                      con audio de ese cuestionario
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

    const { data: callerProfile } = await supabaseAdmin
      .from("profiles")
      .select("role")
      .eq("id", userData.user.id)
      .maybeSingle();

    if (!callerProfile || callerProfile.role !== "admin") {
      return json({ error: "No autorizado — esto es solo para administradores" }, 403);
    }

    const body = await req.json();
    const enrollmentId = body.enrollment_id as string;
    const questionId = body.question_id as string | undefined;
    const quizId = body.quiz_id as string | undefined;

    if (!enrollmentId || (!questionId && !quizId)) {
      return json({ error: "Faltan datos (enrollment_id + question_id o quiz_id)" }, 400);
    }

    let questionIds: string[] = [];
    if (questionId) {
      questionIds = [questionId];
    } else {
      const { data: questions } = await supabaseAdmin
        .from("quiz_questions")
        .select("id")
        .eq("quiz_id", quizId!)
        .not("audio_url", "is", null);
      questionIds = (questions ?? []).map((q) => q.id);
      if (questionIds.length === 0) {
        return json({ error: "Ese cuestionario no tiene preguntas con audio" }, 404);
      }
    }

    const { error: deleteError, count } = await supabaseAdmin
      .from("quiz_question_audio_plays")
      .delete({ count: "exact" })
      .eq("enrollment_id", enrollmentId)
      .in("question_id", questionIds);

    if (deleteError) return json({ error: "No se pudo reiniciar: " + deleteError.message }, 500);

    return json({
      ok: true,
      message: `Reproducciones reiniciadas — el estudiante vuelve a tener sus 2 reproducciones disponibles.`,
      questions_reset: count ?? 0,
    });
  } catch (err) {
    return json({ error: "Error inesperado: " + String(err) }, 500);
  }
});
