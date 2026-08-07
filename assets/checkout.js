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
// Qué hace: si ya hay una sesión activa (Google o correo), usa esos
// datos directamente y abre el pago. Si no hay sesión, deja elegir
// entre "Continuar con Google" (crea/usa la cuenta de Google y luego
// retoma la compra automáticamente) o "Continuar con tu correo" (el
// flujo de siempre: la cuenta se crea después de que ePayco confirme
// el pago). En ambos casos, cuando ePayco confirma, la Edge Function
// (epayco-webhook) matricula al estudiante en el curso.
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

  const {
    data: { session },
  } = await supabaseClient.auth.getSession();

  if (session) {
    // Ya hay una cuenta activa (Google o correo) — se usa directo, sin preguntar nada.
    const email = session.user.email;
    const fullName =
      session.user.user_metadata?.full_name || session.user.user_metadata?.name || "";
    return abrirPagoEpayco(courseSlug, price, title, email, fullName);
  }

  const conGoogle = confirm(
    "Para comprar necesitas una cuenta (así recibes acceso automático a tu curso).\n\n" +
      "Aceptar = Continuar con Google\n" +
      "Cancelar = Continuar con tu correo"
  );

  if (conGoogle) {
    sessionStorage.setItem("pendingPurchase", JSON.stringify({ courseSlug, price, title }));
    await supabaseClient.auth.signInWithOAuth({
      provider: "google",
      options: { redirectTo: window.location.origin + "/tienda.html" },
    });
    return; // la página se va a Google y vuelve sola a tienda.html
  }

  const email = prompt("Tu correo (ahí recibirás tu acceso al curso):");
  if (!email) return;
  const fullName = prompt("Tu nombre completo:") || "";
  await abrirPagoEpayco(courseSlug, price, title, email, fullName);
}

async function abrirPagoEpayco(courseSlug, price, title, email, fullName) {
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

// Si la persona eligió "Continuar con Google" y la página acaba de volver
// del login de Google, retoma la compra que había quedado pendiente.
(async function resumirCompraPendiente() {
  if (!supabaseReady()) return;
  const pending = sessionStorage.getItem("pendingPurchase");
  if (!pending) return;

  const {
    data: { session },
  } = await supabaseClient.auth.getSession();
  if (!session) return;

  sessionStorage.removeItem("pendingPurchase");
  const { courseSlug, price, title } = JSON.parse(pending);
  const email = session.user.email;
  const fullName = session.user.user_metadata?.full_name || session.user.user_metadata?.name || "";
  await abrirPagoEpayco(courseSlug, price, title, email, fullName);
})();
