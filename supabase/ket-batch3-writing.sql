-- ============================================================
-- KET A2 — Batch 3: Writing (Mensaje corto + mini-historia)
-- Módulo: "Writing — Mensaje corto y mini-historia"
-- ============================================================

update public.modules m
set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a Writing",
    "subtitle": "Dos tareas cortas: un mensaje y una historia",
    "guide_html": "<p>Aquí no se trata de escribir mucho, se trata de escribir <em>lo que piden</em>. En Writing hay dos tareas: un mensaje corto donde te dan 3 cosas que debes mencionar sí o sí, y una mini-historia a partir de tres imágenes. En ambas, la clave no es la ortografía perfecta ni el vocabulario complicado — es cumplir la tarea completa, con claridad, en el número de palabras pedido. Vamos paso a paso.</p>"
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "El mensaje corto: cumplir los 3 puntos",
    "html": "<p>En esta tarea te dan una situación y <strong>3 puntos que debes incluir obligatoriamente</strong>. Por ejemplo:</p><div class='example-box'><p><em>'Write an email to your friend Alex. Say:<br>- why you are writing<br>- what time to meet<br>- what to bring'</em></p></div><p>El mínimo son <strong>25 palabras</strong>. Si te faltan palabras o te falta uno de los 3 puntos, pierdes puntos aunque el inglés esté perfecto. Por eso, antes de escribir, subraya mentalmente los 3 puntos y asegúrate de tocar cada uno.</p><h4>Un mensaje que sí cumple los 3 puntos</h4><div class='example-box'><p>Hi Alex,<br><br>I'm writing because <strong>we're having a small party on Saturday</strong> (punto 1: por qué escribe). Can you come at <strong>6 o'clock in the evening</strong> (punto 2: la hora)? Please <strong>bring some snacks or a drink</strong> if you can (punto 3: qué traer).<br><br>See you soon!<br>Sam</p></div><p>Nota que el saludo (<em>Hi Alex,</em>) y la despedida (<em>See you soon!</em>) no cuentan como parte de los 3 puntos, pero sí son necesarios para que el mensaje suene natural.</p><h4>Frases útiles para empezar y cerrar</h4><table class='vocab-table'><tr><th>Para empezar</th><th>Para cerrar</th></tr><tr><td>Hi [nombre], / Dear [nombre],</td><td>See you soon!</td></tr><tr><td>I'm writing to tell you...</td><td>Write back soon.</td></tr><tr><td>Thanks for your message.</td><td>Talk to you later!</td></tr><tr><td>I hope you're doing well.</td><td>Best, / Love, / Bye for now,</td></tr></table>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "La mini-historia: contar lo que muestran las imágenes",
    "html": "<p>La segunda tarea te da <strong>tres imágenes en orden</strong> y debes escribir la historia que cuentan, usando al menos <strong>35 palabras</strong>. No es necesario describir cada detalle de la imagen — se trata de contar una historia con sentido, en orden, usando el pasado.</p><div class='story-panels'><svg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'><rect x='30' y='30' width='60' height='80' rx='4' fill='none' stroke='var(--steel)' stroke-width='3'/><line x1='30' y1='70' x2='90' y2='70' stroke='var(--steel)' stroke-width='2'/><line x1='60' y1='30' x2='60' y2='110' stroke='var(--steel)' stroke-width='2'/><line x1='100' y1='20' x2='92' y2='40' stroke='var(--wine)' stroke-width='2' opacity='.6'/><line x1='115' y1='25' x2='107' y2='45' stroke='var(--wine)' stroke-width='2' opacity='.6'/><line x1='130' y1='20' x2='122' y2='40' stroke='var(--wine)' stroke-width='2' opacity='.6'/><circle cx='120' cy='140' r='16' fill='var(--bg)' stroke='var(--wine)' stroke-width='3'/><path d='M104 175 Q120 155 136 175 L136 195 L104 195 Z' fill='var(--bg)' stroke='var(--wine)' stroke-width='3'/></svg><svg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'><line x1='20' y1='20' x2='10' y2='40' stroke='var(--steel)' stroke-width='2' opacity='.5'/><line x1='45' y1='15' x2='35' y2='35' stroke='var(--steel)' stroke-width='2' opacity='.5'/><line x1='160' y1='20' x2='150' y2='40' stroke='var(--steel)' stroke-width='2' opacity='.5'/><line x1='185' y1='25' x2='175' y2='45' stroke='var(--steel)' stroke-width='2' opacity='.5'/><path d='M70 90 Q100 60 130 90 Z' fill='var(--gold)' stroke='var(--ink)' stroke-width='2'/><line x1='100' y1='90' x2='100' y2='150' stroke='var(--ink)' stroke-width='2'/><circle cx='100' cy='115' r='14' fill='var(--bg)' stroke='var(--wine)' stroke-width='3'/><path d='M86 148 Q100 130 114 148 L114 175 L86 175 Z' fill='var(--bg)' stroke='var(--wine)' stroke-width='3'/><line x1='90' y1='175' x2='85' y2='195' stroke='var(--wine)' stroke-width='3' stroke-linecap='round'/><line x1='110' y1='175' x2='115' y2='195' stroke='var(--wine)' stroke-width='3' stroke-linecap='round'/></svg><svg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'><rect x='40' y='140' width='120' height='6' fill='var(--steel)' opacity='.4'/><circle cx='100' cy='110' r='16' fill='var(--bg)' stroke='var(--wine)' stroke-width='3'/><path d='M94 106 Q100 112 106 106' stroke='var(--ink)' stroke-width='2' fill='none' stroke-linecap='round'/><path d='M84 145 Q100 125 116 145 L116 140 L84 140 Z' fill='var(--bg)' stroke='var(--wine)' stroke-width='3'/><rect x='118' y='128' width='18' height='16' rx='2' fill='var(--bg)' stroke='var(--gold)' stroke-width='2.5'/><path d='M136 132 Q144 132 144 138 Q144 144 136 142' fill='none' stroke='var(--gold)' stroke-width='2'/><path d='M122 122 Q124 116 122 112' stroke='var(--wine)' stroke-width='1.5' fill='none' opacity='.6'/><path d='M129 122 Q131 116 129 112' stroke='var(--wine)' stroke-width='1.5' fill='none' opacity='.6'/></svg></div><p class='caption'>Imagen 1: mira la lluvia por la ventana — Imagen 2: camina bajo la lluvia con paraguas — Imagen 3: llega a la cafetería, feliz con una bebida caliente</p><h4>Una historia posible</h4><div class='example-box'><p>One rainy morning, Mia looked out of the window and saw the rain falling. She decided to go out anyway, so she took her umbrella and walked through the wet streets. After a few minutes, she finally arrived at her favourite café. She sat down, ordered a hot drink, and smiled — it was the perfect end to a rainy walk.</p></div><p>Fíjate en los conectores que unen las tres partes: <strong>One rainy morning...</strong> (empieza), <strong>After a few minutes...</strong> (continúa), <strong>Finally / it was the perfect end...</strong> (cierra). Eso es lo que convierte tres frases sueltas en una historia real.</p>"
  },
  "interactive": {
    "title": "Repaso visual: las reglas de oro de Writing",
    "slides": [
      {"title": "Mensaje corto: 25 palabras mínimo", "text": "Si escribes menos, pierdes puntos aunque el contenido esté perfecto. Cuenta tus palabras antes de terminar.", "tema": "writing"},
      {"title": "Los 3 puntos son obligatorios", "text": "No basta con escribir bonito — si falta uno de los 3 puntos pedidos, el mensaje está incompleto.", "tema": "writing"},
      {"title": "Saludo y despedida naturales", "text": "'Hi [nombre],' para empezar y algo como 'See you soon!' para cerrar hacen que el mensaje suene real, no como una lista.", "tema": "writing"},
      {"title": "Mini-historia: 35 palabras mínimo", "text": "Un poco más larga que el mensaje. Debe contar una historia con inicio, desarrollo y final — no solo describir las imágenes.", "tema": "writing"},
      {"title": "Usa el pasado simple", "text": "Las historias se cuentan en pasado: 'looked', 'walked', 'arrived', 'smiled'. Es la señal más clara de que sabes narrar.", "tema": "writing"},
      {"title": "Conectores que dan orden", "text": "'One day...', 'After that...', 'Then...', 'Finally...' — estas palabras conectan las tres imágenes en una sola historia coherente.", "tema": "writing"}
    ]
  },
  "practice": {
    "title": "Caso real: dos tareas resueltas de principio a fin",
    "html": "<p>Practiquemos con un mensaje nuevo, resuelto paso a paso.</p><div class='example-box'><p><em>'Write an email to your English teacher. Say:<br>- you are going to miss the next class<br>- why you can't come<br>- when you will send your homework'</em></p></div><p><strong>Paso 1 — identifica los 3 puntos:</strong> (1) avisar que faltarás, (2) explicar por qué, (3) decir cuándo enviarás la tarea.</p><p><strong>Paso 2 — escribe cumpliendo los tres:</strong></p><div class='example-box'><p>Dear Mr. Smith,<br><br>I'm writing to tell you that <strong>I won't be able to come to the next class</strong>. I have a doctor's appointment that day, so <strong>I can't attend</strong>. Don't worry about my homework — <strong>I will send it by email on Friday</strong>.<br><br>Thank you for understanding.<br>Laura</p></div><p><strong>Paso 3 — revisa:</strong> ¿están los 3 puntos? Sí. ¿Tiene saludo y despedida? Sí. ¿Pasa de 25 palabras? Sí (39 palabras). Este mensaje aprobaría la tarea.</p><p>El mismo proceso aplica para la mini-historia: primero identifica qué pasa en cada imagen, luego ordénalas con conectores, y por último revisa que uses el pasado y que pases las 35 palabras.</p>"
  },
  "closing_form": {
    "title": "Tu turno de escribir",
    "fields": [
      {"key": "mensaje_propio", "label": "Escribe tu propio mensaje corto (mínimo 25 palabras). Situación: invita a un amigo a tu cumpleaños — di por qué escribes, a qué hora es, y qué debe traer.", "type": "textarea"},
      {"key": "historia_propia", "label": "Escribe tu propia mini-historia (mínimo 35 palabras) sobre 'A day at the beach' (un día en la playa), usando pasado y al menos 2 conectores.", "type": "textarea"},
      {"key": "conector_final", "label": "¿Qué conector usarías para señalar el final de una historia?", "type": "text"},
      {"key": "reflexion", "label": "¿Qué parte de Writing te resultó más difícil: cumplir los 3 puntos o mantener la historia en pasado?", "type": "textarea"}
    ]
  }
}
$JSON$::jsonb
from public.courses c
where m.course_id = c.id and c.slug = 'ingles-a2'
  and m.title = 'Writing — Mensaje corto y mini-historia';

