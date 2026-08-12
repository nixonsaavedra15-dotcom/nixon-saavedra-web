-- ============================================================
-- SIMULACRO FINAL (Inglés A2 / KET) — 30 preguntas reales de Reading
-- ============================================================
-- El Módulo 10 "Simulacro final" estaba completamente vacío (sin
-- lesson_json, sin quiz) — este script lo llena con un examen real:
-- 30 preguntas de Reading distribuidas exactamente como el examen
-- real (Parte 1=6, Parte 2=7, Parte 3=5, Parte 4=6, Parte 5=6),
-- cada parte en su formato auténtico (avisos 3 op., emparejamiento
-- con 3 textos, comprensión 3 op., texto con espacios 3 op., texto
-- con espacios de respuesta abierta).
--
-- Writing y Listening/Speaking NO están incluidos aquí: Writing no
-- se puede calificar automáticamente (se practica en su propio
-- módulo), y Listening/Speaking se dejaron sin tocar por decisión
-- explícita (para no invalidar el audio ya grabado). Este script
-- también corrige la descripción del módulo, que prometía "dos
-- simulacros completos" — por ahora hay uno, real y completo en
-- Reading.
--
-- Requiere haber corrido antes: quiz-open-answer-schema.sql (Parte
-- 5 usa preguntas de texto abierto) y tener desplegada la versión
-- nueva de submit-quiz. Seguro de correr varias veces.
-- ============================================================


update public.modules set description =
  'Examen de práctica con las 30 preguntas reales de Reading (Partes 1 a 5, mismo formato y distribución que el examen A2 Key), en las mismas condiciones del examen real. Requisito para obtener el certificado. Writing y Speaking se practican en sus propios módulos.'
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Simulacro final';

delete from public.quiz_questions
where quiz_id in (
  select qz.id from public.quizzes qz
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'ingles-a2' and m.title = 'Simulacro final' and qz.stage = 'main'
);

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Simulacro final — Examen de certificación (30 preguntas de Reading)', 75, true, 3, 24, 'main'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Simulacro final'
on conflict (module_id, stage) do update set title = excluded.title, passing_score = excluded.passing_score, is_final = excluded.is_final, max_attempts = excluded.max_attempts, cooldown_hours = excluded.cooldown_hours;

