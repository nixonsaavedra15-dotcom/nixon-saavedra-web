# Correos con marca — guía de configuración

Esto conecta el Campus con **Resend** (resend.com) para que **todos** los
correos automáticos —invitación, compra confirmada, curso asignado gratis,
recuperar contraseña, respuesta de soporte, certificado emitido— salgan con
el nombre y los colores del sitio, en vez del correo genérico (y poco
confiable) que manda Supabase por defecto.

No necesitas tocar nada en **Authentication → Email Templates** de Supabase:
las funciones nuevas generan sus propios enlaces y mandan su propio correo,
así que ese sistema deja de usarse por completo para estos flujos.

> **Nota histórica:** al principio se envió por SMTP directo (Hostinger) con
> la librería `denomailer`. Esa librería tenía un bug irresoluble corriendo
> dentro del runtime de Supabase Edge Functions que corrompía el cuerpo del
> correo (llegaba como texto/MIME crudo en vez de HTML renderizado, "como un
> virus"). Por eso se migró por completo a Resend, que envía por HTTP y no
> tiene ese problema — confirmado funcionando en todas las funciones.

---

## 1. Cuenta de Resend y dominio verificado

1. Crea una cuenta en [resend.com](https://resend.com).
2. Ve a **Domains → Add Domain** y agrega `nixonsaavedraescritor.com`.
3. Resend te da unos registros DNS (DKIM tipo TXT en `resend._domainkey`, y
   un subdominio `send` con MX + TXT para SPF). Agrégalos en tu proveedor de
   DNS (en este caso Hostinger, en hPanel → Dominios → tu dominio → DNS).
4. Espera a que Resend marque el dominio como **Verified** (puede tardar
   desde minutos hasta un par de horas según el DNS).
5. Ve a **API Keys → Create API Key** y copia la clave — la necesitas en el
   siguiente paso.

## 2. Configurar los "secrets" en Supabase

Ve a tu proyecto → **Project Settings → Edge Functions → Secrets** (o usa la
CLI si la tienes instalada) y agrega:

```
RESEND_API_KEY=re_xxxxxxxxxxxxxxxxxxxxxxxx
FROM_EMAIL=notificaciones@nixonsaavedraescritor.com
FROM_NAME=Nixon Saavedra · Campus
REPLY_TO=nixonsaavedra15@gmail.com
SITE_URL=https://nixonsaavedraescritor.com
CERTIFICATE_WEBHOOK_SECRET=inventa-una-clave-larga-y-aleatoria-aqui
```

Con la CLI, desde la carpeta `sitio/`:

```bash
supabase secrets set RESEND_API_KEY="re_xxxxxxxxxxxxxxxxxxxxxxxx"
supabase secrets set FROM_EMAIL=notificaciones@nixonsaavedraescritor.com
supabase secrets set FROM_NAME="Nixon Saavedra · Campus"
supabase secrets set REPLY_TO=nixonsaavedra15@gmail.com
supabase secrets set SITE_URL=https://nixonsaavedraescritor.com
supabase secrets set CERTIFICATE_WEBHOOK_SECRET="inventa-una-clave-larga-y-aleatoria-aqui"
```

`SUPABASE_URL` y `SUPABASE_SERVICE_ROLE_KEY` ya deberían existir de antes
(se usan desde que montaste `epayco-webhook`). `FROM_EMAIL` debe ser una
dirección del dominio verificado en Resend (paso 1) — si no, los envíos
fallan.

## 3. Desplegar las funciones

Cada función es un solo archivo autocontenido (`index.ts`) — pensado a
propósito para poder copiarlo y pegarlo tal cual en el editor del navegador
de Supabase, sin instalar nada. `_shared/email.ts` es solo la versión de
referencia/documentación; el código real que se despliega ya está repetido
dentro de cada `index.ts`.

**Opción A — desde el navegador (recomendada, sin instalar nada):**

Ve a **Edge Functions → Deploy a new function → Via Editor**.

- Para las 3 funciones nuevas (`request-password-reset`, `notify-support-reply`,
  `notify-certificate`): escribe el nombre exacto de la función, borra el
  código de ejemplo que trae el editor, y pega el contenido completo del
  archivo `supabase/functions/<nombre>/index.ts` correspondiente. Dale Deploy.
- Para las 2 que ya existían (`admin-assign-course`, `epayco-webhook`): en la
  lista de Edge Functions, haz clic en el nombre de la función → busca la
  opción de editar/ver el código (ícono de lápiz o "Edit function") → reemplaza
  todo el contenido por el del archivo actualizado → Deploy.

**Opción B — con la CLI de Supabase (si la tienes instalada):**

```bash
supabase functions deploy admin-assign-course
supabase functions deploy epayco-webhook
supabase functions deploy request-password-reset
supabase functions deploy notify-support-reply
supabase functions deploy notify-certificate
```

En cualquiera de las dos opciones, verifica que `request-password-reset`
quede marcada como pública (sin "Enforce JWT verification"), igual que
`admin-assign-course` — se protege sola por lógica interna, no por el header
de autorización, porque cualquiera debe poder pedir "olvidé mi contraseña"
sin haber iniciado sesión.

## 4. Conectar el correo de certificado

Lo ideal es usar **Database → Webhooks** desde el dashboard (Create a new
hook → Table `certificates` → Insert → Edge Function `notify-certificate` →
header `x-webhook-secret`). Pero en este proyecto esa función salió con el
error `schema "supabase_functions" does not exist` (un bug conocido de
Supabase en algunos proyectos), así que se conectó por SQL directo en su
lugar — mismo resultado, sin depender de esa pieza rota.

El script ya quedó ejecutado: `supabase/notify-certificate-trigger.sql`
(crea una función que usa `pg_net` para llamar a `notify-certificate` cada
vez que se inserta un certificado, más el trigger que la dispara). Si algún
día se recrea el proyecto o hay que repetir esto, solo hay que volver a
correr ese archivo en el SQL Editor (reemplazando la clave del secret si
cambió).

Así, cada vez que un estudiante termina todos los módulos de un curso (el
trigger `handle_course_completed` de `schema.sql` inserta su certificado
automáticamente), este segundo trigger dispara el correo sin que el sitio
tenga que hacer nada.

## 5. Qué correo llega en cada caso

| Evento | Dónde se dispara | A quién |
|---|---|---|
| Compra en la tienda (ePayco aprueba el pago) | `epayco-webhook` | comprador — con enlace para crear contraseña si es cuenta nueva, o botón "Entrar" si ya tenía |
| Admin asigna curso gratis | `admin-assign-course` | estudiante — mismo patrón |
| "Olvidé mi contraseña" / admin restablece la de un estudiante | `request-password-reset` | esa persona — enlace para crear nueva contraseña |
| Admin responde una pregunta de soporte | `notify-support-reply` | el estudiante que preguntó |
| Se completan todos los módulos de un curso | `notify-certificate` (vía webhook) | el estudiante — aviso de certificado listo |

## 6. Cómo probar que todo quedó bien

1. En `admin.html`, asigna un curso gratis a un correo tuyo que **no** tenga
   cuenta todavía → deberías recibir el correo con botón "Crear mi
   contraseña y entrar" en menos de un minuto (revisa spam la primera vez).
2. Repite con un correo que **ya** tenga cuenta → deberías recibir el correo
   con botón "Entrar a mi Campus" (sin pedir contraseña nueva).
3. En `login.html`, usa "¿Olvidaste tu contraseña?" con tu propio correo →
   debería llegarte el correo de recuperación.
4. En `admin.html` → Soporte, responde una pregunta de prueba → el
   estudiante debería recibir el correo con la respuesta.
5. Marca todos los módulos de un curso de prueba como completados desde una
   cuenta de estudiante → debería llegar el correo de certificado (esto
   confirma que el Database Webhook quedó bien conectado).

Si algún paso no manda el correo, revisa los logs de la función en Supabase
→ **Edge Functions → (nombre de la función) → Logs** — ahí queda el error
exacto (`RESEND_API_KEY` faltante, dominio no verificado en Resend, etc.).
También puedes revisar el historial de envíos directamente en
**resend.com → Emails**, que muestra el estado de cada correo (entregado,
rebotado, etc.).

## 7. Nota sobre entregabilidad (que no caiga en spam)

Con el dominio verificado en Resend (paso 1), SPF y DKIM quedan correctos
automáticamente para los correos enviados desde `FROM_EMAIL`. Si algún
correo cae en spam de todos modos, revisa en Resend → Domains que el estado
siga en "Verified" (los registros DNS a veces se editan sin querer en el
proveedor del dominio).