-- Quiz 1 (stage = readings): tarea del mensaje corto — reconocer si cumple los 3 puntos
insert into public.quizzes (module_id, stage, title)
select m.id, 'readings', 'Chequeo: el mensaje corto'
from public.modules m
join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Writing — Mensaje corto y mini-historia'
on conflict do nothing;

insert into public.quiz_questions (quiz_id, prompt, order_index)
select q.id, question.question, question.order_index
from public.quizzes q
join public.modules m on m.id = q.module_id
join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Task: Write to a friend and say why you are writing, what time to meet, and what to bring. ¿Cuál es el mínimo de palabras exigido?'),
  (1, 'Si tu mensaje cumple los 3 puntos pero tiene solo 18 palabras, ¿qué pasa?'),
  (2, '¿Cuál de estas frases es un cierre natural para un mensaje informal?'),
  (3, 'Task: Say why you can''t come to the party. Un mensaje que solo dice ''Hi, sorry, bye'' sin explicar el motivo...'),
  (4, '¿Por qué es útil subrayar los 3 puntos antes de empezar a escribir?')
) as question(order_index, question)
where c.slug = 'ingles-a2' and m.title = 'Writing — Mensaje corto y mini-historia'
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
    (qq.order_index, 0, 'A. 15 palabras', false, 'El mínimo real es 25 palabras.', 0),
    (qq.order_index, 0, 'B. 25 palabras', true, 'Correcto: 25 palabras es el mínimo para el mensaje corto.', 1),
    (qq.order_index, 0, 'C. 50 palabras', false, 'Ese es más del doble del mínimo real.', 2),
    (qq.order_index, 1, 'A. No importa, si cumple los puntos está bien', false, 'El número de palabras también se evalúa.', 0),
    (qq.order_index, 1, 'B. Pierde puntos por no llegar al mínimo, aunque cumpla los 3 puntos', true, 'Correcto: cumplir los puntos no reemplaza el mínimo de palabras.', 1),
    (qq.order_index, 1, 'C. Se descalifica automáticamente', false, 'No se descalifica, pero sí pierde puntos.', 2),
    (qq.order_index, 2, 'A. Please respond to this message immediately.', false, 'Suena formal y algo brusco para un mensaje entre amigos.', 0),
    (qq.order_index, 2, 'B. See you soon!', true, 'Correcto: es un cierre cálido y natural, típico de un mensaje informal.', 1),
    (qq.order_index, 2, 'C. Regards, Management', false, 'Ese cierre es de correo formal/empresarial.', 2),
    (qq.order_index, 3, 'A. Cumple la tarea igual', false, 'No: si falta el punto pedido, la tarea está incompleta.', 0),
    (qq.order_index, 3, 'B. No cumple el punto pedido, aunque tenga saludo y despedida', true, 'Correcto: falta el contenido obligatorio (el motivo), así que el punto no se cumple.', 1),
    (qq.order_index, 3, 'C. Es mejor porque es más corto', false, 'Ser corto no es la meta — cumplir los 3 puntos sí lo es.', 2),
    (qq.order_index, 4, 'A. Ayuda a no olvidar ninguno mientras escribes', true, 'Correcto: así revisas al final que los tres estén presentes.', 0),
    (qq.order_index, 4, 'B. Es un requisito que pide el examen', false, 'No es un requisito formal, es una estrategia útil.', 1),
    (qq.order_index, 4, 'C. Hace que el mensaje sea más largo', false, 'Subrayar los puntos no afecta la longitud, ayuda a la organización.', 2)
) as c(qorder, order_index, choice_text, is_correct, feedback, order_index2)
where co.slug = 'ingles-a2' and m.title = 'Writing — Mensaje corto y mini-historia'
  and q.stage = 'readings' and qq.order_index = c.qorder
