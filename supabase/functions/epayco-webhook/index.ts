// ============================================================
// epayco-webhook — Supabase Edge Function
// ============================================================
// Qué hace: ePayco llama a esta URL automáticamente cuando alguien paga.
// La función verifica que el pago sea real (no falsificado), y si fue
// aprobado, crea la cuenta del estudiante (o la reutiliza), lo matricula
// en el curso comprado, y le envía el correo de acceso (lo envía Supabase
// automáticamente, no hace falta ningún servicio de correo adicional).
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
// ============================================================

import { serve } from "https://deno.land/std@0.203.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const P_CUST_ID_CLIENTE = Deno.env.get("EPAYCO_P_CUST_ID_CLIENTE")!;
const P_KEY = Deno.env.get("EPAYCO_P_KEY")!;
const SITE_URL = Deno.env.get("SITE_URL") ?? "https://nixonsaavedraescritor.com";

const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

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
    .select("id")
    .eq("slug", order.course_slug)
    .maybeSingle();

  if (!course) {
    return new Response("Curso no encontrado", { status: 404 });
  }

  // 5. ¿El estudiante ya tiene cuenta? Si no, se crea y se le envía el
  //    correo de invitación (Supabase lo manda automáticamente con un
  //    enlace para que el propio estudiante cree su contraseña).
  const { data: existingProfile } = await supabase
    .from("profiles")
    .select("id")
    .eq("email", order.email)
    .maybeSingle();

  let userId: string;

  if (existingProfile) {
    userId = existingProfile.id;
  } else {
    const { data: invited, error: inviteError } = await supabase.auth.admin.inviteUserByEmail(
      order.email,
      {
        data: { full_name: order.full_name },
        redirectTo: `${SITE_URL}/crear-contrasena.html`,
      }
    );
    if (inviteError || !invited?.user) {
      console.error("Error invitando estudiante:", inviteError);
      return new Response("No se pudo crear la cuenta", { status: 500 });
    }
    userId = invited.user.id;
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
    message: "¡Tu compra fue confirmada! Ya tienes acceso a tu curso.",
  });

  return new Response("OK", { status: 200 });
});
