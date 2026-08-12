-- ============================================================
-- Inglés A2 (KET) — Lote 1: Introducción + Reading Partes 1 y 2
-- ============================================================
-- Requiere haber corrido antes: schema.sql, admin-schema.sql,
-- quiz-schema.sql, lesson-flow-schema.sql, seed-ingles-a2.sql,
-- ket-a2-restructure.sql.
-- Seguro de correr varias veces.
-- ============================================================

-- ================================================================
-- MÓDULO 0 — Introducción (formato de una sola página, como en Pre-ICFES)
-- ================================================================
update public.modules set description = $LESSON$
<p class="lead-in">Bienvenido al curso de preparación para el A2 Key (KET) de Cambridge — uno de los exámenes de inglés más reconocidos del mundo para nivel básico-intermedio. Antes de la primera palabra de gramática, quiero explicarte cómo funciona el examen completo, para que nada te tome por sorpresa.</p>

<h2>Las tres partes del examen (papers)</h2>
<p>El A2 Key se divide en <strong>tres papers</strong>, cada uno evaluando una destreza distinta. En este curso vas a practicar exactamente las mismas partes, en el mismo orden:</p>

<table class="grammar-table">
<tr><th>Paper</th><th>Duración</th><th>Qué evalúa</th></tr>
<tr><td>Reading and Writing</td><td>60 minutos</td><td>Comprensión de lectura (5 partes) y escritura guiada (2 partes) — 7 partes en total</td></tr>
<tr><td>Listening</td><td>~30 minutos</td><td>Comprensión auditiva en 5 partes, cada audio se escucha 2 veces</td></tr>
<tr><td>Speaking</td><td>8-10 minutos</td><td>Conversación cara a cara: responder preguntas personales y una tarea colaborativa con otro candidato</td></tr>
</table>

<h2>¿Cómo se califica?</h2>
<p>El A2 Key no es "aprobar o reprobar" como un examen del colegio: tu resultado se ubica en la <strong>Escala de Cambridge English</strong>, y según dónde caigas, recibes un certificado de nivel <strong>A2</strong> (con distinción, si tu puntaje es muy alto) o, si te quedas un poco corto, igual te certifican en nivel <strong>A1</strong> — así que presentarte casi nunca es "perder el examen", siempre te llevas un certificado oficial de tu nivel real.</p>

<div class="tip-box"><span class="icon">🎧</span><span>En el Listening, cada audio se reproduce <strong>dos veces</strong> — aprovecha la primera pasada para ubicarte y la segunda para confirmar tus respuestas, no intentes anotar todo de una vez.</span></div>

<h2>Cómo está organizado este curso</h2>
<p>Cada módulo que viene corresponde a una parte real del examen: primero las 5 partes de Reading, luego Writing, luego las partes de Listening, luego Speaking, y al final, dos simulacros completos que reúnen todo — al aprobarlos, tu certificado queda disponible para descargar.</p>

