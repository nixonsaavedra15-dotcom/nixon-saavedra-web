-- ============================================================
-- Inglés B1 — Conecta los 11 audios de Listening a cada unidad
-- ============================================================
-- Las URLs de abajo ya están completas (mismo proyecto y mismo bucket
-- público que usa Cambridge A2 Key: wyyayvipqvvjoiwlxjgl.supabase.co,
-- bucket "listening-audio") — no tienes que pegar nada a mano, siempre
-- y cuando subas los 11 archivos exactamente con estos nombres:
--
-- PASO 1 — subir los audios a Supabase Storage:
--   1. Ve a tu proyecto → Storage → el bucket "listening-audio" ya
--      existe (lo creaste para Cambridge A2 Key) — no hace falta uno
--      nuevo, este script simplemente agrega 11 archivos más ahí.
--   2. Sube los 11 archivos que están en tu carpeta "Audios B1" con
--      el prefijo "b1-unit..." (ya los renombré ahí mismo, junto a los
--      originales, para que el nombre coincida exacto con este script):
--        b1-unit01-daily-life-routines.mp3
--        b1-unit02-stories-from-the-past.mp3
--        b1-unit03-whats-coming-next.mp3
--        b1-unit04-travelling.mp3
--        b1-unit05-the-world-of-work.mp3
--        b1-unit06-health-lifestyle.mp3
--        b1-unit07-technology-communication.mp3
--        b1-unit08-environment-society.mp3
--        b1-unit09-relationships-feelings.mp3
--        b1-unit10-culture-celebrations.mp3
--        b1-unit11-final-review-certification.mp3
--
-- PASO 2 — corre este script completo en el SQL Editor. Al final hay
-- una consulta de verificación que debe mostrarte 11 filas con su
-- audio_url ya asignado.
--
-- El audio queda dentro de "reading1" de cada unidad (el reproductor
-- con guion visible y límite de reproducciones ya existe en el sitio,
-- no hace falta tocar código — mismo mecanismo que Cambridge A2 Key).
-- ============================================================

update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/b1-unit01-daily-life-routines.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 1 — Daily Life & Routines';

update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/b1-unit02-stories-from-the-past.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 2 — Stories From the Past';

update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/b1-unit03-whats-coming-next.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 3 — What''s Coming Next';

update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/b1-unit04-travelling.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 4 — Travelling';

update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/b1-unit05-the-world-of-work.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 5 — The World of Work';

update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/b1-unit06-health-lifestyle.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 6 — Health & Lifestyle';

update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/b1-unit07-technology-communication.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 7 — Technology & Communication';

update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/b1-unit08-environment-society.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 8 — Environment & Society';

update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/b1-unit09-relationships-feelings.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 9 — Relationships & Feelings';

update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/b1-unit10-culture-celebrations.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 10 — Culture & Celebrations';

update public.modules
set lesson_json = jsonb_set(lesson_json, '{reading1,audio_url}', to_jsonb('https://wyyayvipqvvjoiwlxjgl.supabase.co/storage/v1/object/public/listening-audio/b1-unit11-final-review-certification.mp3'::text))
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 11 — Final Review & Certification';

-- ------------------------------------------------------------
-- Verificación: debe devolver 11 filas, cada una con su audio_url
-- ------------------------------------------------------------
select m.title, m.lesson_json->'reading1'->>'audio_url' as audio_url
from public.modules m
join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1'
order by m.order_index;
