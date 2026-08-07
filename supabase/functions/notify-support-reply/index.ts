// ============================================================
// notify-support-reply — Supabase Edge Function
// ============================================================
// Qué hace: cuando el administrador responde una pregunta en el
// panel (admin.html → pestaña Soporte), esta función le manda al
// estudiante un correo con la marca del sitio avisándole que ya
// tiene respuesta (antes solo se enteraba si entraba a su Campus).
//
// La llama admin.html DESPUÉS de guardar la respuesta en la tabla
// support_messages (esa parte no cambia). Solo administradores
// pueden invocarla.
//
// Secrets que necesita: SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, SITE_URL
// + las variables SMTP_* (ver supabase/CORREOS-SETUP.md)
// ============================================================

import { serve } from "https://deno.land/std@0.203.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { SMTPClient } from "https://deno.land/x/denomailer@1.6.0/mod.ts";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const SITE_URL = Deno.env.get("SITE_URL") ?? "https://nixonsaavedraescritor.com";

const supabaseAdmin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

// ---- Envío de correo con marca (copia local — ver _shared/email.ts para la versión documentada) ----
const SMTP_HOST = Deno.env.get("SMTP_HOST") ?? "smtp.hostinger.com";
const SMTP_PORT = Number(Deno.env.get("SMTP_PORT") ?? "465");
const SMTP_USER = Deno.env.get("SMTP_USER") ?? "";
const SMTP_PASS = Deno.env.get("SMTP_PASS") ?? "";
const FROM_EMAIL = Deno.env.get("FROM_EMAIL") ?? SMTP_USER;
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
  if (!SMTP_USER || !SMTP_PASS) {
    throw new Error("Faltan las credenciales SMTP (SMTP_USER / SMTP_PASS). Configúralas como secrets en Supabase.");
  }
  const client = new SMTPClient({ connection: { hostname: SMTP_HOST, port: SMTP_PORT, tls: true, auth: { username: SMTP_USER, password: SMTP_PASS } } });
  const html = brandEmailShell({ preheader: params.preheader, bodyHtml: params.bodyHtml, ctaText: params.ctaText, ctaUrl: params.ctaUrl });
  try {
    await client.send({ from: `${FROM_NAME} <${FROM_EMAIL}>`, to: params.to, subject: params.subject, html, ...(REPLY_TO ? { replyTo: REPLY_TO } : {}) });
  } finally {
    await client.close();
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
      return new Response(JSON.stringify({ error: "No autorizado" }), {
        status: 403,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const body = await req.json();
    const ticketId = (body.ticket_id ?? "").toString().trim();
    if (!ticketId) {
      return new Response(JSON.stringify({ error: "Falta el ticket" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const { data: ticket } = await supabaseAdmin
      .from("support_messages")
      .select("id, subject, message, admin_reply, user_id")
      .eq("id", ticketId)
      .maybeSingle();

    if (!ticket || !ticket.admin_reply) {
      return new Response(JSON.stringify({ error: "Ese ticket no existe o todavía no tiene respuesta" }), {
        status: 404,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const { data: student } = await supabaseAdmin
      .from("profiles")
      .select("email, full_name")
      .eq("id", ticket.user_id)
      .maybeSingle();

    if (!student?.email) {
      return new Response(JSON.stringify({ error: "No se encontró el correo del estudiante" }), {
        status: 404,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    try {
      await sendBrandedEmail({
        to: student.email,
        subject: ticket.subject ? `Respuesta a: "${ticket.subject}" — Campus Saavedra` : "Respondimos tu pregunta — Campus Saavedra",
        preheader: "Ya tienes una respuesta esperándote en tu Campus.",
        bodyHtml: `
          <p>Hola${student.full_name ? " " + student.full_name.split(" ")[0] : ""},</p>
          <p>Respondimos la pregunta que enviaste${ticket.subject ? ` sobre <strong>"${ticket.subject}"</strong>` : ""}:</p>
          <div style="margin:16px 0;padding:16px 18px;background:#eee6d4;border-radius:10px;border:1px solid rgba(32,33,29,.14);">
            <p style="margin:0 0 8px;color:#65685f;font-size:13px;"><em>Tu pregunta:</em> ${ticket.message}</p>
            <p style="margin:0;">${ticket.admin_reply}</p>
          </div>
        `,
        ctaText: "Ver en mi Campus",
        ctaUrl: `${SITE_URL}/dashboard.html`,
      });
    } catch (emailErr) {
      console.error("No se pudo enviar el correo de respuesta de soporte:", emailErr);
      return new Response(
        JSON.stringify({ ok: true, warning: "La respuesta quedó guardada, pero no se pudo enviar el correo: " + String(emailErr) }),
        { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    return new Response(JSON.stringify({ ok: true }), {
      status: 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (err) {
    return new Response(JSON.stringify({ error: "Error inesperado: " + String(err) }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
