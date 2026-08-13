-- ============================================================
-- Curso "Inglés B1" — creación del curso + 12 módulos (vacíos)
-- ============================================================
-- Cómo usar: Supabase → SQL Editor → New query → pega esto completo
-- → Run. Requiere que schema.sql, admin-schema.sql, quiz-schema.sql,
-- lesson-flow-schema.sql y quiz-open-answer-schema.sql ya se hayan
-- corrido antes (usa lesson_json, quizzes.stage, y las mismas tablas
-- que Cambridge A2 Key).
--
-- El contenido de cada unidad va en archivos separados
-- (b1-batch1-intro-unit1.sql, b1-batch2-..., etc.) — corre este
-- archivo PRIMERO, y luego los batches en orden.
--
-- A propósito, el contenido de las lecciones está 100% en inglés
-- (es un curso de inmersión real, no de examen) — solo la marca del
-- curso, el precio y la descripción de la tienda quedan en español,
-- igual que en el resto del sitio.
-- ============================================================

insert into public.courses (slug, title, description, price, category, active)
values (
  'ingles-b1',
  'Inglés B1 — Aprendizaje real',
  'Gramática, vocabulario, expresiones y las 4 destrezas (reading, writing, listening, speaking) en 11 unidades temáticas, 100% en inglés. No es un curso de examen: es para aprender a comunicarte de verdad en nivel B1.',
  420000,
  'ingles',
  true
)
on conflict (slug) do update set
  title = excluded.title,
  description = excluded.description,
  price = excluded.price,
  category = excluded.category,
  active = excluded.active;

insert into public.modules (course_id, title, order_index, description)
select c.id, m.title, m.order_index, m.description
from public.courses c
cross join (values
  (0,  'Introduction — Welcome to B1',            'What B1 means, a quick self-check to see where you stand, and how this course works.'),
  (1,  'Unit 1 — Daily Life & Routines',           'Present simple vs. present continuous, frequency adverbs, "used to" — talking about your everyday life.'),
  (2,  'Unit 2 — Stories From the Past',           'Past simple vs. past continuous, sequencing words, irregular verbs — telling a good story.'),
  (3,  'Unit 3 — What''s Coming Next',             'Will vs. going to vs. present continuous for the future, first conditional — talking about plans.'),
  (4,  'Unit 4 — Travelling',                      'Present perfect vs. past simple, "for" and "since" — experiences, trips and giving recommendations.'),
  (5,  'Unit 5 — The World of Work',                'Modals of obligation and advice (must, have to, should) — interviews, emails and workplace English.'),
  (6,  'Unit 6 — Health & Lifestyle',               'First conditional in depth, giving advice — talking about wellbeing and healthy habits.'),
  (7,  'Unit 7 — Technology & Communication',       'Passive voice, cause/effect connectors — social media, devices and digital life.'),
  (8,  'Unit 8 — Environment & Society',            'Comparatives/superlatives, second conditional — sustainability and making a difference.'),
  (9,  'Unit 9 — Relationships & Feelings',         'Reported speech, verb + preposition combinations — friendship, family and conflict.'),
  (10, 'Unit 10 — Culture & Celebrations',          'Mixed tense review, idioms and phrasal verbs — traditions, food and festivals.'),
  (11, 'Unit 11 — Final Review & Certification',    'An integrated task for every skill, pulling together everything from Units 1-10. Passing it unlocks your certificate.')
) as m(order_index, title, description)
where c.slug = 'ingles-b1'
on conflict do nothing;
