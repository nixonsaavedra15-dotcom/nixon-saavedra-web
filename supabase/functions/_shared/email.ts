// ============================================================
// _shared/email.ts — envío de correos con marca (Campus Saavedra)
// ============================================================
// Módulo compartido por todas las Edge Functions que necesitan
// mandar un correo. Envía a través de la API de Resend (HTTP) y
// envuelve cada mensaje en una plantilla HTML con los colores y
// tipografías del sitio, para que se vea profesional y coherente
// en cualquier bandeja de entrada.
//
// Nota: antes se enviaba por SMTP (Hostinger) usando la librería
// denomailer, pero tenía un bug irresoluble corriendo dentro del
// runtime de Supabase Edge Functions (Deno) que corrompía el cuerpo
// del mensaje y lo hacía llegar como texto crudo en vez de HTML.
// Por eso se migró a Resend, que envía por HTTP y no tiene ese problema.
//
// Secrets que necesita (Supabase → Project Settings → Edge
// Functions → Secrets, o `supabase secrets set`):
//   RESEND_API_KEY → la API key de tu cuenta en resend.com
//   FROM_EMAIL     → notificaciones@nixonsaavedraescritor.com (opcional)
//   FROM_NAME      → Nixon Saavedra · Campus (opcional)
//   REPLY_TO       → nixonsaavedra15@gmail.com (opcional — a dónde llegan las respuestas)
//   SITE_URL       → https://nixonsaavedraescritor.com
//
// Ver supabase/CORREOS-SETUP.md para la guía paso a paso completa.
// ============================================================

const RESEND_API_KEY = Deno.env.get("RESEND_API_KEY") ?? "";
const FROM_EMAIL = Deno.env.get("FROM_EMAIL") ?? "notificaciones@nixonsaavedraescritor.com";
const FROM_NAME = Deno.env.get("FROM_NAME") ?? "Nixon Saavedra · Campus";
const REPLY_TO = Deno.env.get("REPLY_TO") ?? "";
export const SITE_URL = Deno.env.get("SITE_URL") ?? "https://nixonsaavedraescritor.com";

// Colores/tipografías tomados de assets/style.css para que el correo
// combine con el sitio (en el correo usamos fuentes "web-safe" porque
// Fraunces/Space Grotesk no cargan de forma confiable en clientes de correo).
const BRAND = {
  bg: "#eee6d4",
  card: "#f6f2e9",
  ink: "#20211d",
  muted: "#65685f",
  line: "rgba(32,33,29,.14)",
  steel: "#2f6f68", // acento principal
  wine: "#c1652f", // acento secundario / alertas
  serif: "Georgia, 'Times New Roman', serif",
  sans: "'Helvetica Neue', Arial, sans-serif",
};

/**
 * Envuelve el contenido de un correo en la plantilla de marca.
 * `bodyHtml` puede traer <p>, <h2> (usamos estilos inline propios), etc.
 */
export function brandEmailShell(opts: {
  preheader?: string;
  bodyHtml: string;
  ctaText?: string;
  ctaUrl?: string;
}): string {
  const { preheader = "", bodyHtml, ctaText, ctaUrl } = opts;

  const cta =
    ctaText && ctaUrl
      ? `
      <tr>
        <td style="padding:6px 0 4px;">
          <table role="presentation" cellpadding="0" cellspacing="0">
            <tr>
              <td style="border-radius:10px;background:${BRAND.steel};">
                <a href="${ctaUrl}" style="display:inline-block;padding:14px 30px;font-family:${BRAND.sans};font-weight:700;font-size:14px;color:${BRAND.card};text-decoration:none;border-radius:10px;">
                  ${ctaText}
                </a>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td style="padding:14px 0 0;">
          <p style="margin:0;font-family:${BRAND.sans};font-size:12px;color:${BRAND.muted};word-break:break-all;">
            Si el botón no funciona, copia y pega este enlace en tu navegador:<br>
            <a href="${ctaUrl}" style="color:${BRAND.steel};">${ctaUrl}</a>
          </p>
        </td>
      </tr>`
      : "";

  return `<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Campus Saavedra</title>
</head>
<body style="margin:0;padding:0;background:${BRAND.bg};">
  <div style="display:none;max-height:0;overflow:hidden;opacity:0;">${preheader}</div>
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${BRAND.bg};padding:40px 16px;">
    <tr>
      <td align="center">
        <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="max-width:560px;background:${BRAND.card};border-radius:18px;border:1px solid ${BRAND.line};overflow:hidden;">
          <tr>
            <td style="padding:34px 40px 0;">
              <div style="font-family:${BRAND.serif};font-weight:700;font-size:21px;color:${BRAND.ink};letter-spacing:.2px;">
                N. Saavedra
              </div>
              <div style="font-family:${BRAND.sans};font-size:11px;letter-spacing:1.5px;text-transform:uppercase;color:${BRAND.muted};margin-top:2px;">
                Campus &amp; Escritura
              </div>
            </td>
          </tr>
          <tr>
            <td style="padding:26px 40px 6px;font-family:${BRAND.sans};font-size:15px;line-height:1.7;color:${BRAND.ink};">
              ${bodyHtml}
            </td>
          </tr>
          <tr>
            <td style="padding:6px 40px 34px;">
              ${cta ? `<table role="presentation" cellpadding="0" cellspacing="0">${cta}</table>` : ""}
            </td>
          </tr>
          <tr>
            <td style="padding:22px 40px 28px;border-top:1px solid ${BRAND.line};">
              <p style="margin:0;font-family:${BRAND.sans};font-size:12px;line-height:1.7;color:${BRAND.muted};">
                Nixon Saavedra — escritor y educador.<br>
                ¿Dudas? Responde este correo o escríbenos desde tu Campus en
                <a href="${SITE_URL}/contacto.html" style="color:${BRAND.steel};text-decoration:none;">${SITE_URL.replace("https://", "")}</a>.
              </p>
            </td>
          </tr>
        </table>
        <p style="font-family:${BRAND.sans};font-size:11px;color:${BRAND.muted};margin:18px 0 0;">
          Recibiste este correo porque tienes o solicitaste una cuenta en el Campus de Nixon Saavedra.
        </p>
      </td>
    </tr>
  </table>
</body>
</html>`;
}

/**
 * Envía un correo a través de la API de Resend. Lanza un error legible si
 * falta la API key o si Resend responde con error, para que las Edge
 * Functions puedan devolver un mensaje claro en vez de fallar en silencio.
 */
export async function sendBrandedEmail(params: {
  to: string;
  subject: string;
  preheader?: string;
  bodyHtml: string;
  ctaText?: string;
  ctaUrl?: string;
}): Promise<void> {
  if (!RESEND_API_KEY) {
    throw new Error(
      "Falta el secret RESEND_API_KEY. Configúralo en Supabase → Edge Functions → Secrets — ver supabase/CORREOS-SETUP.md."
    );
  }

  const html = brandEmailShell({
    preheader: params.preheader,
    bodyHtml: params.bodyHtml,
    ctaText: params.ctaText,
    ctaUrl: params.ctaUrl,
  });

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
