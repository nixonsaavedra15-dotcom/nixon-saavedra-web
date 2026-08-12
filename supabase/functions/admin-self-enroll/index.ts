// ============================================================
// admin-self-enroll — Supabase Edge Function
// ============================================================
// Qué hace: le permite al administrador matricularse a SÍ MISMO en
// cualquier curso (activo o no) desde el panel admin, con un solo
// clic — para poder entrar como si fuera estudiante, ver los
// módulos, escuchar los audios, resolver los cuestionarios y llegar
// hasta el certificado, y así verificar que todo funcione sin
// depender de una cuenta de prueba aparte ni de pedirle a un
// estudiante real que revise por él.
//
// Si el admin ya estaba matriculado en ese curso, no crea una
// matrícula duplicada — solo confirma la que ya existe.
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
    const adminId = userData.user.id;

    const { data: callerProfile } = await supabaseAdmin
      .from("profiles")
      .select("role")
      .eq("id", adminId)
      .maybeSingle();

    if (!callerProfile || callerProfile.role !== "admin") {
      return json({ error: "No autorizado — esto es solo para administradores" }, 403);
    }

    const body = await req.json();
    const courseSlug = body.course_slug as string;
    if (!courseSlug) return json({ error: "Falta el curso" }, 400);

    const { data: course } = await supabaseAdmin
      .from("courses")
      .select("id, title")
      .eq("slug", courseSlug)
      .maybeSingle();
    if (!course) return json({ error: "No se encontró ese curso" }, 404);

    // ¿Ya está matriculado?
    const { data: existing } = await supabaseAdmin
      .from("enrollments")
      .select("id, status")
      .eq("course_id", course.id)
      .eq("user_id", adminId)
      .maybeSingle();

    if (existing) {
      // Si estaba desactivada, la reactivamos para que pueda entrar.
      if (existing.status === "cancelled") {
        await supabaseAdmin.from("enrollments").update({ status: "active" }).eq("id", existing.id);
      }
      return json({ ok: true, already_enrolled: true, enrollment_id: existing.id, course_title: course.title });
    }

    const { data: newEnrollment, error: enrollError } = await supabaseAdmin
      .from("enrollments")
      .insert({ course_id: course.id, user_id: adminId, status: "active" })
      .select("id")
      .single();

    if (enrollError) return json({ error: "No se pudo matricular: " + enrollError.message }, 500);

    return json({
      ok: true,
      already_enrolled: false,
      enrollment_id: newEnrollment.id,
      course_title: course.title,
    });
  } catch (err) {
    return json({ error: "Error inesperado: " + String(err) }, 500);
  }
});
