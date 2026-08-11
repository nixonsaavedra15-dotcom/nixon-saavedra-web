-- ============================================================
-- Corrección: la prueba de inglés del ICFES tiene 45 preguntas,
-- no 55. El texto del módulo "Introducción" y su cuestionario
-- (quiz-content-pre-icfes.sql) tenían el número equivocado.
--
-- Verificado contra la fuente oficial: "Guía de orientación Saber
-- 11.° — 2017-1" (ICFES), sección "E. Prueba de Inglés": son 45
-- preguntas de selección múltiple, distribuidas en 7 partes con
-- estos porcentajes: Parte 1: 11% (5), Parte 2: 11% (5), Parte 3:
-- 11% (5), Parte 4: 18% (8), Parte 5: 16% (7), Parte 6: 11% (5),
-- Parte 7: 22% (10). Total: 45.
--
-- CÓMO USARLO: SQL Editor → New query → pega esto completo → Run.
-- Seguro de correr varias veces.
-- ============================================================

-- 1. Corrige el texto de la lección de Introducción
update public.modules set description = replace(
  replace(description, '<strong>55 preguntas</strong>', '<strong>45 preguntas</strong>'),
  '55 preguntas, divididas en 7 partes.', '45 preguntas, divididas en 7 partes.'
)
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Introducción';

-- 2. Corrige las opciones del cuestionario de Introducción
--    (pregunta "¿Cuántas preguntas tiene la prueba de inglés del ICFES?")
update public.quiz_choices set
  choice_text = '45',
  is_correct = true,
  feedback = 'Correcto: la prueba consta de 45 preguntas en total.'
where question_id in (
  select qq.id from public.quiz_questions qq
  join public.quizzes qz on qz.id = qq.quiz_id
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'pre-icfes' and m.title = 'Introducción' and qq.order_index = 0
    and qz.stage = 'main'
)
and choice_text = '55';

update public.quiz_choices set
  is_correct = false,
  feedback = 'Cerca, pero no — son 45 preguntas.'
where question_id in (
  select qq.id from public.quiz_questions qq
  join public.quizzes qz on qz.id = qq.quiz_id
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'pre-icfes' and m.title = 'Introducción' and qq.order_index = 0
    and qz.stage = 'main'
)
and choice_text = '60';
