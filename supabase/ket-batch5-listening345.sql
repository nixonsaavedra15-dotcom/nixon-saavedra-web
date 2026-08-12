-- ============================================================
-- KET A2 — Batch 5: Listening Partes 3, 4 y 5
-- Módulo: "Listening — Partes 3, 4 y 5: Conversaciones y monólogos"
--
-- NOTA: igual que en el módulo anterior, se trabaja con las
-- transcripciones escritas (no hay generación de audio real en
-- este entorno). Se avisa dentro del contenido.
-- ============================================================

update public.modules m
set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a Listening — Partes 3, 4 y 5",
    "subtitle": "Conversaciones más largas y datos exactos",
    "guide_html": "<p>Estas tres partes son un poco distintas de lo que ya viste: la Parte 3 es una conversación más larga con preguntas de opción múltiple, y las Partes 4 y 5 te piden captar <strong>datos exactos</strong> — un número, un nombre, una palabra concreta — no una idea general. Aquí la estrategia cambia: ya no basta con entender el tema, hay que quedarse con el detalle preciso.</p>"
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Parte 3: la conversación larga",
    "html": "<p>En la Parte 3 escuchas una conversación más larga (por ejemplo, dos amigos planeando un fin de semana) y respondes <strong>5 preguntas de opción múltiple con 3 opciones</strong>. La dificultad no es el vocabulario, es que la conversación cubre varios temas y tienes que ubicar la respuesta correcta en el momento exacto en que se menciona.</p><h4>Ejemplo — lee como si lo escucharas</h4><div class='example-box'><p><em>Question: What does Ben want to do on Saturday morning?</em><br>A. Go swimming &nbsp;&nbsp; B. Go shopping &nbsp;&nbsp; C. Go to the cinema</p><p>Ben: What are you doing this weekend?<br>Kate: On Saturday I'm going shopping in the morning, then maybe the cinema in the afternoon. What about you?<br>Ben: I was thinking of going swimming on Saturday morning, actually — the new pool just opened.<br>Kate: Oh nice, maybe I'll join you next weekend.</p></div><p>La respuesta es <strong>A (Go swimming)</strong> — pero nota que 'shopping' y 'cinema' también aparecen, solo que son los planes de <em>Kate</em>, no de Ben. En preguntas sobre conversaciones largas, siempre confirma <strong>de quién</strong> es la información antes de elegir.</p><h4>Estrategia</h4><table class='vocab-table'><tr><th>Qué hacer</th><th>Por qué funciona</th></tr><tr><td>Identifica quién habla (nombres) desde el inicio</td><td>Muchas preguntas dependen de distinguir entre las dos personas</td></tr><tr><td>Lee la pregunta completa, no solo el tema</td><td>'What does Ben want' es distinto de 'What does Kate want'</td></tr><tr><td>Sigue el orden: las preguntas van en el mismo orden que la conversación</td><td>Si vas por la pregunta 3, ya pasó la información de las preguntas 1 y 2</td></tr></table>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Partes 4 y 5: captar el dato exacto",
    "html": "<p>Las Partes 4 y 5 son de <strong>completar información</strong>: escuchas un monólogo (un anuncio, un mensaje de voz, una presentación) y debes captar datos exactos — un nombre propio, un número de teléfono, una hora, un precio. Aquí no hay opción múltiple con distractores de tema: el reto es la precisión.</p><h4>Ejemplo — lee como si lo escucharas</h4><div class='example-box'><p><em>Imagina un mensaje de voz:</em></p><p>'Hi, this is a message from Green Hill Museum. Our new opening hours are from nine thirty in the morning until five in the afternoon, Tuesday to Sunday. Tickets are eight pounds for adults, and children under twelve go free. If you have questions, call us on oh-two-oh, seven-seven-one, four-four-five-six.'</p></div><p>Si te preguntaran '¿Cuál es el precio de la entrada para adultos?', la respuesta exacta es <strong>eight pounds</strong> — no 'cheap', no 'a good price', el número exacto. Si te preguntaran el nombre del museo, tendrías que distinguir 'Green Hill' de otras opciones parecidas como 'Green Park' o 'Green Hall', que suenan similar pero no son lo mismo.</p><h4>Qué tipo de datos suelen pedir</h4><table class='vocab-table'><tr><th>Tipo de dato</th><th>Ejemplo</th></tr><tr><td>Números y precios</td><td>eight pounds, thirty minutes, room 15</td></tr><tr><td>Horas y días</td><td>nine thirty, Tuesday to Sunday</td></tr><tr><td>Nombres propios (con ortografía parecida)</td><td>Green Hill vs. Green Hall vs. Green Park</td></tr><tr><td>Números de teléfono (dígito por dígito)</td><td>oh-two-oh, seven-seven-one...</td></tr></table>"
  },
  "interactive": {
    "title": "Repaso visual: escuchar para el detalle exacto",
    "slides": [
      {"title": "Parte 3: confirma de quién es la información", "text": "Dos personas, dos planes — antes de elegir, verifica a quién le pertenece cada dato mencionado.", "tema": "listening"},
      {"title": "Las preguntas siguen el orden de la conversación", "text": "La pregunta 3 se responde después de la información de las preguntas 1 y 2, nunca antes.", "tema": "listening"},
      {"title": "Partes 4 y 5: el dato exacto, no la idea general", "text": "No basta con 'un buen precio' — necesitas el número exacto que se dice.", "tema": "listening"},
      {"title": "Cuidado con nombres parecidos", "text": "'Green Hill', 'Green Hall' y 'Green Park' suenan similares — la ortografía exacta importa.", "tema": "listening"},
      {"title": "Los números de teléfono se dicen dígito por dígito", "text": "'Oh' se usa para decir el número 0 en inglés hablado — es una trampa común para quien no lo sabe.", "tema": "listening"}
    ]
  },
  "practice": {
    "title": "Caso real: dos ejercicios resueltos",
    "html": "<p>Practiquemos con un diálogo largo y un mensaje de datos, paso a paso.</p><h4>Conversación larga (estilo Parte 3)</h4><div class='example-box'><p><em>Question: Where does Mia want to have lunch?</em><br>A. At home &nbsp;&nbsp; B. At a restaurant &nbsp;&nbsp; C. At the park</p><p>Tom: Do you want to get lunch later?<br>Mia: Sure, but I don't want to go to a restaurant — it's so expensive. Can we just have a picnic at the park instead?<br>Tom: That sounds great, much cheaper than eating out. I'll bring some sandwiches.</p></div><p><strong>Respuesta:</strong> C (At the park). El restaurante se menciona, pero solo para decir que Mia <em>no</em> lo quiere.</p><h4>Mensaje con datos (estilo Parte 4/5)</h4><div class='example-box'><p>'This is a reminder about tomorrow's class trip. Please arrive at the school gate at eight fifteen, not eight o'clock as before — we changed the time. The bus ticket costs six pounds, and please bring a snack for the journey.'</p></div><p><strong>Pregunta:</strong> ¿A qué hora deben llegar? <strong>Respuesta:</strong> eight fifteen (ocho y cuarto) — no 'eight o'clock', que era la hora <em>anterior</em>, ya cambiada.</p>"
  },
  "closing_form": {
    "title": "Tu turno de practicar",
    "fields": [
      {"key": "estrategia_parte3", "label": "En la Parte 3, ¿qué haces para no confundir la información de las dos personas que hablan?", "type": "textarea"},
      {"key": "dato_dificil", "label": "¿Qué tipo de dato exacto te resulta más difícil de captar: números, nombres propios o números de teléfono? ¿Por qué?", "type": "textarea"},
      {"key": "practica_propia", "label": "Escribe (en inglés) un mensaje corto de voz inventado con al menos un número, una hora y un nombre propio, como si fuera un ejercicio de Parte 4 o 5.", "type": "textarea"}
    ]
  }
}
$JSON$::jsonb
from public.courses c
where m.course_id = c.id and c.slug = 'ingles-a2'
  and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos';

