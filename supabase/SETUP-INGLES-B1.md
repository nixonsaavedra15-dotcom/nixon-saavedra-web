# Montar el curso "Inglés B1 — Aprendizaje real" — guía paso a paso

Este es el cuarto curso del sitio, y el primero que no es de examen sino
de aprendizaje real de inglés en nivel B1 (gramática, vocabulario,
expresiones, y las 4 destrezas — reading, writing, listening, speaking
— alrededor de un tema por unidad). Usa exactamente el mismo motor de
lección multi-paso que Cambridge A2 Key y Pre-ICFES: no hace falta
tocar ninguna Edge Function nueva.

**Criterio de idioma del contenido:** lecturas, vocabulario, ejemplos y
diálogos están en inglés (ahí se practica el idioma real); las
explicaciones de gramática, los tips, las instrucciones y el cierre de
cada unidad están en español, para que el autoestudio sin profesor en
vivo no genere confusión.

## 0. Requisito previo

Estos scripts ya deberían estar corridos en tu Supabase (son los mismos
que usan Cambridge A2 Key y Pre-ICFES). Si esos dos cursos ya funcionan
en tu sitio, sáltate este paso y ve directo al punto 1:

- `schema.sql`
- `admin-schema.sql`
- `quiz-schema.sql`
- `lesson-flow-schema.sql`
- `quiz-open-answer-schema.sql`

Es seguro volver a correr cualquiera de ellos si tienes dudas — todos
usan `create table if not exists` / `add column if not exists`.

## 1. Corre estos 12 archivos, en este orden exacto

En Supabase → **SQL Editor** → New query → pega el contenido completo
de cada archivo → **Run**. Espera a que cada uno termine antes de
seguir con el siguiente.

| # | Archivo | Qué hace |
|---|---|---|
| 1 | `supabase/seed-ingles-b1-modules.sql` | Crea el curso "Inglés B1" (precio $420.000) y las 12 filas de módulos vacíos |
| 2 | `supabase/b1-batch1-intro-unit1.sql` | Introducción + Unidad 1 — Daily Life & Routines |
| 3 | `supabase/b1-batch2-unit2.sql` | Unidad 2 — Stories From the Past (incluye tabla completa de verbos irregulares) |
| 4 | `supabase/b1-batch3-unit3.sql` | Unidad 3 — What's Coming Next |
| 5 | `supabase/b1-batch4-unit4.sql` | Unidad 4 — Travelling |
| 6 | `supabase/b1-batch5-unit5.sql` | Unidad 5 — The World of Work |
| 7 | `supabase/b1-batch6-unit6.sql` | Unidad 6 — Health & Lifestyle |
| 8 | `supabase/b1-batch7-unit7.sql` | Unidad 7 — Technology & Communication |
| 9 | `supabase/b1-batch8-unit8.sql` | Unidad 8 — Environment & Society |
| 10 | `supabase/b1-batch9-unit9.sql` | Unidad 9 — Relationships & Feelings |
| 11 | `supabase/b1-batch10-unit10.sql` | Unidad 10 — Culture & Celebrations |
| 12 | `supabase/b1-batch11-unit11.sql` | Unidad 11 — Final Review & Certification (quiz final que desbloquea el certificado) |
| 13 | `supabase/b1-listening-audio-urls.sql` | Conecta los 11 audios de Listening ya grabados (ver sección 2 más abajo — sube los archivos a Storage antes de correr este) |

Los 12 son seguros de correr más de una vez (los `UPDATE` se
sobrescriben y los `INSERT` usan `on conflict do nothing`), así que si
algo falla a mitad de camino puedes volver a correr ese mismo archivo
sin miedo a duplicar nada.

**No hace falta desplegar ninguna función nueva** — este curso usa
exactamente la misma infraestructura (`submit-quiz`,
`submit-closing-form`, `update-lesson-step`, `submit-speaking-attempt`)
que ya está desplegada y funcionando para Cambridge A2 Key.

## 2. Listening — conectar los 11 audios

Ya grabaste los 11 audios (carpeta "Audios B1") y ya los renombré ahí
mismo con el nombre exacto que necesita el siguiente paso
(`b1-unit01-daily-life-routines.mp3` ... `b1-unit11-final-review-certification.mp3`).

1. Supabase → **Storage** → bucket `listening-audio` (el mismo que ya
   usa Cambridge A2 Key, no hace falta crear uno nuevo) → sube los 11
   archivos con el prefijo `b1-unit...` tal cual están nombrados.
2. Corre `supabase/b1-listening-audio-urls.sql` completo en el SQL
   Editor. Al final te muestra una consulta de verificación — debe
   devolver 11 filas, cada una con su `audio_url` ya asignado.

El audio queda dentro de la primera lectura de cada unidad, con el
mismo reproductor (guion visible + límite de reproducciones) que ya
usa Cambridge A2 Key — no hay que tocar código.

## 3. Agrega el curso a `campus.html` y `tienda.html`

Todavía no está agregada la tarjeta del curso en ninguna de las dos
páginas. Cuando quieras, dime y la agrego siguiendo el mismo formato
que las tarjetas de Cambridge A2 Key y Pre-ICFES (imagen de portada,
precio, botón de compartir). Vas a necesitar una imagen de portada
nueva para este curso — puedo escribirte el prompt para generarla,
igual que hice con los otros 3.

## 4. Sube los archivos a GitHub

Desde tu Mac (Terminal, en la carpeta del sitio):

```bash
cd ~/Documents/"Web Nixon"/sitio
git add -A
git commit -m "Contenido completo del curso Ingles B1 (11 unidades + introduccion)"
git push
```

## 5. Cómo probarlo

1. Entra al Campus con una cuenta matriculada en "Inglés B1" (o
   asígnate el curso gratis desde el panel admin).
2. Abre el módulo **"Introduction — Welcome to B1"**.
3. Recorre el flujo completo de una unidad: bienvenida → lectura 1 →
   lectura 2 → quiz de lecturas → interactivo (match o flashcards,
   alternan por unidad) → quiz interactivo → lectura de práctica →
   speaking (grábate con el micrófono) → formulario de cierre.
4. Al enviar el formulario, si aprobaste los dos quizzes (70% cada
   uno), debe desbloquear la siguiente unidad. Repite en las 11
   unidades.
5. En la Unidad 11, el segundo quiz es el **quiz final** — aprobarlo
   debe desbloquear el certificado del curso, igual que en Cambridge
   A2 Key.
6. Si cierras el navegador a la mitad, al volver deberías retomar en
   el mismo paso.

## Qué revisar y decirme

- Si el balance de español/inglés en las 11 unidades te parece
  correcto (lecturas y ejemplos en inglés, explicaciones en español).
- Si el nivel de dificultad progresa bien de la Unidad 1 a la 11.
- Si quieres que ajuste algo del temario original antes de grabar los
  11 audios de Listening (es más fácil ajustar el guion ahora que
  después de grabarlo).
- Cuando confirmes que el contenido se ve bien, seguimos con: guiones
  grabados → tarjeta del curso en campus.html/tienda.html → imagen de
  portada → botón de compra activado.
