-- ============================================================
-- Conecta cada archivo de audio a su pregunta/lectura
-- ============================================================
-- Las URLs de abajo YA están completas (generadas con tu URL real de
-- proyecto: wyyayvipqvvjoiwlxjgl.supabase.co) — no tienes que pegar
-- nada a mano, siempre y cuando subas los archivos exactamente así:
--
-- PASO 1 — subir los audios a Supabase Storage:
--   1. Ve a tu proyecto → Storage → "New bucket".
--   2. Nombre exacto: listening-audio · Marca "Public bucket" (para
--      que el navegador del estudiante pueda reproducirlo directo).
--   3. Sube los 23 archivos de tu carpeta "Audios English A2" TAL
--      CUAL están nombrados (ya los revisé: los 23 están correctos —
--      corregí uno que tenía ".mp3.mp3" por error, "L12-readings-q1").
--
-- PASO 2 — corre este script completo en el SQL Editor. Si algún
-- nombre de archivo no coincide exactamente (mayúsculas, guion vs.
-- guion bajo, etc.), esa fila no encontrará el audio — puedes
-- verificar cuáles quedaron sin pegar con la consulta de abajo del
-- todo.
-- ============================================================

-- ------------------------------------------------------------
-- AUDIOS DE PRÁCTICA (van dentro de lesson_json, con guion visible)
-- ------------------------------------------------------------

-- L12-practice-parte1.mp3 → Listening Partes 1 y 2, Lectura 1
update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L12-practice-parte1.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes';

-- L12-practice-parte2.mp3 → Listening Partes 1 y 2, Lectura 2
update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading2,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L12-practice-parte2.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes';

-- L345-practice-parte3.mp3 → Listening Partes 3, 4 y 5, Lectura 1
update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-practice-parte3.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos';

-- L345-practice-parte45.mp3 → Listening Partes 3, 4 y 5, Lectura 2
update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading2,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-practice-parte45.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos';

-- ------------------------------------------------------------
-- AUDIOS EVALUATIVOS (van en quiz_questions.audio_url, sin guion,
-- máximo 2 reproducciones)
-- ------------------------------------------------------------

-- Helper: identifica la pregunta por curso + módulo + stage + order_index
-- (order_index es 0-based: q1 del guion = order_index 0, q2 = order_index 1, etc.)

update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L12-readings-q1.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'readings' and qq.order_index = 0;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L12-readings-q2.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'readings' and qq.order_index = 1;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L12-readings-q3.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'readings' and qq.order_index = 2;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L12-readings-q4.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'readings' and qq.order_index = 3;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L12-readings-q5.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'readings' and qq.order_index = 4;

update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L12-interactive-q1.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'interactive' and qq.order_index = 0;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L12-interactive-q2.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'interactive' and qq.order_index = 1;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L12-interactive-q3.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'interactive' and qq.order_index = 2;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L12-interactive-q4.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes' and qz.stage = 'interactive' and qq.order_index = 3;
-- (la pregunta 5/order_index 4 de este cuestionario NO lleva audio_url — es la de estrategia)

update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-readings-q1.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'readings' and qq.order_index = 0;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-readings-q2.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'readings' and qq.order_index = 1;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-readings-q3.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'readings' and qq.order_index = 2;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-readings-q4.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'readings' and qq.order_index = 3;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-readings-q5.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'readings' and qq.order_index = 4;

update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-interactive-q1.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'interactive' and qq.order_index = 0;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-interactive-q2.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'interactive' and qq.order_index = 1;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-interactive-q3.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'interactive' and qq.order_index = 2;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-interactive-q4.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'interactive' and qq.order_index = 3;
update public.quiz_questions qq set audio_url = 'https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/L345-interactive-q5.mp3'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos' and qz.stage = 'interactive' and qq.order_index = 4;

-- ------------------------------------------------------------
-- VERIFICACIÓN — corre esto al final para confirmar que las 23
-- filas sí quedaron conectadas (si el bucket/nombres no coinciden,
-- audio_url se queda en null y no aparece aquí)
-- ------------------------------------------------------------
select 'práctica' as tipo, m.title as modulo, 'reading1' as parte, m.lesson_json->'reading1'->>'audio_url' as audio_url
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title like 'Listening%' and m.lesson_json->'reading1'->>'audio_url' is not null
union all
select 'práctica', m.title, 'reading2', m.lesson_json->'reading2'->>'audio_url'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title like 'Listening%' and m.lesson_json->'reading2'->>'audio_url' is not null
union all
select 'evaluativo', m.title, qz.stage || ' · pregunta ' || (qq.order_index + 1), qq.audio_url
from public.quiz_questions qq
join public.quizzes qz on qz.id = qq.quiz_id
join public.modules m on m.id = qz.module_id
join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title like 'Listening%' and qq.audio_url is not null
order by 1, 2, 3;
-- Deberías ver 23 filas en total (4 de práctica + 19 evaluativas).
