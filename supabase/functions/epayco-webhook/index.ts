// ============================================================
// epayco-webhook — Supabase Edge Function
// ============================================================
// Qué hace: ePayco llama a esta URL automáticamente cuando alguien paga.
// La función verifica que el pago sea real (no falsificado), y si fue
// aprobado, crea la cuenta del estudiante (o la reutiliza), lo matricula
// en el curso comprado, y le envía un correo de compra confirmada con la
// marca del sitio (vía SMTP propio — ver _shared/email.ts y
// supabase/CORREOS-SETUP.md), no el correo genérico de Supabase.
//
// Dónde se configura en ePayco: Panel ePayco → Configuración → Integraciones
// → "URL de confirmación" (Webhook). Ahí pegas la URL de esta función una
// vez esté desplegada (Supabase te la da al hacer `supabase functions deploy`).
//
// Secrets que necesita (se configuran en Supabase, nunca en este archivo):
//   SUPABASE_URL                 → la URL de tu proyecto
//   SUPABASE_SERVICE_ROLE_KEY    → la "service_role key" (secreta, distinta de la anon key)
//   EPAYCO_P_CUST_ID_CLIENTE     → tu P_CUST_ID_CLIENTE de ePayco
//   EPAYCO_P_KEY                 → tu P_KEY de ePayco (la llave privada de validación)
//   SITE_URL                     → https://nixonsaavedraescritor.com
//   + las variables SMTP_* de _shared/email.ts (ver CORREOS-SETUP.md)
// ============================================================

import { serve } from "https://deno.land/std@0.203.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { SMTPClient } from "https://deno.land/x/denomailer@1.6.0/mod.ts";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const P_CUST_ID_CLIENTE = Deno.env.get("EPAYCO_P_CUST_ID_CLIENTE")!;
const P_KEY = Deno.env.get("EPAYCO_P_KEY")!;
const SITE_URL = Deno.env.get("SITE_URL") ?? "https://nixonsaavedraescritor.com";

const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

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

