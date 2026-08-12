-- ============================================================
-- KET A2 — Batch 6: Speaking (entrevista + tarea colaborativa)
-- Módulo: "Speaking — Entrevista y tarea colaborativa"
--
-- NOTA: el examen real de Speaking es cara a cara con un examinador
-- y otro candidato. Aquí no hay compañero real ni examinador, así
-- que la lección se adapta a práctica de auto-grabación: el
-- estudiante practica en voz alta y se graba con su propio celular,
-- primero un rol y luego el otro. Se avisa dentro del contenido.
-- ============================================================

update public.modules m
set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a Speaking",
    "subtitle": "Hablar con confianza, aunque sea practicando solo",
    "guide_html": "<p>El examen de Speaking real es cara a cara: un examinador te hace preguntas personales, y luego hablas con otro candidato sobre un tema, con imágenes de apoyo. Aquí no hay examinador ni compañero — así que vamos a adaptar la práctica: vas a hablar en voz alta, grabarte con tu celular, y escuchar cómo suenas. Practicar así, aunque no sea igual a tener a alguien enfrente, sí construye la fluidez y la confianza que necesitas para el día del examen.</p>"
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Parte 1: la entrevista personal",
    "html": "<p>La primera parte es una entrevista corta: el examinador te pregunta datos personales — tu nombre, de dónde eres, qué haces (estudias o trabajas), tu familia, tus gustos. La clave no es dar la respuesta 'correcta', es <strong>extender tu respuesta</strong> un poco más allá de una sola palabra.</p><h4>La diferencia entre una respuesta corta y una buena respuesta</h4><div class='example-box'><p><em>Question: What do you like doing in your free time?</em></p><p>❌ Respuesta corta: <em>'I like reading.'</em></p><p>✅ Respuesta extendida: <em>'I like reading, especially adventure books. I usually read before going to bed because it helps me relax.'</em></p></div><p>Una palabra o una frase muy corta no te da la oportunidad de mostrar lo que sabes. Agregar un motivo ('because...') o un ejemplo ('especially...', 'usually...') muestra más nivel de inglés, aunque el vocabulario sea sencillo.</p><h4>Temas típicos de la Parte 1</h4><table class='vocab-table'><tr><th>Tema</th><th>Pregunta de ejemplo</th></tr><tr><td>Datos personales</td><td>What's your name? Where are you from?</td></tr><tr><td>Estudios o trabajo</td><td>What do you study? Do you like your school?</td></tr><tr><td>Familia</td><td>Do you have brothers or sisters?</td></tr><tr><td>Tiempo libre</td><td>What do you do at the weekend?</td></tr><tr><td>Rutina diaria</td><td>What time do you usually get up?</td></tr></table>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Parte 2: la tarea colaborativa",
    "html": "<p>La segunda parte simula una conversación con otra persona sobre un tema, apoyándose en tarjetas o imágenes (por ejemplo, diferentes lugares para comer con amigos). En el examen real hablas con el otro candidato; aquí vas a practicar diciendo <strong>ambos lados</strong> de la conversación en voz alta, como un pequeño guion.</p><h4>Ejemplo de tarea</h4><div class='example-box'><p><em>Talk together about different places to have lunch with a friend: a restaurant, a park, a café, at home.</em></p><p>A: I think a café is a nice place because it's relaxed and not too expensive.<br>B: I agree, but what about a picnic in the park? It's free and you can enjoy the weather.<br>A: That's true. Maybe we could choose the park if it's sunny, and a café if it's raining.<br>B: Good idea, let's go with that.</p></div><p>Fíjate que no se trata de 'ganar' el argumento — se trata de dar tu opinión, escuchar la otra, y llegar a un acuerdo. Eso es exactamente lo que se evalúa.</p><h4>Frases útiles para la tarea colaborativa</h4><table class='vocab-table'><tr><th>Para qué</th><th>Frase</th></tr><tr><td>Dar tu opinión</td><td>I think... / In my opinion...</td></tr><tr><td>Preguntar la opinión del otro</td><td>What about you? / What do you think?</td></tr><tr><td>Estar de acuerdo</td><td>I agree. / That's true.</td></tr><tr><td>Estar en desacuerdo (con respeto)</td><td>I'm not sure about that. / Maybe, but...</td></tr><tr><td>Llegar a un acuerdo</td><td>Let's choose... / Maybe we could...</td></tr></table>"
  },
  "interactive": {
    "title": "Repaso visual: hablar con más confianza",
    "slides": [
      {"title": "Extiende tus respuestas", "text": "Agrega un motivo o un ejemplo — 'because...', 'especially...', 'usually...' — en vez de responder con una sola palabra.", "tema": "speaking"},
      {"title": "No hay respuesta incorrecta en Parte 1", "text": "Las preguntas son sobre ti — lo que se evalúa es cómo te expresas, no el contenido de tu vida.", "tema": "speaking"},
      {"title": "Parte 2 es una conversación, no un examen individual", "text": "Escucha, opina y responde a lo que dice la otra persona — no repitas un discurso memorizado.", "tema": "speaking"},
      {"title": "Usa frases para opinar y estar de acuerdo", "text": "'I think...', 'I agree', 'What about you?' hacen que suene como una conversación real.", "tema": "speaking"},
      {"title": "Practica en voz alta y grábate", "text": "Aunque no tengas un compañero real, hablar en voz alta y escucharte después mejora tu fluidez notablemente.", "tema": "speaking"}
    ]
  },
  "practice": {
    "title": "Caso real: entrevista y tarea resueltas",
    "html": "<p>Practiquemos con una entrevista completa y una tarea colaborativa, paso a paso.</p><h4>Entrevista (Parte 1) — modelo completo</h4><div class='example-box'><p><em>Examiner: What do you do, do you study or work?</em><br>You: I'm a student. I study at a school in Bogotá, in tenth grade.</p><p><em>Examiner: Do you like your school?</em><br>You: Yes, I like it a lot, especially my English classes, because my teachers are very patient and I've learned a lot this year.</p><p><em>Examiner: What do you usually do after school?</em><br>You: I usually do my homework first, and then I like to play football with my friends near my house.</p></div><p>Nota cómo cada respuesta tiene al menos dos partes: la respuesta directa, y un poco más (un motivo, un detalle, un ejemplo).</p><h4>Tarea colaborativa (Parte 2) — modelo completo</h4><div class='example-box'><p><em>Talk together about different ways to celebrate a birthday: a party at home, a dinner at a restaurant, a trip somewhere.</em></p><p>A: I think a party at home is the best option because you can invite a lot of friends without spending too much money.<br>B: That's a good point, but I prefer a restaurant dinner — it feels more special, even if it's more expensive.<br>A: True, maybe it depends on the age of the person. For a big birthday, a restaurant could be nicer.<br>B: I agree. Let's say a restaurant for a special birthday and a home party for a normal one.</p></div><p>Practica diciendo ambos lados en voz alta — primero el papel de A, después el de B. Te ayudará a pensar en argumentos desde las dos perspectivas.</p>"
  },
  "closing_form": {
    "title": "Tu turno de practicar en voz alta",
    "fields": [
      {"key": "respuesta_extendida", "label": "Responde en voz alta (y luego escribe aquí tu respuesta) a: 'What do you like doing at the weekend?' — usando al menos un motivo o ejemplo.", "type": "textarea"},
      {"key": "dialogo_propio", "label": "Escribe un mini-diálogo (ambos lados, A y B) sobre: 'Talk together about different ways to learn English: apps, classes, watching films, or talking with friends.'", "type": "textarea"},
      {"key": "reflexion", "label": "¿Te resulta más difícil la Parte 1 (hablar de ti mismo) o la Parte 2 (dar tu opinión y llegar a un acuerdo)? ¿Por qué?", "type": "textarea"}
    ]
  }
}
$JSON$::jsonb
from public.courses c
where m.course_id = c.id and c.slug = 'ingles-a2'
  and m.title = 'Speaking — Entrevista y tarea colaborativa';

