-- ============================================================
-- PLANTILLA: conecta cada archivo de audio a su pregunta/lectura
-- ============================================================
-- Corre esto DESPUÉS de subir tus 23 archivos .mp3 a Supabase
-- Storage (ver PASO 1 abajo). Reemplaza cada 'PEGA_AQUI_LA_URL...'
-- por la URL pública real de ese archivo, y luego corre todo el
-- script en el SQL Editor.
--
-- PASO 1 — subir los audios a Supabase Storage:
--   1. Ve a tu proyecto → Storage → "New bucket".
--   2. Nombre: listening-audio · Marca "Public bucket" (para que el
--      navegador del estudiante pueda reproducirlo directamente).
--   3. Sube los 23 archivos con los nombres exactos del documento
--      "Guiones-Audio-Listening-A2-KET.md" (L12-readings-q1.mp3, etc.)
--   4. Por cada archivo, clic derecho → "Copy URL" (o ábrelo y copia
--      la URL) — se ve algo así:
--      https://TU-PROYECTO.supabase.co/storage/v1/object/public/listening-audio/L12-readings-q1.mp3
--   5. Pega cada URL abajo, en el lugar correspondiente.
-- ============================================================

-- ------------------------------------------------------------
-- AUDIOS DE PRÁCTICA (van dentro de lesson_json, con guion visible)
-- ------------------------------------------------------------

-- L12-practice-parte1.mp3 → Listening Partes 1 y 2, Lectura 1
update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('PEGA_AQUI_LA_URL_L12_practice_parte1'::text))
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes';

-- L12-practice-parte2.mp3 → Listening Partes 1 y 2, Lectura 2
update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading2,audio_url}', to_jsonb('PEGA_AQUI_LA_URL_L12_practice_parte2'::text))
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes';

-- L345-practice-parte3.mp3 → Listening Partes 3, 4 y 5, Lectura 1
update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('PEGA_AQUI_LA_URL_L345_practice_parte3'::text))
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos';

-- L345-practice-parte45.mp3 → Listening Partes 3, 4 y 5, Lectura 2
update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading2,audio_url}', to_jsonb('PEGA_AQUI_LA_URL_L345_practice_parte45'::text))
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos';

-- ------------------------------------------------------------
-- AUDIOS EVALUATIVOS (van en quiz_questions.audio_url, sin guion,
-- máximo 2 reproducciones)
-- ------------------------------------------------------------

-- Helper: identifica la pregunta por curso + módulo + stage + order_index
-- (order_index es 0-based: q1 del guion = order_index 0, q2 = order_index 1, etc.)

update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L12_readings_q1'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'readings' and qq.order_index = 0;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L12_readings_q2'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'readings' and qq.order_index = 1;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L12_readings_q3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'readings' and qq.order_index = 2;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L12_readings_q4'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'readings' and qq.order_index = 3;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L12_readings_q5'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'readings' and qq.order_index = 4;

update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L12_interactive_q1'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'interactive' and qq.order_index = 0;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L12_interactive_q2'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'interactive' and qq.order_index = 1;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L12_interactive_q3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'interactive' and qq.order_index = 2;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L12_interactive_q4'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'interactive' and qq.order_index = 3;
-- (la pregunta 5/order_index 4 de este cuestionario NO lleva audio_url — es la de estrategia)

update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L345_readings_q1'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'readings' and qq.order_index = 0;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L345_readings_q2'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'readings' and qq.order_index = 1;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L345_readings_q3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'readings' and qq.order_index = 2;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L345_readings_q4'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'readings' and qq.order_index = 3;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L345_readings_q5'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'readings' and qq.order_index = 4;

update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L345_interactive_q1'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'interactive' and qq.order_index = 0;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L345_interactive_q2'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'interactive' and qq.order_index = 1;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L345_interactive_q3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'interactive' and qq.order_index = 2;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L345_interactive_q4'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'interactive' and qq.order_index = 3;
update public.quiz_questions qq set audio_url = 'PEGA_AQUI_LA_URL_L345_interactive_q5'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'interactive' and qq.order_index = 4;
