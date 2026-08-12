// ============================================================
// submit-speaking-attempt — Supabase Edge Function
// ============================================================
// Qué hace: recibe la transcripción que el propio navegador del
// estudiante generó en vivo (Web Speech API, gratis, sin llave de
// API) al practicar Speaking, y calcula la nota EN EL SERVIDOR (no
// se confía en ningún puntaje que mande el navegador) comparando
// contra las palabras clave / mínimos configurados en el
// lesson_json del módulo (campo "speaking_tasks").
//
// Es una calificación por REGLAS, no por IA: cuenta palabras,
// duración hablada y cobertura de palabras clave esperadas. No
// evalúa gramática fina — es a propósito (decisión: $0 de costo, 0
// tokens de IA, resultado inmediato). Sirve como práctica formativa:
// NO bloquea el avance de la lección.
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

interface SpeakingTask {
  id: string;
  label?: string;
  keywords: string[];
  min_words: number;
  min_seconds: number;
}

const PASSING_SCORE = 60;

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
    const taskId = body.task_id as string;
    const transcript = ((body.transcript as string) || "").trim();
    const durationSeconds = Number(body.duration_seconds) || 0;

    if (!enrollmentId || !moduleId || !taskId) {
      return json({ error: "Faltan datos" }, 400);
    }

    // 1. Confirmar que la matrícula es del estudiante que llama
    const { data: enrollment } = await supabaseAdmin
      .from("enrollments")
      .select("id, user_id")
      .eq("id", enrollmentId)
      .maybeSingle();
    if (!enrollment || enrollment.user_id !== userId) {
      return json({ error: "Esa matrícula no te pertenece" }, 403);
    }

    // 2. Confirmar que el módulo está desbloqueado y traer sus speaking_tasks
    const { data: progressRow } = await supabaseAdmin
      .from("progress")
      .select("id, unlocked")
      .eq("enrollment_id", enrollmentId)
      .eq("module_id", moduleId)
      .maybeSingle();
    if (!progressRow) return json({ error: "Módulo no encontrado en tu matrícula" }, 404);
    if (!progressRow.unlocked) return json({ error: "Este módulo todavía está bloqueado" }, 403);

    const { data: mod } = await supabaseAdmin
      .from("modules")
      .select("lesson_json")
      .eq("id", moduleId)
      .maybeSingle();

    const tasks: SpeakingTask[] = mod?.lesson_json?.speaking_tasks ?? [];
    const task = tasks.find((t) => t.id === taskId);
    if (!task) return json({ error: "No se encontró esa tarea de speaking" }, 404);

    // 3. Calificar EN EL SERVIDOR, sobre el texto transcrito
    const words = transcript.length ? transcript.trim().split(/\s+/).filter(Boolean).length : 0;
    const lowerTranscript = transcript.toLowerCase();
    const matchedKeywords = (task.keywords || []).filter((k) => lowerTranscript.includes(k.toLowerCase()));

    const wordScore = Math.min(words / Math.max(task.min_words, 1), 1) * 40;
    const durationScore = Math.min(durationSeconds / Math.max(task.min_seconds, 1), 1) * 30;
    const keywordScore =
      (task.keywords?.length ? matchedKeywords.length / task.keywords.length : 0) * 30;

    const score = Math.round(wordScore + durationScore + keywordScore);
    const passed = score >= PASSING_SCORE;

    await supabaseAdmin.from("speaking_attempts").insert({
      enrollment_id: enrollmentId,
      module_id: moduleId,
      task_id: taskId,
      transcript,
      words,
      duration_seconds: durationSeconds,
      matched_keywords: matchedKeywords,
      total_keywords: task.keywords?.length ?? 0,
      score,
      passed,
    });

    return json({
      ok: true,
      score,
      passed,
      passing_score: PASSING_SCORE,
      words,
      min_words: task.min_words,
      duration_seconds: durationSeconds,
      min_seconds: task.min_seconds,
      matched_keywords: matchedKeywords,
      total_keywords: task.keywords?.length ?? 0,
    });
  } catch (err) {
    return json({ error: "Error inesperado: " + String(err) }, 500);
  }
});