-- Quiz 1 (stage = readings): Parte 3 — conversación larga, opción múltiple
insert into public.quizzes (module_id, stage, title)
select m.id, 'readings', 'Chequeo: Parte 3 (conversación larga)'
from public.modules m
join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, prompt, order_index)
select q.id, question.question, question.order_index
from public.quizzes q
join public.modules m on m.id = q.module_id
join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Lee como si lo escucharas: "Ana: What are you doing tonight? Leo: I was going to watch a film at home, but my sister wants to go to a restaurant, so I''ll probably go with her instead." Question: What is Leo going to do tonight?'),
  (1, 'Lee como si lo escucharas: "Sam: Do you want to play football on Sunday? Jo: I can''t, I have a piano lesson. But I''m free on Saturday if you want to play then." Question: When can Jo play football?'),
  (2, 'Lee como si lo escucharas: "Mia: Are you taking the train to the concert? Dan: I was, but tickets were sold out, so my dad is driving us instead." Question: How is Dan going to the concert?'),
  (3, 'Lee como si lo escucharas: "Lucy: I need a new bag for school. Tom: Why don''t you ask for one for your birthday? Lucy: Good idea, that''s next month anyway." Question: How will Lucy probably get her new bag?'),
  (4, 'Lee como si lo escucharas: "Ben: Should we meet at the library or the café? Ella: The library is too quiet for talking, let''s go to the café instead." Question: Where will Ben and Ella meet?')
) as question(order_index, question)
where c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
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
    (qq.order_index, 0, 'A. Watch a film at home', false, 'Ese era el plan original, antes de que su hermana propusiera otra cosa.', 0),
    (qq.order_index, 0, 'B. Go to a restaurant', true, 'Correcto: ''I''ll probably go with her instead'' señala el plan final.', 1),
    (qq.order_index, 0, 'C. Go to the cinema', false, 'El cine no se menciona en este diálogo.', 2),
    (qq.order_index, 1, 'A. Sunday', false, 'Ese día tiene clase de piano, no puede.', 0),
    (qq.order_index, 1, 'B. Saturday', true, 'Correcto: ''I''m free on Saturday'' es la respuesta.', 1),
    (qq.order_index, 1, 'C. Both days', false, 'Solo mencionó estar libre el sábado, no ambos días.', 2),
    (qq.order_index, 2, 'A. By train', false, 'Ese era el plan original, pero los tiquetes se agotaron.', 0),
    (qq.order_index, 2, 'B. By car', true, 'Correcto: ''my dad is driving us instead'' es la respuesta final.', 1),
    (qq.order_index, 2, 'C. By bus', false, 'El bus no se menciona en el diálogo.', 2),
    (qq.order_index, 3, 'A. She will buy it herself', false, 'No se menciona que la compre ella misma.', 0),
    (qq.order_index, 3, 'B. She will ask for it as a birthday present', true, 'Correcto: Tom lo sugiere y Lucy confirma que su cumpleaños es el próximo mes.', 1),
    (qq.order_index, 3, 'C. Her friend will lend her one', false, 'No se menciona ningún préstamo.', 2),
    (qq.order_index, 4, 'A. At the library', false, 'Descartada por ser demasiado silenciosa para hablar.', 0),
    (qq.order_index, 4, 'B. At the café', true, 'Correcto: ''let''s go to the café instead'' es la decisión final.', 1),
    (qq.order_index, 4, 'C. At school', false, 'La escuela no se menciona en el diálogo.', 2)
) as c(qorder, order_index, choice_text, is_correct, feedback, order_index2)
where co.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and q.stage = 'readings' and qq.order_index = c.qorder
on conflict (question_id, order_index) do nothing;

