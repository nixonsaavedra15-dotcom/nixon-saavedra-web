-- ============================================================
-- Inglés B1 — Lote 10: Unidad 10 (Culture & Celebrations)
-- ============================================================
-- Requiere haber corrido antes: seed-ingles-b1-modules.sql y los
-- batches anteriores. Seguro de correr varias veces.
-- ============================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Unidad 10 — Culture & Celebrations",
    "subtitle": "Un repaso de todos los tiempos verbales que has aprendido, ambientado en tradiciones y celebraciones del mundo angloparlante.",
    "guide_html": "<p>Esta unidad combina todo lo que has aprendido hasta ahora — presente, pasado, futuro, present perfect, condicionales — en textos sobre tradiciones y celebraciones. También vamos a ver <strong>idioms</strong> (modismos) comunes, que son expresiones que no se traducen literalmente pero que un hablante nativo usa todo el tiempo.</p>",
    "objectives": [
      "Reconocer y usar correctamente los tiempos verbales vistos en el curso, combinados",
      "Reconocer y usar idioms comunes del inglés",
      "Usar vocabulario de tradiciones, comida y festivales",
      "Hablar de una celebración o tradición importante para ti"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Celebrations Around the English-Speaking World",
    "html": "<p class='lead-in'>Lee este texto sobre celebraciones. Fíjate en los distintos tiempos verbales que se mezclan de forma natural.</p><div class='reading-passage'><span class='passage-tag'>Culture Notes</span>Thanksgiving is celebrated in the United States every November, and it has been a tradition for centuries. Families usually get together and eat a big meal, often with turkey as the main dish. If you ever visit the US in November, you'll probably be invited to a Thanksgiving dinner — Americans love sharing this tradition with visitors. In the UK, Bonfire Night is celebrated on the 5th of November; people light fireworks to remember a historical event from 1605. I've never celebrated Thanksgiving myself, but a friend who lived in Canada for two years told me it was one of her favourite traditions. Once you experience a celebration like this, it's hard to forget it — it really is a piece of cake to understand why people love it so much!</div><h2>Vocabulario — Tradiciones y festivales</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>a tradition</div><div class='mean'>una tradición</div></div><div class='vocab-item'><div class='word'>to get together</div><div class='mean'>reunirse</div></div><div class='vocab-item'><div class='word'>a festival</div><div class='mean'>un festival</div></div><div class='vocab-item'><div class='word'>fireworks</div><div class='mean'>fuegos artificiales</div></div><div class='vocab-item'><div class='word'>a historical event</div><div class='mean'>un evento histórico</div></div><div class='vocab-item'><div class='word'>to be invited</div><div class='mean'>ser invitado</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>Fíjate en la mezcla: presente pasivo (\"is celebrated\"), present perfect (\"has been\", \"I've never celebrated\"), first conditional (\"if you visit, you'll be invited\") y past simple (\"told me it was\") — todo en un solo texto, como pasa en la vida real.</span></div><details class='mini-check'><summary>¿Cuándo se celebra Bonfire Night en el Reino Unido?</summary><div class='answer'>El 5 de noviembre.</div></details><details class='mini-check'><summary>¿Qué idiom usa el texto para decir que algo es fácil de entender?</summary><div class='answer'>\"It's a piece of cake\" (literalmente \"es un pedazo de pastel\", significa que es muy fácil).</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Idioms comunes y repaso de tiempos verbales",
    "html": "<p class='lead-in'>Los idioms son expresiones fijas — no intentes traducirlas palabra por palabra.</p><table class='grammar-table'><tr><th>Idiom</th><th>Significado real</th></tr><tr><td>it's a piece of cake</td><td>es muy fácil</td></tr><tr><td>to break the ice</td><td>romper el hielo (iniciar una conversación)</td></tr><tr><td>once in a blue moon</td><td>muy de vez en cuando</td></tr><tr><td>to cost an arm and a leg</td><td>costar muchísimo dinero</td></tr><tr><td>to be over the moon</td><td>estar feliz, emocionadísimo</td></tr></table><h2>Repaso rápido de tiempos verbales</h2><table class='grammar-table'><tr><th>Tiempo</th><th>Uso</th><th>Ejemplo</th></tr><tr><td>Present simple/continuous</td><td>rutinas, hechos, ahora mismo</td><td>She works... / She's working...</td></tr><tr><td>Past simple/continuous</td><td>hechos pasados, contexto</td><td>She worked... / She was working...</td></tr><tr><td>Present perfect</td><td>experiencias, sin fecha</td><td>She has worked...</td></tr><tr><td>Will / going to</td><td>futuro: promesa/plan</td><td>She will work... / She's going to work...</td></tr><tr><td>First / second conditional</td><td>condición real / hipotética</td><td>If she works... / If she worked...</td></tr></table><div class='tip-box'><span class='icon'>💡</span><span>No necesitas memorizar reglas sueltas — lo que realmente ayuda es reconocer, en un texto real, <strong>por qué</strong> se eligió cada tiempo verbal. Vuelve a leer la Lectura 1 e identifica cada tiempo verbal que usamos.</span></div><h2>Conectores de repaso</h2><div class='connector-flow'><span class='conn-chip'>meanwhile</span><span class='conn-arrow'>→</span><span class='conn-chip'>nowadays</span><span class='conn-arrow'>→</span><span class='conn-chip'>eventually</span><span class='conn-arrow'>→</span><span class='conn-chip'>overall</span></div><h2>Phrasal verbs de celebraciones</h2><div class='phrasal-grid'><div class='phrasal-item'><div class='pv'>get together</div><div class='pv-mean'>reunirse</div><div class='pv-ex'>We get together every Christmas.</div></div><div class='phrasal-item'><div class='pv'>dress up</div><div class='pv-mean'>disfrazarse, vestirse elegante</div><div class='pv-ex'>We dressed up for the party.</div></div><div class='phrasal-item'><div class='pv'>hand out</div><div class='pv-mean'>repartir</div><div class='pv-ex'>They handed out candy to the kids.</div></div><div class='phrasal-item'><div class='pv'>light up</div><div class='pv-mean'>encender, iluminar</div><div class='pv-ex'>Fireworks lit up the sky.</div></div></div><div class='mindmap-wrap'><div class='mindmap-hub'>Cultura y celebraciones</div><div class='mindmap-branches'><div class='mindmap-node'><div class='node-title'>Tradiciones</div><div class='node-items'>a tradition, a festival, a custom</div></div><div class='mindmap-node'><div class='node-title'>Comida festiva</div><div class='node-items'>a main dish, to share a meal</div></div><div class='mindmap-node'><div class='node-title'>Celebración</div><div class='node-items'>fireworks, to get together</div></div><div class='mindmap-node'><div class='node-title'>Idioms</div><div class='node-items'>piece of cake, break the ice</div></div></div></div><details class='mini-check'><summary>¿Qué significa el idiom \"to cost an arm and a leg\"?</summary><div class='answer'>Que algo cuesta muchísimo dinero.</div></details>"
  },
  "interactive": {
    "title": "Flashcards — Idioms y repaso de tiempos verbales",
    "intro": "Toca cada tarjeta para revelar el significado.",
    "slides": [
      { "id":"s1", "icon":"🍰", "title":"it's a piece of cake", "bubble":"¿Qué significa este idiom?", "detail":"Que algo es muy fácil — no tiene nada que ver con pasteles de verdad." },
      { "id":"s2", "icon":"🧊", "title":"break the ice", "bubble":"¿Qué significa este idiom?", "detail":"Romper el hielo — iniciar una conversación en una situación incómoda." },
      { "id":"s3", "icon":"🌙", "title":"once in a blue moon", "bubble":"¿Qué significa este idiom?", "detail":"Muy de vez en cuando, casi nunca." },
      { "id":"s4", "icon":"💰", "title":"cost an arm and a leg", "bubble":"¿Qué significa este idiom?", "detail":"Que algo cuesta muchísimo dinero." },
      { "id":"s5", "icon":"🎉", "title":"get together", "bubble":"¿Qué significa este phrasal verb?", "detail":"Reunirse — 'We get together every Christmas.'" },
      { "id":"s6", "icon":"🎆", "title":"light up", "bubble":"¿Qué significa este phrasal verb?", "detail":"Encender o iluminar — 'Fireworks lit up the sky.'" }
    ]
  },
  "practice": {
    "title": "Ahora te toca a ti",
    "html": "<p class='lead-in'>Lee este ejemplo y luego escribe sobre una celebración importante para ti.</p><div class='reading-passage'><div class='passage-tag'>Example</div>Every December, my family gets together for Christmas Eve. We've celebrated it the same way for as long as I can remember — with a big dinner and lots of music. If we didn't have this tradition, the holidays wouldn't feel the same. Honestly, organising everything used to cost an arm and a leg, but nowadays we share the cost, so it's much easier.</div><div class='tip-box'><span class='icon'>✍️</span><span><strong>Actividad de escritura:</strong> escribe un párrafo (6-8 oraciones) sobre una celebración o tradición importante para ti. Intenta mezclar <strong>al menos 3 tiempos verbales distintos</strong> y usar <strong>un idiom</strong>.</span></div>"
  },
  "speaking_tasks": [
    {
      "id": "u10-speaking-1",
      "label": "Habla en voz alta (30-45 segundos, en inglés) sobre una celebración o tradición que te guste. Intenta usar al menos 3 tiempos verbales distintos.",
      "keywords": ["celebrate", "tradition", "family", "every", "always", "festival", "together", "favourite"],
      "min_words": 25,
      "min_seconds": 20
    }
  ],
  "closing_form": {
    "title": "Sella lo aprendido en esta unidad",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id": "idioms_propios", "label": "Escribe 2 idioms que aprendiste en esta unidad y su significado.", "type": "textarea", "placeholder": "" },
      { "id": "repaso_tiempos", "label": "Escribe 3 oraciones en inglés usando 3 tiempos verbales distintos.", "type": "textarea", "placeholder": "" },
      { "id": "mi_tradicion", "label": "Escribe 2-3 oraciones en inglés sobre una tradición o celebración importante para ti.", "type": "textarea", "placeholder": "" },
      { "id": "dificultad", "label": "¿Qué fue lo más difícil de esta unidad para ti?", "type": "textarea", "placeholder": "" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 10 — Culture & Celebrations';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: Culture & Celebrations', 70, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 10 — Culture & Celebrations'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuándo se celebra Bonfire Night en el Reino Unido?'),
  (1, '¿Qué idiom usa el texto para decir que algo es fácil de entender?'),
  (2, '¿Qué significa "a tradition"?'),
  (3, '¿Qué significa "fireworks"?'),
  (4, '¿Qué plato es típico de Thanksgiving, según el texto?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 10 — Culture & Celebrations' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. El 5 de noviembre',true,'Correcto.'),(1,'B. El 25 de diciembre',false,'Esa es la fecha de Navidad, no de Bonfire Night.'),(2,'C. El último jueves de noviembre',false,'Esa es la fecha de Thanksgiving, no de Bonfire Night.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 10 — Culture & Celebrations' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. "It''s a piece of cake"',true,'Correcto.'),(1,'B. "Once in a blue moon"',false,'Ese idiom significa "muy de vez en cuando", no "fácil".'),(2,'C. "Break the ice"',false,'Ese idiom significa "iniciar una conversación", no "fácil".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 10 — Culture & Celebrations' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Una tradición',true,'Correcto.'),(1,'B. Un festival de música',false,'No es específicamente el significado de "tradition".'),(2,'C. Una receta de cocina',false,'No es el significado de "tradition".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 10 — Culture & Celebrations' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Fuegos artificiales',true,'Correcto.'),(1,'B. Velas',false,'No es el significado de "fireworks".'),(2,'C. Linternas',false,'No es el significado de "fireworks".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 10 — Culture & Celebrations' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Pavo (turkey)',true,'Correcto: "often with turkey as the main dish".'),(1,'B. Pastel de calabaza',false,'No es lo que menciona este texto como plato principal.'),(2,'C. Pizza',false,'No se menciona la pizza en el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 10 — Culture & Celebrations' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 70, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 10 — Culture & Celebrations'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué significa el idiom "to break the ice"?'),
  (1, '¿Qué significa el idiom "once in a blue moon"?'),
  (2, '¿Qué significa el idiom "to cost an arm and a leg"?'),
  (3, '¿Qué significa el phrasal verb "hand out"?'),
  (4, '¿Qué significa el phrasal verb "dress up"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 10 — Culture & Celebrations' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Romper algo físicamente',false,'No es el significado del idiom.'),(1,'B. Iniciar una conversación en una situación incómoda',true,'Correcto.'),(2,'C. Congelar algo',false,'No es el significado del idiom.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 10 — Culture & Celebrations' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Muy de vez en cuando',true,'Correcto.'),(1,'B. Todos los meses',false,'No es el significado del idiom.'),(2,'C. Cada noche',false,'No es el significado del idiom.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 10 — Culture & Celebrations' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Costar muchísimo dinero',true,'Correcto.'),(1,'B. Ser gratis',false,'Es prácticamente lo opuesto al significado real.'),(2,'C. Perder una extremidad',false,'No es el significado real del idiom, es figurado.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 10 — Culture & Celebrations' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Repartir',true,'Correcto: "they handed out candy to the kids".'),(1,'B. Recoger algo',false,'Es prácticamente lo opuesto al significado real.'),(2,'C. Guardar algo',false,'No es el significado de "hand out".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 10 — Culture & Celebrations' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Vestirse elegante o disfrazarse',true,'Correcto: "we dressed up for the party".'),(1,'B. Quitarse la ropa',false,'Es prácticamente lo opuesto al significado real.'),(2,'C. Lavar la ropa',false,'No es el significado de "dress up".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 10 — Culture & Celebrations' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
