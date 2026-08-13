-- ============================================================
-- Inglés B1 — Lote 3: Unidad 3 (What's Coming Next)
-- ============================================================
-- Requiere haber corrido antes: seed-ingles-b1-modules.sql y los
-- batches anteriores. Seguro de correr varias veces.
-- ============================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Unidad 3 — What's Coming Next",
    "subtitle": "En inglés hay tres formas distintas de hablar del futuro — y cada una dice algo diferente sobre qué tan segura o planeada está la acción.",
    "guide_html": "<p>Hasta ahora hemos hablado del presente y del pasado. En esta unidad damos el salto al futuro: cómo hacer planes, cómo hablar de decisiones espontáneas, y cómo conectar una condición con su consecuencia usando el <strong>first conditional</strong> (si pasa esto, entonces pasará aquello). También vas a aprender vocabulario para hablar de metas — algo muy útil en cualquier conversación sobre el futuro.</p>",
    "objectives": [
      "Diferenciar 'will', 'going to' y el present continuous para hablar del futuro",
      "Formar y usar correctamente el first conditional",
      "Usar vocabulario y expresiones para hablar de planes y metas",
      "Hablar de tus propios planes futuros con confianza"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Big Plans for Next Year",
    "html": "<p class='lead-in'>Lee el mensaje que Camila le escribió a su hermana. Fíjate en las tres formas de hablar del futuro.</p><div class='reading-passage'><span class='passage-tag'>A message from Camila</span>Hey! I have so much news. I'm moving to Medellín in March — I've already found an apartment near the office. I'm going to start my new job on the 15th, and honestly, I think it's going to be a great change for me. I'm also planning a short trip to the coast in April; I'll send you the dates as soon as I book the flights. Oh, and guess what — I've decided to finally learn how to drive! I'm having my first lesson next Tuesday. If everything goes well, I'll get my license before the summer. What about you? Are you still thinking of applying for that scholarship?</div><h2>Vocabulario — Planes y metas</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>to move (to a city)</div><div class='mean'>mudarse (a una ciudad)</div></div><div class='vocab-item'><div class='word'>a goal</div><div class='mean'>una meta</div></div><div class='vocab-item'><div class='word'>to book (a flight)</div><div class='mean'>reservar (un vuelo)</div></div><div class='vocab-item'><div class='word'>a scholarship</div><div class='mean'>una beca</div></div><div class='vocab-item'><div class='word'>as soon as</div><div class='mean'>tan pronto como</div></div><div class='vocab-item'><div class='word'>to apply for</div><div class='mean'>postularse a, aplicar a</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>Fíjate: \"I'm moving\" y \"I'm going to start\" son planes ya decididos y organizados. \"I'll send you the dates\" es una promesa/decisión que Camila toma en el momento de escribir, no algo que ya tenía planeado.</span></div><details class='mini-check'><summary>¿Cuándo empieza Camila su nuevo trabajo?</summary><div class='answer'>El día 15 (I'm going to start my new job on the 15th).</div></details><details class='mini-check'><summary>¿Qué decidió aprender a hacer?</summary><div class='answer'>A manejar/conducir (I've decided to finally learn how to drive).</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Will vs. Going To vs. Present Continuous — y el First Conditional",
    "html": "<p class='lead-in'>Las tres formas de futuro no son intercambiables — cada una comunica algo distinto.</p><table class='grammar-table'><tr><th>Forma</th><th>Cuándo se usa</th><th>Ejemplo</th></tr><tr><td>going to</td><td>Un plan ya decidido, con intención</td><td>I'<strong>m going to</strong> start my new job on the 15th.</td></tr><tr><td>present continuous</td><td>Un plan ya organizado, con fecha/detalles fijos</td><td>I'<strong>m moving</strong> to Medellín in March.</td></tr><tr><td>will</td><td>Una decisión espontánea, promesa o predicción</td><td>I'<strong>ll send</strong> you the dates.</td></tr></table><div class='example-box'><div class='line'><span class='speaker'>✅ Correcto</span> I think it's going to rain — mira esas nubes (predicción con evidencia).</div><div class='line'><span class='speaker'>✅ Correcto</span> I think it will rain tomorrow — predicción de opinión, sin evidencia inmediata.</div></div><h2>First Conditional — si pasa esto, entonces...</h2><table class='grammar-table'><tr><th>Estructura</th><th>Ejemplo</th></tr><tr><td>If + present simple, ... will + base verb</td><td>If everything <strong>goes</strong> well, I <strong>'ll get</strong> my license before summer.</td></tr><tr><td>will + base verb ... if + present simple</td><td>I<strong>'ll be</strong> happy if you <strong>come</strong> to visit.</td></tr></table><div class='tip-box'><span class='icon'>💡</span><span>Error común: usar \"will\" en la parte del \"if\" — <strong>NO</strong> se dice \"if it will rain\", se dice <strong>\"if it rains\"</strong>. El \"will\" solo va en el resultado.</span></div><h2>Conectores de tiempo futuro</h2><div class='connector-flow'><span class='conn-chip'>as soon as</span><span class='conn-arrow'>→</span><span class='conn-chip'>before</span><span class='conn-arrow'>→</span><span class='conn-chip'>after</span><span class='conn-arrow'>→</span><span class='conn-chip'>once</span><span class='conn-arrow'>→</span><span class='conn-chip'>by the time</span></div><h2>Phrasal verbs para hablar de planes</h2><div class='phrasal-grid'><div class='phrasal-item'><div class='pv'>look forward to</div><div class='pv-mean'>esperar con ganas algo</div><div class='pv-ex'>I'm looking forward to the trip.</div></div><div class='phrasal-item'><div class='pv'>plan out</div><div class='pv-mean'>planear en detalle</div><div class='pv-ex'>Let's plan out the whole week.</div></div><div class='phrasal-item'><div class='pv'>come up with</div><div class='pv-mean'>idear, ocurrírsele algo</div><div class='pv-ex'>She came up with a great idea.</div></div><div class='phrasal-item'><div class='pv'>figure out</div><div class='pv-mean'>resolver, descifrar</div><div class='pv-ex'>We still need to figure out the budget.</div></div></div><div class='mindmap-wrap'><div class='mindmap-hub'>Hablando del futuro</div><div class='mindmap-branches'><div class='mindmap-node'><div class='node-title'>Metas</div><div class='node-items'>goal, to achieve, to succeed</div></div><div class='mindmap-node'><div class='node-title'>Viajes</div><div class='node-items'>to book, itinerary, to pack</div></div><div class='mindmap-node'><div class='node-title'>Trabajo</div><div class='node-items'>to apply for, a promotion</div></div><div class='mindmap-node'><div class='node-title'>Vida personal</div><div class='node-items'>to move, to settle down</div></div></div></div><div class='tip-box'><span class='icon'>🌍</span><span><strong>Cultura:</strong> en países de habla inglesa, el 1 de enero mucha gente hace \"New Year's resolutions\" (propósitos de año nuevo) — casi siempre usando 'going to' o 'will': \"I'm going to exercise more\" / \"I'll read more books this year\".</span></div><details class='mini-check'><summary>¿Por qué no se dice \"if it will rain\"?</summary><div class='answer'>Porque en el first conditional, el \"will\" solo va en la parte del resultado, no en la parte del \"if\".</div></details>"
  },
  "interactive": {
    "type": "match",
    "title": "Empareja cada expresión de futuro con su uso",
    "intro": "Arrastra tu atención a cada tarjeta y encuentra su pareja correcta.",
    "pairs": [
      { "left": "I'm going to start my new job", "right": "Plan ya decidido, con intención" },
      { "left": "I'm moving in March", "right": "Plan organizado, con fecha fija" },
      { "left": "I'll send you the dates", "right": "Decisión espontánea o promesa" },
      { "left": "If it rains, we'll stay home", "right": "First conditional: condición + resultado" },
      { "left": "look forward to", "right": "Esperar algo con ganas" },
      { "left": "figure out", "right": "Resolver o descifrar algo" },
      { "left": "as soon as", "right": "Tan pronto como" },
      { "left": "a scholarship", "right": "Una beca" }
    ]
  },
  "practice": {
    "title": "Ahora te toca a ti",
    "html": "<p class='lead-in'>Lee este otro ejemplo y luego escribe tus propios planes.</p><div class='reading-passage'><div class='passage-tag'>Example</div>Next year, I'm going to focus on my English. I'm planning to take an official exam in October, and if I study a little every day, I'll be ready in time. I'm also thinking of traveling somewhere I've never been — maybe I'll finally visit the coast!</div><div class='tip-box'><span class='icon'>✍️</span><span><strong>Actividad de escritura:</strong> escribe un párrafo corto (5-7 oraciones) sobre tus planes para el próximo año. Usa <strong>'going to'</strong> para un plan decidido, <strong>presente continuo</strong> para algo ya organizado, <strong>'will'</strong> para una decisión espontánea, y al menos <strong>un first conditional</strong>.</span></div>"
  },
  "speaking_tasks": [
    {
      "id": "u3-speaking-1",
      "label": "Habla en voz alta (30-45 segundos, en inglés) sobre tus planes para los próximos meses. Usa al menos dos formas distintas de futuro y un first conditional.",
      "keywords": ["going", "will", "plan", "if", "next", "hope", "goal", "looking forward"],
      "min_words": 25,
      "min_seconds": 20
    }
  ],
  "closing_form": {
    "title": "Sella lo aprendido en esta unidad",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id": "diferencia_futuros", "label": "Explica con tus palabras la diferencia entre 'will' y 'going to'.", "type": "textarea", "placeholder": "" },
      { "id": "first_conditional", "label": "Escribe tu propio ejemplo de first conditional (if + presente, will + verbo).", "type": "textarea", "placeholder": "" },
      { "id": "mis_planes", "label": "Escribe 2-3 oraciones en inglés sobre tus planes reales para este año.", "type": "textarea", "placeholder": "" },
      { "id": "dificultad", "label": "¿Qué fue lo más difícil de esta unidad para ti?", "type": "textarea", "placeholder": "" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 3 — What''s Coming Next';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: What''s Coming Next', 70, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 3 — What''s Coming Next'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuándo empieza Camila su nuevo trabajo?'),
  (1, '¿Qué decidió aprender a hacer?'),
  (2, '¿Qué significa "to book a flight"?'),
  (3, '¿Qué significa "a scholarship"?'),
  (4, '¿Qué significa "as soon as"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 3 — What''s Coming Next' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. El día 15',true,'Correcto: "I''m going to start my new job on the 15th".'),(1,'B. El día 1 de marzo',false,'Ese es el mes en que se muda, no el día del nuevo trabajo.'),(2,'C. En abril',false,'Abril es cuando planea el viaje a la costa.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 3 — What''s Coming Next' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. A cocinar',false,'No se menciona nada sobre cocinar.'),(1,'B. A manejar/conducir',true,'Correcto: "I''ve decided to finally learn how to drive".'),(2,'C. A nadar',false,'No se menciona nada sobre nadar.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 3 — What''s Coming Next' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Reservar un vuelo',true,'Correcto.'),(1,'B. Cancelar un vuelo',false,'"Book" es reservar, no cancelar.'),(2,'C. Perder un vuelo',false,'"Book" no tiene relación con perder un vuelo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 3 — What''s Coming Next' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Una beca',true,'Correcto.'),(1,'B. Una entrevista',false,'No es el significado de "scholarship".'),(2,'C. Un contrato',false,'No es el significado de "scholarship".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 3 — What''s Coming Next' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Tan pronto como',true,'Correcto.'),(1,'B. Justo antes de',false,'No es el significado de "as soon as".'),(2,'C. Hace mucho tiempo',false,'No es el significado de "as soon as".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 3 — What''s Coming Next' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 70, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 3 — What''s Coming Next'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál se usa para un plan ya decidido, con intención?'),
  (1, '¿Cuál se usa para una decisión espontánea o promesa?'),
  (2, 'Completa: "If it ___ tomorrow, we''ll stay home."'),
  (3, '¿Qué significa el phrasal verb "look forward to"?'),
  (4, '¿Qué significa el phrasal verb "come up with"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 3 — What''s Coming Next' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. going to',true,'Correcto: "going to" expresa un plan ya decidido.'),(1,'B. will',false,'"Will" es para decisiones espontáneas, no planes ya decididos.'),(2,'C. present simple',false,'El present simple no se usa para expresar planes futuros de este tipo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 3 — What''s Coming Next' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. will',true,'Correcto: "will" se usa para decisiones espontáneas y promesas.'),(1,'B. going to',false,'"Going to" es para planes ya decididos, no decisiones espontáneas.'),(2,'C. present continuous',false,'El present continuous es para planes ya organizados con fecha fija.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 3 — What''s Coming Next' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. will rain',false,'En el first conditional, "will" no va en la parte del "if".'),(1,'B. rains',true,'Correcto: "if" + present simple, "we''ll stay home" + will.'),(2,'C. rained',false,'No se usa el pasado en el first conditional.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 3 — What''s Coming Next' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Esperar algo con ganas',true,'Correcto.'),(1,'B. Mirar hacia atrás con nostalgia',false,'Ese es el significado de "look back on", no "look forward to".'),(2,'C. Buscar algo perdido',false,'No es el significado de "look forward to".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 3 — What''s Coming Next' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Idear, ocurrírsele una idea',true,'Correcto: "she came up with a great idea".'),(1,'B. Subir algo',false,'No es el significado de "come up with".'),(2,'C. Terminar algo',false,'No es el significado de "come up with".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 3 — What''s Coming Next' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