-- Quiz 1 (stage = readings): Parte 1 — respuestas extendidas
insert into public.quizzes (module_id, stage, title)
select m.id, 'readings', 'Chequeo: Parte 1 (la entrevista)'
from public.modules m
join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Speaking — Entrevista y tarea colaborativa'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, prompt, order_index)
select q.id, question.question, question.order_index
from public.quizzes q
join public.modules m on m.id = q.module_id
join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Question: Do you have any brothers or sisters? ¿Cuál es la mejor respuesta?'),
  (1, 'Question: What do you usually do after school? ¿Cuál es la mejor respuesta?'),
  (2, '¿Por qué es importante extender tus respuestas en la Parte 1?'),
  (3, '¿Cuál palabra ayuda a agregar un motivo a tu respuesta?'),
  (4, '¿Sobre qué tipo de temas suele preguntar la Parte 1?')
) as question(order_index, question)
where c.slug = 'ingles-a2' and m.title = 'Speaking — Entrevista y tarea colaborativa'
  and q.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, choice_text, is_correct, feedback, order_index)
select qq.id, c.choice_text, c.is_correct, c.feedback, c.order_index
from public.quiz_questions qq
join public.quizzes q on q.id = qq.quiz_id
join public.modules m on m.id = q.module_id
join public.courses co on co.id = m.course_id
cross join lateral (
  values
    (qq.order_index, 0, 'A. Yes.', false, 'Es correcta pero demasiado corta — no muestra nivel de inglés.', 0),
    (qq.order_index, 0, 'B. Yes, I have one older brother. We get along really well.', true, 'Correcto: responde y agrega un detalle extra.', 1),
    (qq.order_index, 0, 'C. I don''t know.', false, 'No responde la pregunta y no suena natural para una pregunta personal.', 2),
    (qq.order_index, 1, 'A. Nothing.', false, 'Es una respuesta muy corta que no da información real.', 0),
    (qq.order_index, 1, 'B. I usually do my homework first, and then I play football with my friends.', true, 'Correcto: dos acciones conectadas, con detalle.', 1),
    (qq.order_index, 1, 'C. Homework.', false, 'Una sola palabra no muestra tu nivel de inglés.', 2),
    (qq.order_index, 2, 'A. Porque las respuestas cortas están prohibidas', false, 'No están prohibidas, pero no muestran tanto nivel de inglés.', 0),
    (qq.order_index, 2, 'B. Porque muestran más nivel de inglés y dan más para evaluar', true, 'Correcto: extender la respuesta da más oportunidad de mostrar vocabulario y gramática.', 1),
    (qq.order_index, 2, 'C. Porque el examinador solo entiende oraciones largas', false, 'No es un problema de comprensión, es de evaluación del nivel.', 2),
    (qq.order_index, 3, 'A. Because', true, 'Correcto: introduce el motivo de tu respuesta.', 0),
    (qq.order_index, 3, 'B. Maybe', false, 'Expresa duda, no agrega un motivo.', 1),
    (qq.order_index, 3, 'C. Also', false, 'Agrega información adicional, pero no específicamente un motivo.', 2),
    (qq.order_index, 4, 'A. Historia mundial y política', false, 'Esos temas son demasiado avanzados para la Parte 1.', 0),
    (qq.order_index, 4, 'B. Datos personales: familia, estudios, rutina, gustos', true, 'Correcto: la Parte 1 se centra en temas personales sencillos.', 1),
    (qq.order_index, 4, 'C. Gramática avanzada y vocabulario técnico', false, 'No se evalúa así — se trata de una conversación personal simple.', 2)
) as c(qorder, order_index, choice_text, is_correct, feedback, order_index2)
where co.slug = 'ingles-a2' and m.title = 'Speaking — Entrevista y tarea colaborativa'
  and q.stage = 'readings' and qq.order_index = c.qorder
