-- ============================================================
-- Inglés B1 — Lote 11: Unidad 11 (Final Review & Certification)
-- ============================================================
-- Requiere haber corrido antes: seed-ingles-b1-modules.sql y los
-- batches anteriores. Seguro de correr varias veces.
--
-- El segundo quiz (stage 'interactive') tiene is_final = true:
-- aprobarlo es lo que desbloquea el certificado del curso, igual
-- que en Cambridge A2 Key y Pre-ICFES.
-- ============================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Unidad 11 — Final Review & Certification",
    "subtitle": "Diez unidades después, es momento de juntar todo lo que has aprendido.",
    "guide_html": "<p>Llegaste a la última unidad. Aquí no vamos a ver gramática nueva — vamos a repasar todo lo que has aprendido en las 10 unidades anteriores, integrado en textos y actividades reales. Al final de esta unidad hay un <strong>quiz final</strong>: aprobarlo desbloquea tu <strong>certificado</strong> del curso Inglés B1.</p>",
    "objectives": [
      "Repasar e integrar los tiempos verbales y estructuras vistas en el curso",
      "Repasar vocabulario y expresiones clave de todas las unidades",
      "Producir un texto escrito y uno hablado que combinen varias estructuras",
      "Aprobar el quiz final para desbloquear tu certificado"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Ten Months of English",
    "html": "<p class='lead-in'>Lee esta reflexión de un estudiante que terminó el curso. Es un repaso natural de casi todo lo que has visto — trata de identificar cada estructura mientras lees.</p><div class='reading-passage'><span class='passage-tag'>A Student's Reflection</span>When I started this course, I could barely introduce myself in English. Now, ten months later, I've learned so much more than I expected. I remember when I was struggling with the present perfect — I used to mix it up with the past simple all the time! If someone had told me back then that I would be writing a reflection like this in English, I wouldn't have believed them. I've made mistakes along the way, and I'll probably keep making them, but that's how languages are learned. Next year, I'm planning to take an official exam, and if I keep practising every day, I know I'll be ready. One thing I've realised is that English isn't just grammar rules — it's told through stories, jokes, idioms, and real conversations. I'd recommend this course to anyone who wants to learn English properly, not just for a test.</div><h2>Vocabulario — Repaso general</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>to struggle with</div><div class='mean'>tener dificultades con</div></div><div class='vocab-item'><div class='word'>to mix up</div><div class='mean'>confundir</div></div><div class='vocab-item'><div class='word'>along the way</div><div class='mean'>en el camino, durante el proceso</div></div><div class='vocab-item'><div class='word'>to realise</div><div class='mean'>darse cuenta</div></div><div class='vocab-item'><div class='word'>properly</div><div class='mean'>de forma correcta, como se debe</div></div><div class='vocab-item'><div class='word'>an achievement</div><div class='mean'>un logro</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>Este texto mezcla present perfect (\"I''ve learned\"), past simple/continuous (\"I was struggling\"), used to, first y second conditional, y future forms — todo lo que has visto en el curso, en un solo párrafo natural.</span></div><details class='mini-check'><summary>¿Con qué tiempo verbal solía confundirse el estudiante?</summary><div class='answer'>Con el present perfect, que confundía con el past simple.</div></details><details class='mini-check'><summary>¿Qué planea hacer el estudiante el próximo año?</summary><div class='answer'>Presentar un examen oficial de inglés.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Mapa completo del curso — repaso final",
    "html": "<p class='lead-in'>Este es el resumen de las 10 unidades que ya completaste. Úsalo como referencia rápida antes del quiz final.</p><table class='grammar-table'><tr><th>Unidad</th><th>Gramática clave</th></tr><tr><td>1 — Daily Life</td><td>Present simple vs. continuous, frequency adverbs</td></tr><tr><td>2 — Stories From the Past</td><td>Past simple vs. continuous, verbos irregulares</td></tr><tr><td>3 — What's Coming Next</td><td>Will / going to / present continuous, first conditional</td></tr><tr><td>4 — Travelling</td><td>Present perfect vs. past simple, for/since</td></tr><tr><td>5 — The World of Work</td><td>Must / have to / should</td></tr><tr><td>6 — Health & Lifestyle</td><td>First conditional a fondo, formas de dar consejo</td></tr><tr><td>7 — Technology</td><td>Voz pasiva, conectores de causa/efecto</td></tr><tr><td>8 — Environment & Society</td><td>Comparativos/superlativos, second conditional</td></tr><tr><td>9 — Relationships</td><td>Reported speech, verbo + preposición</td></tr><tr><td>10 — Culture & Celebrations</td><td>Repaso mixto, idioms</td></tr></table><div class='mindmap-wrap'><div class='mindmap-hub'>Todo el curso Inglés B1</div><div class='mindmap-branches'><div class='mindmap-node'><div class='node-title'>Tiempo</div><div class='node-items'>presente, pasado, futuro, perfect</div></div><div class='mindmap-node'><div class='node-title'>Hipótesis</div><div class='node-items'>first/second conditional</div></div><div class='mindmap-node'><div class='node-title'>Voz y discurso</div><div class='node-items'>voz pasiva, reported speech</div></div><div class='mindmap-node'><div class='node-title'>Vocabulario vivo</div><div class='node-items'>phrasal verbs, idioms, conectores</div></div></div></div><div class='tip-box'><span class='icon'>💡</span><span>Si alguna de estas estructuras todavía no te sale natural, no pasa nada — vuelve a la unidad correspondiente y repasa la lectura 2 y el mini-check antes de intentar el quiz final.</span></div><h2>Conectores de cierre</h2><div class='connector-flow'><span class='conn-chip'>in conclusion</span><span class='conn-arrow'>→</span><span class='conn-chip'>overall</span><span class='conn-arrow'>→</span><span class='conn-chip'>looking back</span><span class='conn-arrow'>→</span><span class='conn-chip'>from now on</span></div><details class='mini-check'><summary>¿Cuál es la diferencia principal entre first y second conditional?</summary><div class='answer'>El first conditional habla de situaciones reales/posibles (if + presente, will); el second conditional habla de situaciones hipotéticas/improbables (if + pasado, would).</div></details>"
  },
  "interactive": {
    "type": "match",
    "title": "Repaso general — empareja cada estructura con su ejemplo",
    "intro": "Un último repaso mezclando las 10 unidades antes del quiz final.",
    "pairs": [
      { "left": "Present perfect", "right": "I've been to five countries." },
      { "left": "Past continuous", "right": "I was cooking when she called." },
      { "left": "First conditional", "right": "If it rains, I'll stay home." },
      { "left": "Second conditional", "right": "If I were rich, I'd travel more." },
      { "left": "Passive voice", "right": "The app was updated yesterday." },
      { "left": "Reported speech", "right": "She said she was tired." },
      { "left": "Idiom", "right": "It's a piece of cake." },
      { "left": "Modal of obligation", "right": "You have to arrive early." }
    ]
  },
  "practice": {
    "title": "Tu reflexión final",
    "html": "<p class='lead-in'>Lee este ejemplo de reflexión final y luego escribe la tuya.</p><div class='reading-passage'><div class='passage-tag'>Example</div>When I started this course, I couldn't have a real conversation in English. Now I can talk about my past, my plans, my opinions, and even hypothetical situations. If I hadn't practised every week, I wouldn't have improved this much. I'm proud of what I've achieved, and I'm planning to keep learning.</div><div class='tip-box'><span class='icon'>✍️</span><span><strong>Actividad de escritura final:</strong> escribe un párrafo (7-10 oraciones) reflexionando sobre tu proceso aprendiendo inglés en este curso. Intenta usar <strong>al menos 4 estructuras distintas</strong> vistas a lo largo del curso (tiempos verbales, condicionales, voz pasiva, reported speech, modales, etc.).</span></div>"
  },
  "speaking_tasks": [
    {
      "id": "u11-speaking-1",
      "label": "Habla en voz alta (45-60 segundos, en inglés) sobre tu experiencia aprendiendo inglés en este curso: qué has aprendido, qué fue difícil, y qué planeas hacer después. Intenta usar varias estructuras distintas.",
      "keywords": ["learned", "improved", "difficult", "plan", "practise", "before", "now", "achieved", "confident"],
      "min_words": 40,
      "min_seconds": 30
    }
  ],
  "closing_form": {
    "title": "Cierre del curso — reflexión final",
    "intro": "Este es el cierre del curso completo. Responde con calma.",
    "fields": [
      { "id": "logro_principal", "label": "¿Cuál sientes que fue tu mayor logro en este curso?", "type": "textarea", "placeholder": "" },
      { "id": "estructura_dificil", "label": "¿Qué estructura gramatical te costó más trabajo, de todo el curso?", "type": "textarea", "placeholder": "" },
      { "id": "plan_futuro", "label": "¿Qué planeas hacer para seguir practicando inglés después de este curso?", "type": "textarea", "placeholder": "" },
      { "id": "comentario_final", "label": "¿Algo más que quieras compartir sobre tu experiencia con el curso?", "type": "textarea", "placeholder": "" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 11 — Final Review & Certification';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: repaso general', 70, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 11 — Final Review & Certification'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Con qué tiempo verbal solía confundirse el estudiante del texto?'),
  (1, '¿Qué planea hacer el estudiante el próximo año?'),
  (2, '¿Qué significa "to struggle with"?'),
  (3, '¿Qué significa "to mix up"?'),
  (4, '¿Qué significa "along the way"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 11 — Final Review & Certification' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Present perfect',true,'Correcto: lo confundía con el past simple.'),(1,'B. Past continuous',false,'No es el tiempo mencionado en el texto.'),(2,'C. Second conditional',false,'No es el tiempo mencionado en el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Presentar un examen oficial',true,'Correcto: "I''m planning to take an official exam".'),(1,'B. Mudarse a otro país',false,'No se menciona en el texto.'),(2,'C. Empezar otro idioma',false,'No se menciona en el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Tener dificultades con algo',true,'Correcto.'),(1,'B. Disfrutar de algo',false,'Es prácticamente lo opuesto al significado real.'),(2,'C. Terminar algo rápido',false,'No es el significado de "struggle with".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Confundir',true,'Correcto.'),(1,'B. Recordar',false,'No es el significado de "mix up".'),(2,'C. Aprender rápido',false,'No es el significado de "mix up".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. En el camino, durante el proceso',true,'Correcto.'),(1,'B. Al final del camino',false,'No es exactamente el significado de la expresión.'),(2,'C. Desde el principio',false,'No es el significado de "along the way".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz final — Inglés B1', 70, true, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 11 — Final Review & Certification'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Completa: "I ___ to Peru in 2019." (momento específico)'),
  (1, 'Completa: "I ___ been to Ecuador and Chile." (experiencia general)'),
  (2, '¿Cuál es la voz pasiva de "They updated the app"?'),
  (3, 'Completa: "If it rains, I ___ stay home." (first conditional)'),
  (4, 'Completa: "If I ___ rich, I would travel more." (second conditional)'),
  (5, '¿Cuál es el reported speech de: "I am tired." (she said...)'),
  (6, '¿Qué significa el idiom "it''s a piece of cake"?'),
  (7, '¿Cuál expresa una obligación externa (regla, empresa)?'),
  (8, '¿Cuál es el pasado del verbo irregular "go"?'),
  (9, '¿Qué significa el phrasal verb "look forward to"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 11 — Final Review & Certification' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. have gone',false,'Un año específico (2019) requiere past simple, no present perfect.'),(1,'B. went',true,'Correcto: "in 2019" es un momento específico → past simple.'),(2,'C. go',false,'Falta el pasado del verbo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive' and qz2.is_final=true)
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. have',true,'Correcto: experiencia general sin fecha → present perfect.'),(1,'B. did',false,'No corresponde a la estructura del present perfect.'),(2,'C. was',false,'No corresponde a la estructura del present perfect.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive' and qz2.is_final=true)
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. The app was updated.',true,'Correcto: sujeto (the app) + was + past participle.'),(1,'B. The app updated.',false,'Falta el auxiliar "was" para la voz pasiva.'),(2,'C. The app has update.',false,'No es una estructura pasiva correcta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive' and qz2.is_final=true)
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. would',false,'"Would" se usa en el second conditional, no en el first.'),(1,'B. will',true,'Correcto: first conditional usa "will" en el resultado.'),(2,'C. am',false,'No corresponde a la estructura del first conditional.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive' and qz2.is_final=true)
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. am',false,'El second conditional usa "were" para todas las personas, no "am".'),(1,'B. were',true,'Correcto: "if I were rich..." — excepción del second conditional.'),(2,'C. was',false,'La forma correcta en el second conditional es "were", incluso con "I".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive' and qz2.is_final=true)
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. She said she is tired.',false,'Falta el backshift: "is" debe cambiar a "was".'),(1,'B. She said she was tired.',true,'Correcto: present → past en reported speech.'),(2,'C. She say she was tired.',false,'El verbo introductorio debe ser "said", no "say".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=5 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive' and qz2.is_final=true)
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Que algo es muy fácil',true,'Correcto.'),(1,'B. Que algo es muy dulce',false,'No es el significado figurado del idiom.'),(2,'C. Que algo es muy caro',false,'Ese es el significado de "cost an arm and a leg", no este idiom.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=6 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive' and qz2.is_final=true)
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. should',false,'"Should" es un consejo, no una obligación externa.'),(1,'B. have to',true,'Correcto: "have to" expresa una obligación externa (regla, empresa, ley).'),(2,'C. might',false,'"Might" expresa posibilidad, no obligación.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=7 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive' and qz2.is_final=true)
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. goed',false,'"Go" es un verbo irregular, no termina en -ed.'),(1,'B. went',true,'Correcto: go → went → gone.'),(2,'C. gone',false,'"Gone" es el participio, no el pasado simple.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=8 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive' and qz2.is_final=true)
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Esperar algo con ganas',true,'Correcto.'),(1,'B. Mirar hacia atrás',false,'Ese es el significado de "look back on", no "look forward to".'),(2,'C. Buscar algo',false,'No es el significado de "look forward to".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 11 — Final Review & Certification' and qq.order_index=9 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive' and qz2.is_final=true)
on conflict (question_id, order_index) do nothing;
