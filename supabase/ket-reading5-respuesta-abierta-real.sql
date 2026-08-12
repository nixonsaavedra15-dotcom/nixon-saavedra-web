-- ================================================================
-- Reading Parte 5 (Inglés A2) — preguntas de texto abierto REALES
-- ================================================================
-- Reemplaza el quiz de opción múltiple (que contradecía el propio
-- título del módulo, "respuesta abierta") por el formato real: el
-- estudiante escribe UNA palabra, sin ver opciones A/B/C. Requiere
-- haber corrido antes quiz-open-answer-schema.sql (crea answer_type
-- y quiz_text_answers) y haber desplegado la versión nueva de la
-- Edge Function submit-quiz. Seguro de correr varias veces.
-- ================================================================


delete from public.quiz_questions
where quiz_id in (
  select qz.id from public.quizzes qz
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 5: Texto con espacios (respuesta abierta)' and qz.stage = 'readings'
);

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: correo con espacios (respuesta abierta)', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 5: Texto con espacios (respuesta abierta)'
on conflict (module_id, stage) do update set title = excluded.title;

insert into public.quiz_questions (quiz_id, order_index, prompt, answer_type)
select qz.id, v.order_index, v.prompt, v.answer_type
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Welcome ___ my blog! ¿Qué palabra falta?', 'text'),
  (1, 'I was born in Australia, but I grew ___ in France. ¿Qué palabra falta (verbo con partícula: ''crecí'')?', 'text'),
  (2, 'At the moment, I ___ working in Paris, as a photographer. ¿Qué palabra falta (verbo auxiliar)?', 'text'),
  (3, 'I live near my office and it only takes me ten minutes ___ get there. ¿Qué palabra falta?', 'text'),
  (4, 'Sometimes I have to travel to other countries to work — for ___, last month I went to the USA. ¿Qué palabra falta (expresión: ''por ejemplo'')?', 'text'),
  (5, 'Leave me a message ___ you want to ask me any questions. ¿Qué palabra falta (conector condicional)?', 'text')
) as v(order_index, prompt, answer_type)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 5: Texto con espacios (respuesta abierta)' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['to'], 'Correcto: ''welcome to'' es la combinación fija.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['up'], 'Correcto: ''grow up'' significa crecer.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['am'], 'Correcto: el sujeto es ''I'', entonces el auxiliar es ''am''.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['to'], 'Correcto: ''takes me ten minutes to get there'' usa el infinitivo con ''to''.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['example'], 'Correcto: ''for example'' es la expresión fija que significa ''por ejemplo''.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['if'], 'Correcto: ''if'' introduce la condición.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=5 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

delete from public.quiz_questions
where quiz_id in (
  select qz.id from public.quizzes qz
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 5: Texto con espacios (respuesta abierta)' and qz.stage = 'interactive'
);

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso: correo con espacios (respuesta abierta)', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 5: Texto con espacios (respuesta abierta)'
on conflict (module_id, stage) do update set title = excluded.title;

insert into public.quiz_questions (quiz_id, order_index, prompt, answer_type)
select qz.id, v.order_index, v.prompt, v.answer_type
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Hi Robbie, I hope you ___ having a great week. ¿Qué palabra falta (verbo auxiliar)?', 'text'),
  (1, 'I''m writing ___ tell you about the football match on Saturday. ¿Qué palabra falta?', 'text'),
  (2, 'We arrived ___ the stadium an hour early. ¿Qué palabra falta (preposición de lugar puntual)?', 'text'),
  (3, 'We were a little nervous ___ the beginning of the game. ¿Qué palabra falta (expresión: ''al principio'')?', 'text'),
  (4, 'In the end, we won the match, ___ I scored two goals! ¿Qué palabra falta (conector)?', 'text'),
  (5, 'Write back soon ___ let me know your news. ¿Qué palabra falta?', 'text')
) as v(order_index, prompt, answer_type)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 5: Texto con espacios (respuesta abierta)' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['are'], 'Correcto: el sujeto es ''you'', entonces el auxiliar es ''are''.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['to'], 'Correcto: ''writing to tell'' usa el infinitivo con ''to''.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['at'], 'Correcto: ''at the stadium'' — ''at'' se usa con lugares puntuales.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['at'], 'Correcto: ''at the beginning'' es la expresión fija.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['and'], 'Correcto: ''and'' conecta dos ideas de la misma línea (ganamos, y anoté dos goles).'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['to'], 'Correcto: ''write back soon to let me know'' usa el infinitivo con ''to''.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=5 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;