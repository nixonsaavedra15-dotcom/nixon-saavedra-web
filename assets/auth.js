// ============================================================
// Helpers de autenticación — Campus Saavedra
// ============================================================
// Requiere, en este orden, antes de este archivo:
//   <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.min.js"></script>
//   <script src="assets/supabase-config.js"></script>
// ============================================================

const supabaseClient =
  window.SUPABASE_URL && window.SUPABASE_URL.indexOf("TU-PROYECTO") === -1
    ? window.supabase.createClient(window.SUPABASE_URL, window.SUPABASE_ANON_KEY)
    : null;

function supabaseReady() {
  if (!supabaseClient) {
    console.warn(
      "Supabase todavía no está conectado. Edita assets/supabase-config.js con tus llaves reales."
    );
  }
  return !!supabaseClient;
}

// Redirige a login.html si no hay sesión activa. Devuelve la sesión si sí la hay.
async function requireSession() {
  if (!supabaseReady()) return null;
  const {
    data: { session },
  } = await supabaseClient.auth.getSession();
  if (!session) {
    window.location.href = "login.html";
    return null;
  }
  return session;
}

async function logout() {
  if (!supabaseReady()) return;
  await supabaseClient.auth.signOut();
  window.location.href = "login.html";
}
