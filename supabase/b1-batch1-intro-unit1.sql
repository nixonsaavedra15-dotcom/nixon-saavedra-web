-- ============================================================
-- Inglés B1 — Lote 1: Introducción + Unidad 1 (Daily Life & Routines)
-- ============================================================
-- Requiere haber corrido antes: schema.sql, admin-schema.sql,
-- quiz-schema.sql, lesson-flow-schema.sql, seed-ingles-b1-modules.sql.
-- Seguro de correr varias veces.
--
-- Criterio de idioma (igual que en Cambridge A2 Key): las lecturas,
-- el vocabulario, los ejemplos y los diálogos van en inglés (es donde
-- se practica el idioma real) — las explicaciones de gramática, tips,
-- instrucciones y el cierre de cada lección van en español, porque es
-- un curso de autoestudio sin profesor en vivo que aclare dudas.
-- ============================================================

-- ================================================================
-- MÓDULO 0 — Introducción
-- ================================================================
update public.modules set description = $LESSON$
<p class="lead-in">¡Bienvenido a B1! Este curso es distinto a uno de preparación para examen: no hay un formato que memorizar ni "trucos" para pasar una prueba. El objetivo es simple — al terminar, deberías poder hablar, leer, escribir y escuchar sobre temas reales y cotidianos, con confianza de verdad.</p>

<h2>¿Qué significa realmente "B1"?</h2>
<p>B1 es el nivel intermedio del Marco Común Europeo (CEFR): ya no eres principiante, pero tampoco eres totalmente independiente todavía. En B1, ya puedes:</p>
<table class="grammar-table">
<tr><th>Destreza</th><th>Lo que ya puedes hacer</th></tr>
<tr><td>Listening</td><td>Seguir las ideas principales de un discurso claro sobre temas conocidos</td></tr>
<tr><td>Speaking</td><td>Manejar la mayoría de situaciones al viajar, y hablar de experiencias, planes y esperanzas</td></tr>
<tr><td>Reading</td><td>Entender textos con lenguaje cotidiano y encontrar información específica</td></tr>
<tr><td>Writing</td><td>Escribir textos simples y conectados sobre temas conocidos</td></tr>
</table>

<h2>Cómo está organizado este curso</h2>
<p>Once unidades, cada una construida alrededor de un tema real — tu rutina, un viaje, una entrevista de trabajo, un problema de salud, tecnología, medio ambiente, relaciones, cultura. Cada unidad mezcla gramática, vocabulario, expresiones y las 4 destrezas — así es como funciona el inglés de verdad, fuera del salón de clase.</p>

<div class="mindmap-wrap">
  <div class="mindmap-hub">Cada unidad incluye</div>
  <div class="mindmap-branches">
    <div class="mindmap-node"><div class="node-title">Gramática</div><div class="node-items">Una estructura clara, explicada con calma</div></div>
    <div class="mindmap-node"><div class="node-title">Vocabulario</div><div class="node-items">Palabras que de verdad vas a usar</div></div>
    <div class="mindmap-node"><div class="node-title">4 destrezas</div><div class="node-items">Reading · Writing · Listening · Speaking</div></div>
    <div class="mindmap-node"><div class="node-title">Cultura</div><div class="node-items">Cómo hablan de verdad los hablantes nativos</div></div>
  </div>
</div>

<div class="tip-box"><span class="icon">💡</span><span>No te preocupes por entender <strong>cada palabra</strong>. En B1, la habilidad real es entender la <strong>idea general</strong> — eso es justo lo que vamos a practicar.</span></div>

<h2>Antes de empezar, un autodiagnóstico rápido</h2>
<details class="mini-check"><summary>¿Ya puedes tener una conversación sencilla sobre tu rutina diaria en inglés?</summary><div class="answer">Si dijiste que sí — la Unidad 1 te va a ayudar a hacerla más rica y natural. Si no del todo — para eso exactamente es la Unidad 1.</div></details>
<details class="mini-check"><summary>¿Sabes la diferencia entre "I go" e "I'm going"?</summary><div class="answer">Lo repasamos con calma en la Unidad 1 — no hay problema si todavía no estás seguro.</div></details>

