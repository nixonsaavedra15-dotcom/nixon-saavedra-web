// ============================================================
// admin-assign-course — Supabase Edge Function
// ============================================================
// Qué hace: permite que el administrador matricule a un estudiante
// en un curso GRATIS desde el panel admin.html. Verifica primero
// que quien llama de verdad sea un administrador (revisando su
// sesión y su rol en la tabla profiles). Si el estudiante todavía
// no tiene cuenta, la crea automáticamente y le manda el correo de
// acceso (igual que cuando compra un curso).
//
// Secrets que necesita (ya deberían estar configurados desde el
// despliegue de epayco-webhook — se comparten en el mismo proyecto):
//   SUPABASE_URL
//   SUPABASE_SERVICE_ROLE_KEY
//   SITE_URL
// ============================================================

import { serve } from "https://deno.land/std@0.203.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const SITE_URL = Deno.env.get("SITE_URL") ?? "https://nixonsaavedraescritor.com";

const supabaseAdmin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  if (req.method !== "POST") {
    return new Response(JSON.stringify({ error: "Método no permitido" }), {
      status: 405,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }

  try {
    // 1. Verificar que quien llama tiene sesión y es administrador
    const authHeader = req.headers.get("Authorization") ?? "";
    const token = authHeader.replace("Bearer ", "");
    if (!token) {
      return new Response(JSON.stringify({ error: "No autenticado" }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const { data: userData, error: userError } = await supabaseAdmin.auth.getUser(token);
    if (userError || !userData?.user) {
      return new Response(JSON.stringify({ error: "Sesión inválida" }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const { data: callerProfile } = await supabaseAdmin
      .from("profiles")
      .select("role")
      .eq("id", userData.user.id)
      .maybeSingle();

    if (!callerProfile || callerProfile.role !== "admin") {
      return new Response(JSON.stringify({ error: "No autorizado — esto es solo para administradores" }), {
        status: 403,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // 2. Leer los datos enviados desde el panel
    const body = await req.json();
    const email = (body.email ?? "").toString().trim().toLowerCase();
    const fullName = (body.full_name ?? "").toString().trim();
    const courseSlug = (body.course_slug ?? "").toString().trim();

    if (!email || !courseSlug) {
      return new Response(JSON.stringify({ error: "Falta el correo o el curso" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const { data: course } = await supabaseAdmin
      .from("courses")
      .select("id, title")
      .eq("slug", courseSlug)
      .maybeSingle();

    if (!course) {
      return new Response(JSON.stringify({ error: "Ese curso no existe" }), {
        status: 404,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // 3. ¿El estudiante ya tiene cuenta? Si no, se crea y se le invita.
    const { data: existingProfile } = await supabaseAdmin
      .from("profiles")
      .select("id")
      .eq("email", email)
      .maybeSingle();

    let targetUserId: string;

    if (existingProfile) {
      targetUserId = existingProfile.id;
    } else {
      const { data: invited, error: inviteError } = await supabaseAdmin.auth.admin.inviteUserByEmail(email, {
        data: { full_name: fullName },
        redirectTo: `${SITE_URL}/crear-contrasena.html`,
      });
      if (inviteError || !invited?.user) {
        return new Response(
          JSON.stringify({ error: "No se pudo crear la cuenta: " + (inviteError?.message ?? "error desconocido") }),
          { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }
      targetUserId = invited.user.id;
    }

    // 4. Matricular gratis
    const { error: enrollError } = await supabaseAdmin
      .from("enrollments")
      .upsert(
        { user_id: targetUserId, course_id: course.id, payment_ref: "ADMIN-GRANT", status: "active" },
        { onConflict: "user_id,course_id" }
      );

    if (enrollError) {
      return new Response(JSON.stringify({ error: "No se pudo matricular: " + enrollError.message }), {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // 5. Notificación visible en el panel del estudiante
    await supabaseAdmin.from("notifications").insert({
      user_id: targetUserId,
      message: `Un administrador te asignó el curso "${course.title}" de forma gratuita. ¡Ya puedes empezar!`,
    });

    return new Response(
      JSON.stringify({ ok: true, message: `Listo: "${course.title}" fue asignado gratis a ${email}.` }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    return new Response(JSON.stringify({ error: "Error inesperado: " + String(err) }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
