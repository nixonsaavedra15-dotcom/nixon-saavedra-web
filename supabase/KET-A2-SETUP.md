# Inglés A2 (KET) — despliegue

Mismo mecanismo que Pre-ICFES: solo SQL, no necesita funciones nuevas
(usa las mismas `submit-quiz`, `submit-closing-form`, `update-lesson-step`
ya desplegadas).

Corre estos archivos en el SQL Editor, en este orden:

1. `supabase/ket-a2-restructure.sql` — reemplaza los 8 módulos viejos
   por los 11 módulos nuevos, organizados por partes del examen A2 Key.
2. `supabase/ket-batch1-intro-reading12.sql` — Introducción + Reading
   Partes 1 y 2.
3. `supabase/ket-batch2-reading345.sql` — Reading Partes 3, 4 y 5.
4. `supabase/ket-batch3-writing.sql` — Writing (mensaje corto +
   mini-historia de 3 imágenes, con ilustración propia).
5. `supabase/ket-batch4-listening12.sql` — Listening Partes 1 y 2
   (incluye opciones con imagen, estilo picture-choice real).
6. `supabase/ket-batch5-listening345.sql` — Listening Partes 3, 4 y 5
   (conversación larga + datos exactos: números, nombres, horas).
7. `supabase/ket-batch6-speaking.sql` — Speaking (entrevista +
   tarea colaborativa). Nota: sin examinador/compañero real, se
   adapta a práctica de auto-grabación en voz alta.

**Nota sobre Listening:** este entorno no genera audio real, así que
las lecciones usan las transcripciones de los diálogos ("lee como si
lo escucharas"), dejando claro que es una sustitución del audio. La
estrategia que se enseña (leer las opciones antes, detectar palabras
de corrección como "actually"/"no wait") es la misma que aplicarías
escuchando audio real.

Van a seguir llegando más archivos (`ket-batch7...`) para los dos
simulacros completos y el certificado — los iré agregando aquí a
medida que estén listos. Corre cada uno en cuanto te lo entregue, no
hace falta esperar a tener todos.