<h2>Empecemos</h2>
<p>Tómate tu tiempo en cada unidad. No hay afán — el objetivo es progreso real, no velocidad.</p>
$LESSON$
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Introduction — Welcome to B1';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Cuestionario — Introducción', 70, false, null, 0, 'main'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Introduction — Welcome to B1'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué significa el nivel B1 del CEFR?'),
  (1, 'En B1, ¿en qué te debes enfocar al escuchar?'),
  (2, '¿En qué se diferencia este curso de uno de preparación para examen?'),
  (3, '¿Qué combina cada unidad de este curso?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Introduction — Welcome to B1' and qz.stage = 'main'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Un nivel totalmente principiante',false,'B1 no es principiante — ese sería A1.'),(1,'Un nivel intermedio e independiente — ya no principiante',true,'Correcto: B1 está justo en la mitad de la escala del CEFR.'),(2,'Un nivel de hablante nativo',false,'Eso sería C2, mucho más alto que B1.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Introduction — Welcome to B1' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Entender cada palabra',false,'No es realista ni necesario en B1.'),(1,'Entender la idea general',true,'Correcto: en B1 importa más captar la idea general que cada palabra.'),(2,'Traducir todo al español primero',false,'Eso en realidad te retrasa en vez de ayudarte.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Introduction — Welcome to B1' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'No hay un formato que memorizar — el objetivo es comunicación real',true,'Correcto: este curso es de aprendizaje real, no de trucos de examen.'),(1,'En realidad es igual a un curso de preparación para examen',false,'Es intencionalmente distinto — aquí no hay formato de examen.'),(2,'Solo se enfoca en reglas gramaticales',false,'Combina gramática con vocabulario, expresiones y las 4 destrezas.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Introduction — Welcome to B1' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Solo ejercicios de gramática',false,'La gramática sola no es suficiente — el curso mezcla varios elementos.'),(1,'Gramática, vocabulario, las 4 destrezas y cultura, alrededor de un mismo tema',true,'Correcto: cada unidad combina todo esto.'),(2,'Solo práctica de listening',false,'El listening es solo una de las cuatro destrezas.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Introduction — Welcome to B1' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;


-- ================================================================
-- UNIDAD 1 — Daily Life & Routines
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Unidad 1 — Daily Life & Routines",
    "subtitle": "Vamos a hablar de tu vida diaria — con más precisión y expresiones más naturales que antes.",
    "guide_html": "<p>Hablar de tu rutina suena simple, pero ahí vive buena parte de la gramática de B1: present simple, present continuous, adverbios de frecuencia, y los phrasal verbs que los hablantes nativos usan todos los días (wake up, get dressed, head off...). Al terminar esta unidad, vas a poder describir un día normal — y uno fuera de lo común — con confianza real.</p>",
    "objectives": [
      "Usar correctamente present simple y present continuous, y saber cuándo aplica cada uno",
      "Usar adverbios de frecuencia (always, usually, often, sometimes, rarely, never) de forma natural",
      "Reconocer y usar los phrasal verbs más comunes de la rutina diaria",
      "Describir tu propia rutina en voz alta, usando conectores de secuencia"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Meet Sofia — A Day in Her Life",
    "html": "<p class='lead-in'>Lee sobre un martes típico de Sofía. Fíjate en cómo usa el present simple para su rutina, y presta atención a las expresiones de tiempo.</p><div class='reading-passage'><span class='passage-tag'>A Day in Sofia's Life</span>Sofia usually wakes up at 6:30 a.m. She gets up straight away — she never hits the snooze button twice! First, she has a quick shower, then she gets dressed and has breakfast, usually just coffee and toast. She often listens to a podcast on her way to work. Sofia works as a graphic designer, so she spends most of her day in front of a computer. She rarely eats lunch at her desk; she usually goes out with a colleague instead. After work, she sometimes goes to the gym, but on Tuesdays she normally has a Spanish class — yes, she's learning Spanish too! In the evening, she cooks dinner, watches something on TV, and goes to bed around 11 p.m.</div><h2>Vocabulario — Daily Routine</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>to wake up</div><div class='mean'>despertarse</div></div><div class='vocab-item'><div class='word'>to get up</div><div class='mean'>levantarse de la cama</div></div><div class='vocab-item'><div class='word'>to get dressed</div><div class='mean'>vestirse</div></div><div class='vocab-item'><div class='word'>to have breakfast/lunch/dinner</div><div class='mean'>desayunar/almorzar/cenar</div></div><div class='vocab-item'><div class='word'>to commute</div><div class='mean'>trasladarse regularmente al trabajo/estudio</div></div><div class='vocab-item'><div class='word'>a colleague</div><div class='mean'>un compañero de trabajo</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>Fíjate: en inglés británico se dice <strong>have</strong> a shower/breakfast/a class, pero <strong>take</strong> a shower también es muy común, sobre todo en inglés americano. ¡Las dos formas son correctas!</span></div><details class='mini-check'><summary>¿Qué hace Sofía justo después de levantarse?</summary><div class='answer'>Se da una ducha rápida (she has a quick shower).</div></details><details class='mini-check'><summary>¿Qué hace Sofía normalmente los martes en la tarde?</summary><div class='answer'>Tiene clase de español (she has a Spanish class).</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Present Simple vs. Present Continuous — ¿Cuál es la diferencia?",
    "html": "<p class='lead-in'>Los dos tiempos usan el presente, pero responden preguntas distintas. Vamos a verlo con calma.</p><table class='grammar-table'><tr><th>Tiempo</th><th>Uso</th><th>Ejemplo</th></tr><tr><td>Present Simple</td><td>Rutinas, hábitos, hechos, cosas que son generalmente ciertas</td><td>Sofia <strong>works</strong> as a graphic designer.</td></tr><tr><td>Present Continuous</td><td>Algo que pasa en este momento, o una situación temporal</td><td>Sofia <strong>is working</strong> on a new project this week.</td></tr></table><h2>Adverbios de frecuencia — y dónde van</h2><p>Los adverbios de frecuencia normalmente van <strong>antes</strong> del verbo principal, pero <strong>después</strong> del verbo 'to be':</p><div class='example-box'><div class='line'><span class='speaker'>✓</span> She <strong>usually</strong> wakes up at 6:30.</div><div class='line'><span class='speaker'>✓</span> She <strong>is</strong> <strong>usually</strong> tired on Mondays.</div><div class='line'><span class='speaker'>✗</span> She wakes <strong>usually</strong> up at 6:30. <em>(posición incorrecta)</em></div></div><table class='grammar-table'><tr><th>Adverbio</th><th>Frecuencia aproximada</th></tr><tr><td>always</td><td>100%</td></tr><tr><td>usually / normally</td><td>~80%</td></tr><tr><td>often</td><td>~60%</td></tr><tr><td>sometimes</td><td>~40%</td></tr><tr><td>rarely / hardly ever</td><td>~10%</td></tr><tr><td>never</td><td>0%</td></tr></table><h2>Conectando tu rutina — palabras de secuencia</h2><div class='connector-flow'><span class='conn-chip'>First,...</span><span class='conn-arrow'>→</span><span class='conn-chip'>Then,...</span><span class='conn-arrow'>→</span><span class='conn-chip'>After that,...</span><span class='conn-arrow'>→</span><span class='conn-chip'>Later,...</span><span class='conn-arrow'>→</span><span class='conn-chip'>Finally,...</span></div><h2>Phrasal verbs de la rutina</h2><div class='phrasal-grid'><div class='phrasal-item'><div class='pv'>wake up</div><div class='pv-mean'>despertarse</div><div class='pv-ex'>I wake up at 7.</div></div><div class='phrasal-item'><div class='pv'>get up</div><div class='pv-mean'>levantarse de la cama</div><div class='pv-ex'>I wake up but I don't get up straight away.</div></div><div class='phrasal-item'><div class='pv'>get ready</div><div class='pv-mean'>arreglarse para salir</div><div class='pv-ex'>It takes me 20 minutes to get ready.</div></div><div class='phrasal-item'><div class='pv'>head off / head out</div><div class='pv-mean'>salir, irse</div><div class='pv-ex'>I head off to work at 8.</div></div><div class='phrasal-item'><div class='pv'>catch up on</div><div class='pv-mean'>ponerse al día con algo</div><div class='pv-ex'>I catch up on emails on Sunday nights.</div></div><div class='phrasal-item'><div class='pv'>wind down</div><div class='pv-mean'>relajarse antes de dormir</div><div class='pv-ex'>I wind down by reading for a bit.</div></div></div><div class='mindmap-wrap'><div class='mindmap-hub'>My Daily Routine</div><div class='mindmap-branches'><div class='mindmap-node'><div class='node-title'>Mañana</div><div class='node-items'>wake up · get up · get ready · have breakfast</div></div><div class='mindmap-node'><div class='node-title'>Tarde</div><div class='node-items'>work/study · have lunch · commute</div></div><div class='mindmap-node'><div class='node-title'>Noche</div><div class='node-items'>have dinner · wind down · go to bed</div></div><div class='mindmap-node'><div class='node-title'>Fin de semana</div><div class='node-items'>sleep in · catch up on... · relax</div></div></div></div><div class='tip-box'><span class='icon'>🔑</span><span>Un error muy común en B1: usar present continuous para rutinas (<em>'I am waking up at 7 every day'</em> ❌). Las rutinas casi siempre necesitan <strong>present simple</strong> — guarda el continuous para lo que pasa ahora mismo o esta semana.</span></div><details class='mini-check'><summary>¿Qué tiempo usamos para hábitos y rutinas?</summary><div class='answer'>Present simple.</div></details><details class='mini-check'><summary>¿Dónde va el adverbio de frecuencia con el verbo 'to be'?</summary><div class='answer'>Después de él — por ejemplo: 'She is usually tired.'</div></details>"
  },
  "interactive": {
    "type": "match",
    "title": "Empareja el phrasal verb con su significado",
    "intro": "Toca una tarjeta de la izquierda y luego la que le corresponde a la derecha.",
    "pairs": [
      { "left": "wake up", "right": "despertarse" },
      { "left": "get up", "right": "levantarse de la cama" },
      { "left": "get ready", "right": "arreglarse para salir" },
      { "left": "head off", "right": "salir, irse" },
      { "left": "catch up on", "right": "ponerse al día con algo" },
      { "left": "wind down", "right": "relajarse antes de dormir" },
      { "left": "sleep in", "right": "levantarse más tarde de lo normal" },
      { "left": "commute", "right": "trasladarse regularmente al trabajo/estudio" }
    ]
  },
  "practice": {
    "title": "Ahora te toca a ti",
    "html": "<p class='lead-in'>Juntemos todo con un ejemplo real, y luego te toca escribir y hablar.</p><div class='reading-passage'><div class='passage-tag'>Example</div>On weekdays, I usually wake up at 6 a.m. First, I get up and drink a glass of water. Then I get ready for work — I never skip breakfast! After that, I commute for about 30 minutes, and I often listen to music on the way. In the evening, I wind down by reading for half an hour before I go to bed.</div><div class='tip-box'><span class='icon'>✍️</span><span><strong>Actividad de escritura:</strong> escribe 5-7 oraciones en inglés describiendo tu rutina típica entre semana. Usa al menos <strong>3 adverbios de frecuencia</strong> y <strong>2 conectores de secuencia</strong> (first, then, after that, later, finally).</span></div>"
  },
  "speaking_tasks": [
    {
      "id": "u1-speaking-1",
      "label": "Describe tu día típico en voz alta, en inglés (30-45 segundos). Intenta usar al menos 3 adverbios de frecuencia y 2 palabras de secuencia.",
      "keywords": ["usually", "always", "sometimes", "often", "never", "first", "then", "after", "finally", "wake", "get up"],
      "min_words": 25,
      "min_seconds": 20
    }
  ],
  "closing_form": {
    "title": "Sella lo aprendido en esta unidad",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id": "diferencia_tiempos", "label": "Explica, con tus propias palabras, la diferencia entre present simple y present continuous.", "type": "textarea", "placeholder": "" },
      { "id": "phrasal_ejemplo", "label": "Escribe una oración en inglés usando un phrasal verb de esta unidad (que no hayas visto ya en los ejemplos).", "type": "text", "placeholder": "" },
      { "id": "mi_rutina", "label": "Escribe 2-3 oraciones en inglés sobre tu propia rutina, usando un adverbio de frecuencia.", "type": "textarea", "placeholder": "" },
      { "id": "dificultad", "label": "¿Qué fue lo más difícil de esta unidad para ti?", "type": "textarea", "placeholder": "" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 1 — Daily Life & Routines';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: Daily Life & Routines', 70, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 1 — Daily Life & Routines'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Según el texto, ¿qué hace Sofía justo después de levantarse?'),
  (1, '¿Qué tiempo verbal usamos para rutinas y hábitos?'),
  (2, '¿Dónde va el adverbio de frecuencia con el verbo "to be"?'),
  (3, '"She rarely eats lunch at her desk." ¿Qué te dice esto sobre Sofía?'),
  (4, '¿Qué significa el phrasal verb "wind down"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 1 — Daily Life & Routines' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Desayuna',false,'Primero se ducha, después desayuna.'),(1,'B. Se da una ducha rápida',true,'Correcto: el texto dice "she has a quick shower" primero.'),(2,'C. Se va a trabajar',false,'Eso pasa más tarde, después del desayuno.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 1 — Daily Life & Routines' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Present continuous',false,'Ese es para el momento presente o situaciones temporales, no rutinas.'),(1,'B. Present simple',true,'Correcto: present simple es para rutinas, hábitos y hechos.'),(2,'C. Past simple',false,'Past simple es para acciones terminadas en el pasado.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 1 — Daily Life & Routines' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Antes del verbo',false,'Esa es la regla para otros verbos, no para "to be".'),(1,'B. Después del verbo',true,'Correcto: por ejemplo, "She is usually tired."'),(2,'C. Al final de la oración',false,'Esa no es la posición normal del adverbio de frecuencia.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 1 — Daily Life & Routines' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Casi siempre almuerza fuera',true,'Correcto: "rarely" significa que es poco común — así que normalmente almuerza fuera en vez de en su escritorio.'),(1,'B. Nunca almuerza',false,'"Rarely" no significa "never" (nunca).'),(2,'C. Siempre almuerza en su escritorio',false,'Ese sería el significado contrario.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 1 — Daily Life & Routines' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Relajarse antes de dormir',true,'Correcto: "wind down" significa relajarse antes de dormir.'),(1,'B. Salir rápido de la casa',false,'Eso sería más cercano a "head off".'),(2,'C. Despertarse de golpe',false,'"Wind down" no tiene que ver con despertarse.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 1 — Daily Life & Routines' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 70, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 1 — Daily Life & Routines'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué significa "to get ready"?'),
  (1, '¿Qué significa "to commute"?'),
  (2, 'Elige la oración correcta:'),
  (3, '¿Qué conector usarías para empezar a describir una secuencia de eventos?'),
  (4, '¿Cuál es un error común de B1 con el present continuous?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 1 — Daily Life & Routines' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Arreglarse para salir',true,'Correcto.'),(1,'B. Quedarse dormido',false,'Ese no es el significado de "get ready".'),(2,'C. Desayunar',false,'"Get ready" es más amplio que solo comer.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 1 — Daily Life & Routines' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Trasladarse regularmente al trabajo o estudio',true,'Correcto.'),(1,'B. Relajarse en casa',false,'Eso es más cercano a "wind down".'),(2,'C. Cocinar la cena',false,'"Commute" tiene que ver con trasladarse, no con cocinar.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 1 — Daily Life & Routines' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. She usually wakes up early.',true,'Correcto: el adverbio de frecuencia va antes del verbo principal.'),(1,'B. She wakes usually up early.',false,'Posición incorrecta del adverbio de frecuencia.'),(2,'C. Usually she is wakes up early.',false,'Esta oración no es gramaticalmente correcta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 1 — Daily Life & Routines' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. First,...',true,'Correcto: "first" es la forma natural de abrir una secuencia.'),(1,'B. Finally,...',false,'"Finally" cierra una secuencia, no la abre.'),(2,'C. However,...',false,'"However" muestra contraste, no secuencia.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 1 — Daily Life & Routines' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Usarlo correctamente para rutinas',false,'Eso en realidad sería un error, no un uso correcto.'),(1,'B. Usarlo (incorrectamente) para rutinas en vez de present simple',true,'Correcto: las rutinas necesitan present simple, no present continuous.'),(2,'C. No usarlo nunca',false,'El present continuous sigue siendo útil — solo que no para rutinas.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 1 — Daily Life & Routines' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
