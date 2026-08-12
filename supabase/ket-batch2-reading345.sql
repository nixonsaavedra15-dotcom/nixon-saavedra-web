-- ============================================================
-- Inglés A2 (KET) — Lote 2: Reading Partes 3, 4 y 5
-- ============================================================
-- Requiere haber corrido antes: ket-a2-restructure.sql y
-- ket-batch1-intro-reading12.sql. Seguro de correr varias veces.
-- ============================================================

-- ================================================================
-- MÓDULO 3 — Reading Parte 3: Comprensión de lectura
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a Reading — Parte 3: Comprensión de lectura",
    "subtitle": "Aquí lees un texto de longitud media y respondes 5 preguntas de opción múltiple (A, B o C) — algunas piden información explícita, otras piden deducir un poco.",
    "guide_html": "<p>Este texto es más largo que los anteriores, pero no te asustes: no necesitas entender cada palabra, solo la idea general y los detalles que las preguntas te pidan. En las dos lecturas vamos a practicar con textos completos, al estilo del examen real.</p>",
    "objectives": [
      "Leer un texto de longitud media sin detenerte en cada palabra desconocida",
      "Responder preguntas de opción múltiple sobre información explícita e implícita",
      "Reconocer distractores: opciones que se parecen a la respuesta pero no son exactamente correctas"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Un texto completo: el fin de semana de Emma",
    "html": "<p class='lead-in'>Vamos a leer un texto como los que aparecen en el examen real, y a analizar cómo se responden sus preguntas.</p><div class='reading-passage'><span class='passage-tag'>Texto de práctica</span>Emma usually spends her weekends at home, but last Saturday was different. She decided to visit her cousin, who lives in a small town two hours away by train. Emma was a little nervous because she had never traveled alone before. When she arrived, her cousin was waiting at the station with a big smile. They spent the afternoon walking around the town and trying local food. Emma loved the trip so much that she's already planning to go back next month — this time, she wants to stay for the whole weekend.</div><h2>Cómo se construyen las preguntas</h2><table class='grammar-table'><tr><th>Tipo de pregunta</th><th>Ejemplo</th><th>Dónde buscar la respuesta</th></tr><tr><td>Explícita (literal)</td><td>How did Emma travel?</td><td>Directamente en el texto: 'by train'</td></tr><tr><td>Implícita (inferencial)</td><td>How did Emma feel before the trip?</td><td>Se deduce de 'a little nervous... had never traveled alone before'</td></tr><tr><td>Sobre el final</td><td>What does Emma plan to do next?</td><td>Última oración: volver el próximo mes, quedarse todo el fin de semana</td></tr></table><details class='mini-check'><summary>¿Cómo viajó Emma a visitar a su prima?</summary><div class='answer'>En tren.</div></details><details class='mini-check'><summary>¿Por qué estaba un poco nerviosa?</summary><div class='answer'>Porque nunca había viajado sola antes.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Distractores: la opción que casi es correcta",
    "html": "<p class='lead-in'>La mayor dificultad de esta parte no es entender el texto — es distinguir la respuesta correcta de una opción que se parece mucho, pero no es exacta.</p><h2>Ejemplo de distractor</h2><p>Sobre el texto de Emma, imagina esta pregunta: <em>'What does Emma plan to do next month?'</em></p><table class='grammar-table'><tr><th>Opción</th><th>¿Correcta?</th><th>Por qué</th></tr><tr><td>A. Visit her cousin again, just for a day</td><td>❌ Distractor</td><td>El texto dice que quiere quedarse todo el fin de semana, no un solo día.</td></tr><tr><td>B. Visit her cousin again and stay the whole weekend</td><td>✅ Correcta</td><td>Coincide exactamente con 'she wants to stay for the whole weekend'.</td></tr><tr><td>C. Invite her cousin to visit her instead</td><td>❌ Distractor</td><td>El texto no menciona que su prima la visite a ella.</td></tr></table><div class='tip-box'><span class='icon'>🔍</span><span>Los distractores suelen usar palabras que SÍ aparecen en el texto, pero mezcladas de forma incorrecta. Por eso, nunca elijas una opción solo porque 'suena parecida' — verifica que TODA la frase coincida con lo que dice el texto.</span></div><details class='mini-check'><summary>¿Por qué la opción A es un distractor y no la respuesta correcta?</summary><div class='answer'>Porque el texto dice que Emma quiere quedarse todo el fin de semana, no solo un día.</div></details>"
  },
  "interactive": {
    "title": "Repasemos con imágenes: verdadero, falso o distractor",
    "intro": "Toca cada burbuja para revelar la respuesta correcta.",
    "slides": [
      { "id":"s1", "icon":"🚂", "title":"How did Emma travel?", "bubble":"¿Cuál es la respuesta literal, directa del texto?", "detail":"By train — está escrito tal cual en el texto." },
      { "id":"s2", "icon":"😟", "title":"How did Emma feel before the trip?", "bubble":"¿Esta respuesta es literal o hay que deducirla?", "detail":"Hay que deducirla: 'a little nervous' + 'had never traveled alone before'." },
      { "id":"s3", "icon":"🍲", "title":"What did Emma and her cousin do?", "bubble":"¿Qué actividades menciona el texto?", "detail":"Caminaron por el pueblo y probaron comida local." },
      { "id":"s4", "icon":"📅", "title":"What does Emma plan to do next?", "bubble":"¿Cuál es el plan exacto de Emma?", "detail":"Volver el próximo mes y quedarse todo el fin de semana." },
      { "id":"s5", "icon":"🎯", "title":"Distractor típico", "bubble":"¿Por qué una opción parecida puede estar mal?", "detail":"Porque mezcla palabras del texto pero cambia un detalle clave (como el tiempo o la cantidad)." },
      { "id":"s6", "icon":"✅", "title":"Estrategia final", "bubble":"¿Cómo verificas que una opción es la correcta?", "detail":"Comprobando que TODA la frase coincide con el texto, no solo una palabra suelta." }
    ]
  },
  "practice": {
    "title": "Un artículo real: aplicando la estrategia completa",
    "html": "<p class='lead-in'>Practiquemos con un texto más, como el que verías en un examen real.</p><div class='reading-passage'><div class='passage-tag'>Caso real</div>Carlos works in an office in the city, but he's never really liked his job. Last year, he started taking photography classes at the weekend, just for fun. He soon realised he was good at it, and now some of his photos have been used in a local magazine. Carlos still works in the office during the week, but he's saving money because, in two years, he hopes to become a full-time photographer.</div><div class='tip-box'><span class='icon'>✅</span><span>Si te preguntaran <em>'What is Carlos planning to do in two years?'</em>, la trampa sería elegir 'stop working' (muy general) en vez de la opción exacta: 'become a full-time photographer' — siempre busca el detalle específico, no la idea aproximada.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id":"literal_vs_inferencial", "label":"Explica la diferencia entre una pregunta explícita (literal) y una implícita (inferencial) en esta parte del examen.", "type":"textarea", "placeholder":"" },
      { "id":"distractor_propio", "label":"Con el texto de Carlos, escribe un ejemplo de 'distractor' (opción incorrecta que parece correcta).", "type":"textarea", "placeholder":"" },
      { "id":"estrategia_verificacion", "label":"¿Cómo verificas que una opción es realmente la correcta y no solo un distractor?", "type":"text", "placeholder":"" },
      { "id":"dificultad", "label":"¿Qué fue lo que más te costó de esta lección?", "type":"textarea", "placeholder":"" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Reading — Parte 3: Comprensión de lectura';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: el fin de semana de Emma', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 3: Comprensión de lectura'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'How did Emma travel to see her cousin?'),
  (1, 'Why was Emma a little nervous?'),
  (2, 'What did Emma and her cousin do in the afternoon?'),
  (3, 'What does Emma plan to do next month?'),
  (4, 'How did Emma feel about the trip overall?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 3: Comprensión de lectura' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. By car',false,'El texto dice que viajó en tren, no en carro.'),(1,'B. By train',true,'Correcto: "two hours away by train".'),(2,'C. By plane',false,'El texto no menciona avión.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 3: Comprensión de lectura' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Because she had never traveled alone before',true,'Correcto: se infiere directamente de esa frase.'),(1,'B. Because she doesn''t like her cousin',false,'El texto no dice eso, al contrario, la recibió con una gran sonrisa.'),(2,'C. Because the train was very late',false,'El texto no menciona ningún retraso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 3: Comprensión de lectura' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. They stayed at home and watched movies',false,'El texto dice que caminaron por el pueblo.'),(1,'B. They walked around the town and tried local food',true,'Correcto: coincide exactamente con el texto.'),(2,'C. They went shopping in the city',false,'No es lo que dice el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 3: Comprensión de lectura' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Visit her cousin again, just for a day',false,'Distractor: el texto dice que quiere quedarse todo el fin de semana.'),(1,'B. Visit her cousin again and stay the whole weekend',true,'Correcto: coincide exactamente con el texto.'),(2,'C. Invite her cousin to visit her instead',false,'El texto no menciona esa opción.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 3: Comprensión de lectura' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. She loved it',true,'Correcto: "Emma loved the trip so much".'),(1,'B. She was disappointed',false,'Al contrario, le encantó el viaje.'),(2,'C. She felt indifferent',false,'No fue indiferente, le encantó.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 3: Comprensión de lectura' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 3: Comprensión de lectura'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Según el texto de Carlos: "What does Carlos do during the week?"'),
  (1, '"How did Carlos discover he was good at photography?"'),
  (2, '"What is Carlos planning to do in two years?"'),
  (3, 'Si una opción usa palabras del texto pero cambia un detalle clave, ¿qué es?'),
  (4, '¿Cómo compruebas que una opción es realmente correcta y no un distractor?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 3: Comprensión de lectura' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. He works in an office',true,'Correcto: "Carlos works in an office in the city".'),(1,'B. He takes photos full-time already',false,'Todavía no es fotógrafo de tiempo completo, solo lo planea para dentro de dos años.'),(2,'C. He studies at university',false,'El texto no menciona estudios universitarios.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 3: Comprensión de lectura' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. A friend told him he was talented',false,'El texto no menciona eso.'),(1,'B. His photos were used in a local magazine',true,'Correcto: eso es la evidencia que da el texto de su talento.'),(2,'C. He won a photography competition',false,'El texto no menciona ningún concurso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 3: Comprensión de lectura' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Stop working completely',false,'Distractor: es una idea demasiado general, no lo que dice el texto exactamente.'),(1,'B. Become a full-time photographer',true,'Correcto: coincide exactamente con el texto.'),(2,'C. Open a photography school',false,'El texto no menciona una escuela.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 3: Comprensión de lectura' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Un distractor',true,'Correcto: usa palabras conocidas pero cambia un detalle clave, por eso engaña.'),(1,'B. La respuesta correcta siempre',false,'Al contrario, ese es justo el patrón típico de una opción incorrecta.'),(2,'C. Un error de imprenta',false,'No es un error, es una técnica deliberada del examen.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 3: Comprensión de lectura' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Verificando que TODA la frase coincide con el texto',true,'Correcto: no basta con que una palabra suelta coincida.'),(1,'B. Eligiendo la opción más larga',false,'La longitud no determina si una opción es correcta.'),(2,'C. Eligiendo siempre la primera opción',false,'No hay ningún patrón así en el examen real.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 3: Comprensión de lectura' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;


-- ================================================================
-- MÓDULO 4 — Reading Parte 4: Texto con espacios (opción múltiple)
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a Reading — Parte 4: Texto con espacios (opción múltiple)",
    "subtitle": "Aquí completas los espacios de un texto eligiendo, para cada uno, la palabra correcta entre tres opciones (A, B o C).",
    "guide_html": "<p>Esta parte combina gramática y vocabulario dentro de un solo texto — cada espacio prueba algo distinto: una preposición, un verbo, un conector. En las dos lecturas vamos a ver los tipos de espacios más comunes, con ejemplos resueltos.</p>",
    "objectives": [
      "Identificar qué categoría gramatical falta en cada espacio (verbo, preposición, conector, etc.)",
      "Elegir la opción correcta entre tres alternativas muy parecidas",
      "Leer la frase completa (no solo el espacio) para no perder el sentido general"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Cómo se construyen los espacios",
    "html": "<p class='lead-in'>Cada espacio de esta parte prueba un punto gramatical distinto. Si aprendes a reconocer el tipo de espacio, la opción correcta salta a la vista mucho más rápido.</p><div class='reading-passage'><span class='passage-tag'>Texto de práctica</span>Last weekend, I (1) ___ to my grandmother's house. She lives (2) ___ a small village near the coast. We spent the afternoon (3) ___ in the garden and talking about old photos.</div><table class='grammar-table'><tr><th>Espacio</th><th>Opciones</th><th>Respuesta</th><th>Por qué</th></tr><tr><td>(1)</td><td>A. go / B. went / C. going</td><td>B. went</td><td>El texto está en pasado ('last weekend'), se necesita el verbo conjugado en pasado.</td></tr><tr><td>(2)</td><td>A. in / B. at / C. on</td><td>A. in</td><td>Usamos 'in' con pueblos, ciudades y países.</td></tr><tr><td>(3)</td><td>A. walk / B. walked / C. walking</td><td>C. walking</td><td>Después de 'spent time', se usa el verbo en gerundio (-ing).</td></tr></table><div class='tip-box'><span class='icon'>💡</span><span>Antes de elegir, identifica qué tipo de palabra falta: ¿es un verbo? ¿una preposición? Eso reduce las opciones posibles a la mitad, incluso antes de leer las tres alternativas.</span></div><details class='mini-check'><summary>¿Por qué se usa 'went' y no 'go' en el espacio 1?</summary><div class='answer'>Porque el texto está en pasado ('last weekend'), y 'went' es el pasado de 'go'.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Preposiciones, conectores y verbos con partícula",
    "html": "<p class='lead-in'>Sigamos practicando con los tipos de espacio que más se repiten: preposiciones fijas, conectores lógicos y verbos con partícula (phrasal verbs).</p><div class='reading-passage'><span class='passage-tag'>Texto de práctica</span>My brother is really good (1) ___ playing the guitar. (2) ___, he never had any formal lessons — he taught himself! Every evening, he (3) ___ practising for at least an hour.</div><table class='grammar-table'><tr><th>Espacio</th><th>Opciones</th><th>Respuesta</th><th>Por qué</th></tr><tr><td>(1)</td><td>A. at / B. in / C. on</td><td>A. at</td><td>'Good at' es una combinación fija — no se puede cambiar la preposición.</td></tr><tr><td>(2)</td><td>A. Because / B. However / C. So</td><td>B. However</td><td>Introduce un contraste: es bueno en algo, PERO nunca tuvo clases formales.</td></tr><tr><td>(3)</td><td>A. keeps / B. does / C. makes</td><td>A. keeps</td><td>'Keep + gerundio' significa 'seguir haciendo algo' — encaja con la rutina diaria.</td></tr></table><div class='tip-box'><span class='icon'>🔑</span><span>Cuando el espacio está entre dos ideas que se contrastan o se conectan, fíjate primero en el <strong>sentido lógico</strong> de la frase completa — eso te dice si necesitas un conector de contraste (however), de causa (because) o de consecuencia (so).</span></div><details class='mini-check'><summary>¿Por qué se usa 'however' y no 'because' en el espacio 2?</summary><div class='answer'>Porque introduce un contraste (es bueno en la guitarra, PERO nunca tuvo clases), no una causa.</div></details>"
  },
  "interactive": {
    "title": "Repasemos con imágenes: ¿qué tipo de espacio es?",
    "intro": "Toca cada burbuja para revelar la categoría gramatical.",
    "slides": [
      { "id":"s1", "icon":"⏳", "title":"Last weekend, I ___ to my grandmother's house.", "bubble":"¿Qué categoría de palabra falta aquí?", "detail":"Un verbo en pasado: 'went'." },
      { "id":"s2", "icon":"🏘️", "title":"She lives ___ a small village.", "bubble":"¿Qué categoría de palabra falta aquí?", "detail":"Una preposición de lugar: 'in'." },
      { "id":"s3", "icon":"🎸", "title":"My brother is good ___ playing the guitar.", "bubble":"¿Qué categoría de palabra falta aquí?", "detail":"Una preposición fija: 'at' (good at)." },
      { "id":"s4", "icon":"🔄", "title":"___, he never had formal lessons.", "bubble":"¿Qué tipo de conector falta aquí?", "detail":"Un conector de contraste: 'however'." },
      { "id":"s5", "icon":"🔁", "title":"He ___ practising every evening.", "bubble":"¿Qué verbo con este patrón falta aquí?", "detail":"'Keeps' — 'keep + gerundio' = seguir haciendo algo." },
      { "id":"s6", "icon":"🧭", "title":"Estrategia general", "bubble":"¿Cuál es el primer paso antes de mirar las opciones?", "detail":"Identificar qué categoría gramatical falta (verbo, preposición, conector...)." }
    ]
  },
  "practice": {
    "title": "Un diario personal con espacios reales",
    "html": "<p class='lead-in'>Practiquemos con un texto más largo, como el que verías en el examen.</p><div class='reading-passage'><div class='passage-tag'>Caso real</div>Dear diary, today was a strange day. I woke up late (1) because my alarm didn't go off. I was worried (2) about missing the bus, but luckily I arrived at work just (3) in time. Later, my colleague invited me (4) to have lunch together, which made the day much better.</div><div class='tip-box'><span class='icon'>✅</span><span>Fíjate en (2) 'worried about' (preposición fija con 'worried') y en (4) 'invited me to' (verbo + infinitivo) — son combinaciones que conviene memorizar como parejas fijas, igual que hiciste con 'good at' o 'interested in'.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id":"identificar_categoria", "label":"Explica cómo identificas qué categoría gramatical falta antes de mirar las tres opciones.", "type":"textarea", "placeholder":"" },
      { "id":"preposicion_fija", "label":"Escribe dos combinaciones fijas de preposición que hayas aprendido (como 'good at' o 'interested in').", "type":"textarea", "placeholder":"" },
      { "id":"conector_propio", "label":"Escribe una oración usando 'however' o 'because' correctamente.", "type":"text", "placeholder":"" },
      { "id":"dificultad", "label":"¿Qué tipo de espacio (verbo, preposición, conector) se te dificulta más?", "type":"textarea", "placeholder":"" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Reading — Parte 4: Texto con espacios (opción múltiple)';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: espacios de opción múltiple', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 4: Texto con espacios (opción múltiple)'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"Last weekend, I ___ to my grandmother''s house." ¿Qué opción completa correctamente?'),
  (1, '"She lives ___ a small village near the coast." ¿Qué preposición completa correctamente?'),
  (2, '"We spent the afternoon ___ in the garden." ¿Qué forma verbal completa correctamente?'),
  (3, '"My brother is really good ___ playing the guitar." ¿Qué preposición completa correctamente?'),
  (4, '"___, he never had any formal lessons." ¿Qué conector completa correctamente?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 4: Texto con espacios (opción múltiple)' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. go',false,'Falta la forma en pasado.'),(1,'B. went',true,'Correcto: "went" es el pasado de "go", y el texto está en pasado.'),(2,'C. going',false,'El gerundio no encaja como verbo principal aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 4: Texto con espacios (opción múltiple)' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. in',true,'Correcto: usamos "in" con pueblos, ciudades y países.'),(1,'B. at',false,'"At" se usa para lugares puntuales, no para pueblos.'),(2,'C. on',false,'"On" no se usa para este tipo de lugar.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 4: Texto con espacios (opción múltiple)' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. walk',false,'Falta la forma en gerundio después de "spent time".'),(1,'B. walked',false,'No es la forma correcta después de "spent... time".'),(2,'C. walking',true,'Correcto: "spend time + gerundio" es la estructura correcta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 4: Texto con espacios (opción múltiple)' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. at',true,'Correcto: "good at" es la combinación fija.'),(1,'B. in',false,'No es la combinación correcta con "good".'),(2,'C. on',false,'No es la combinación correcta con "good".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 4: Texto con espacios (opción múltiple)' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Because',false,'"Because" introduciría una causa, pero aquí hay un contraste.'),(1,'B. However',true,'Correcto: introduce el contraste entre ser bueno en algo y nunca haber tenido clases.'),(2,'C. So',false,'"So" introduciría una consecuencia, no un contraste.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 4: Texto con espacios (opción múltiple)' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 4: Texto con espacios (opción múltiple)'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"I woke up late ___ my alarm didn''t go off." ¿Qué conector completa correctamente?'),
  (1, '"I was worried ___ missing the bus." ¿Qué preposición fija completa correctamente?'),
  (2, '"I arrived at work just ___ time." ¿Qué preposición completa correctamente?'),
  (3, '"My colleague invited me ___ have lunch together." ¿Qué palabra completa correctamente?'),
  (4, '¿Cuál es el primer paso para resolver un espacio de esta parte del examen?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 4: Texto con espacios (opción múltiple)' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. because',true,'Correcto: introduce la causa de que se despertó tarde.'),(1,'B. however',false,'No hay contraste en esta frase, hay una causa.'),(2,'C. so',false,'"So" introduciría una consecuencia, no una causa.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 4: Texto con espacios (opción múltiple)' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. about',true,'Correcto: "worried about" es la combinación fija.'),(1,'B. of',false,'No es la combinación correcta con "worried".'),(2,'C. for',false,'No es la combinación correcta con "worried".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 4: Texto con espacios (opción múltiple)' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. in',true,'Correcto: "just in time" es la expresión fija.'),(1,'B. on',false,'No es la combinación correcta.'),(2,'C. at',false,'No es la combinación correcta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 4: Texto con espacios (opción múltiple)' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. to',true,'Correcto: "invite someone to + verbo" es la estructura correcta.'),(1,'B. for',false,'No es la estructura correcta con "invite".'),(2,'C. having',false,'Después de "invite me" se necesita "to" + infinitivo, no gerundio.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 4: Texto con espacios (opción múltiple)' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Identificar qué categoría gramatical falta',true,'Correcto: eso reduce las opciones posibles antes de leerlas.'),(1,'B. Elegir la opción más corta',false,'La longitud no determina la respuesta correcta.'),(2,'C. Adivinar al azar',false,'Nunca conviene adivinar sin analizar primero.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 4: Texto con espacios (opción múltiple)' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;


-- ================================================================
-- MÓDULO 5 — Reading Parte 5: Texto con espacios (respuesta abierta)
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a Reading — Parte 5: Texto con espacios (respuesta abierta)",
    "subtitle": "Aquí no hay opciones para elegir: debes escribir tú mismo la palabra que falta en cada espacio de un correo o nota corta.",
    "guide_html": "<p>Esta es la última parte del Reading, y suele ser la que más nervios da porque no hay pistas de opciones — pero en realidad, casi siempre faltan palabras pequeñas y predecibles: artículos, preposiciones, pronombres, verbos auxiliares. En las dos lecturas vamos a aprender a reconocerlas.</p>",
    "objectives": [
      "Reconocer qué tipo de palabra pequeña suele faltar (artículos, preposiciones, pronombres, auxiliares)",
      "Completar un correo o nota corta sin opciones de ayuda",
      "Revisar la ortografía exacta de la palabra escrita"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Las palabras que casi siempre faltan",
    "html": "<p class='lead-in'>La buena noticia de esta parte es que las palabras que faltan son casi siempre cortas y predecibles — nunca te piden un sustantivo raro o una palabra muy específica.</p><div class='reading-passage'><span class='passage-tag'>Texto de práctica</span>Hi Sam, thank you (1) ___ your email. I'm writing (2) ___ tell you about my trip. I arrived (3) ___ Madrid last week and I'm having a great time!</div><table class='grammar-table'><tr><th>Espacio</th><th>Respuesta</th><th>Categoría</th></tr><tr><td>(1)</td><td>for</td><td>Preposición fija: 'thank you for'</td></tr><tr><td>(2)</td><td>to</td><td>Infinitivo: 'writing to tell'</td></tr><tr><td>(3)</td><td>in</td><td>Preposición de lugar con ciudades</td></tr></table><div class='tip-box'><span class='icon'>💡</span><span>Categorías que más se repiten en esta parte: <strong>preposiciones</strong> (in, on, at, to, for), <strong>artículos</strong> (a, an, the), <strong>pronombres</strong> (it, this, they) y <strong>verbos auxiliares</strong> (do, does, is, are, was, were).</span></div><details class='mini-check'><summary>¿Por qué la respuesta del espacio (1) es 'for'?</summary><div class='answer'>Porque 'thank you for' es una combinación fija.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Practicando con un correo completo",
    "html": "<p class='lead-in'>Practiquemos con un correo más largo, tal como aparece en el examen real — con seis espacios en total.</p><div class='reading-passage'><span class='passage-tag'>Texto de práctica</span>Dear Laura, I hope you (1) ___ well. I'm sorry I haven't written (2) ___ a while — I've been very busy (3) ___ work. Next weekend, I'm going (4) ___ visit my parents. Would you like (5) ___ come with me? Let me know (6) ___ soon as possible!</div><table class='grammar-table'><tr><th>Espacio</th><th>Respuesta</th><th>Categoría</th></tr><tr><td>(1)</td><td>are</td><td>Verbo auxiliar (I hope you ARE well)</td></tr><tr><td>(2)</td><td>for</td><td>Preposición de tiempo (for a while)</td></tr><tr><td>(3)</td><td>with</td><td>Preposición fija (busy with work)</td></tr><tr><td>(4)</td><td>to</td><td>Infinitivo (going to visit)</td></tr><tr><td>(5)</td><td>to</td><td>Infinitivo (would like to come)</td></tr><tr><td>(6)</td><td>as</td><td>Expresión fija (as soon as possible)</td></tr></table><div class='tip-box'><span class='icon'>✍️</span><span>La ortografía cuenta: si escribes 'to' en vez de 'too', o dejas una letra mal escrita, la respuesta se considera incorrecta aunque hayas entendido bien la gramática. Revisa siempre tu palabra antes de continuar.</span></div><details class='mini-check'><summary>¿Por qué la respuesta del espacio (1) es 'are' y no 'is'?</summary><div class='answer'>Porque el sujeto es 'you', y con 'you' el verbo to be es 'are', no 'is'.</div></details>"
  },
  "interactive": {
    "title": "Repasemos con imágenes: ¿qué categoría falta?",
    "intro": "Toca cada burbuja para revelar qué categoría de palabra falta.",
    "slides": [
      { "id":"s1", "icon":"🙏", "title":"Thank you ___ your email.", "bubble":"¿Qué categoría de palabra falta?", "detail":"Una preposición fija: 'for'." },
      { "id":"s2", "icon":"➡️", "title":"I'm writing ___ tell you about my trip.", "bubble":"¿Qué categoría de palabra falta?", "detail":"Un infinitivo: 'to'." },
      { "id":"s3", "icon":"🏙️", "title":"I arrived ___ Madrid last week.", "bubble":"¿Qué categoría de palabra falta?", "detail":"Una preposición de lugar: 'in'." },
      { "id":"s4", "icon":"✅", "title":"I hope you ___ well.", "bubble":"¿Qué categoría de palabra falta?", "detail":"Un verbo auxiliar: 'are'." },
      { "id":"s5", "icon":"💼", "title":"I've been busy ___ work.", "bubble":"¿Qué categoría de palabra falta?", "detail":"Una preposición fija: 'with'." },
      { "id":"s6", "icon":"⏱️", "title":"Let me know ___ soon as possible.", "bubble":"¿Qué categoría de palabra falta?", "detail":"Parte de una expresión fija: 'as'." }
    ]
  },
  "practice": {
    "title": "Escribiendo tu propia respuesta a un correo",
    "html": "<p class='lead-in'>Practiquemos completando otro correo típico, con el mismo tipo de espacios que verás en el examen real.</p><div class='reading-passage'><div class='passage-tag'>Caso real</div>Hi Marco, thanks (1) ___ inviting me to your party! I would love (2) ___ come, but I'm not sure if I can, because I'm working (3) ___ Saturday. I'll let you know (4) ___ Friday.</div><div class='tip-box'><span class='icon'>✅</span><span>Respuestas: (1) for, (2) to, (3) on (con días de la semana usamos 'on'), (4) by (con el sentido de 'antes del viernes'). Fíjate cómo, otra vez, son todas palabras cortas y muy comunes.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id":"categorias_comunes", "label":"Menciona 3 categorías de palabras que suelen faltar en esta parte (por ejemplo, preposiciones).", "type":"textarea", "placeholder":"" },
      { "id":"correo_propio", "label":"Escribe 2-3 frases de un correo corto usando alguna de las combinaciones fijas que aprendiste (thank you for, busy with, etc.).", "type":"textarea", "placeholder":"" },
      { "id":"importancia_ortografia", "label":"¿Por qué es importante revisar la ortografía exacta de la palabra que escribes?", "type":"text", "placeholder":"" },
      { "id":"dificultad", "label":"¿Qué fue lo que más te costó de esta lección?", "type":"textarea", "placeholder":"" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Reading — Parte 5: Texto con espacios (respuesta abierta)';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: correo con espacios', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 5: Texto con espacios (respuesta abierta)'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"Thank you ___ your email." ¿Qué preposición falta?'),
  (1, '"I''m writing ___ tell you about my trip." ¿Qué palabra falta?'),
  (2, '"I arrived ___ Madrid last week." ¿Qué preposición falta?'),
  (3, '"I hope you ___ well." ¿Qué verbo auxiliar falta?'),
  (4, '"I''ve been very busy ___ work." ¿Qué preposición falta?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 5: Texto con espacios (respuesta abierta)' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. for',true,'Correcto: "thank you for" es la combinación fija.'),(1,'B. of',false,'No es la combinación correcta.'),(2,'C. to',false,'No es la combinación correcta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. to',true,'Correcto: "writing to tell" usa el infinitivo con "to".'),(1,'B. for',false,'No es la estructura correcta.'),(2,'C. and',false,'No es la estructura correcta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. in',true,'Correcto: usamos "in" con ciudades.'),(1,'B. at',false,'No es la preposición correcta con ciudades.'),(2,'C. on',false,'No es la preposición correcta con ciudades.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. are',true,'Correcto: con "you" el verbo to be es "are".'),(1,'B. is',false,'"Is" no concuerda con "you".'),(2,'C. am',false,'"Am" solo se usa con "I".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. with',true,'Correcto: "busy with work" es la combinación fija.'),(1,'B. for',false,'No es la combinación correcta.'),(2,'C. of',false,'No es la combinación correcta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 5: Texto con espacios (respuesta abierta)'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"Thanks ___ inviting me to your party!" ¿Qué preposición falta?'),
  (1, '"I would love ___ come." ¿Qué palabra falta?'),
  (2, '"I''m working ___ Saturday." ¿Qué preposición falta (con días de la semana)?'),
  (3, '"I''ll let you know ___ Friday." (antes del viernes) ¿Qué preposición falta?'),
  (4, '¿Por qué la ortografía exacta importa tanto en esta parte del examen?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Reading — Parte 5: Texto con espacios (respuesta abierta)' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. for',true,'Correcto: "thanks for" es la combinación fija.'),(1,'B. to',false,'No es la combinación correcta.'),(2,'C. of',false,'No es la combinación correcta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. to',true,'Correcto: "would love to + verbo" es la estructura correcta.'),(1,'B. for',false,'No es la estructura correcta.'),(2,'C. and',false,'No es la estructura correcta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. on',true,'Correcto: usamos "on" con días de la semana.'),(1,'B. in',false,'No es la preposición correcta con días.'),(2,'C. at',false,'No es la preposición correcta con días.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. by',true,'Correcto: "by Friday" expresa "antes del viernes" o "a más tardar el viernes".'),(1,'B. on',false,'"On Friday" significaría "el viernes" específicamente, no "antes de".'),(2,'C. at',false,'No es la preposición correcta para este sentido.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Porque una palabra mal escrita se considera incorrecta, aunque la gramática esté bien',true,'Correcto: la ortografía exacta es parte de la respuesta correcta.'),(1,'B. Porque el examen resta puntos por cada letra mal escrita',false,'No funciona así — simplemente la respuesta completa se marca como incorrecta.'),(2,'C. La ortografía no importa en esta parte',false,'Al contrario, sí importa mucho.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading — Parte 5: Texto con espacios (respuesta abierta)' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