<h2>Antes de seguir, ponte a prueba</h2>
<details class="mini-check"><summary>¿Cuántos papers (partes principales) tiene el examen A2 Key?</summary><div class="answer">Tres: Reading and Writing, Listening y Speaking.</div></details>
<details class="mini-check"><summary>¿Cuántas veces se reproduce cada audio en el Listening?</summary><div class="answer">Dos veces.</div></details>
<details class="mini-check"><summary>¿Qué pasa si tu puntaje no alcanza el nivel A2 completo?</summary><div class="answer">Igual recibes un certificado, pero de nivel A1 — casi nunca te vas sin certificado.</div></details>
$LESSON$
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Introducción';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Cuestionario — Introducción', 75, false, null, 0, 'main'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Introducción'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuántos papers (partes principales) tiene el examen A2 Key?'),
  (1, '¿Cuántas partes tiene el paper de Reading and Writing?'),
  (2, '¿Cuántas partes tiene el paper de Listening?'),
  (3, '¿Cuántas veces se reproduce cada audio en el Listening?'),
  (4, '¿Qué pasa si tu resultado no alcanza el nivel A2 completo?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Introducción' and qz.stage = 'main'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Dos',false,'Son tres papers, no dos.'),(1,'Tres',true,'Correcto: Reading and Writing, Listening y Speaking.'),(2,'Cinco',false,'Cinco son las partes del Listening, no el número de papers.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Introducción' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'5',false,'Cinco es el número de partes de lectura, pero el paper completo tiene más.'),(1,'7',true,'Correcto: 7 partes en total (5 de lectura, 2 de escritura).'),(2,'9',false,'No, son 7 partes.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Introducción' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'3',false,'El Listening tiene más de 3 partes.'),(1,'5',true,'Correcto: 5 partes en el Listening.'),(2,'7',false,'7 es el número de partes del Reading and Writing, no del Listening.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Introducción' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Solo una vez',false,'Se reproduce más de una vez.'),(1,'Dos veces',true,'Correcto: cada audio se reproduce dos veces.'),(2,'Tres veces',false,'No, son dos veces, no tres.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Introducción' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Te quedas sin ningún certificado',false,'Casi nunca te vas sin certificado.'),(1,'Igual recibes un certificado, de nivel A1',true,'Correcto: el A2 Key casi siempre entrega algún certificado, aunque sea de nivel A1.'),(2,'Debes repetir el examen obligatoriamente',false,'No es obligatorio repetirlo, simplemente te certifican en el nivel que alcanzaste.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Introducción' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='main')
on conflict (question_id, order_index) do nothing;


-- ================================================================
-- MÓDULO 1 — Reading Parte 1: Avisos y señales
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a Reading — Parte 1: Avisos y señales",
    "subtitle": "En esta parte del examen vas a leer seis avisos o mensajes cortos y elegir, entre tres opciones, qué significan o dónde aparecerían.",
    "guide_html": "<p>Los avisos en inglés están en todas partes — carteles, mensajes de texto, notas pegadas en la puerta del refrigerador. La buena noticia es que casi nunca necesitas traducir cada palabra: basta con reconocer el propósito del mensaje. En las dos lecturas vamos a practicar exactamente eso, con ejemplos reales, para que cuando llegues al quiz ya reconozcas el patrón.</p>",
    "objectives": [
      "Reconocer el propósito de un aviso, nota o mensaje corto en inglés",
      "Elegir correctamente entre tres opciones de significado (A, B o C), como en el examen real",
      "Identificar el lenguaje típico de instrucciones y prohibiciones (please, don't, no...)"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Avisos, notas y mensajes de texto",
    "html": "<p class='lead-in'>En la Parte 1 del Reading vas a ver seis textos cortos — pueden ser un cartel, una nota escrita a mano, o un mensaje de texto — y para cada uno debes elegir, entre tres opciones (A, B o C), cuál explica mejor lo que dice.</p><h2>Tres avisos para empezar</h2><div class='sign-box'><div class='sign-text'>Please close the door. The cat likes to escape!</div><div class='sign-meaning'>Es una nota informal (probablemente pegada en una puerta) que pide cerrar la puerta para que el gato no se escape — no es una orden fría, tiene un tono cercano y una razón.</div></div><div class='sign-box'><div class='sign-text'>Sorry, we're closed. Back at 2 p.m.</div><div class='sign-meaning'>Un cartel de tienda: informa que está cerrada por ahora y da la hora en que vuelve a abrir.</div></div><div class='sign-box'><div class='sign-text'>Mia — I've gone to the gym. Dinner's in the fridge, just heat it up!</div><div class='sign-meaning'>Un mensaje/nota dejado para alguien específico (Mia): explica dónde está la persona y da una instrucción sencilla sobre la cena.</div></div><div class='tip-box'><span class='icon'>💡</span><span>Fíjate en el tono: los avisos del examen casi siempre suenan naturales y cercanos, como algo que de verdad te dirían un amigo o un vecino — no como instrucciones formales de manual.</span></div><details class='mini-check'><summary>¿Qué pide la nota sobre el gato?</summary><div class='answer'>Que cierres la puerta, porque al gato le gusta escaparse.</div></details><details class='mini-check'><summary>¿A qué hora vuelve a abrir la tienda?</summary><div class='answer'>A las 2 p.m.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "El lenguaje de instrucciones y prohibiciones",
    "html": "<p class='lead-in'>Muchos avisos dan una instrucción directa o prohíben algo. Reconocer estas estructuras te ahorra tiempo valioso en el examen.</p><h2>Instrucciones y prohibiciones comunes</h2><div class='sign-box'><div class='sign-text'>Please don't feed the birds.</div><div class='sign-meaning'><em>Don't + verbo</em> es la forma más común de prohibir algo de manera educada. Aquí, pide no darle comida a las aves.</div></div><div class='sign-box'><div class='sign-text'>Remember to bring your umbrella tomorrow!</div><div class='sign-meaning'><em>Remember to + verbo</em> es un recordatorio, no una prohibición — te sugiere no olvidar algo.</div></div><div class='sign-box'><div class='sign-text'>No photos allowed inside the museum.</div><div class='sign-meaning'><em>No + sustantivo + allowed</em> es otra forma común de prohibir — aquí, tomar fotos dentro del museo.</div></div><table class='grammar-table'><tr><th>Estructura</th><th>Función</th><th>Ejemplo</th></tr><tr><td>Please + verbo</td><td>Petición educada</td><td>Please close the door.</td></tr><tr><td>Don't + verbo</td><td>Prohibición educada</td><td>Don't feed the birds.</td></tr><tr><td>No + sustantivo + allowed</td><td>Prohibición formal</td><td>No photos allowed.</td></tr><tr><td>Remember to + verbo</td><td>Recordatorio</td><td>Remember to bring your umbrella.</td></tr></table><div class='tip-box'><span class='icon'>🔑</span><span>En el examen, las tres opciones (A, B, C) suelen parecerse bastante — la trampa más común es confundir una <strong>prohibición</strong> con un simple <strong>recordatorio</strong>. Lee bien si el aviso te dice qué NO hacer o qué SÍ debes recordar.</span></div><details class='mini-check'><summary>¿Qué diferencia hay entre 'Don't feed the birds' y 'Remember to bring your umbrella'?</summary><div class='answer'>El primero prohíbe algo; el segundo es solo un recordatorio, no una prohibición.</div></details>"
  },
  "interactive": {
    "title": "Repasemos los avisos con imágenes",
    "intro": "Toca cada burbuja para revelar qué tipo de mensaje es.",
    "slides": [
      { "id":"s1", "icon":"🐈", "title":"Please close the door. The cat likes to escape!", "bubble":"¿Qué te pide esta nota y por qué?", "detail":"Que cierres la puerta, para que el gato no se escape — es una petición educada con una razón." },
      { "id":"s2", "icon":"🏪", "title":"Sorry, we're closed. Back at 2 p.m.", "bubble":"¿Qué información clave da este cartel?", "detail":"Que la tienda está cerrada y a qué hora vuelve a abrir." },
      { "id":"s3", "icon":"🍽️", "title":"Dinner's in the fridge, just heat it up!", "bubble":"¿Qué instrucción sencilla da este mensaje?", "detail":"Que hay comida en la nevera y solo hay que calentarla." },
      { "id":"s4", "icon":"🚫", "title":"Please don't feed the birds.", "bubble":"¿Es una prohibición o un recordatorio?", "detail":"Es una prohibición educada — 'don't' + verbo." },
      { "id":"s5", "icon":"☔", "title":"Remember to bring your umbrella tomorrow!", "bubble":"¿Es una prohibición o un recordatorio?", "detail":"Es un recordatorio — 'remember to' + verbo." },
      { "id":"s6", "icon":"📷", "title":"No photos allowed inside the museum.", "bubble":"¿Qué estructura usa esta prohibición?", "detail":"'No + sustantivo + allowed' — una forma formal de prohibir." }
    ]
  },
  "practice": {
    "title": "Un sábado leyendo avisos reales",
    "html": "<p class='lead-in'>Veamos estos avisos aplicados a una mañana cualquiera — así es como realmente los vas a encontrar.</p><div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Sofía sale a caminar un sábado. En la puerta de la panadería ve: <strong>'Back in 10 minutes!'</strong> — entiende que debe esperar un poco o volver más tarde.</p><p>En el parque, un cartel dice: <strong>'Please keep your dog on a leash.'</strong> — reconoce la estructura de petición educada y mantiene a su perro con correa.</p><p>Al llegar a casa, encuentra una nota de su compañera de piso: <strong>'Used the last of the milk — sorry! Will buy more today.'</strong> — entiende que no hay leche, pero que ya la van a reponer.</p></div><div class='tip-box'><span class='icon'>✅</span><span>En cada caso, Sofía no tradujo palabra por palabra — reconoció el propósito del mensaje al instante. Esa es exactamente la habilidad que evalúa la Parte 1 del Reading.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id":"estrategia", "label":"¿Cuál es la estrategia para entender un aviso sin traducir cada palabra?", "type":"textarea", "placeholder":"" },
      { "id":"prohibicion_recordatorio", "label":"Escribe un ejemplo de prohibición y uno de recordatorio, usando las estructuras que aprendiste.", "type":"textarea", "placeholder":"" },
      { "id":"aviso_propio", "label":"Inventa tu propio aviso corto en inglés (una frase).", "type":"text", "placeholder":"" },
      { "id":"dificultad", "label":"¿Qué fue lo que más te costó de esta lección?", "type":"textarea", "placeholder":"" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Reading — Parte 1: Avisos y señales';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: avisos y señales', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 1: Avisos y señales'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"Please close the door. The cat likes to escape!" ¿Qué te pide esta nota?'),
  (1, '"Sorry, we''re closed. Back at 2 p.m." ¿Qué información da este cartel?'),
  (2, '"Please don''t feed the birds." ¿Qué tipo de mensaje es?'),
  (3, '"Remember to bring your umbrella tomorrow!" ¿Qué tipo de mensaje es?'),
  (4, '"No photos allowed inside the museum." ¿Qué está prohibido?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 1: Avisos y señales' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. That she should get a new cat',false,'La nota no habla de conseguir un gato nuevo.'),(1,'B. That she should close the door so the cat doesn''t escape',true,'Correcto: pide cerrar la puerta para que el gato no se escape.'),(2,'C. That the cat is lost',false,'No dice que el gato esté perdido.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 1: Avisos y señales' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. The shop is closed forever',false,'No dice que esté cerrada para siempre.'),(1,'B. The shop will reopen at 2 p.m.',true,'Correcto: informa que vuelve a abrir a las 2 p.m.'),(2,'C. The shop opens at 2 p.m. every day',false,'El cartel no dice que ese sea el horario habitual, solo que hoy vuelve a esa hora.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 1: Avisos y señales' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. A prohibition',true,'Correcto: "don''t" + verbo es una prohibición educada.'),(1,'B. A reminder',false,'No es un recordatorio, es una prohibición.'),(2,'C. An invitation',false,'No es una invitación.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 1: Avisos y señales' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. A prohibition',false,'No es una prohibición.'),(1,'B. A reminder',true,'Correcto: "remember to" + verbo es un recordatorio.'),(2,'C. A complaint',false,'No es una queja.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 1: Avisos y señales' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Talking loudly',false,'El aviso no menciona hablar en voz alta.'),(1,'B. Taking photos',true,'Correcto: "no photos allowed" prohíbe tomar fotos.'),(2,'C. Bringing food',false,'El aviso no menciona comida.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 1: Avisos y señales' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 1: Avisos y señales'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"Mia — I''ve gone to the gym. Dinner''s in the fridge, just heat it up!" ¿Qué debe hacer Mia con la cena?'),
  (1, '¿Cuál de estas estructuras se usa para prohibir algo educadamente?'),
  (2, '¿Cuál de estas estructuras se usa para pedir algo con una razón, de forma cercana?'),
  (3, '¿Qué tienen en común los avisos del examen A2 Key según lo que viste en esta lección?'),
  (4, '¿Cuál es la trampa más común al leer estos avisos?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 1: Avisos y señales' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Cook it from scratch',false,'No necesita cocinarla desde cero.'),(1,'B. Just heat it up',true,'Correcto: solo debe calentarla.'),(2,'C. Order food instead',false,'No dice que deba pedir comida.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 1: Avisos y señales' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Remember to + verbo',false,'Eso es un recordatorio, no una prohibición.'),(1,'B. Don''t + verbo',true,'Correcto: "don''t" + verbo es la forma más común de prohibir con cortesía.'),(2,'C. I like to + verbo',false,'Eso solo expresa gusto, no prohíbe nada.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 1: Avisos y señales' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Please + verbo',true,'Correcto: "please" + verbo es una petición educada y cercana.'),(1,'B. No + sustantivo + allowed',false,'Esa es una prohibición formal, no una petición cercana.'),(2,'C. Sorry, we''re closed',false,'Eso es solo información, no una petición.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 1: Avisos y señales' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Usan un lenguaje muy formal y técnico',false,'Al contrario, suenan naturales y cercanos.'),(1,'B. Suenan naturales, como algo que te diría un amigo o vecino',true,'Correcto: el tono es cercano y realista, no de manual técnico.'),(2,'C. Siempre están escritos en pasado',false,'No hay una regla de tiempo verbal fija.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 1: Avisos y señales' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Confundir una prohibición con un recordatorio',true,'Correcto: es el error más común, por eso hay que leer bien la estructura exacta.'),(1,'B. No saber el alfabeto en inglés',false,'No tiene relación con esta parte del examen.'),(2,'C. Confundir mayúsculas con minúsculas',false,'No es la trampa principal de esta parte.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 1: Avisos y señales' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;


-- ================================================================
-- MÓDULO 2 — Reading Parte 2: Vocabulario en contexto
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a Reading — Parte 2: Vocabulario en contexto",
    "subtitle": "Aquí lees tres textos cortos y relacionas siete preguntas o descripciones con el texto correcto — pone a prueba cuánto vocabulario general reconoces.",
    "guide_html": "<p>Esta parte se siente distinta a la anterior: en vez de un aviso por pregunta, tienes tres textos y varias preguntas que debes repartir entre ellos. La clave está en leer rápido buscando ideas generales, no en entender cada palabra. Vamos a practicarlo con calma en las dos lecturas.</p>",
    "objectives": [
      "Leer varios textos cortos e identificar su idea general rápidamente",
      "Relacionar preguntas o descripciones con el texto que corresponde",
      "Reconocer vocabulario de temas cotidianos (rutinas, lugares, gustos, planes)"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Tres textos, una idea general cada uno",
    "html": "<p class='lead-in'>En esta parte del examen vas a encontrar tres textos cortos — perfiles de personas, mensajes, o descripciones — y varias preguntas que debes repartir entre ellos según cuál responde mejor.</p><h2>Tres perfiles de ejemplo</h2><div class='reading-passage'><span class='passage-tag'>Texto A — Leo</span>I love playing football with my friends every weekend. I also enjoy cooking, especially pasta dishes. I'm not very good at sports that need a lot of equipment, like tennis.</div><div class='reading-passage'><span class='passage-tag'>Texto B — Ana</span>My favorite hobby is painting. I go to an art class every Tuesday evening. I don't really like sports — I prefer quiet activities where I can relax.</div><div class='reading-passage'><span class='passage-tag'>Texto C — Tom</span>I play tennis twice a week and I'm part of a local team. I also like swimming in summer. I'm not interested in cooking at all — I always order food!</div><p>Si la pregunta fuera <em>'Who doesn't like cooking?'</em>, la respuesta sería <strong>Tom</strong> — el único que dice explícitamente que no le interesa cocinar.</p><div class='tip-box'><span class='icon'>💡</span><span>Estrategia: lee primero las preguntas, subraya (mentalmente) la palabra clave de cada una, y luego busca esa idea en los tres textos — no leas los textos completos varias veces desde el principio.</span></div><details class='mini-check'><summary>¿A quién le gusta pintar?</summary><div class='answer'>A Ana.</div></details><details class='mini-check'><summary>¿Quién juega tenis dos veces a la semana?</summary><div class='answer'>Tom.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Vocabulario de rutinas, gustos y planes",
    "html": "<p class='lead-in'>Los tres textos de esta parte casi siempre hablan de rutinas diarias, gustos personales o planes — vale la pena tener listo el vocabulario típico de estos temas.</p><h2>Vocabulario clave</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>I enjoy / I love</div><div class='mean'>me encanta — gusto fuerte</div></div><div class='vocab-item'><div class='word'>I don't mind</div><div class='mean'>no me molesta — indiferencia</div></div><div class='vocab-item'><div class='word'>I can't stand</div><div class='mean'>no soporto — disgusto fuerte</div></div><div class='vocab-item'><div class='word'>I'm planning to</div><div class='mean'>tengo planeado</div></div></div><p>Fíjate en la diferencia de intensidad: <em>'I love it'</em> no es lo mismo que <em>'I don't mind it'</em> — si una pregunta busca a alguien a quien realmente le encanta algo, un texto que solo dice 'I don't mind' NO es la respuesta correcta.</p><div class='tip-box'><span class='icon'>🔑</span><span>Esta parte tiene siempre <strong>una opción de más</strong> (más textos o más preguntas de las que parecen encajar directamente) — no te preocupes si una pregunta parece no encajar del todo con ningún texto a primera vista, vuelve a leer con calma.</span></div><details class='mini-check'><summary>¿Qué diferencia hay entre 'I love it' y 'I don't mind it'?</summary><div class='answer'>'I love it' es un gusto fuerte; 'I don't mind it' es indiferencia, no le molesta pero tampoco le encanta.</div></details>"
  },
  "interactive": {
    "title": "Repasemos con imágenes: ¿de quién es este gusto?",
    "intro": "Toca cada burbuja para revelar a quién corresponde.",
    "slides": [
      { "id":"s1", "icon":"⚽", "title":"Loves playing football with friends", "bubble":"¿De quién es esta afición?", "detail":"De Leo." },
      { "id":"s2", "icon":"🎨", "title":"Goes to an art class every Tuesday", "bubble":"¿De quién es esta afición?", "detail":"De Ana." },
      { "id":"s3", "icon":"🎾", "title":"Plays tennis twice a week", "bubble":"¿De quién es esta afición?", "detail":"De Tom." },
      { "id":"s4", "icon":"🍝", "title":"Enjoys cooking pasta dishes", "bubble":"¿De quién es esta afición?", "detail":"De Leo." },
      { "id":"s5", "icon":"🚫🍳", "title":"Not interested in cooking at all", "bubble":"¿De quién es esta descripción?", "detail":"De Tom." },
      { "id":"s6", "icon":"🧘", "title":"Prefers quiet, relaxing activities", "bubble":"¿De quién es esta descripción?", "detail":"De Ana." }
    ]
  },
  "practice": {
    "title": "Comparando tres perfiles reales",
    "html": "<p class='lead-in'>Practiquemos con un caso más completo, como lo verías en el examen real.</p><div class='reading-passage'><div class='passage-tag'>Texto D — Marta</div>I usually get up early to go running before work. On weekends, I like to relax at home and read. I'm planning to run my first marathon next year!</div><div class='reading-passage'><div class='passage-tag'>Texto E — Diego</div>I'm not a morning person at all — I always wake up as late as possible. I love going out with friends at night, especially to try new restaurants.</div><div class='tip-box'><span class='icon'>✅</span><span>Si te preguntaran <em>'Who has a sports goal for next year?'</em>, la respuesta sería <strong>Marta</strong>, por 'I'm planning to run my first marathon next year' — la palabra clave 'planning' + una meta deportiva concreta te llevan directo a la respuesta.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id":"estrategia_lectura", "label":"Explica la estrategia para resolver esta parte sin leer los textos completos varias veces.", "type":"textarea", "placeholder":"" },
      { "id":"diferencia_gustos", "label":"Escribe dos frases que muestren distinta intensidad de gusto (por ejemplo, 'I love' vs 'I don't mind').", "type":"textarea", "placeholder":"" },
      { "id":"perfil_propio", "label":"Escribe 2-3 frases sobre tus propios gustos, como los textos de esta lección.", "type":"textarea", "placeholder":"" },
      { "id":"dificultad", "label":"¿Qué fue lo que más te costó de esta lección?", "type":"textarea", "placeholder":"" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Reading — Parte 2: Vocabulario en contexto';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: vocabulario en contexto', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 2: Vocabulario en contexto'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Según los textos de Leo, Ana y Tom: "Who doesn''t like cooking?"'),
  (1, '"Who goes to an art class every week?"'),
  (2, '"Who plays a sport twice a week?"'),
  (3, '¿Qué significa "I can''t stand it"?'),
  (4, '¿Qué significa "I don''t mind it"?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 2: Vocabulario en contexto' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Leo',false,'Leo dice que le gusta cocinar pasta.'),(1,'B. Ana',false,'Ana no menciona nada sobre cocinar.'),(2,'C. Tom',true,'Correcto: Tom dice "I''m not interested in cooking at all".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 2: Vocabulario en contexto' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Leo',false,'Leo no menciona clases de arte.'),(1,'B. Ana',true,'Correcto: Ana va a una clase de arte cada martes.'),(2,'C. Tom',false,'Tom no menciona clases de arte.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 2: Vocabulario en contexto' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Leo',false,'Leo juega fútbol los fines de semana, no dos veces a la semana.'),(1,'B. Ana',false,'Ana no menciona deportes.'),(2,'C. Tom',true,'Correcto: Tom juega tenis dos veces a la semana.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 2: Vocabulario en contexto' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Me encanta',false,'Eso sería "I love it".'),(1,'B. No lo soporto',true,'Correcto: "I can''t stand it" expresa un disgusto fuerte.'),(2,'C. No me molesta',false,'Eso sería "I don''t mind it".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 2: Vocabulario en contexto' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Me encanta',false,'Eso sería "I love it".'),(1,'B. No me molesta, pero tampoco me encanta',true,'Correcto: expresa indiferencia, ni gusto fuerte ni disgusto.'),(2,'C. No lo soporto',false,'Eso sería "I can''t stand it".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 2: Vocabulario en contexto' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 2: Vocabulario en contexto'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Según los textos de Marta y Diego: "Who has a sports goal for next year?"'),
  (1, '"Who doesn''t like waking up early?"'),
  (2, '¿Cuál es la estrategia correcta para resolver esta parte del examen?'),
  (3, '¿Por qué NO conviene leer los tres textos completos varias veces desde el inicio?'),
  (4, '¿Qué debes hacer si una pregunta no parece encajar con ningún texto a primera vista?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 2: Vocabulario en contexto' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Marta',true,'Correcto: Marta dice "I''m planning to run my first marathon next year".'),(1,'B. Diego',false,'Diego no menciona ninguna meta deportiva.'),(2,'C. Ninguno de los dos',false,'Marta sí menciona una meta deportiva concreta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 2: Vocabulario en contexto' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Marta',false,'Marta se levanta temprano a correr, no le molesta.'),(1,'B. Diego',true,'Correcto: Diego dice "I''m not a morning person at all".'),(2,'C. Los dos por igual',false,'Solo Diego expresa disgusto por madrugar.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 2: Vocabulario en contexto' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Leer primero las preguntas y buscar la palabra clave en los textos',true,'Correcto: es más rápido y preciso que leer todo de corrido varias veces.'),(1,'B. Memorizar los textos completos antes de ver las preguntas',false,'Eso consume demasiado tiempo en el examen real.'),(2,'C. Elegir siempre la opción B',false,'No hay ningún patrón así en el examen real.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 2: Vocabulario en contexto' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Porque el examen tiene tiempo limitado y esa estrategia es más lenta',true,'Correcto: leer todo varias veces desperdicia el tiempo limitado del examen.'),(1,'B. Porque está prohibido por las reglas del examen',false,'No es una regla del examen, es una cuestión de estrategia y tiempo.'),(2,'C. Porque los textos cambian cada vez que los lees',false,'Los textos no cambian, el problema es la gestión del tiempo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 2: Vocabulario en contexto' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Descartar la pregunta y dejarla en blanco',false,'Nunca conviene dejar preguntas en blanco.'),(1,'B. Releer con calma — normalmente sí hay una respuesta',true,'Correcto: vale la pena releer con calma antes de descartar.'),(2,'C. Elegir el texto más largo automáticamente',false,'La longitud del texto no determina la respuesta correcta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 2: Vocabulario en contexto' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
