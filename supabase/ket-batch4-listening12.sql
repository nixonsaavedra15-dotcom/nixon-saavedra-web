-- ============================================================
-- KET A2 — Batch 4: Listening Partes 1 y 2
-- Módulo: "Listening — Partes 1 y 2: Diálogos cortos e imágenes"
--
-- NOTA IMPORTANTE: esta lección enseña la ESTRATEGIA de Listening
-- usando transcripciones escritas (no hay generación de audio real
-- disponible en este entorno). Cada diálogo dice claramente
-- "vas a escuchar/lee como si lo escucharas" para que el estudiante
-- entienda que está practicando con el texto de lo que sonaría,
-- igual que en el examen real (donde cada audio se reproduce 2 veces).
-- ============================================================

update public.modules m
set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a Listening — Partes 1 y 2",
    "subtitle": "Escuchar con estrategia, no solo con el oído",
    "guide_html": "<p>En el examen real, cada audio se reproduce <strong>dos veces</strong>, así que no necesitas entenderlo todo a la primera. Aquí vamos a trabajar con las transcripciones de lo que escucharías, para que aprendas a identificar la información clave — números, horas, lugares, objetos — sin depender de entender cada palabra. La Parte 1 es de opción con imágenes; la Parte 2 es de frases cortas de opción múltiple.</p><p class='nota-audio'>Nota: en esta versión trabajamos con el texto exacto de los diálogos, ya que aquí no hay reproducción de audio real. La estrategia que aprendas aplica igual cuando practiques con audio de verdad.</p>"
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Parte 1: elegir la imagen correcta",
    "html": "<p>En la Parte 1 escuchas <strong>cortas conversaciones</strong> y eliges, entre 3 imágenes, la que responde correctamente a la pregunta. La trampa más común: las 3 imágenes están relacionadas con el tema, pero solo una es la respuesta exacta a lo que se dice al final del diálogo.</p><h4>Ejemplo — lee como si lo escucharas (se reproduce 2 veces en el examen real)</h4><div class='example-box'><p><em>Question: What did Sara buy at the shop?</em></p><p>A: Did you go to the shop, Sara?<br>B: Yes, I did. We already had bread and milk at home, so I just got some apples.<br>A: Good idea, we needed some fruit.</p></div><p>Las tres opciones serían manzana, pan y leche — pero el pan y la leche se mencionan solo para decir que <strong>ya</strong> los tenían, no que los compró. La respuesta correcta es la manzana. Esta es la trampa típica: escuchar una palabra no significa que sea la respuesta.</p><h4>Estrategia</h4><table class='vocab-table'><tr><th>Qué hacer</th><th>Por qué funciona</th></tr><tr><td>Lee las 3 imágenes antes de escuchar</td><td>Sabes qué buscar desde el inicio</td></tr><tr><td>Presta atención a palabras como 'already', 'but', 'actually'</td><td>Suelen señalar el cambio hacia la respuesta correcta</td></tr><tr><td>No elijas por la primera palabra que reconozcas</td><td>Las opciones incorrectas casi siempre se mencionan también</td></tr></table>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Parte 2: frases cortas de opción múltiple",
    "html": "<p>La Parte 2 tiene diálogos un poco más largos, con preguntas de opción múltiple en texto (no imágenes). Aquí también se reproduce el audio dos veces, y la clave sigue siendo identificar el dato específico que responde la pregunta, no solo el tema general.</p><h4>Ejemplo — lee como si lo escucharas</h4><div class='example-box'><p><em>Question: What time does the film start?</em><br>A. 6:30 &nbsp;&nbsp; B. 7:00 &nbsp;&nbsp; C. 7:30</p><p>A: The film starts at seven, right?<br>B: Actually, they changed it — it's now at half past seven because of the trailers.<br>A: Oh okay, so we should arrive by seven then.</p></div><p>La respuesta correcta es <strong>C (7:30)</strong>, no B, aunque '7:00' se menciona primero. Igual que en la Parte 1: el dato correcto casi siempre aparece <em>después</em> de una corrección o aclaración ('actually', 'but', 'no wait').</p><h4>Palabras clave que señalan una corrección</h4><table class='vocab-table'><tr><th>Palabra/frase</th><th>Lo que indica</th></tr><tr><td>Actually...</td><td>Lo que sigue corrige lo anterior</td></tr><tr><td>Sorry, I mean...</td><td>El hablante se corrige a sí mismo</td></tr><tr><td>No, wait...</td><td>Cambio inmediato de información</td></tr><tr><td>But then...</td><td>Algo cambió después del primer dato</td></tr></table>"
  },
  "interactive": {
    "title": "Repaso visual: escuchar con estrategia",
    "slides": [
      {"title": "El audio se repite 2 veces", "text": "No necesitas captarlo todo la primera vez — usa la segunda repetición para confirmar tu respuesta.", "tema": "listening"},
      {"title": "Lee las opciones antes de escuchar", "text": "Saber qué buscar (una hora, un objeto, un lugar) te ayuda a enfocar la atención en lo importante.", "tema": "listening"},
      {"title": "Cuidado con las menciones falsas", "text": "Las opciones incorrectas casi siempre se nombran también — no elijas solo porque escuchaste la palabra.", "tema": "listening"},
      {"title": "Las correcciones marcan la respuesta real", "text": "'Actually...', 'No, wait...', 'I mean...' casi siempre anuncian el dato correcto.", "tema": "listening"},
      {"title": "Parte 1 = imágenes, Parte 2 = texto", "text": "Misma estrategia, distinto formato de opciones — en ambas, el detalle final es el que cuenta.", "tema": "listening"}
    ]
  },
  "practice": {
    "title": "Caso real: dos diálogos resueltos",
    "html": "<p>Practiquemos con dos diálogos más, paso a paso.</p><h4>Diálogo 1 (estilo Parte 1 — imagen)</h4><div class='example-box'><p><em>Question: How is Tom going to the station?</em></p><p>A: Are you taking the bus to the station?<br>B: I was going to, but it's such a nice day — I think I'll ride my bike instead. It's not far.<br>A: Good idea, the bus can be slow anyway.</p></div><p><strong>Respuesta:</strong> bicicleta. El bus se menciona dos veces, pero solo como algo que <em>no</em> va a hacer ('I was going to, but...').</p><h4>Diálogo 2 (estilo Parte 2 — texto)</h4><div class='example-box'><p><em>Question: What is the weather like tomorrow?</em><br>A. Sunny &nbsp;&nbsp; B. Rainy &nbsp;&nbsp; C. Snowy</p><p>A: I heard it's going to rain tomorrow.<br>B: Really? I saw the forecast and it said sunny, actually — the rain is for the day after.<br>A: Oh great, perfect for our picnic then!</p></div><p><strong>Respuesta:</strong> A (Sunny). La lluvia se menciona primero, pero 'actually' señala la corrección: el sol es para mañana, la lluvia es para el día siguiente.</p>"
  },
  "closing_form": {
    "title": "Tu turno de practicar",
    "fields": [
      {"key": "palabra_clave", "label": "¿Qué palabra o frase te ayuda más a identificar cuándo viene una corrección en el diálogo? Da un ejemplo.", "type": "textarea"},
      {"key": "estrategia_propia", "label": "Describe con tus palabras los pasos que seguirás la próxima vez que hagas un ejercicio de Listening.", "type": "textarea"},
      {"key": "dificultad", "label": "¿Qué te resulta más difícil: la Parte 1 (imágenes) o la Parte 2 (opción múltiple en texto)? ¿Por qué?", "type": "textarea"}
    ]
  }
}
$JSON$::jsonb
from public.courses c
where m.course_id = c.id and c.slug = 'ingles-a2'
  and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes';