on conflict (question_id, order_index) do nothing;

-- Quiz 2 (stage = interactive): Parte 2 — tarea colaborativa
insert into public.quizzes (module_id, stage, title)
select m.id, 'interactive', 'Chequeo: Parte 2 (la tarea colaborativa)'
from public.modules m
join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Speaking — Entrevista y tarea colaborativa'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, prompt, order_index)
select q.id, question.question, question.order_index
from public.quizzes q
join public.modules m on m.id = q.module_id
join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál frase es útil para dar tu opinión al empezar a hablar?'),
  (1, '¿Cuál frase es útil para preguntar la opinión de la otra persona?'),
  (2, '¿Cuál es una forma respetuosa de mostrar desacuerdo?'),
  (3, 'En la tarea colaborativa, ¿qué se evalúa principalmente?'),
  (4, '¿Cuál frase ayuda a llegar a un acuerdo al final de la conversación?')
) as question(order_index, question)
where c.slug = 'ingles-a2' and m.title = 'Speaking — Entrevista y tarea colaborativa'
  and q.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, choice_text, is_correct, feedback, order_index)
select qq.id, c.choice_text, c.is_correct, c.feedback, c.order_index
from public.quiz_questions qq
join public.quizzes q on q.id = qq.quiz_id
join public.modules m on m.id = q.module_id
join public.courses co on co.id = m.course_id
cross join lateral (
  values
    (qq.order_index, 0, 'A. I think...', true, 'Correcto: es una forma directa y natural de introducir tu opinión.', 0),
    (qq.order_index, 0, 'B. The end.', false, 'No tiene relación con dar una opinión.', 1),
    (qq.order_index, 0, 'C. Goodbye.', false, 'Es una despedida, no una forma de opinar.', 2),
    (qq.order_index, 1, 'A. I don''t care.', false, 'Suena como falta de interés, no invita a la conversación.', 0),
    (qq.order_index, 1, 'B. What about you?', true, 'Correcto: invita a la otra persona a compartir su opinión.', 1),
    (qq.order_index, 1, 'C. That''s all.', false, 'Cierra la conversación en vez de abrirla.', 2),
    (qq.order_index, 2, 'A. You are wrong.', false, 'Suena confrontacional, no es la forma recomendada.', 0),
    (qq.order_index, 2, 'B. I''m not sure about that, maybe...', true, 'Correcto: expresa desacuerdo de forma suave y abre espacio a seguir hablando.', 1),
    (qq.order_index, 2, 'C. No.', false, 'Es demasiado abrupto para una conversación colaborativa.', 2),
    (qq.order_index, 3, 'A. Memorizar un discurso perfecto', false, 'No se trata de memorizar, sino de conversar de forma natural.', 0),
    (qq.order_index, 3, 'B. Cómo interactúas: escuchar, opinar y responder a la otra persona', true, 'Correcto: la interacción real es justamente lo que se evalúa.', 1),
    (qq.order_index, 3, 'C. Quién habla más tiempo', false, 'No se trata de hablar más, sino de interactuar bien.', 2),
    (qq.order_index, 4, 'A. Let''s choose... / Maybe we could...', true, 'Correcto: son frases naturales para proponer un acuerdo final.', 0),
    (qq.order_index, 4, 'B. I don''t know anything.', false, 'No ayuda a cerrar la conversación con un acuerdo.', 1),
    (qq.order_index, 4, 'C. Stop talking.', false, 'Suena brusco y no es apropiado para cerrar una conversación colaborativa.', 2)
) as c(qorder, order_index, choice_text, is_correct, feedback, order_index2)
where co.slug = 'ingles-a2' and m.title = 'Speaking — Entrevista y tarea colaborativa'
  and q.stage = 'interactive' and qq.order_index = c.qorder
on conflict (question_id, order_index) do nothing;
