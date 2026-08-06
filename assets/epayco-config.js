// ============================================================
// Configuración de ePayco — Campus Saavedra
// ============================================================
// Reemplaza con tu "Public Key" (Panel ePayco → Configuración → Integraciones
// → "Public key del comercio"). Esta llave SÍ es segura de tener en el
// código público del sitio — está hecha para usarse desde el navegador.
//
// NUNCA pongas aquí tu P_KEY ni tu PRIVATE_KEY: esas son secretas y solo
// deben vivir como variables de entorno en la Edge Function de Supabase.
// ============================================================

window.EPAYCO_PUBLIC_KEY = "TU-PUBLIC-KEY-AQUI";
window.EPAYCO_TEST_MODE = true; // cámbialo a false cuando quieras cobrar de verdad