on conflict (question_id, order_index) do nothing;

-- Quiz 2 (stage = interactive): la mini-historia — pasado, conectores, longitud
insert into public.quizzes (module_id, stage, title)
select m.id, 'interactive', 'Chequeo: la mini-historia'
from public.modules m
join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Writing — Mensaje corto y mini-historia'
on conflict do nothing;

insert into public.quiz_questions (quiz_id, prompt, order_index)
select q.id, question.question, question.order_index
from public.quizzes q
join public.modules m on m.id = q.module_id
join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál es el mínimo de palabras para la mini-historia de 3 imágenes?'),
  (1, '¿En qué tiempo verbal se debe escribir la mini-historia?'),
  (2, '¿Cuál de estas opciones es un conector útil para empezar una historia?'),
  (3, 'Si solo describes cada imagen por separado sin conectarlas, ¿qué le falta a tu historia?'),
  (4, '¿Cuál frase está en pasado correctamente?')
) as question(order_index, question)
where c.slug = 'ingles-a2' and m.title = 'Writing — Mensaje corto y mini-historia'
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
    (qq.order_index, 0, 'A. 20 palabras', false, 'El mínimo real es 35 palabras.', 0),
    (qq.order_index, 0, 'B. 35 palabras', true, 'Correcto: 35 palabras es el mínimo para la mini-historia.', 1),
    (qq.order_index, 0, 'C. 60 palabras', false, 'No es obligatorio llegar tan alto, aunque escribir un poco más no perjudica.', 2),
    (qq.order_index, 1, 'A. Presente simple', false, 'El presente simple no narra hechos pasados de una historia.', 0),
    (qq.order_index, 1, 'B. Pasado simple', true, 'Correcto: las historias se cuentan en pasado (looked, walked, arrived).', 1),
    (qq.order_index, 1, 'C. Futuro simple', false, 'El futuro se usaría para hablar de planes, no para narrar una historia ya ocurrida.', 2),
    (qq.order_index, 2, 'A. One day...', true, 'Correcto: es una forma natural de abrir una historia corta.', 0),
    (qq.order_index, 2, 'B. In conclusion...', false, 'Esa frase es más típica de un ensayo formal, no de abrir una historia.', 1),
    (qq.order_index, 2, 'C. Furthermore...', false, 'Es un conector de ensayo académico, no de narración.', 2),
    (qq.order_index, 3, 'A. Le falta vocabulario avanzado', false, 'El problema no es el nivel de vocabulario.', 0),
    (qq.order_index, 3, 'B. Le falta coherencia — no se siente como una sola historia', true, 'Correcto: sin conectores, son frases sueltas, no una historia con hilo narrativo.', 1),
    (qq.order_index, 3, 'C. Le falta usar mayúsculas', false, 'No es un problema de ortografía sino de estructura.', 2),
    (qq.order_index, 4, 'A. She walk to the café.', false, 'Falta la terminación correcta del pasado: debería ser ''walked''.', 0),
    (qq.order_index, 4, 'B. She walked to the café.', true, 'Correcto: ''walked'' es el pasado simple correcto de ''walk''.', 1),
    (qq.order_index, 4, 'C. She walking to the café.', false, 'Esa forma (gerundio) necesitaría un verbo auxiliar como ''was'' para ser correcta.', 2)
) as c(qorder, order_index, choice_text, is_correct, feedback, order_index2)
where co.slug = 'ingles-a2' and m.title = 'Writing — Mensaje corto y mini-historia'
  and q.stage = 'interactive' and qq.order_index = c.qorder
on conflict (question_id, order_index) do nothing;