insert into public.quiz_questions (quiz_id, order_index, prompt, answer_type)
select qz.id, v.order_index, v.prompt, v.answer_type
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '<div class=''sim-part-tag''>Reading — Parte 1 de 5 — Avisos y señales</div><p>"CAUTION: Wet paint. Do not touch." ¿Qué te pide este aviso?</p>', 'choice'),
  (1, '<div class=''sim-part-tag''>Reading — Parte 1 de 5 — Avisos y señales</div><p>"Free Wi-Fi for customers only. Ask staff for the password." ¿Qué necesitas hacer para usar el wifi gratis?</p>', 'choice'),
  (2, '<div class=''sim-part-tag''>Reading — Parte 1 de 5 — Avisos y señales</div><p>"Lost: black wallet near the library. If found, please call 555-0192." ¿Qué pide este aviso?</p>', 'choice'),
  (3, '<div class=''sim-part-tag''>Reading — Parte 1 de 5 — Avisos y señales</div><p>"Meeting moved to Room 12 — same time." ¿Qué cambió?</p>', 'choice'),
  (4, '<div class=''sim-part-tag''>Reading — Parte 1 de 5 — Avisos y señales</div><p>"Careful! Steps are slippery when wet." ¿Qué advierte este aviso?</p>', 'choice'),
  (5, '<div class=''sim-part-tag''>Reading — Parte 1 de 5 — Avisos y señales</div><p>"Return your library books by Friday to avoid a late fee." ¿Qué pasa si no devuelves los libros a tiempo?</p>', 'choice'),
  (6, '<div class=''sim-part-tag''>Reading — Parte 2 de 5 — Emparejamiento (Sara, Nico y Elena)</div><div class=''reading-passage''><p><strong>Sara:</strong> I love cooking, especially Italian food. I also enjoy painting on weekends, but I''m not very good at sports.</p><p><strong>Nico:</strong> I play basketball every Wednesday and Friday. I don''t really like cooking, so I usually eat out.</p><p><strong>Elena:</strong> I go to a photography class every Saturday morning. I also like reading mystery novels before bed.</p></div><p><strong>Who enjoys painting?</strong></p>', 'choice'),
  (7, '<div class=''sim-part-tag''>Reading — Parte 2 de 5 — Emparejamiento (Sara, Nico y Elena)</div><div class=''reading-passage''><p><strong>Sara:</strong> I love cooking, especially Italian food. I also enjoy painting on weekends, but I''m not very good at sports.</p><p><strong>Nico:</strong> I play basketball every Wednesday and Friday. I don''t really like cooking, so I usually eat out.</p><p><strong>Elena:</strong> I go to a photography class every Saturday morning. I also like reading mystery novels before bed.</p></div><p><strong>Who plays a sport twice a week?</strong></p>', 'choice'),
  (8, '<div class=''sim-part-tag''>Reading — Parte 2 de 5 — Emparejamiento (Sara, Nico y Elena)</div><div class=''reading-passage''><p><strong>Sara:</strong> I love cooking, especially Italian food. I also enjoy painting on weekends, but I''m not very good at sports.</p><p><strong>Nico:</strong> I play basketball every Wednesday and Friday. I don''t really like cooking, so I usually eat out.</p><p><strong>Elena:</strong> I go to a photography class every Saturday morning. I also like reading mystery novels before bed.</p></div><p><strong>Who goes to a class every week?</strong></p>', 'choice'),
  (9, '<div class=''sim-part-tag''>Reading — Parte 2 de 5 — Emparejamiento (Sara, Nico y Elena)</div><div class=''reading-passage''><p><strong>Sara:</strong> I love cooking, especially Italian food. I also enjoy painting on weekends, but I''m not very good at sports.</p><p><strong>Nico:</strong> I play basketball every Wednesday and Friday. I don''t really like cooking, so I usually eat out.</p><p><strong>Elena:</strong> I go to a photography class every Saturday morning. I also like reading mystery novels before bed.</p></div><p><strong>Who doesn''t like cooking?</strong></p>', 'choice'),
  (10, '<div class=''sim-part-tag''>Reading — Parte 2 de 5 — Emparejamiento (Sara, Nico y Elena)</div><div class=''reading-passage''><p><strong>Sara:</strong> I love cooking, especially Italian food. I also enjoy painting on weekends, but I''m not very good at sports.</p><p><strong>Nico:</strong> I play basketball every Wednesday and Friday. I don''t really like cooking, so I usually eat out.</p><p><strong>Elena:</strong> I go to a photography class every Saturday morning. I also like reading mystery novels before bed.</p></div><p><strong>Who likes Italian food?</strong></p>', 'choice'),
  (11, '<div class=''sim-part-tag''>Reading — Parte 2 de 5 — Emparejamiento (Sara, Nico y Elena)</div><div class=''reading-passage''><p><strong>Sara:</strong> I love cooking, especially Italian food. I also enjoy painting on weekends, but I''m not very good at sports.</p><p><strong>Nico:</strong> I play basketball every Wednesday and Friday. I don''t really like cooking, so I usually eat out.</p><p><strong>Elena:</strong> I go to a photography class every Saturday morning. I also like reading mystery novels before bed.</p></div><p><strong>Who reads before going to sleep?</strong></p>', 'choice'),
  (12, '<div class=''sim-part-tag''>Reading — Parte 2 de 5 — Emparejamiento (Sara, Nico y Elena)</div><div class=''reading-passage''><p><strong>Sara:</strong> I love cooking, especially Italian food. I also enjoy painting on weekends, but I''m not very good at sports.</p><p><strong>Nico:</strong> I play basketball every Wednesday and Friday. I don''t really like cooking, so I usually eat out.</p><p><strong>Elena:</strong> I go to a photography class every Saturday morning. I also like reading mystery novels before bed.</p></div><p><strong>Who eats out often?</strong></p>', 'choice'),
  (13, '<div class=''sim-part-tag''>Reading — Parte 3 de 5 — Comprensión de lectura</div><div class=''reading-passage''><p>Daniel started a new job at a small bakery last month. At first, he was nervous because he had never worked in a kitchen before, but the owner, Rosa, was very patient and showed him everything step by step. Daniel now arrives every morning at six to help prepare the bread before the shop opens at seven thirty. His favourite part of the day is decorating cakes, something he never thought he would enjoy. Next year, Daniel hopes to take a baking course so he can learn to make more difficult recipes. For now, he is just happy to be learning something new every day.</p></div><p><strong>How did Daniel feel when he started the job?</strong></p>', 'choice'),
  (14, '<div class=''sim-part-tag''>Reading — Parte 3 de 5 — Comprensión de lectura</div><div class=''reading-passage''><p>Daniel started a new job at a small bakery last month. At first, he was nervous because he had never worked in a kitchen before, but the owner, Rosa, was very patient and showed him everything step by step. Daniel now arrives every morning at six to help prepare the bread before the shop opens at seven thirty. His favourite part of the day is decorating cakes, something he never thought he would enjoy. Next year, Daniel hopes to take a baking course so he can learn to make more difficult recipes. For now, he is just happy to be learning something new every day.</p></div><p><strong>Who helped Daniel learn the job?</strong></p>', 'choice'),
  (15, '<div class=''sim-part-tag''>Reading — Parte 3 de 5 — Comprensión de lectura</div><div class=''reading-passage''><p>Daniel started a new job at a small bakery last month. At first, he was nervous because he had never worked in a kitchen before, but the owner, Rosa, was very patient and showed him everything step by step. Daniel now arrives every morning at six to help prepare the bread before the shop opens at seven thirty. His favourite part of the day is decorating cakes, something he never thought he would enjoy. Next year, Daniel hopes to take a baking course so he can learn to make more difficult recipes. For now, he is just happy to be learning something new every day.</p></div><p><strong>What time does the bakery open?</strong></p>', 'choice'),
  (16, '<div class=''sim-part-tag''>Reading — Parte 3 de 5 — Comprensión de lectura</div><div class=''reading-passage''><p>Daniel started a new job at a small bakery last month. At first, he was nervous because he had never worked in a kitchen before, but the owner, Rosa, was very patient and showed him everything step by step. Daniel now arrives every morning at six to help prepare the bread before the shop opens at seven thirty. His favourite part of the day is decorating cakes, something he never thought he would enjoy. Next year, Daniel hopes to take a baking course so he can learn to make more difficult recipes. For now, he is just happy to be learning something new every day.</p></div><p><strong>What is Daniel''s favourite part of the day?</strong></p>', 'choice'),
  (17, '<div class=''sim-part-tag''>Reading — Parte 3 de 5 — Comprensión de lectura</div><div class=''reading-passage''><p>Daniel started a new job at a small bakery last month. At first, he was nervous because he had never worked in a kitchen before, but the owner, Rosa, was very patient and showed him everything step by step. Daniel now arrives every morning at six to help prepare the bread before the shop opens at seven thirty. His favourite part of the day is decorating cakes, something he never thought he would enjoy. Next year, Daniel hopes to take a baking course so he can learn to make more difficult recipes. For now, he is just happy to be learning something new every day.</p></div><p><strong>What does Daniel hope to do next year?</strong></p>', 'choice'),
  (18, '<div class=''sim-part-tag''>Reading — Parte 4 de 5 — Texto con espacios (opción múltiple)</div><div class=''cloze-passage''>Last summer, my family and I <mark>___(1)___</mark> to a small town by the sea. We stayed ___(2)___ a little house near the beach. Every morning, we went ___(3)___ before breakfast. My sister is really good ___(4)___ surfing, so she spent most afternoons in the water. ___(5)___, I preferred just relaxing on the sand with a book. In the evenings, we walked along the beach ___(6)___ watch the sunset.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (1).</strong></p>', 'choice'),
  (19, '<div class=''sim-part-tag''>Reading — Parte 4 de 5 — Texto con espacios (opción múltiple)</div><div class=''cloze-passage''>Last summer, my family and I ___(1)___ to a small town by the sea. We stayed <mark>___(2)___</mark> a little house near the beach. Every morning, we went ___(3)___ before breakfast. My sister is really good ___(4)___ surfing, so she spent most afternoons in the water. ___(5)___, I preferred just relaxing on the sand with a book. In the evenings, we walked along the beach ___(6)___ watch the sunset.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (2).</strong></p>', 'choice'),
  (20, '<div class=''sim-part-tag''>Reading — Parte 4 de 5 — Texto con espacios (opción múltiple)</div><div class=''cloze-passage''>Last summer, my family and I ___(1)___ to a small town by the sea. We stayed ___(2)___ a little house near the beach. Every morning, we went <mark>___(3)___</mark> before breakfast. My sister is really good ___(4)___ surfing, so she spent most afternoons in the water. ___(5)___, I preferred just relaxing on the sand with a book. In the evenings, we walked along the beach ___(6)___ watch the sunset.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (3).</strong></p>', 'choice'),
  (21, '<div class=''sim-part-tag''>Reading — Parte 4 de 5 — Texto con espacios (opción múltiple)</div><div class=''cloze-passage''>Last summer, my family and I ___(1)___ to a small town by the sea. We stayed ___(2)___ a little house near the beach. Every morning, we went ___(3)___ before breakfast. My sister is really good <mark>___(4)___</mark> surfing, so she spent most afternoons in the water. ___(5)___, I preferred just relaxing on the sand with a book. In the evenings, we walked along the beach ___(6)___ watch the sunset.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (4).</strong></p>', 'choice'),
  (22, '<div class=''sim-part-tag''>Reading — Parte 4 de 5 — Texto con espacios (opción múltiple)</div><div class=''cloze-passage''>Last summer, my family and I ___(1)___ to a small town by the sea. We stayed ___(2)___ a little house near the beach. Every morning, we went ___(3)___ before breakfast. My sister is really good ___(4)___ surfing, so she spent most afternoons in the water. <mark>___(5)___</mark>, I preferred just relaxing on the sand with a book. In the evenings, we walked along the beach ___(6)___ watch the sunset.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (5).</strong></p>', 'choice'),
  (23, '<div class=''sim-part-tag''>Reading — Parte 4 de 5 — Texto con espacios (opción múltiple)</div><div class=''cloze-passage''>Last summer, my family and I ___(1)___ to a small town by the sea. We stayed ___(2)___ a little house near the beach. Every morning, we went ___(3)___ before breakfast. My sister is really good ___(4)___ surfing, so she spent most afternoons in the water. ___(5)___, I preferred just relaxing on the sand with a book. In the evenings, we walked along the beach <mark>___(6)___</mark> watch the sunset.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (6).</strong></p>', 'choice'),
  (24, '<div class=''sim-part-tag''>Reading — Parte 5 de 5 — Texto con espacios (respuesta abierta)</div><div class=''cloze-passage''>Dear Grandma, I''m writing <mark>___(1)___</mark> tell you about my holiday. We arrived ___(2)___ Rome three days ago and the weather has been lovely. Yesterday we went ___(3)___ a famous museum and saw incredible paintings. I hope you ___(4)___ feeling well. I''ll be back ___(5)___ Sunday and I can''t wait ___(6)___ see you. Love, Mia</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (1).</strong></p>', 'text'),
  (25, '<div class=''sim-part-tag''>Reading — Parte 5 de 5 — Texto con espacios (respuesta abierta)</div><div class=''cloze-passage''>Dear Grandma, I''m writing ___(1)___ tell you about my holiday. We arrived <mark>___(2)___</mark> Rome three days ago and the weather has been lovely. Yesterday we went ___(3)___ a famous museum and saw incredible paintings. I hope you ___(4)___ feeling well. I''ll be back ___(5)___ Sunday and I can''t wait ___(6)___ see you. Love, Mia</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (2).</strong></p>', 'text'),
  (26, '<div class=''sim-part-tag''>Reading — Parte 5 de 5 — Texto con espacios (respuesta abierta)</div><div class=''cloze-passage''>Dear Grandma, I''m writing ___(1)___ tell you about my holiday. We arrived ___(2)___ Rome three days ago and the weather has been lovely. Yesterday we went <mark>___(3)___</mark> a famous museum and saw incredible paintings. I hope you ___(4)___ feeling well. I''ll be back ___(5)___ Sunday and I can''t wait ___(6)___ see you. Love, Mia</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (3).</strong></p>', 'text'),
  (27, '<div class=''sim-part-tag''>Reading — Parte 5 de 5 — Texto con espacios (respuesta abierta)</div><div class=''cloze-passage''>Dear Grandma, I''m writing ___(1)___ tell you about my holiday. We arrived ___(2)___ Rome three days ago and the weather has been lovely. Yesterday we went ___(3)___ a famous museum and saw incredible paintings. I hope you <mark>___(4)___</mark> feeling well. I''ll be back ___(5)___ Sunday and I can''t wait ___(6)___ see you. Love, Mia</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (4).</strong></p>', 'text'),
  (28, '<div class=''sim-part-tag''>Reading — Parte 5 de 5 — Texto con espacios (respuesta abierta)</div><div class=''cloze-passage''>Dear Grandma, I''m writing ___(1)___ tell you about my holiday. We arrived ___(2)___ Rome three days ago and the weather has been lovely. Yesterday we went ___(3)___ a famous museum and saw incredible paintings. I hope you ___(4)___ feeling well. I''ll be back <mark>___(5)___</mark> Sunday and I can''t wait ___(6)___ see you. Love, Mia</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (5).</strong></p>', 'text'),
  (29, '<div class=''sim-part-tag''>Reading — Parte 5 de 5 — Texto con espacios (respuesta abierta)</div><div class=''cloze-passage''>Dear Grandma, I''m writing ___(1)___ tell you about my holiday. We arrived ___(2)___ Rome three days ago and the weather has been lovely. Yesterday we went ___(3)___ a famous museum and saw incredible paintings. I hope you ___(4)___ feeling well. I''ll be back ___(5)___ Sunday and I can''t wait <mark>___(6)___</mark> see you. Love, Mia</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (6).</strong></p>', 'text')
) as v(order_index, prompt, answer_type)
where c.slug = 'ingles-a2' and m.title = 'Simulacro final' and qz.stage = 'main'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. That you paint the wall',false,'El aviso no pide pintar nada.'),(1,'B. That you don''t touch the fresh paint',true,'Correcto: ''wet paint, do not touch'' pide no tocar la pintura fresca.'),(2,'C. That you clean the paint',false,'El aviso no pide limpiar.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Ask a staff member for the password',true,'Correcto: el aviso pide pedir la contraseña al personal.'),(1,'B. Pay for a subscription',false,'El aviso dice que es gratis para clientes.'),(2,'C. Bring your own router',false,'El aviso no menciona traer nada.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. That you buy a new wallet',false,'El aviso no habla de comprar nada.'),(1,'B. That you call if you find the wallet',true,'Correcto: pide llamar si encuentras la billetera.'),(2,'C. That you donate money to the library',false,'El aviso no menciona donaciones.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. The time of the meeting',false,'El aviso dice ''same time'' — la hora no cambió.'),(1,'B. The day of the meeting',false,'El aviso no menciona un cambio de día.'),(2,'C. The place of the meeting',true,'Correcto: se movió a otra sala, el lugar cambió.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. That the steps can be slippery when wet',true,'Correcto: advierte que los escalones resbalan cuando están mojados.'),(1,'B. That the steps are broken',false,'El aviso no dice que estén rotos.'),(2,'C. That you cannot go up',false,'El aviso no prohíbe subir, solo advierte.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. You get a free book',false,'El aviso no ofrece nada gratis.'),(1,'B. You get charged a fee',true,'Correcto: ''to avoid a late fee'' — si no devuelves a tiempo, te cobran.'),(2,'C. Your account is blocked forever',false,'El aviso no menciona un bloqueo permanente.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=5 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Sara',true,'Correcto: revisa el texto de Sara.'),(1,'B. Nico',false,'Incorrecto: revisa el texto de Nico.'),(2,'C. Elena',false,'Incorrecto: revisa el texto de Elena.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=6 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Sara',false,'Incorrecto: revisa el texto de Sara.'),(1,'B. Nico',true,'Correcto: revisa el texto de Nico.'),(2,'C. Elena',false,'Incorrecto: revisa el texto de Elena.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=7 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Sara',false,'Incorrecto: revisa el texto de Sara.'),(1,'B. Nico',false,'Incorrecto: revisa el texto de Nico.'),(2,'C. Elena',true,'Correcto: revisa el texto de Elena.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=8 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Sara',false,'Incorrecto: revisa el texto de Sara.'),(1,'B. Nico',true,'Correcto: revisa el texto de Nico.'),(2,'C. Elena',false,'Incorrecto: revisa el texto de Elena.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=9 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Sara',true,'Correcto: revisa el texto de Sara.'),(1,'B. Nico',false,'Incorrecto: revisa el texto de Nico.'),(2,'C. Elena',false,'Incorrecto: revisa el texto de Elena.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=10 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Sara',false,'Incorrecto: revisa el texto de Sara.'),(1,'B. Nico',false,'Incorrecto: revisa el texto de Nico.'),(2,'C. Elena',true,'Correcto: revisa el texto de Elena.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=11 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Sara',false,'Incorrecto: revisa el texto de Sara.'),(1,'B. Nico',true,'Correcto: revisa el texto de Nico.'),(2,'C. Elena',false,'Incorrecto: revisa el texto de Elena.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=12 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Confident',false,'Esta opción no coincide con lo que dice el texto.'),(1,'B. Nervous',true,'Correcto: el texto dice que estaba nervioso al principio.'),(2,'C. Bored',false,'Esta opción no coincide con lo que dice el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=13 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. A customer',false,'Esta opción no coincide con lo que dice el texto.'),(1,'B. His family',false,'Esta opción no coincide con lo que dice el texto.'),(2,'C. The owner, Rosa',true,'Correcto: Rosa, la dueña, le enseñó paso a paso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=14 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Six o''clock',false,'Esta opción no coincide con lo que dice el texto.'),(1,'B. Seven thirty',true,'Correcto: el texto dice que la tienda abre a las siete y media.'),(2,'C. Eight o''clock',false,'Esta opción no coincide con lo que dice el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=15 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Preparing bread',false,'Esta opción no coincide con lo que dice el texto.'),(1,'B. Decorating cakes',true,'Correcto: el texto dice que decorar pasteles es su parte favorita.'),(2,'C. Closing the shop',false,'Esta opción no coincide con lo que dice el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=16 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Open his own bakery',false,'Esta opción no coincide con lo que dice el texto.'),(1,'B. Take a baking course',true,'Correcto: espera tomar un curso de repostería el próximo año.'),(2,'C. Change jobs',false,'Esta opción no coincide con lo que dice el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=17 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. go',false,'No es la opción que mejor encaja; revisa el contexto cercano.'),(1,'B. went',true,'Correcto: el texto está en pasado, ''went'' es el pasado de ''go''.'),(2,'C. going',false,'No es la opción que mejor encaja; revisa el contexto cercano.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=18 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. in',true,'Correcto: ''stayed in a house'' usa ''in''.'),(1,'B. at',false,'No es la opción que mejor encaja; revisa el contexto cercano.'),(2,'C. on',false,'No es la opción que mejor encaja; revisa el contexto cercano.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=19 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. swimming',true,'Correcto: ''go swimming'' es la expresión fija.'),(1,'B. swim',false,'No es la opción que mejor encaja; revisa el contexto cercano.'),(2,'C. to swim',false,'No es la opción que mejor encaja; revisa el contexto cercano.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=20 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. at',true,'Correcto: ''good at'' es la combinación fija.'),(1,'B. in',false,'No es la opción que mejor encaja; revisa el contexto cercano.'),(2,'C. on',false,'No es la opción que mejor encaja; revisa el contexto cercano.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=21 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. However',true,'Correcto: ''However'' introduce el contraste con lo que hacía su hermana.'),(1,'B. Because',false,'No es la opción que mejor encaja; revisa el contexto cercano.'),(2,'C. So',false,'No es la opción que mejor encaja; revisa el contexto cercano.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=22 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. for',false,'No es la opción que mejor encaja; revisa el contexto cercano.'),(1,'B. to',true,'Correcto: ''walked... to watch'' es un infinitivo de propósito.'),(2,'C. and',false,'No es la opción que mejor encaja; revisa el contexto cercano.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=23 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['to'], 'Correcto: ''writing to tell'' usa el infinitivo con ''to''.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=24 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['in'], 'Correcto: ''arrived in Rome'' — con ciudades usamos ''in''.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=25 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['to'], 'Correcto: ''went to a museum'' usa ''to''.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=26 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['are'], 'Correcto: el sujeto es ''you'', el auxiliar correcto es ''are''.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=27 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['on'], 'Correcto: ''back on Sunday'' usa ''on'' con días.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=28 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;

insert into public.quiz_text_answers (question_id, accepted_answers, feedback)
select qq.id, array['to'], 'Correcto: ''can''t wait to see'' usa el infinitivo con ''to''.'
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
where c.slug='ingles-a2' and m.title='Simulacro final' and qq.order_index=29 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id) do update set accepted_answers = excluded.accepted_answers, feedback = excluded.feedback;