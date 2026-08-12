// ============================================================
// notify-certificate — Supabase Edge Function
// ============================================================
// Qué hace: manda un correo con la marca del sitio cuando se emite
// un certificado (el estudiante completó todos los módulos de un
// curso). No la llama el sitio directamente — se dispara sola desde
// un "Database Webhook" de Supabase cuando se inserta una fila en
// la tabla certificates (eso ya pasa automáticamente por el trigger
// handle_course_completed definido en schema.sql).
//
// CÓMO CONECTARLA (una sola vez, desde el dashboard de Supabase):
//   Database → Webhooks → Create a new hook
//     - Table: certificates
//     - Events: Insert
//     - Type: Supabase Edge Function
//     - Edge Function: notify-certificate
//     - HTTP Headers → agrega uno manual:
//         x-webhook-secret : (el mismo valor que pongas en el secret
//                             CERTIFICATE_WEBHOOK_SECRET)
//
// Secrets: SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, SITE_URL,
// CERTIFICATE_WEBHOOK_SECRET, RESEND_API_KEY (ver CORREOS-SETUP.md)
// ============================================================

import { serve } from "https://deno.land/std@0.203.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const SITE_URL = Deno.env.get("SITE_URL") ?? "https://nixonsaavedraescritor.com";
const WEBHOOK_SECRET = Deno.env.get("CERTIFICATE_WEBHOOK_SECRET") ?? "";

const supabaseAdmin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

// ---- Envío de correo con marca, vía la API de Resend (copia local — ver
// _shared/email.ts para la versión documentada) ----
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
    headers: { "Authorization": `Bearer ${RESEND_API_KEY}`, "Content-Type": "application/json" },
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

serve(async (req) => {
  if (req.method !== "POST") {
    return new Response("Método no permitido", { status: 405 });
  }

  if (WEBHOOK_SECRET && req.headers.get("x-webhook-secret") !== WEBHOOK_SECRET) {
    return new Response("No autorizado", { status: 401 });
  }

  try {
    const payload = await req.json();
    const record = payload.record ?? payload.new ?? null;
    const enrollmentId = record?.enrollment_id;
    if (!enrollmentId) {
      return new Response("Sin enrollment_id en el payload", { status: 400 });
    }

    const { data: enrollment } = await supabaseAdmin
      .from("enrollments")
      .select("user_id, course:courses(title)")
      .eq("id", enrollmentId)
      .maybeSingle();

    if (!enrollment) {
      return new Response("Matrícula no encontrada", { status: 404 });
    }

    const { data: student } = await supabaseAdmin
      .from("profiles")
      .select("email, full_name")
      .eq("id", enrollment.user_id)
      .maybeSingle();

    if (!student?.email) {
      return new Response("Correo del estudiante no encontrado", { status: 404 });
    }

    const courseTitle = (enrollment.course as unknown as { title?: string } | null)?.title ?? "tu curso";

    await sendBrandedEmail({
      to: student.email,
      subject: `¡Certificado listo! Completaste "${courseTitle}" — Campus Saavedra`,
      preheader: `Terminaste "${courseTitle}". Tu certificado ya está disponible en tu Campus.`,
      bodyHtml: `
        <p>Hola${student.full_name ? " " + student.full_name.split(" ")[0] : ""},</p>
        <p>¡Felicitaciones! Completaste todos los módulos de <strong>"${courseTitle}"</strong> y tu certificado ya quedó emitido.</p>
        <p>Puedes verlo y descargarlo desde tu Campus cuando quieras.</p>
      `,
      ctaText: "Ver mi certificado",
      ctaUrl: `${SITE_URL}/dashboard.html`,
    });

    return new Response("OK", { status: 200 });
  } catch (err) {
    console.error("Error en notify-certificate:", err);
    return new Response("Error inesperado: " + String(err), { status: 500 });
  }
});
