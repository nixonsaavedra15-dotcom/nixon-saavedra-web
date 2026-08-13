-- ============================================================
-- Inglés B1 — Lote 9: Unidad 9 (Relationships & Feelings)
-- ============================================================
-- Requiere haber corrido antes: seed-ingles-b1-modules.sql y los
-- batches anteriores. Seguro de correr varias veces.
-- ============================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Unidad 9 — Relationships & Feelings",
    "subtitle": "\"She said she was tired\" en vez de \"She said: 'I am tired'\" — así es como contamos lo que otros dijeron.",
    "guide_html": "<p>Esta unidad es sobre relaciones, sentimientos y cómo contar lo que otras personas dicen — el llamado <strong>reported speech</strong> (estilo indirecto). También vamos a ver combinaciones de verbo + preposición muy comunes al hablar de relaciones (depend on, worry about, apologise for), y vocabulario para hablar de amistad, familia y conflictos.</p>",
    "objectives": [
      "Formar y usar el reported speech para contar lo que alguien dijo",
      "Usar combinaciones correctas de verbo + preposición",
      "Usar vocabulario de relaciones, sentimientos y conflictos",
      "Hablar de tus relaciones personales en inglés"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "A Conversation Worth Having",
    "html": "<p class='lead-in'>Lee esta historia sobre un conflicto entre amigas. Fíjate en cómo se cuenta lo que cada una dijo.</p><div class='reading-passage'><span class='passage-tag'>Sara's Story</span>Last week, my best friend and I had a small argument. She told me she felt hurt because I had cancelled our plans twice in a row. I explained that I was going through a stressful time at work, and I apologised for not communicating better. She said she understood, but she also mentioned that she needed to feel like the friendship mattered to me too. We talked for almost an hour, and by the end, we both agreed that honest conversations, even uncomfortable ones, make relationships stronger. I told her I would try harder to depend less on \"I'm busy\" as an excuse. Now we check in with each other more often, and our friendship actually feels closer than before.</div><h2>Vocabulario — Relaciones y sentimientos</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>hurt</div><div class='mean'>herido/a (emocionalmente)</div></div><div class='vocab-item'><div class='word'>an argument</div><div class='mean'>una discusión</div></div><div class='vocab-item'><div class='word'>to apologise</div><div class='mean'>disculparse</div></div><div class='vocab-item'><div class='word'>to matter</div><div class='mean'>importar</div></div><div class='vocab-item'><div class='word'>an excuse</div><div class='mean'>una excusa</div></div><div class='vocab-item'><div class='word'>to check in (with someone)</div><div class='mean'>saber cómo está alguien, ponerse al día</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>\"She <strong>told me</strong> she felt hurt\" — este es un ejemplo de reported speech: contamos lo que ella dijo, sin usar comillas ni sus palabras exactas.</span></div><details class='mini-check'><summary>¿Por qué se sintió herida la amiga de Sara?</summary><div class='answer'>Porque Sara había cancelado sus planes dos veces seguidas.</div></details><details class='mini-check'><summary>¿Qué acordaron las dos al final de la conversación?</summary><div class='answer'>Que las conversaciones honestas, aunque incómodas, hacen las relaciones más fuertes.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Reported Speech — y verbo + preposición",
    "html": "<p class='lead-in'>Cuando contamos lo que alguien dijo, casi siempre \"retrocedemos\" un tiempo verbal.</p><table class='grammar-table'><tr><th>Discurso directo</th><th>Reported speech</th></tr><tr><td>\"I feel hurt.\"</td><td>She said (that) she <strong>felt</strong> hurt.</td></tr><tr><td>\"I am stressed.\"</td><td>He said (that) he <strong>was</strong> stressed.</td></tr><tr><td>\"I will try harder.\"</td><td>I told her I <strong>would</strong> try harder.</td></tr><tr><td>\"I have cancelled twice.\"</td><td>She said (that) I <strong>had cancelled</strong> twice.</td></tr></table><div class='tip-box'><span class='icon'>💡</span><span>Regla general de \"backshift\": present → past, past → past perfect, will → would. No es obligatorio en todos los casos, pero es lo más común y natural.</span></div><h2>Verbo + preposición</h2><div class='example-box'><div class='line'><span class='speaker'>depend on</span> I depend on my friends a lot.</div><div class='line'><span class='speaker'>worry about</span> She worries about her family.</div><div class='line'><span class='speaker'>apologise for</span> He apologised for being late.</div><div class='line'><span class='speaker'>believe in</span> I believe in honest friendships.</div></div><h2>Conectores para contar conversaciones</h2><div class='connector-flow'><span class='conn-chip'>she told me...</span><span class='conn-arrow'>→</span><span class='conn-chip'>I explained that...</span><span class='conn-arrow'>→</span><span class='conn-chip'>she mentioned that...</span><span class='conn-arrow'>→</span><span class='conn-chip'>in the end, we agreed that...</span></div><h2>Phrasal verbs de relaciones</h2><div class='phrasal-grid'><div class='phrasal-item'><div class='pv'>make up (with someone)</div><div class='pv-mean'>reconciliarse</div><div class='pv-ex'>We made up after the argument.</div></div><div class='phrasal-item'><div class='pv'>fall out (with someone)</div><div class='pv-mean'>pelearse, distanciarse</div><div class='pv-ex'>They fell out over money.</div></div><div class='phrasal-item'><div class='pv'>look up to</div><div class='pv-mean'>admirar a alguien</div><div class='pv-ex'>I look up to my older sister.</div></div><div class='phrasal-item'><div class='pv'>get along with</div><div class='pv-mean'>llevarse bien con</div><div class='pv-ex'>I get along with my colleagues.</div></div></div><div class='mindmap-wrap'><div class='mindmap-hub'>Relaciones y sentimientos</div><div class='mindmap-branches'><div class='mindmap-node'><div class='node-title'>Emociones</div><div class='node-items'>hurt, frustrated, grateful</div></div><div class='mindmap-node'><div class='node-title'>Conflicto</div><div class='node-items'>an argument, to fall out</div></div><div class='mindmap-node'><div class='node-title'>Reconciliación</div><div class='node-items'>to apologise, to make up</div></div><div class='mindmap-node'><div class='node-title'>Vínculos</div><div class='node-items'>to depend on, to get along with</div></div></div></div><details class='mini-check'><summary>En reported speech, ¿en qué se convierte \"will\" normalmente?</summary><div class='answer'>En \"would\" (I will try → I said I would try).</div></details>"
  },
  "interactive": {
    "type": "match",
    "title": "Empareja el discurso directo con su reported speech",
    "intro": "Encuentra la pareja correcta para cada tarjeta.",
    "pairs": [
      { "left": "\"I feel hurt.\"", "right": "She said she felt hurt." },
      { "left": "\"I am stressed.\"", "right": "He said he was stressed." },
      { "left": "\"I will try harder.\"", "right": "I said I would try harder." },
      { "left": "depend on", "right": "Depender de" },
      { "left": "apologise for", "right": "Disculparse por" },
      { "left": "make up", "right": "Reconciliarse" },
      { "left": "fall out", "right": "Pelearse, distanciarse" },
      { "left": "get along with", "right": "Llevarse bien con" }
    ]
  },
  "practice": {
    "title": "Ahora te toca a ti",
    "html": "<p class='lead-in'>Lee este ejemplo y luego practica el reported speech.</p><div class='reading-passage'><div class='passage-tag'>Example</div>My brother called me yesterday. He told me he was having a hard week at work, and he said he needed some advice. I explained that I understood how he felt, because I had gone through something similar last year. We talked for a while, and he thanked me for listening.</div><div class='tip-box'><span class='icon'>✍️</span><span><strong>Actividad de escritura:</strong> escribe un párrafo corto (5-7 oraciones) contando una conversación real o inventada con un familiar o amigo. Usa <strong>al menos 3 oraciones en reported speech</strong> y <strong>una combinación de verbo + preposición</strong>.</span></div>"
  },
  "speaking_tasks": [
    {
      "id": "u9-speaking-1",
      "label": "Habla en voz alta (30-45 segundos, en inglés) sobre una conversación importante que hayas tenido con alguien. Usa al menos una oración en reported speech.",
      "keywords": ["said", "told", "felt", "explained", "friend", "family", "understood", "apologised"],
      "min_words": 25,
      "min_seconds": 20
    }
  ],
  "closing_form": {
    "title": "Sella lo aprendido en esta unidad",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id": "reported_speech", "label": "Explica con tus palabras cómo funciona el 'backshift' en reported speech.", "type": "textarea", "placeholder": "" },
      { "id": "verbo_preposicion", "label": "Escribe 2 ejemplos con verbo + preposición (depend on, worry about, etc.).", "type": "textarea", "placeholder": "" },
      { "id": "mi_relacion", "label": "Escribe 2-3 oraciones en inglés sobre una relación importante en tu vida.", "type": "textarea", "placeholder": "" },
      { "id": "dificultad", "label": "¿Qué fue lo más difícil de esta unidad para ti?", "type": "textarea", "placeholder": "" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 9 — Relationships & Feelings';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: Relationships & Feelings', 70, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 9 — Relationships & Feelings'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Por qué se sintió herida la amiga de Sara?'),
  (1, '¿Qué acordaron las dos al final de la conversación?'),
  (2, '¿Qué significa "to apologise"?'),
  (3, '¿Qué significa "an excuse"?'),
  (4, '¿Qué hace Sara ahora, según el texto, para mejorar la amistad?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 9 — Relationships & Feelings' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Sara canceló los planes dos veces',true,'Correcto: "I had cancelled our plans twice in a row".'),(1,'B. Sara se olvidó de su cumpleaños',false,'No se menciona ningún cumpleaños en el texto.'),(2,'C. Se mudaron a distintas ciudades',false,'No se menciona ninguna mudanza en el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 9 — Relationships & Feelings' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Que las conversaciones honestas fortalecen las relaciones',true,'Correcto.'),(1,'B. Que ya no serían amigas',false,'Es lo opuesto a lo que dice el texto.'),(2,'C. Que nunca hablarían del tema otra vez',false,'No es lo que acordaron según el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 9 — Relationships & Feelings' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Disculparse',true,'Correcto.'),(1,'B. Discutir',false,'No es el significado de "apologise".'),(2,'C. Ignorar a alguien',false,'No es el significado de "apologise".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 9 — Relationships & Feelings' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Una excusa',true,'Correcto.'),(1,'B. Una disculpa sincera',false,'No es exactamente el mismo significado.'),(2,'C. Un secreto',false,'No es el significado de "excuse".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 9 — Relationships & Feelings' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Ahora se saludan/consultan más seguido',true,'Correcto: "we check in with each other more often".'),(1,'B. Le compra regalos',false,'No se menciona ningún regalo en el texto.'),(2,'C. La visita todos los días',false,'No se menciona esto en el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 9 — Relationships & Feelings' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 70, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 9 — Relationships & Feelings'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál es el reported speech correcto de "I am stressed"?'),
  (1, 'En reported speech, ¿en qué se convierte normalmente "will"?'),
  (2, '¿Qué preposición acompaña normalmente al verbo "depend"?'),
  (3, '¿Qué significa el phrasal verb "make up" (con alguien)?'),
  (4, '¿Qué significa el phrasal verb "fall out" (con alguien)?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 9 — Relationships & Feelings' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. He said he is stressed.',false,'Falta el backshift: debe cambiar "is" a "was".'),(1,'B. He said he was stressed.',true,'Correcto: present → past en reported speech.'),(2,'C. He says he was stressed.',false,'El verbo introductorio también suele ir en pasado ("said", no "says").')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 9 — Relationships & Feelings' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. would',true,'Correcto: "I will try" → "I said I would try".'),(1,'B. will',false,'"Will" normalmente cambia a "would" en reported speech.'),(2,'C. can',false,'No es la conversión habitual de "will".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 9 — Relationships & Feelings' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. depend of',false,'No es la preposición correcta en inglés.'),(1,'B. depend on',true,'Correcto: "I depend on my friends".'),(2,'C. depend in',false,'No es la preposición correcta en inglés.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 9 — Relationships & Feelings' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Reconciliarse',true,'Correcto: "we made up after the argument".'),(1,'B. Pelearse',false,'Es prácticamente lo opuesto — ese es "fall out".'),(2,'C. Mudarse juntos',false,'No es el significado de "make up".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 9 — Relationships & Feelings' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Pelearse, distanciarse',true,'Correcto: "they fell out over money".'),(1,'B. Reconciliarse',false,'Es lo opuesto — ese es "make up".'),(2,'C. Caerse físicamente',false,'No es el significado en el contexto de relaciones.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 9 — Relationships & Feelings' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