async function sha256Hex(text: string) {
  const data = new TextEncoder().encode(text);
  const hashBuffer = await crypto.subtle.digest("SHA-256", data);
  return Array.from(new Uint8Array(hashBuffer))
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

serve(async (req) => {
  if (req.method !== "POST") {
    return new Response("Method not allowed", { status: 405 });
  }

  const form = await req.formData();
  const x_ref_payco = form.get("x_ref_payco")?.toString() ?? "";
  const x_transaction_id = form.get("x_transaction_id")?.toString() ?? "";
  const x_amount = form.get("x_amount")?.toString() ?? "";
  const x_currency_code = form.get("x_currency_code")?.toString() ?? "";
  const x_cod_response = form.get("x_cod_response")?.toString() ?? "";
  const x_id_invoice = form.get("x_id_invoice")?.toString() ?? "";
  const x_signature = form.get("x_signature")?.toString() ?? "";

  // 1. Verificar la firma — así sabemos que el aviso viene realmente de
  //    ePayco y no de alguien simulando un pago aprobado.
  const expected = await sha256Hex(
    `${P_CUST_ID_CLIENTE}^${P_KEY}^${x_ref_payco}^${x_transaction_id}^${x_amount}^${x_currency_code}`
  );
  if (expected !== x_signature) {
    return new Response("Firma inválida", { status: 400 });
  }

  // 2. x_cod_response: 1 = aceptada, 2 = rechazada, 3 = pendiente, 4 = fallida
  if (x_cod_response !== "1") {
    return new Response("Pago no aprobado, no se procesa", { status: 200 });
  }

  // 3. Buscar el pedido que se guardó al iniciar la compra en la tienda
  const { data: order, error: orderError } = await supabase
    .from("pending_orders")
    .select("*")
    .eq("order_ref", x_id_invoice)
    .maybeSingle();

  if (orderError || !order) {
    return new Response("Pedido no encontrado", { status: 404 });
  }

  // 4. Buscar el curso comprado
  const { data: course } = await supabase
    .from("courses")
    .select("id, title")
    .eq("slug", order.course_slug)
    .maybeSingle();

  if (!course) {
    return new Response("Curso no encontrado", { status: 404 });
  }

  // 5. ¿El estudiante ya tiene cuenta? Si no, se crea (el correo con el
  //    enlace de acceso se manda más abajo, con la marca del sitio).
  const { data: existingProfile } = await supabase
    .from("profiles")
    .select("id")
    .eq("email", order.email)
    .maybeSingle();

  let userId: string;
  let isNewAccount = false;
  let accessLink: string | null = null;

  if (existingProfile) {
    userId = existingProfile.id;
  } else {
    isNewAccount = true;
    // generateLink crea la cuenta y da el enlace de acceso sin disparar el
    // correo automático de Supabase — el correo lo mandamos nosotros abajo,
    // con la marca del sitio (ver _shared/email.ts).
    const { data: linkData, error: inviteError } = await supabase.auth.admin.generateLink({
      type: "invite",
      email: order.email,
      options: {
        data: { full_name: order.full_name },
        redirectTo: `${SITE_URL}/crear-contrasena.html`,
      },
    });
    if (inviteError || !linkData?.user) {
      console.error("Error creando cuenta del estudiante:", inviteError);
      return new Response("No se pudo crear la cuenta", { status: 500 });
    }
    userId = linkData.user.id;
    accessLink = linkData.properties?.action_link ?? null;
  }

  // 6. Matricular al estudiante en el curso
  await supabase
    .from("enrollments")
    .upsert(
      {
        user_id: userId,
        course_id: course.id,
        payment_ref: x_ref_payco,
        status: "active",
      },
      { onConflict: "user_id,course_id" }
    );

  // 7. Marcar el pedido como confirmado
  await supabase.from("pending_orders").update({ status: "confirmed" }).eq("id", order.id);

  // 8. Notificación visible en el panel del estudiante
  await supabase.from("notifications").insert({
    user_id: userId,
    message: `¡Tu compra fue confirmada! Ya tienes acceso a "${course.title}".`,
  });

  // 9. Correo de compra confirmada, con la marca del sitio.
  try {
    if (isNewAccount && accessLink) {
      await sendBrandedEmail({
        to: order.email,
        subject: `Compra confirmada: "${course.title}" — Campus Saavedra`,
        preheader: `Recibimos tu pago. Crea tu contraseña para entrar a "${course.title}".`,
        bodyHtml: `
          <p>Hola${order.full_name ? " " + order.full_name.split(" ")[0] : ""},</p>
          <p>¡Gracias por tu compra! Confirmamos tu pago y ya tienes acceso a <strong>"${course.title}"</strong>.</p>
          <p>Como es tu primera vez en el Campus, solo falta un paso: crea tu contraseña para entrar cuando quieras.</p>
        `,
        ctaText: "Crear mi contraseña y entrar",
        ctaUrl: accessLink,
      });
    } else {
      await sendBrandedEmail({
        to: order.email,
        subject: `Compra confirmada: "${course.title}" — Campus Saavedra`,
        preheader: `Recibimos tu pago. Ya tienes acceso a "${course.title}".`,
        bodyHtml: `
          <p>Hola${order.full_name ? " " + order.full_name.split(" ")[0] : ""},</p>
          <p>¡Gracias por tu compra! Confirmamos tu pago y ya tienes acceso a <strong>"${course.title}"</strong>.</p>
          <p>Entra con tu correo y tu contraseña de siempre para empezar.</p>
        `,
        ctaText: "Entrar a mi Campus",
        ctaUrl: `${SITE_URL}/login.html`,
      });
    }
  } catch (emailErr) {
    // La compra y la matrícula ya quedaron guardadas — un fallo de correo
    // no debe hacer que ePayco reintente el webhook ni afectar el pago.
    console.error("No se pudo enviar el correo de compra confirmada:", emailErr);
  }

  return new Response("OK", { status: 200 });
});
