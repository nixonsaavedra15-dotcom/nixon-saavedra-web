// ============================================================
// Checkout — Campus Saavedra
// ============================================================
// Requiere, antes de este archivo:
//   <script src="https://checkout.epayco.co/checkout.js"></script>
//   <script src="assets/epayco-config.js"></script>
//   <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.min.js"></script>
//   <script src="assets/supabase-config.js"></script>
//   <script src="assets/auth.js"></script>
//
// Qué hace: guarda un "pedido pendiente" en Supabase (para que la Edge
// Function sepa qué curso corresponde a qué pago), y abre la ventana de
// pago de ePayco. Cuando ePayco confirma el pago, avisa automáticamente
// a la Edge Function (epayco-webhook), que crea la cuenta del estudiante.
// ============================================================

async function iniciarCompra(courseSlug, price, title) {
  if (!window.EPAYCO_PUBLIC_KEY || window.EPAYCO_PUBLIC_KEY.indexOf("TU-PUBLIC-KEY") !== -1) {
    alert("El pago en línea todavía no está activo. Escríbeme y lo coordinamos: nixonsaavedra15@gmail.com");
    return;
  }
  if (!supabaseReady()) {
    alert("El Campus todavía no está conectado a la base de datos.");
    return;
  }

  const email = prompt("Tu correo (ahí recibirás tu acceso al curso):");
  if (!email) return;
  const fullName = prompt("Tu nombre completo:") || "";

  const orderRef = "ORD-" + Date.now() + "-" + Math.floor(Math.random() * 1000);

  const { error } = await supabaseClient.from("pending_orders").insert({
    order_ref: orderRef,
    email,
    full_name: fullName,
    course_slug: courseSlug,
  });

  if (error) {
    alert("No se pudo iniciar la compra: " + error.message);
    return;
  }

  const handler = ePayco.checkout.configure({
    key: window.EPAYCO_PUBLIC_KEY,
    test: !!window.EPAYCO_TEST_MODE,
  });

  handler.open({
    name: title,
    description: title,
    invoice: orderRef,
    currency: "cop",
    amount: String(price),
    tax_base: "0",
    tax: "0",
    country: "co",
    lang: "es",
    external: "false",
    extra1: courseSlug,
    email_billing: email,
    name_billing: fullName,
    response: window.location.origin + "/tienda.html",
    confirmation: window.SUPABASE_URL
      ? window.SUPABASE_URL + "/functions/v1/epayco-webhook"
      : "",
  });
}
