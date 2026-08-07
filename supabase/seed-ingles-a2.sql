-- ============================================================
-- Curso Inglés A2 (LEO) — curso + módulos reales
-- ============================================================
-- Cómo usar: en Supabase → "SQL Editor" → "New query", pega esto y
-- dale "Run" (después de haber corrido ya supabase/schema.sql).
-- Tomado y organizado a partir de tu respaldo de Moodle
-- "Curos de Inglés A2 LEO.mbz" (curso "LEO English A2", 40 horas).
-- ============================================================

insert into public.courses (slug, title, description, price, category)
values
  ('ingles-a2', 'Inglés A2', 'Curso de inglés nivel A2 (40 horas): gramática, writing, reading, listening y speaking, con examen final y certificado.', 420000, 'ingles')
on conflict (slug) do update set
  title = excluded.title,
  description = excluded.description,
  price = excluded.price;

insert into public.modules (course_id, title, order_index, description)
select c.id, m.title, m.order_index, m.description
from public.courses c
cross join (values
  (0, 'Introducción',
   'Bienvenida al curso, cómo está organizado, el sistema de evaluación y su relación con el nivel Cambridge KEY (A2). Foro de dudas y reto inicial de vocabulario.'),
  (1, 'Gramática A2 — Presente simple',
   'Presente simple afirmativo, negativo e interrogativo, incluyendo preguntas con Wh-. Ejercicios de vocabulario y cuestionario de cierre.'),
  (2, 'Gramática A2 — To Be, preposiciones y adverbios',
   'El verbo to be en afirmativo, negativo e interrogativo; verbos en infinitivo y gerundio; preposiciones de tiempo y lugar.'),
  (3, 'Writing',
   'Conectores y linkers para unir ideas, análisis de modelos de texto y práctica guiada de escritura en inglés nivel A2.'),
  (4, 'Reading',
   'Comprensión de lectura con dos textos graduados y preguntas de análisis, para practicar la extracción de información en inglés.'),
  (5, 'Listening',
   'Ejercicios de escucha con audios progresivos y consejos prácticos para mejorar la comprensión auditiva en nivel A2.'),
  (6, 'Speaking',
   'Práctica de expresión oral usando grabación de voz (Vocaroo), con ejercicios guiados para ganar fluidez y confianza al hablar.'),
  (7, 'Certificación',
   'Examen final que reúne gramática, writing, reading, listening y speaking. Al aprobarlo se emite el certificado de Inglés A2.')
) as m(order_index, title, description)
where c.slug = 'ingles-a2'
on conflict do nothing;