-- Quiz 2 (stage = interactive): Partes 4 y 5 — datos exactos (números, nombres, horas)
insert into public.quizzes (module_id, stage, title)
select m.id, 'interactive', 'Chequeo: Partes 4 y 5 (datos exactos)'
from public.modules m
join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, prompt, order_index)
select q.id, question.question, question.order_index
from public.quizzes q
join public.modules m on m.id = q.module_id
join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Lee como si lo escucharas: "This is a message from Green Hill Museum. Tickets are eight pounds for adults." Question: What is the name of the museum?'),
  (1, 'Lee como si lo escucharas: "Our opening hours are from nine thirty until five, Tuesday to Sunday." Question: What time does the museum open?'),
  (2, 'Lee como si lo escucharas: "Please arrive at the school gate at eight fifteen, not eight o''clock as before — we changed the time." Question: What time should students arrive?'),
  (3, 'Lee como si lo escucharas: "The bus ticket costs six pounds, and please bring a snack for the journey." Question: How much does the bus ticket cost?'),
  (4, 'Lee como si lo escucharas: "If you have questions, call us on oh-two-oh, seven-seven-one, four-four-five-six." Question: What does the speaker say instead of the number ''0'' on the phone?')
) as question(order_index, question)
where c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
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
    (qq.order_index, 0, 'A. Green Park Museum', false, 'Nombre parecido, pero no es el que se dice en el mensaje.', 0),
    (qq.order_index, 0, 'B. Green Hill Museum', true, 'Correcto: ese es el nombre exacto mencionado.', 1),
    (qq.order_index, 0, 'C. Green Hall Museum', false, 'Nombre parecido, pero no es el correcto — este tipo de confusión es justo la trampa de estas preguntas.', 2),
    (qq.order_index, 1, 'A. Eight thirty', false, 'Esa hora no se menciona en el mensaje.', 0),
    (qq.order_index, 1, 'B. Nine thirty', true, 'Correcto: ''from nine thirty'' es la hora de apertura.', 1),
    (qq.order_index, 1, 'C. Nine o''clock', false, 'Casi correcto pero no exacto — el mensaje dice ''nine thirty'', no en punto.', 2),
    (qq.order_index, 2, 'A. Eight o''clock', false, 'Esa era la hora anterior, ya cambiada.', 0),
    (qq.order_index, 2, 'B. Eight fifteen', true, 'Correcto: ''not eight o''clock as before'' confirma que la hora nueva es eight fifteen.', 1),
    (qq.order_index, 2, 'C. Eight thirty', false, 'Esa hora no se menciona en el mensaje.', 2),
    (qq.order_index, 3, 'A. Six pounds', true, 'Correcto: ese es el precio exacto mencionado.', 0),
    (qq.order_index, 3, 'B. Sixteen pounds', false, 'Suena parecido a ''six'' pero es un número distinto — cuidado con confundir six y sixteen.', 1),
    (qq.order_index, 3, 'C. Eight pounds', false, 'Ese precio no se menciona en este mensaje.', 2),
    (qq.order_index, 4, 'A. Zero', false, 'Es el número correcto en inglés estándar, pero no es la palabra que se usó en el mensaje.', 0),
    (qq.order_index, 4, 'B. Oh', true, 'Correcto: en inglés hablado, especialmente en números de teléfono, ''oh'' se usa para decir el dígito 0.', 1),
    (qq.order_index, 4, 'C. Nought', false, 'Es otra forma británica de decir 0, pero no es la que aparece en este mensaje.', 2)
) as c(qorder, order_index, choice_text, is_correct, feedback, order_index2)
where co.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and q.stage = 'interactive' and qq.order_index = c.qorder
on conflict (question_id, order_index) do nothing;
