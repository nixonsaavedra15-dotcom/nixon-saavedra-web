// ============================================================
// admin-assign-course — Supabase Edge Function
// ============================================================
// Qué hace: permite que el administrador matricule a un estudiante
// en un curso GRATIS desde el panel admin.html. Verifica primero
// que quien llama de verdad sea un administrador (revisando su
// sesión y su rol en la tabla profiles). Si el estudiante todavía
// no tiene cuenta, la crea automáticamente; en cualquier caso le
// manda un correo con la marca del sitio (vía SMTP propio — ver
// _shared/email.ts y supabase/CORREOS-SETUP.md), no el correo
// genérico de Supabase.
//
// Secrets que necesita (ya deberían estar configurados desde el
// despliegue de epayco-webhook — se comparten en el mismo proyecto):
//   SUPABASE_URL
//   SUPABASE_SERVICE_ROLE_KEY
//   SITE_URL
//   + las variables SMTP_* de _shared/email.ts (ver CORREOS-SETUP.md)
// ============================================================

import { serve } from "https://deno.land/std@0.203.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const SITE_URL = Deno.env.get("SITE_URL") ?? "https://nixonsaavedraescritor.com";

const supabaseAdmin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

// ---- Envío de correo con marca, vía la API de Resend (copia local — ver
// _shared/email.ts para la versión documentada). Reemplaza el envío por
// SMTP (denomailer), que tenía un bug irresoluble en este entorno. ----
const RESEND_API_KEY = Deno.env.get("RESEND_API_KEY") ?? "";
const FROM_EMAIL = Deno.env.get("FROM_EMAIL") ?? "notificaciones@nixonsaavedraescritor.com";
const FROM_NAME = Deno.env.get("FROM_NAME") ?? "Nixon Saavedra · Campus";
const REPLY_TO = Deno.env.get("REPLY_TO") ?? "";
const BRAND = {
  bg: "#eee6d4", card: "#f6f2e9", ink: "#20211d", muted: "#65685f",
  line: "rgba(32,33,29,.14)", steel: "#2f6f68",
  serif: "Georgia, 'Times New Roman', serif", sans: "'Helvetica Neue', Arial, sans-serif",
};
function brandEmailShell(opts: { preheader?: string; bodyHtml: string; ctaText?: string; ctaUrl?: string }): string {
  const { preheader = "", bodyHtml, ctaText, ctaUrl } = opts;
  const cta = ctaText && ctaUrl ? `
    <tr><td style="border-radius:10px;background:${BRAND.steel};"><a href="${ctaUrl}" style="display:inline-block;padding:14px 30px;font-family:${BRAND.sans};font-weight:700;font-size:14px;color:${BRAND.card};text-decoration:none;border-radius:10px;">${ctaText}</a></td></tr>
    <tr><td style="padding:14px 0 0;"><p style="margin:0;font-family:${BRAND.sans};font-size:12px;color:${BRAND.muted};word-break:break-all;">Si el botón no funciona, copia y pega este enlace:<br><a href="${ctaUrl}" style="color:${BRAND.steel};">${ctaUrl}</a></p></td></tr>` : "";
  return `<!DOCTYPE html><html lang="es"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Campus Saavedra</title></head>
  <body style="margin:0;padding:0;background:${BRAND.bg};">
  <div style="display:none;max-height:0;overflow:hidden;opacity:0;">${preheader}</div>
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${BRAND.bg};padding:40px 16px;"><tr><td align="center">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="max-width:560px;background:${BRAND.card};border-radius:18px;border:1px solid ${BRAND.line};overflow:hidden;">
  <tr><td style="padding:34px 40px 0;"><div style="font-family:${BRAND.serif};font-weight:700;font-size:21px;color:${BRAND.ink};">N. Saavedra</div><div style="font-family:${BRAND.sans};font-size:11px;letter-spacing:1.5px;text-transform:uppercase;color:${BRAND.muted};margin-top:2px;">Campus &amp; Escritura</div></td></tr>
  <tr><td style="padding:26px 40px 6px;font-family:${BRAND.sans};font-size:15px;line-height:1.7;color:${BRAND.ink};">${bodyHtml}</td></tr>
  <tr><td style="padding:6px 40px 34px;">${cta ? `<table role="presentation" cellpadding="0" cellspacing="0">${cta}</table>` : ""}</td></tr>
  <tr><td style="padding:22px 40px 28px;border-top:1px solid ${BRAND.line};"><p style="margin:0;font-family:${BRAND.sans};font-size:12px;line-height:1.7;color:${BRAND.muted};">Nixon Saavedra — escritor y educador.<br>¿Dudas? Responde este correo o escríbenos desde tu Campus en <a href="${SITE_URL}/contacto.html" style="color:${BRAND.steel};text-decoration:none;">${SITE_URL.replace("https://", "")}</a>.</p></td></tr>
  </table>
  <p style="font-family:${BRAND.sans};font-size:11px;color:${BRAND.muted};margin:18px 0 0;">Recibiste este correo porque tienes o solicitaste una cuenta en el Campus de Nixon Saavedra.</p>
  </td></tr></table></body></html>`;
}
async function sendBrandedEmail(params: { to: string; subject: string; preheader?: string; bodyHtml: string; ctaText?: string; ctaUrl?: string }): Promise<void> {
  if (!RESEND_API_KEY) {
    throw new Error("Falta el secret RESEND_API_KEY. Configúralo en Supabase → Edge Functions → Secrets.");
  }
  const html = brandEmailShell({ preheader: params.preheader, bodyHtml: params.bodyHtml, ctaText: params.ctaText, ctaUrl: params.ctaUrl });
  const res = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${RESEND_API_KEY}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      from: `${FROM_NAME} <${FROM_EMAIL}>`,
      to: [params.to],
      subject: params.subject,
      html,
      ...(REPLY_TO ? { reply_to: REPLY_TO } : {}),
    }),
  });
  if (!res.ok) {
    const errText = await res.text();
    throw new Error(`Resend respondió ${res.status}: ${errText}`);
  }
}
// ---- fin bloque de correo ----

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
    let isNewAccount = false;
    let accessLink: string | null = null; // link de invitación, solo para cuentas nuevas

    if (existingProfile) {
      targetUserId = existingProfile.id;
    } else {
      isNewAccount = true;
      // generateLink crea la cuenta y nos da el enlace de acceso, pero NO
      // envía ningún correo — así el único correo que le llega al estudiante
      // es el nuestro, con la marca del sitio (ver _shared/email.ts).
      const { data: linkData, error: inviteError } = await supabaseAdmin.auth.admin.generateLink({
        type: "invite",
        email,
        options: {
          data: { full_name: fullName },
          redirectTo: `${SITE_URL}/crear-contrasena.html`,
        },
      });
      if (inviteError || !linkData?.user) {
        return new Response(
          JSON.stringify({ error: "No se pudo crear la cuenta: " + (inviteError?.message ?? "error desconocido") }),
          { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }
      targetUserId = linkData.user.id;
      accessLink = linkData.properties?.action_link ?? null;
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

    // 6. Correo con la marca del sitio — con enlace de invitación si la
    // cuenta es nueva, o enlace directo al login si ya tenía cuenta.
    let emailWarning: string | null = null;
    try {
      if (isNewAccount && accessLink) {
        await sendBrandedEmail({
          to: email,
          subject: `Tu curso "${course.title}" ya está listo — Campus Saavedra`,
          preheader: `Te asignamos "${course.title}" de forma gratuita. Crea tu contraseña para empezar.`,
          bodyHtml: `
            <p>Hola${fullName ? " " + fullName.split(" ")[0] : ""},</p>
            <p>Te dimos acceso gratuito al curso <strong>"${course.title}"</strong> en el Campus de Nixon Saavedra.</p>
            <p>Como es tu primera vez aquí, solo falta un paso: crea tu contraseña para entrar cuando quieras.</p>
          `,
          ctaText: "Crear mi contraseña y entrar",
          ctaUrl: accessLink,
        });
      } else {
        await sendBrandedEmail({
          to: email,
          subject: `Tu curso "${course.title}" ya está listo — Campus Saavedra`,
          preheader: `Te asignamos "${course.title}" de forma gratuita. Ya puedes entrar a tu Campus.`,
          bodyHtml: `
            <p>Hola${fullName ? " " + fullName.split(" ")[0] : ""},</p>
            <p>Te dimos acceso gratuito al curso <strong>"${course.title}"</strong> en el Campus de Nixon Saavedra.</p>
            <p>Ya está disponible en tu cuenta — entra con tu correo y tu contraseña de siempre.</p>
          `,
          ctaText: "Entrar a mi Campus",
          ctaUrl: `${SITE_URL}/login.html`,
        });
      }
    } catch (emailErr) {
      // No queremos que un problema de correo tumbe la matrícula, que ya
      // quedó guardada. Avisamos igual en la respuesta para que el admin lo sepa.
      console.error("No se pudo enviar el correo de asignación:", emailErr);
      emailWarning = "El estudiante quedó matriculado, pero no se pudo enviar el correo: " + String(emailErr);
    }

    return new Response(
      JSON.stringify({
        ok: true,
        message: `Listo: "${course.title}" fue asignado gratis a ${email}.`,
        ...(emailWarning ? { warning: emailWarning } : {}),
      }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    return new Response(JSON.stringify({ error: "Error inesperado: " + String(err) }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
