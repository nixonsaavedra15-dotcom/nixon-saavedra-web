# Alinear Inglés A2 (KET) con el formato real del examen

Auditoría completa contra tus imágenes del examen A2 Key real: la mayoría del curso ya estaba bien construido — Reading Partes 1, 2, 3 y 4, y Writing, ya coinciden con el formato real (mismo número de opciones, mismo estilo de pregunta). Encontré y corregí 2 problemas:

1. **Reading Parte 5** decía "respuesta abierta, sin opciones" pero en realidad mostraba A/B/C igual que la Parte 4. El examen real no da opciones — el estudiante escribe la palabra. Como la plataforma solo sabía hacer preguntas de opción múltiple, construí un tipo de pregunta nuevo (casilla de texto, calificada en el servidor) y reconstruí ambos quizzes de esta parte con el formato real.
2. **Módulo 10 "Simulacro final"** estaba completamente vacío — sin lección, sin examen. Lo llené con un examen real de **30 preguntas de Reading**, en la distribución exacta del examen (Parte 1 = 6, Parte 2 = 7, Parte 3 = 5, Parte 4 = 6, Parte 5 = 6), cada parte en su formato auténtico.

**Sobre Listening (Partes 2, 4 y 5):** confirmaste que prefieres dejarlas como están por ahora, para no invalidar los 23 audios que ya grabaste en ElevenLabs. No las toqué. Si más adelante quieres alinearlas al formato real (Parte 2 = completar un formulario, Parte 4 = 5 conversaciones cortas separadas, Parte 5 = relacionar 5 lugares con 8 objetos), te preparo los guiones nuevos cuando quieras.

**Sobre el Simulacro final:** el módulo prometía "dos simulacros completos". Por ahora construí **uno**, real y completo en Reading (30 preguntas). Speaking y Writing no están incluidos ahí porque no se pueden calificar automáticamente — se siguen practicando en sus propios módulos, igual que ya funcionaba. Ajusté la descripción del módulo para que sea honesta con lo que hay.

## 1. Correr el SQL — en Supabase → SQL Editor, en este orden

1. **`quiz-open-answer-schema.sql`** — crea el nuevo tipo de pregunta de texto abierto (columna `answer_type` en `quiz_questions`, tabla `quiz_text_answers` con las respuestas correctas protegidas — igual de seguras que las opciones de multiple choice, nunca visibles para el estudiante).
2. **`ket-reading5-respuesta-abierta-real.sql`** — reemplaza los 2 quizzes de Reading Parte 5 por preguntas de escribir-una-palabra reales.
3. **`ket-simulacro-final-30-preguntas.sql`** — llena el Módulo 10 con el examen de 30 preguntas.

## 2. Desplegar la función actualizada

`submit-quiz` ahora también califica preguntas de texto abierto (comparando, sin mayúsculas ni espacios extra, contra la respuesta guardada).

```bash
cd "/Users/macbookpro/Documents/Web Nixon/sitio"
supabase functions deploy submit-quiz
```

## 3. Subir los cambios de código

```bash
git add assets/style.css leccion.html admin-preview.html supabase/quiz-open-answer-schema.sql supabase/ket-reading5-respuesta-abierta-real.sql supabase/ket-simulacro-final-30-preguntas.sql supabase/functions/submit-quiz/index.ts supabase/SETUP-KET-FORMATO-REAL.md
git commit -m "Inglés A2: Reading Parte 5 con respuesta abierta real + Simulacro final de 30 preguntas"
git push
```

## Cómo verificarlo

1. Entra a `admin.html` → Inglés A2 → **"👁 Vista completa"** en Reading Parte 5 y en Simulacro final. Vas a ver, para las preguntas de texto abierto, la(s) respuesta(s) aceptada(s) en vez de opciones A/B/C.
2. Como estudiante (o con "Entrar a este curso" desde admin), entra a Reading Parte 5: deberías ver una casilla de texto vacía en cada pregunta, no botones.
3. Entra al Simulacro final: deberías ver 30 preguntas en total, empezando con avisos (Parte 1), siguiendo con el emparejamiento de Sara/Nico/Elena (Parte 2), la lectura de Daniel (Parte 3), el texto con espacios de las vacaciones (Parte 4), y terminando con la postal a la abuela en respuesta abierta (Parte 5).
