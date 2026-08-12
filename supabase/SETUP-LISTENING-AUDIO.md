# Cómo montar el audio de Listening (Inglés A2 / KET)

Todo el código ya está escrito. Esto es lo que falta que hagas tú, en orden.

## 1. Generar los audios en ElevenLabs

Usa el documento `Guiones-Audio-Listening-A2-KET.md` (en la raíz de tu carpeta) — tiene los 23 guiones listos para pegar, con el nombre de archivo exacto que debe llevar cada uno.

## 2. Correr el SQL — en Supabase → SQL Editor

En este orden exacto:

1. `listening-audio-schema.sql` — agrega la columna `audio_url` y la tabla que cuenta las reproducciones.
2. `listening-audio-cleanup-prompts.sql` — quita el texto del diálogo de las 19 preguntas evaluativas (ya no hace falta, ahora van a tener audio real) y deja solo la pregunta. Puedes correr esto ANTES de tener los audios listos — el reproductor simplemente no aparece hasta que una pregunta tenga `audio_url`.

No corras todavía `listening-audio-urls-TEMPLATE.sql` — ese es el paso 4.

## 3. Subir los 23 audios a Supabase Storage

Ya los tienes listos en tu carpeta "Audios English A2" (los revisé — los 23 están, y corregí un nombre que tenía ".mp3.mp3" por error).

1. Supabase → **Storage** → **New bucket**.
2. Nombre EXACTO: `listening-audio` · marca **Public bucket** (así el navegador del estudiante puede reproducirlo sin pedir permiso).
3. Sube los 23 archivos de esa carpeta tal cual están nombrados — no cambies nada, el siguiente paso depende de que el nombre coincida exactamente.

## 4. Conectar cada audio a su pregunta/lectura

Ya no tienes que copiar URLs a mano: usa `listening-audio-urls.sql` (ya viene con las 23 URLs completas, armadas con tu proyecto real). Ábrelo, pégalo completo en el SQL Editor y dale Run — al final corre una consulta de verificación que debe mostrarte 23 filas. Si te muestra menos, algún nombre de archivo no coincidió exactamente con lo que subiste (revisa mayúsculas/guiones).

*(`listening-audio-urls-TEMPLATE.sql` se queda solo como referencia por si algún día subes los audios con otros nombres — no lo necesitas si seguiste el paso 3 tal cual.)*

## 5. Desplegar las 3 funciones nuevas

Desde tu terminal, en la carpeta del proyecto:

```bash
supabase functions deploy register-audio-play
supabase functions deploy admin-reset-quiz-attempts
supabase functions deploy admin-reset-audio-plays
```

(No necesitan secrets nuevos — usan los mismos `SUPABASE_URL` / `SUPABASE_SERVICE_ROLE_KEY` que ya tienes configurados para las otras funciones.)

## 6. Subir los cambios de `leccion.html` y `admin.html`

Ya quedaron editados en tu carpeta local:
- `leccion.html` — las lecturas de Listening ahora muestran un reproductor con el guion visible (práctica); las preguntas evaluativas con audio muestran un botón de reproducir con el límite de 2 veces y la advertencia.
- `admin.html` — en "Ver vista de estudiante", cada módulo con cuestionario ahora tiene un botón **Reiniciar examen** (borra el historial de intentos de ese quiz para ese estudiante) y, si el cuestionario tiene audios, un botón **Reiniciar audios** (le devuelve sus 2 reproducciones).

```bash
git add .
git commit -m "Audio de Listening + reinicio de exámenes/audios desde admin"
git push
```

## Cómo probarlo

1. Entra como estudiante a un módulo de Listening → deberías ver el reproductor con guion en las dos lecturas, y en el quiz, el botón de audio con el límite de 2 reproducciones.
2. Reproduce el audio de una pregunta 2 veces → el botón debe bloquearse y mostrar la advertencia.
3. Entra al panel admin → busca a ese estudiante → "Ver vista de estudiante" → en ese módulo, clic en "Reiniciar audios" → vuelve a entrar como estudiante y confirma que el botón ya no está bloqueado.
4. Prueba igual "Reiniciar examen" con cualquier cuestionario.

## Notas

- El límite de 2 reproducciones vive en la base de datos (tabla `quiz_question_audio_plays`), no en el navegador — un estudiante no puede saltárselo limpiando caché o usando incógnito.
- "Reiniciar examen" borra `quiz_attempts` para ese estudiante + ese cuestionario puntual — no toca su progreso en otros módulos ni cuestionarios.
- Si más adelante generas audio para otro módulo (por ejemplo si decides grabar Speaking también), el mismo mecanismo sirve: solo necesitas otra tanda de `UPDATE`s de `audio_url`, no hace falta tocar el código de nuevo.