-- Quiz 1 (stage = readings): Parte 1 — opción con imágenes (picture choice)
insert into public.quizzes (module_id, stage, title)
select m.id, 'readings', 'Chequeo: Parte 1 (elige la imagen)'
from public.modules m
join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
on conflict do nothing;

insert into public.quiz_questions (quiz_id, prompt, order_index)
select q.id, question.question, question.order_index
from public.quizzes q
join public.modules m on m.id = q.module_id
join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Lee como si lo escucharas: "A: Do we need anything from the shop? B: We have bread and milk already, so let''s just get some apples." Question: What are they going to buy?'),
  (1, 'Lee como si lo escucharas: "A: Are you walking to school? B: No, it''s too far — I''m taking the bus today." Question: How is the person going to school?'),
  (2, 'Lee como si lo escucharas: "A: Is it sunny today? B: It was this morning, but now it''s raining." Question: What is the weather like now?'),
  (3, 'Lee como si lo escucharas: "A: What time is your class? B: It was at three, but they moved it to four." Question: What time is the class now?'),
  (4, 'Lee como si lo escucharas: "A: Did you go by train? B: I wanted to, but I rode my bike instead — it was faster." Question: How did the person travel?')
) as question(order_index, question)
where c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
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
    -- Q0: apple / bread / milk
    (qq.order_index, 0, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><path d="M50 35 C30 35 22 55 28 72 C33 85 42 90 50 90 C58 90 67 85 72 72 C78 55 70 35 50 35Z" fill="var(--wine)" opacity=".25" stroke="var(--wine)" stroke-width="3"/><path d="M50 35 C50 28 46 22 40 20" stroke="var(--steel)" stroke-width="3" fill="none" stroke-linecap="round"/><path d="M50 22 Q58 15 64 22 Q58 26 50 22Z" fill="var(--steel)"/></svg><div class="pic-label">A. apple</div>', true, 'Correcto: solo la manzana es lo que van a comprar; pan y leche ya los tienen.', 0),
    (qq.order_index, 0, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><path d="M20 65 Q20 30 50 30 Q80 30 80 65 L80 75 Q80 82 72 82 L28 82 Q20 82 20 75Z" fill="var(--gold)" opacity=".25" stroke="var(--gold)" stroke-width="3"/><path d="M35 45 Q37 55 35 65" stroke="var(--gold)" stroke-width="2" fill="none"/><path d="M50 42 Q52 55 50 68" stroke="var(--gold)" stroke-width="2" fill="none"/><path d="M65 45 Q67 55 65 65" stroke="var(--gold)" stroke-width="2" fill="none"/></svg><div class="pic-label">B. bread</div>', false, 'El pan se menciona, pero como algo que ya tenían en casa, no algo por comprar.', 1),
    (qq.order_index, 0, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><path d="M35 25 L65 25 L65 35 L75 45 L75 85 L25 85 L25 45 L35 35Z" fill="var(--bg)" stroke="var(--steel)" stroke-width="3"/><line x1="25" y1="45" x2="75" y2="45" stroke="var(--steel)" stroke-width="2"/><rect x="40" y="58" width="20" height="14" fill="var(--steel)" opacity=".25"/></svg><div class="pic-label">C. milk</div>', false, 'La leche también ya la tenían — es una mención falsa, no la respuesta.', 2),
    -- Q1: bus / walk / bike
    (qq.order_index, 1, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><rect x="15" y="35" width="70" height="35" rx="6" fill="var(--bg)" stroke="var(--wine)" stroke-width="3"/><line x1="30" y1="35" x2="30" y2="55" stroke="var(--wine)" stroke-width="2" opacity=".6"/><line x1="50" y1="35" x2="50" y2="55" stroke="var(--wine)" stroke-width="2" opacity=".6"/><line x1="70" y1="35" x2="70" y2="55" stroke="var(--wine)" stroke-width="2" opacity=".6"/><circle cx="32" cy="75" r="8" fill="var(--ink)"/><circle cx="68" cy="75" r="8" fill="var(--ink)"/></svg><div class="pic-label">A. bus</div>', true, 'Correcto: dice ''I''m taking the bus today'' — esa es la respuesta final.', 0),
    (qq.order_index, 1, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><circle cx="50" cy="80" r="8" fill="var(--ink)"/><line x1="50" y1="72" x2="50" y2="45" stroke="var(--steel)" stroke-width="4" stroke-linecap="round"/><line x1="50" y1="50" x2="30" y2="65" stroke="var(--steel)" stroke-width="4" stroke-linecap="round"/><line x1="50" y1="50" x2="70" y2="60" stroke="var(--steel)" stroke-width="4" stroke-linecap="round"/><circle cx="50" cy="30" r="10" fill="none" stroke="var(--steel)" stroke-width="3"/></svg><div class="pic-label">B. walking</div>', false, 'Se pregunta si camina, pero la respuesta es ''no, es muy lejos''.', 1),
    (qq.order_index, 1, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><circle cx="28" cy="70" r="16" fill="none" stroke="var(--steel)" stroke-width="3"/><circle cx="72" cy="70" r="16" fill="none" stroke="var(--steel)" stroke-width="3"/><path d="M28 70 L48 40 L72 70 M48 40 L40 70 M48 40 L58 35" stroke="var(--steel)" stroke-width="3" fill="none" stroke-linecap="round" stroke-linejoin="round"/></svg><div class="pic-label">C. bike</div>', false, 'La bicicleta no se menciona en este diálogo — es una opción distractora.', 2),
    -- Q2: sun / rain / snow (now raining)
    (qq.order_index, 2, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><circle cx="50" cy="50" r="20" fill="var(--gold)" opacity=".3" stroke="var(--gold)" stroke-width="3"/><line x1="50" y1="15" x2="50" y2="25" stroke="var(--gold)" stroke-width="3" stroke-linecap="round"/><line x1="50" y1="75" x2="50" y2="85" stroke="var(--gold)" stroke-width="3" stroke-linecap="round"/><line x1="15" y1="50" x2="25" y2="50" stroke="var(--gold)" stroke-width="3" stroke-linecap="round"/><line x1="75" y1="50" x2="85" y2="50" stroke="var(--gold)" stroke-width="3" stroke-linecap="round"/></svg><div class="pic-label">A. sunny</div>', false, 'Era soleado esta mañana, pero la pregunta es sobre ahora.', 0),
    (qq.order_index, 2, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><path d="M30 55 Q18 55 18 45 Q18 35 30 35 Q32 25 45 25 Q58 25 60 37 Q75 37 75 50 Q75 58 65 58Z" fill="var(--steel)" opacity=".25" stroke="var(--steel)" stroke-width="3"/><line x1="35" y1="65" x2="30" y2="78" stroke="var(--steel)" stroke-width="2.5" stroke-linecap="round"/><line x1="50" y1="65" x2="45" y2="78" stroke="var(--steel)" stroke-width="2.5" stroke-linecap="round"/><line x1="65" y1="65" x2="60" y2="78" stroke="var(--steel)" stroke-width="2.5" stroke-linecap="round"/></svg><div class="pic-label">B. raining</div>', true, 'Correcto: ''but now it''s raining'' — esa es la respuesta sobre el clima actual.', 1),
    (qq.order_index, 2, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><path d="M30 55 Q18 55 18 45 Q18 35 30 35 Q32 25 45 25 Q58 25 60 37 Q75 37 75 50 Q75 58 65 58Z" fill="var(--bg-alt)" opacity=".6" stroke="var(--steel)" stroke-width="3"/><circle cx="35" cy="72" r="3" fill="var(--steel)"/><circle cx="50" cy="78" r="3" fill="var(--steel)"/><circle cx="65" cy="72" r="3" fill="var(--steel)"/></svg><div class="pic-label">C. snowing</div>', false, 'La nieve no se menciona en el diálogo.', 2),
    -- Q3: 3:00 / 4:00 / 7:00 (class moved to four)
    (qq.order_index, 3, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><circle cx="50" cy="50" r="35" fill="var(--bg)" stroke="var(--ink)" stroke-width="3"/><line x1="50" y1="50" x2="50" y2="25" stroke="var(--ink)" stroke-width="3" stroke-linecap="round"/><line x1="50" y1="50" x2="72" y2="50" stroke="var(--ink)" stroke-width="3" stroke-linecap="round"/></svg><div class="pic-label">A. three o''clock</div>', false, 'Esa era la hora original, antes de que la cambiaran.', 0),
    (qq.order_index, 3, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><circle cx="50" cy="50" r="35" fill="var(--bg)" stroke="var(--ink)" stroke-width="3"/><line x1="50" y1="50" x2="50" y2="25" stroke="var(--ink)" stroke-width="3" stroke-linecap="round"/><line x1="50" y1="50" x2="65" y2="65" stroke="var(--ink)" stroke-width="3" stroke-linecap="round"/></svg><div class="pic-label">B. four o''clock</div>', true, 'Correcto: ''they moved it to four'' es la hora final y correcta.', 1),
    (qq.order_index, 3, '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><circle cx="50" cy="50" r="35" fill="var(--bg)" stroke="var(--ink)" stroke-width="3"/><line x1="50" y1="50" x2="50" y2="25" stroke="var(--ink)" stroke-width="3" stroke-linecap="round"/><line x1="50" y1="50" x2="28" y2="63" stroke="var(--ink)" stroke-width="3" stroke-linecap="round"/></svg><div class="pic-label">C. seven o''clock</div>', false, 'Esta hora no se menciona en el diálogo — es una opción distractora.', 2)
) as c(qorder, order_index, choice_text, is_correct, feedback, order_index2)
where co.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
  and q.stage = 'readings' and qq.order_index = c.qorder
on conflict (question_id, order_index) do nothing;

-- Quiz 2 (stage = interactive): Parte 2 — opción múltiple en texto
insert into public.quizzes (module_id, stage, title)
select m.id, 'interactive', 'Chequeo: Parte 2 (opción múltiple)'
from public.modules m
join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
on conflict do nothing;

insert into public.quiz_questions (quiz_id, prompt, order_index)
select q.id, question.question, question.order_index
from public.quizzes q
join public.modules m on m.id = q.module_id
join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Lee como si lo escucharas: "A: The film starts at seven, right? B: Actually, it''s now half past seven because of the trailers." Question: What time does the film start?'),
  (1, 'Lee como si lo escucharas: "A: I heard it''s going to rain tomorrow. B: Really? The forecast said sunny, actually — the rain is for the day after." Question: What is the weather like tomorrow?'),
  (2, 'Lee como si lo escucharas: "A: Is the meeting in room 12? B: No, wait, they moved it to room 15 this morning." Question: Which room is the meeting in?'),
  (3, 'Lee como si lo escucharas: "A: Can you meet at the library at five? B: Sorry, I mean six — I have class until then." Question: What time will they meet?'),
  (4, '¿Qué palabra en un diálogo te avisa que la información que sigue corrige lo anterior?')
) as question(order_index, question)
where c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
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
    (qq.order_index, 0, 'A. 6:30', false, 'Esa no es la hora mencionada en el diálogo.', 0),
    (qq.order_index, 0, 'B. 7:00', false, 'Esa es la hora original, antes de la corrección con ''actually''.', 1),
    (qq.order_index, 0, 'C. 7:30', true, 'Correcto: ''actually, it''s now half past seven'' es la hora final.', 2),
    (qq.order_index, 1, 'A. Sunny', true, 'Correcto: ''the forecast said sunny, actually'' corrige la primera mención de lluvia.', 0),
    (qq.order_index, 1, 'B. Rainy', false, 'La lluvia se menciona primero, pero es para el día después de mañana.', 1),
    (qq.order_index, 1, 'C. Snowy', false, 'La nieve no se menciona en el diálogo.', 2),
    (qq.order_index, 2, 'A. Room 12', false, 'Esa era la sala original, antes del cambio.', 0),
    (qq.order_index, 2, 'B. Room 15', true, 'Correcto: ''no, wait, they moved it to room 15'' es la información final.', 1),
    (qq.order_index, 2, 'C. Room 20', false, 'Ese número no se menciona en el diálogo.', 2),
    (qq.order_index, 3, 'A. Five o''clock', false, 'Esa era la hora propuesta al inicio, luego corregida.', 0),
    (qq.order_index, 3, 'B. Six o''clock', true, 'Correcto: ''sorry, I mean six'' corrige la hora propuesta.', 1),
    (qq.order_index, 3, 'C. Seven o''clock', false, 'Esa hora no se menciona en el diálogo.', 2),
    (qq.order_index, 4, 'A. ''Actually'', ''I mean'', ''no wait''', true, 'Correcto: estas frases anuncian que viene una corrección o dato más preciso.', 0),
    (qq.order_index, 4, 'B. ''And'', ''also'', ''too''', false, 'Estas palabras suman información, no corrigen lo anterior.', 1),
    (qq.order_index, 4, 'C. ''Maybe'', ''perhaps'', ''possibly''', false, 'Estas palabras expresan duda, no corrección de un dato ya dicho.', 2)
) as c(qorder, order_index, choice_text, is_correct, feedback, order_index2)
where co.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
  and q.stage = 'interactive' and qq.order_index = c.qorder
on conflict (question_id, order_index) do nothing;
