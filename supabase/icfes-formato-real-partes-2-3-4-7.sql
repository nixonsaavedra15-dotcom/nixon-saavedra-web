-- ============================================================
-- FORMATO REAL ICFES — Partes 2, 3, 4 y 7 (reemplazo completo)
-- ============================================================
-- Corrige el desalineamiento encontrado en la auditoría: estas 4 partes
-- no reproducían el formato real de la prueba Saber 11 de inglés.
-- A partir de aquí:
--   Parte 2 -> banco compartido de 8 palabras para 5 enunciados (no MC de 4).
--   Parte 3 -> coherencia conversacional, 3 opciones (no gramática aislada).
--   Parte 4 -> texto con espacios, nivel básico, 4 opciones por espacio.
--   Parte 7 -> texto con espacios, nivel avanzado, 4 opciones por espacio
--              (mismo formato que la Parte 4 pero con vocabulario y
--              conectores de mayor dificultad, tal como en la prueba real).
--
-- Requiere haber corrido antes: modules2-7-content.sql (crea estos 4
-- módulos con lesson_json y quizzes). Este script SOBRESCRIBE el
-- lesson_json de los 4 módulos y BORRA + RECREA sus preguntas y
-- opciones (las viejas no servían para el formato nuevo). Seguro de
-- correr varias veces.
-- ============================================================


-- ================================================================
-- MÓDULO 2 — Parte 2: Relación de enunciados (banco de 8 palabras)
-- ================================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Parte 2: Relación de enunciados",
    "subtitle": "Ojo: esta parte NO es de opción múltiple normal. Te dan UN banco de 8 palabras y 5 frases — cada frase corresponde a una sola palabra del banco. Hay 3 palabras 'trampa' que no corresponden a ninguna frase.",
    "guide_html": "<p>Así se ve en la prueba real: arriba, un cuadro con 8 palabras marcadas A–H. Abajo, 5 frases numeradas que describen una de esas palabras. Tu trabajo es escribir, al lado de cada frase, la letra que le corresponde. En esta plataforma vas a practicar el mismo mecanismo: para cada frase, eliges la palabra correcta entre las 8 opciones del banco.</p><p>Vas a recorrer la ruta de siempre: 2 lecturas con estrategia + banco de práctica, un quiz con banco compartido, una lección interactiva, otro quiz con banco compartido, una lectura de práctica con el ejercicio completo tipo examen, y el cierre.</p>",
    "objectives": [
      "Reconocer el formato real: 1 banco de 8 palabras + 5 frases a relacionar (no 4 opciones por frase)",
      "Leer las 8 palabras del banco ANTES de leer las frases, para tener el panorama completo",
      "Usar descarte: cada palabra del banco solo se usa una vez, así que a medida que respondes vas reduciendo opciones",
      "Detectar las palabras 'trampa' — palabras que suenan parecido o están en la misma categoría pero no encajan con ninguna frase"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Cómo funciona realmente el banco de 8 palabras",
    "html": "<p class='lead-in'>Este es el error más común en esta parte: tratar cada frase como si tuviera sus propias 4 opciones. NO es así. Hay un solo banco de 8 palabras arriba, compartido por las 5 frases. Aprender a leerlo bien te ahorra tiempo y errores.</p><h2>El banco (ejemplo real de la guía ICFES)</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>A. CD</div></div><div class='vocab-item'><div class='word'>B. comics</div></div><div class='vocab-item'><div class='word'>C. DVD</div></div><div class='vocab-item'><div class='word'>D. films</div></div><div class='vocab-item'><div class='word'>E. map</div></div><div class='vocab-item'><div class='word'>F. messages</div></div><div class='vocab-item'><div class='word'>G. ticket</div></div><div class='vocab-item'><div class='word'>H. TV</div></div></div><h2>Las frases</h2><p>Cada frase describe, con otras palabras, una de esas 8 opciones. Por ejemplo: <em>'You use this to watch videos or movies.'</em> → la respuesta es <strong>H. TV</strong> (o podría ser D. films, según el resto del banco — por eso hay que leer TODO antes de responder).</p><div class='tip-box'><span class='icon'>🧠</span><span><strong>Estrategia clave:</strong> lee las 8 palabras primero, en 10 segundos, solo para saber qué hay disponible. Luego lee las 5 frases una por una. Cuando estés seguro de una, táchala mentalmente del banco — ya no puede volver a usarse.</span></div><details class='mini-check'><summary>¿Cuántas veces se puede usar la misma palabra del banco?</summary><div class='answer'>Una sola vez. Por eso el descarte funciona tan bien en esta parte.</div></details><details class='mini-check'><summary>¿Por qué es un error tratar cada frase como si tuviera 4 opciones propias?</summary><div class='answer'>Porque el banco es compartido — las 8 palabras aplican a las 5 frases en conjunto, no una lista distinta por frase.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Las palabras 'trampa' y cómo no caer en ellas",
    "html": "<p class='lead-in'>De las 8 palabras del banco, solo 5 se van a usar. Las otras 3 son distractores: palabras reales, de la misma categoría, que existen para tentarte si no lees con cuidado.</p><h2>Ejemplo de distractores</h2><p>En el banco A–H de arriba (CD, comics, DVD, films, map, messages, ticket, TV), si las 5 frases hablan de: ver películas en casa (TV), leer historietas (comics), un plano de una ciudad (map), un boleto de cine (ticket) y escribir a un amigo (messages) — entonces <strong>CD, DVD y films</strong> quedan sin usar. Son palabras de la misma familia (entretenimiento, viajes) pero ninguna frase las describe con exactitud.</p><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Trampa típica:</strong> una frase sobre 'películas' te puede tentar a marcar 'films' o 'DVD' cuando la respuesta correcta y más precisa es 'TV' (porque la frase dice 'watch... at home', no 'a physical disc'). Lee la frase completa, no solo la palabra clave.</span></div><h2>Método de 3 pasos</h2><ol><li>Lee el banco completo (8 palabras).</li><li>Lee la frase 1, elige la palabra que encaje MEJOR (no solo 'una que suene bien').</li><li>Sigue con la frase 2 recordando que esa palabra ya no está disponible.</li></ol><details class='mini-check'><summary>¿Cuántas palabras del banco quedan SIN usar al final?</summary><div class='answer'>3 — porque hay 8 palabras y solo 5 frases.</div></details><details class='mini-check'><summary>¿Qué hacer si dos palabras del banco parecen encajar con la misma frase?</summary><div class='answer'>Revisar cuál es más precisa según la frase completa, y guardar la otra para una frase posterior — probablemente sea la respuesta de otra pregunta.</div></details>"
  },
  "interactive": {
    "title": "Practica el banco compartido con imágenes",
    "intro": "Este es el banco de esta lección. Toca cada frase para revelar cuál palabra del banco le corresponde.",
    "slides": [
      {
        "id": "s1",
        "icon": "📖",
        "title": "Banco: novel, gym, headphones, bench, concert, gallery, subscription, playlist",
        "bubble": "'You use this to listen to music without disturbing others.'",
        "detail": "Headphones — no está en la lista de 'novel, gym...' arriba pero sí en el banco completo de la lección: audífonos."
      },
      {
        "id": "s2",
        "icon": "🎨",
        "title": "Misma frase, banco distinto",
        "bubble": "'You visit this place to see paintings and art.'",
        "detail": "Gallery — galería de arte."
      },
      {
        "id": "s3",
        "icon": "💪",
        "title": "",
        "bubble": "'You go to this place to exercise and stay fit.'",
        "detail": "Gym — gimnasio."
      },
      {
        "id": "s4",
        "icon": "📚",
        "title": "",
        "bubble": "'This is a long fictional book you read for pleasure.'",
        "detail": "Novel — novela."
      },
      {
        "id": "s5",
        "icon": "💳",
        "title": "",
        "bubble": "'You pay this every month to keep using a streaming service.'",
        "detail": "Subscription — suscripción."
      },
      {
        "id": "s6",
        "icon": "🚫",
        "title": "Palabras sin usar (trampa)",
        "bubble": "concert, bench, playlist",
        "detail": "Son del mismo campo (entretenimiento, lugares) pero ninguna frase de este banco las describe — quedan fuera."
      }
    ]
  },
  "practice": {
    "title": "Ejercicio completo tipo examen",
    "html": "<p class='lead-in'>Este es el ejercicio completo, igual a como aparece en la prueba real: un banco de 8 palabras arriba y 5 frases abajo. Resuélvelo mentalmente antes de ver la respuesta.</p><div class='reading-passage'><div class='passage-tag'>Banco (A–H)</div><p><strong>A.</strong> passport &nbsp; <strong>B.</strong> ticket &nbsp; <strong>C.</strong> suitcase &nbsp; <strong>D.</strong> schedule &nbsp; <strong>E.</strong> receipt &nbsp; <strong>F.</strong> map &nbsp; <strong>G.</strong> wallet &nbsp; <strong>H.</strong> calendar</p></div><div class='reading-passage'><div class='passage-tag'>Frases</div><p>1. You need this document to travel to another country.</p><p>2. This shows you the days, weeks and months of the year.</p><p>3. You use this to know the streets and directions in a new city.</p><p>4. You get this paper after paying for something in a store.</p><p>5. You carry your money and cards inside this.</p></div><details class='mini-check'><summary>Ver respuestas</summary><div class='answer'>1. A (passport) · 2. H (calendar) · 3. F (map) · 4. E (receipt) · 5. G (wallet). Sin usar: B (ticket), C (suitcase), D (schedule) — las 3 trampas de este banco.</div></details><div class='tip-box'><span class='icon'>✅</span><span>Si te quedaste con B, C o D 'sobrando' al final, ¡perfecto! Eso confirma que descartaste bien — eran las 3 palabras trampa de este banco.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras — no hay respuestas incorrectas aquí.",
    "fields": [
      {
        "id": "diferencia_formato",
        "label": "¿Cuál es la diferencia entre esta parte y una pregunta de opción múltiple normal?",
        "type": "textarea",
        "placeholder": ""
      },
      {
        "id": "estrategia_banco",
        "label": "Describe con tus palabras la estrategia de 3 pasos para resolver un banco de 8 palabras.",
        "type": "textarea",
        "placeholder": ""
      },
      {
        "id": "palabra_trampa",
        "label": "Escribe un ejemplo de 'palabra trampa' y explica por qué puede confundir.",
        "type": "text",
        "placeholder": ""
      },
      {
        "id": "cuantas_sobran",
        "label": "En un banco de 8 palabras con 5 frases, ¿cuántas palabras quedan sin usar?",
        "type": "text",
        "placeholder": ""
      }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 2 — Relación de enunciados';

-- Quiz: Quiz — Banco de palabras: documentos y objetos de viaje (Parte 2 — Relación de enunciados / readings)

delete from public.quiz_questions
where quiz_id in (
  select qz.id from public.quizzes qz
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados' and qz.stage = 'readings'
);

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Banco de palabras: documentos y objetos de viaje', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados'
on conflict (module_id, stage) do update set title = excluded.title, passing_score = excluded.passing_score, is_final = excluded.is_final, max_attempts = excluded.max_attempts, cooldown_hours = excluded.cooldown_hours;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Banco: passport, ticket, suitcase, schedule, receipt, map, wallet, calendar. Frase: "You need this document to travel to another country."'),
  (1, 'Mismo banco. Frase: "This shows you the days, weeks and months of the year."'),
  (2, 'Mismo banco. Frase: "You use this to know the streets and directions in a new city."'),
  (3, 'Mismo banco. Frase: "You get this paper after paying for something in a store."'),
  (4, 'Mismo banco. Frase: "You carry your money and cards inside this."')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'passport',true,'Correcto: ''passport'' es el documento para viajar a otro país.'),(1,'ticket',false,'Ticket no encaja con esta frase.'),(2,'suitcase',false,'Suitcase no encaja con esta frase.'),(3,'schedule',false,'Schedule no encaja con esta frase.'),(4,'receipt',false,'Receipt no encaja con esta frase.'),(5,'map',false,'Map no encaja con esta frase.'),(6,'wallet',false,'Wallet no encaja con esta frase.'),(7,'calendar',false,'Calendar no encaja con esta frase.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'passport',false,'Passport no encaja con esta frase.'),(1,'ticket',false,'Ticket no encaja con esta frase.'),(2,'suitcase',false,'Suitcase no encaja con esta frase.'),(3,'schedule',false,'Schedule no encaja con esta frase.'),(4,'receipt',false,'Receipt no encaja con esta frase.'),(5,'map',false,'Map no encaja con esta frase.'),(6,'wallet',false,'Wallet no encaja con esta frase.'),(7,'calendar',true,'Correcto: ''calendar'' muestra los días, semanas y meses del año.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'passport',false,'Passport no encaja con esta frase.'),(1,'ticket',false,'Ticket no encaja con esta frase.'),(2,'suitcase',false,'Suitcase no encaja con esta frase.'),(3,'schedule',false,'Schedule no encaja con esta frase.'),(4,'receipt',false,'Receipt no encaja con esta frase.'),(5,'map',true,'Correcto: ''map'' te ayuda a ubicar calles y direcciones.'),(6,'wallet',false,'Wallet no encaja con esta frase.'),(7,'calendar',false,'Calendar no encaja con esta frase.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'passport',false,'Passport no encaja con esta frase.'),(1,'ticket',false,'Ticket no encaja con esta frase.'),(2,'suitcase',false,'Suitcase no encaja con esta frase.'),(3,'schedule',false,'Schedule no encaja con esta frase.'),(4,'receipt',true,'Correcto: ''receipt'' es el recibo que te dan al pagar.'),(5,'map',false,'Map no encaja con esta frase.'),(6,'wallet',false,'Wallet no encaja con esta frase.'),(7,'calendar',false,'Calendar no encaja con esta frase.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'passport',false,'Passport no encaja con esta frase.'),(1,'ticket',false,'Ticket no encaja con esta frase.'),(2,'suitcase',false,'Suitcase no encaja con esta frase.'),(3,'schedule',false,'Schedule no encaja con esta frase.'),(4,'receipt',false,'Receipt no encaja con esta frase.'),(5,'map',false,'Map no encaja con esta frase.'),(6,'wallet',true,'Correcto: ''wallet'' es la billetera donde llevas dinero y tarjetas.'),(7,'calendar',false,'Calendar no encaja con esta frase.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- Quiz: Quiz — Banco de palabras: tiempo libre y entretenimiento (Parte 2 — Relación de enunciados / interactive)

delete from public.quiz_questions
where quiz_id in (
  select qz.id from public.quizzes qz
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados' and qz.stage = 'interactive'
);

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Banco de palabras: tiempo libre y entretenimiento', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados'
on conflict (module_id, stage) do update set title = excluded.title, passing_score = excluded.passing_score, is_final = excluded.is_final, max_attempts = excluded.max_attempts, cooldown_hours = excluded.cooldown_hours;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Banco: concert, novel, gym, bench, headphones, gallery, subscription, playlist. Frase: "You use this to listen to music without disturbing others."'),
  (1, 'Mismo banco. Frase: "This is a long fictional book you read for pleasure."'),
  (2, 'Mismo banco. Frase: "You visit this place to see paintings and art."'),
  (3, 'Mismo banco. Frase: "You pay this every month to keep using a streaming service."'),
  (4, 'Mismo banco. Frase: "You go to this place to exercise and stay fit."')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'concert',false,'Concert no encaja con esta frase.'),(1,'novel',false,'Novel no encaja con esta frase.'),(2,'gym',false,'Gym no encaja con esta frase.'),(3,'bench',false,'Bench no encaja con esta frase.'),(4,'headphones',true,'Correcto: ''headphones'' son los audífonos.'),(5,'gallery',false,'Gallery no encaja con esta frase.'),(6,'subscription',false,'Subscription no encaja con esta frase.'),(7,'playlist',false,'Playlist no encaja con esta frase.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'concert',false,'Concert no encaja con esta frase.'),(1,'novel',true,'Correcto: ''novel'' es una novela.'),(2,'gym',false,'Gym no encaja con esta frase.'),(3,'bench',false,'Bench no encaja con esta frase.'),(4,'headphones',false,'Headphones no encaja con esta frase.'),(5,'gallery',false,'Gallery no encaja con esta frase.'),(6,'subscription',false,'Subscription no encaja con esta frase.'),(7,'playlist',false,'Playlist no encaja con esta frase.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'concert',false,'Concert no encaja con esta frase.'),(1,'novel',false,'Novel no encaja con esta frase.'),(2,'gym',false,'Gym no encaja con esta frase.'),(3,'bench',false,'Bench no encaja con esta frase.'),(4,'headphones',false,'Headphones no encaja con esta frase.'),(5,'gallery',true,'Correcto: ''gallery'' es una galería de arte.'),(6,'subscription',false,'Subscription no encaja con esta frase.'),(7,'playlist',false,'Playlist no encaja con esta frase.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'concert',false,'Concert no encaja con esta frase.'),(1,'novel',false,'Novel no encaja con esta frase.'),(2,'gym',false,'Gym no encaja con esta frase.'),(3,'bench',false,'Bench no encaja con esta frase.'),(4,'headphones',false,'Headphones no encaja con esta frase.'),(5,'gallery',false,'Gallery no encaja con esta frase.'),(6,'subscription',true,'Correcto: ''subscription'' es la suscripción mensual.'),(7,'playlist',false,'Playlist no encaja con esta frase.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'concert',false,'Concert no encaja con esta frase.'),(1,'novel',false,'Novel no encaja con esta frase.'),(2,'gym',true,'Correcto: ''gym'' es el gimnasio.'),(3,'bench',false,'Bench no encaja con esta frase.'),(4,'headphones',false,'Headphones no encaja con esta frase.'),(5,'gallery',false,'Gallery no encaja con esta frase.'),(6,'subscription',false,'Subscription no encaja con esta frase.'),(7,'playlist',false,'Playlist no encaja con esta frase.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;-- ================================================================
-- MÓDULO 3 — Parte 3: Diálogos y coherencia conversacional (3 opciones)
-- ================================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Parte 3: Diálogos y coherencia conversacional",
    "subtitle": "Esta parte no busca que sepas la 'respuesta gramaticalmente correcta' — busca que sepas cuál respuesta sigue la lógica de la conversación. Las 3 opciones suelen ser gramaticalmente correctas; solo una tiene sentido en ese momento.",
    "guide_html": "<p>El formato real es corto: te dan una línea de diálogo (una pregunta, un comentario, una invitación) y 3 opciones de respuesta (A, B, C). Tu trabajo es elegir la que un hablante real diría después de esa línea — no la que 'suena bien' aislada.</p><p>Vas a recorrer la ruta de siempre: 2 lecturas de estrategia, un quiz, una lección interactiva, otro quiz, una práctica con diálogos completos y el cierre.</p>",
    "objectives": [
      "Identificar la función comunicativa de la primera línea: ¿es una pregunta, una invitación, una queja, un saludo?",
      "Anticipar qué TIPO de respuesta se espera antes de leer las opciones",
      "Descartar opciones que son gramaticalmente correctas pero hablan de otro tema",
      "Reconocer el patrón de examen: casi siempre 2 de las 3 opciones están fuera de contexto, no mal escritas"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Función comunicativa: saber qué tipo de respuesta se espera",
    "html": "<p class='lead-in'>Antes de mirar las opciones, identifica qué está haciendo la primera línea: ¿pregunta información?, ¿hace una invitación?, ¿se disculpa?, ¿hace un comentario de cortesía (small talk)? Cada tipo espera un tipo distinto de respuesta.</p><h2>Tipos de función comunicativa</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>Small talk / comentario</div><div class='mean'>\"It's a nice day, isn't it?\" → espera acuerdo/desacuerdo sobre el clima.</div></div><div class='vocab-item'><div class='word'>Pregunta de información</div><div class='mean'>\"What time does the movie start?\" → espera un dato (hora, lugar, cantidad).</div></div><div class='vocab-item'><div class='word'>Invitación / propuesta</div><div class='mean'>\"Would you like some coffee?\" → espera aceptar o rechazar.</div></div><div class='vocab-item'><div class='word'>Disculpa</div><div class='mean'>\"I'm sorry I'm late.\" → espera que la otra persona reste importancia o pregunte por qué.</div></div></div><div class='tip-box'><span class='icon'>🧠</span><span><strong>Estrategia clave:</strong> antes de leer A, B y C, pregúntate: '¿qué clase de respuesta tendría sentido aquí?' Si la línea pregunta una hora, buscas una opción con una hora — no una opinión sobre el clima.</span></div><details class='mini-check'><summary>Si alguien dice \"Would you like some coffee?\", ¿qué tipo de respuesta esperas?</summary><div class='answer'>Aceptar o rechazar la invitación (ej: \"Yes, please\" o \"No, thanks\").</div></details><details class='mini-check'><summary>¿Por qué es útil identificar la función ANTES de ver las opciones?</summary><div class='answer'>Porque reduce el riesgo de que una opción 'bien escrita pero fuera de tema' te confunda.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "La trampa: opciones correctas gramaticalmente, incoherentes en contexto",
    "html": "<p class='lead-in'>Esta es la clave de toda la parte 3: en el examen real, las 3 opciones casi siempre están bien escritas en inglés. La única diferencia es si responden o no a lo que se dijo.</p><h2>Ejemplo</h2><p><strong>\"Can you help me carry these bags?\"</strong></p><ul><li>A. It's blue. <em>(correcta en gramática, pero habla de un color — no responde nada)</em></li><li>B. I'm from Bogotá. <em>(correcta en gramática, pero es información irrelevante)</em></li><li>C. Sure, no problem. <em>(coherente: acepta ayudar)</em></li></ul><p>La respuesta es <strong>C</strong> — no porque A y B tengan errores de inglés, sino porque no tienen relación con lo que se pidió.</p><div class='tip-box'><span class='icon'>⚠️</span><span><strong>No busques errores gramaticales en las opciones incorrectas</strong> — casi nunca los hay. Busca la que responde al TEMA y a la INTENCIÓN de la primera línea.</span></div><h2>Método de 3 pasos</h2><ol><li>Lee la línea inicial e identifica su función (pregunta / invitación / disculpa / comentario).</li><li>Anticipa mentalmente qué tipo de respuesta esperarías tú.</li><li>Elige la opción que más se acerque a esa expectativa — no la más 'bonita' gramaticalmente.</li></ol><details class='mini-check'><summary>¿Las opciones incorrectas suelen tener errores de gramática?</summary><div class='answer'>Casi nunca. El error está en el contexto, no en la gramática.</div></details><details class='mini-check'><summary>¿Cuál es el método de 3 pasos para esta parte?</summary><div class='answer'>1) Identificar la función de la línea inicial. 2) Anticipar el tipo de respuesta. 3) Elegir la opción coherente con esa expectativa.</div></details>"
  },
  "interactive": {
    "title": "Practica identificando la respuesta coherente",
    "intro": "Toca cada diálogo para revelar la respuesta correcta y por qué las otras fallan.",
    "slides": [
      {
        "id": "s1",
        "icon": "☀️",
        "title": "Small talk",
        "bubble": "\"It's a nice day, isn't it?\" — A. Yes, it's beautiful. B. I don't like pizza. C. The store closes at six.",
        "detail": "A — es la única que sigue el comentario sobre el clima."
      },
      {
        "id": "s2",
        "icon": "🎒",
        "title": "Petición de ayuda",
        "bubble": "\"Can you help me carry these bags?\" — A. It's blue. B. I'm from Bogotá. C. Sure, no problem.",
        "detail": "C — acepta ayudar, que es lo que se pidió."
      },
      {
        "id": "s3",
        "icon": "☕",
        "title": "Invitación",
        "bubble": "\"Would you like some coffee?\" — A. It rained yesterday. B. No thanks, I'm fine. C. He is my brother.",
        "detail": "B — rechaza la invitación de forma coherente."
      },
      {
        "id": "s4",
        "icon": "🎬",
        "title": "Pregunta de información",
        "bubble": "\"What time does the movie start?\" — A. At seven o'clock. B. Yes, I do. C. She's very tall.",
        "detail": "A — responde con una hora, el dato que se pidió."
      },
      {
        "id": "s5",
        "icon": "🙏",
        "title": "Disculpa",
        "bubble": "\"I'm sorry I'm late.\" — A. It's made of wood. B. That's okay, don't worry. C. Turn left at the corner.",
        "detail": "B — resta importancia a la disculpa, respuesta social esperada."
      }
    ]
  },
  "practice": {
    "title": "Cinco diálogos, formato completo de examen",
    "html": "<p class='lead-in'>Resuelve estos 5 diálogos como si fueran el examen real. Identifica primero la función de cada línea inicial.</p><div class='reading-passage'><div class='passage-tag'>Diálogo 1</div><p>\"Excuse me, where's the nearest bank?\"</p><p>A. It's next to the pharmacy. &nbsp; B. I like tea. &nbsp; C. He works there.</p></div><div class='reading-passage'><div class='passage-tag'>Diálogo 2</div><p>\"Did you finish your homework?\"</p><p>A. It's raining outside. &nbsp; B. She's twenty years old. &nbsp; C. Not yet, almost.</p></div><div class='reading-passage'><div class='passage-tag'>Diálogo 3</div><p>\"Shall we go for a walk?\"</p><p>A. It costs ten dollars. &nbsp; B. That sounds great. &nbsp; C. He lives in Cali.</p></div><details class='mini-check'><summary>Ver respuestas</summary><div class='answer'>1. A (responde la pregunta de ubicación) · 2. C (responde sobre el avance de la tarea) · 3. B (acepta la propuesta de caminar).</div></details><div class='tip-box'><span class='icon'>✅</span><span>Fíjate que en los 3 diálogos, las opciones incorrectas están perfectamente escritas en inglés — el problema siempre es el tema, no la gramática.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras — no hay respuestas incorrectas aquí.",
    "fields": [
      {
        "id": "funcion_comunicativa",
        "label": "Explica con tus palabras qué es la 'función comunicativa' de una línea de diálogo.",
        "type": "textarea",
        "placeholder": ""
      },
      {
        "id": "trampa_gramatica",
        "label": "¿Por qué no sirve buscar errores gramaticales para descartar opciones en esta parte?",
        "type": "textarea",
        "placeholder": ""
      },
      {
        "id": "ejemplo_propio",
        "label": "Escribe una línea de diálogo corta y una respuesta coherente para esa línea.",
        "type": "text",
        "placeholder": ""
      },
      {
        "id": "metodo_3_pasos",
        "label": "Enumera el método de 3 pasos para resolver esta parte.",
        "type": "textarea",
        "placeholder": ""
      }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 3 — Diálogos y conversación';

-- Quiz: Quiz — Coherencia conversacional I (Parte 3 — Diálogos y conversación / readings)

delete from public.quiz_questions
where quiz_id in (
  select qz.id from public.quizzes qz
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación' and qz.stage = 'readings'
);

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Coherencia conversacional I', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación'
on conflict (module_id, stage) do update set title = excluded.title, passing_score = excluded.passing_score, is_final = excluded.is_final, max_attempts = excluded.max_attempts, cooldown_hours = excluded.cooldown_hours;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"It''s a nice day, isn''t it?"'),
  (1, '"Can you help me carry these bags?"'),
  (2, '"Would you like some coffee?"'),
  (3, '"What time does the movie start?"'),
  (4, '"I''m sorry I''m late."')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Yes, it''s beautiful.',true,'Correcto: sigue el comentario sobre el clima.'),(1,'I don''t like pizza.',false,'Fuera de tema — habla de comida, no del clima.'),(2,'The store closes at six.',false,'Fuera de tema — no responde al comentario.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'It''s blue.',false,'Fuera de tema — habla de un color.'),(1,'I''m from Bogotá.',false,'Fuera de tema — información irrelevante.'),(2,'Sure, no problem.',true,'Correcto: acepta ayudar, que es lo que se pidió.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'It rained yesterday.',false,'Fuera de tema — habla del clima de ayer.'),(1,'No thanks, I''m fine.',true,'Correcto: rechaza la invitación de forma coherente.'),(2,'He is my brother.',false,'Fuera de tema — no responde a la invitación.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'At seven o''clock.',true,'Correcto: responde con la hora que se pidió.'),(1,'Yes, I do.',false,'No corresponde — la pregunta no se responde con sí/no.'),(2,'She''s very tall.',false,'Fuera de tema — describe a una persona.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'It''s made of wood.',false,'Fuera de tema — describe un material.'),(1,'That''s okay, don''t worry.',true,'Correcto: resta importancia a la disculpa, respuesta social esperada.'),(2,'Turn left at the corner.',false,'Fuera de tema — son indicaciones de dirección.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- Quiz: Quiz — Coherencia conversacional II (Parte 3 — Diálogos y conversación / interactive)

delete from public.quiz_questions
where quiz_id in (
  select qz.id from public.quizzes qz
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación' and qz.stage = 'interactive'
);

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Coherencia conversacional II', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación'
on conflict (module_id, stage) do update set title = excluded.title, passing_score = excluded.passing_score, is_final = excluded.is_final, max_attempts = excluded.max_attempts, cooldown_hours = excluded.cooldown_hours;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"Excuse me, where''s the nearest bank?"'),
  (1, '"Did you finish your homework?"'),
  (2, '"Shall we go for a walk?"'),
  (3, '"How was your weekend?"'),
  (4, '"Why are you so happy today?"')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'It''s next to the pharmacy.',true,'Correcto: responde la ubicación que se pidió.'),(1,'I like tea.',false,'Fuera de tema — preferencia de bebida.'),(2,'He works there.',false,'Fuera de tema — no da una ubicación clara.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'It''s raining outside.',false,'Fuera de tema — habla del clima.'),(1,'She''s twenty years old.',false,'Fuera de tema — habla de edad.'),(2,'Not yet, almost.',true,'Correcto: responde sobre el avance de la tarea.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'It costs ten dollars.',false,'Fuera de tema — habla de un precio.'),(1,'That sounds great.',true,'Correcto: acepta la propuesta de caminar.'),(2,'He lives in Cali.',false,'Fuera de tema — habla de otra persona.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'It was fantastic, thanks.',true,'Correcto: responde sobre cómo estuvo el fin de semana.'),(1,'Turn off the lights.',false,'Fuera de tema — es una instrucción.'),(2,'Two kilometers away.',false,'Fuera de tema — habla de distancia.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'The bus is late.',false,'Fuera de tema — no explica la felicidad.'),(1,'It''s on the table.',false,'Fuera de tema — indica ubicación de un objeto.'),(2,'Because I passed my exam.',true,'Correcto: da la razón de la felicidad, que es lo que se preguntó.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;-- ================================================================
-- MÓDULO 4 — Parte 4: Use of Language, nivel básico (texto con espacios, 4 opciones)
-- ================================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Parte 4: texto con espacios (nivel básico)",
    "subtitle": "Aquí no respondes preguntas sueltas: completas un mismo texto con 4 opciones por cada espacio en blanco. Ganas más si lees el texto completo antes de responder el primer espacio.",
    "guide_html": "<p>El formato real: un texto corto con varios espacios numerados. Cada espacio tiene 4 opciones (A, B, C, D). En este nivel básico, los espacios prueban preposiciones (in/on/at), pronombres posesivos (my/her/his), tiempos verbales simples y artículos — gramática de uso diario.</p><p>Vas a recorrer la ruta de siempre: 2 lecturas de estrategia con textos de ejemplo, un quiz tipo cloze, una lección interactiva, otro quiz tipo cloze, una práctica completa y el cierre.</p>",
    "objectives": [
      "Leer el texto completo ANTES de responder cualquier espacio, para entender el sentido general",
      "Identificar qué categoría gramatical pide cada espacio: ¿preposición?, ¿pronombre?, ¿verbo?, ¿artículo?",
      "Usar las palabras antes y después del espacio como pista, no solo memoria de reglas sueltas",
      "Reconocer que un espacio mal resuelto no cambia el sentido de los demás — cada uno se responde de forma independiente"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Leer todo el texto antes de responder",
    "html": "<p class='lead-in'>El error más común: responder el espacio 1 apenas lo ves, sin haber leído el resto del texto. Eso te hace perder contexto que puede estar más adelante.</p><h2>Ejemplo</h2><div class='reading-passage'><p>My name is Laura and I live ___ Medellín with my family. Every morning I wake up ___ six o'clock and I have breakfast before school.</p></div><p>Si solo miras el primer espacio, podrías dudar entre 'in', 'on', 'at'. Pero si lees toda la oración, ves que 'Medellín' es una ciudad — y con ciudades siempre usamos <strong>in</strong>. Ese tipo de pista solo aparece si lees con calma.</p><h2>Categorías gramaticales típicas de esta parte</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>Preposiciones</div><div class='mean'>in / on / at / for / with</div></div><div class='vocab-item'><div class='word'>Pronombres posesivos</div><div class='mean'>my / her / his / their / our</div></div><div class='vocab-item'><div class='word'>Verbos en presente</div><div class='mean'>go / goes, live / lives</div></div><div class='vocab-item'><div class='word'>Artículos</div><div class='mean'>a / an / the</div></div></div><div class='tip-box'><span class='icon'>🧠</span><span><strong>Estrategia clave:</strong> lee el texto completo una vez, sin pensar en las opciones. Luego vuelve al espacio 1 y responde con el sentido general ya claro en tu cabeza.</span></div><details class='mini-check'><summary>¿Por qué 'in Medellín' es correcto y no 'at Medellín'?</summary><div class='answer'>Porque con ciudades y países usamos 'in', reservamos 'at' para lugares puntuales (at the corner, at six o'clock).</div></details><details class='mini-check'><summary>¿Cuál es el primer paso antes de responder cualquier espacio?</summary><div class='answer'>Leer el texto completo para entender el sentido general.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Prepocisiones de tiempo y pronombres posesivos: las trampas más comunes",
    "html": "<p class='lead-in'>Dos categorías generan la mayoría de errores en el nivel básico: preposiciones de tiempo (in/on/at) y pronombres posesivos (my/her/his/their).</p><h2>Preposiciones de tiempo</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>in</div><div class='mean'>meses, años, partes del día largas: in December, in the morning</div></div><div class='vocab-item'><div class='word'>on</div><div class='mean'>días y fechas: on Monday, on my birthday</div></div><div class='vocab-item'><div class='word'>at</div><div class='mean'>horas exactas: at six o'clock, at noon</div></div></div><h2>Pronombres posesivos</h2><p>La trampa más común: el pronombre debe concordar con QUIÉN posee, no con el objeto. Si el texto dice \"I visit ___ grandparents\" y el sujeto es \"I\", la respuesta es <strong>my</strong> — no importa si los abuelos son hombres o mujeres.</p><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Trampa típica:</strong> confundir 'her' (posesivo de 'she') con 'his' (posesivo de 'he'). Vuelve siempre al sujeto de la oración para decidir.</span></div><details class='mini-check'><summary>¿Qué preposición usamos con horas exactas como 'six o'clock'?</summary><div class='answer'>At — at six o'clock.</div></details><details class='mini-check'><summary>Si el sujeto de la oración es 'I', ¿qué pronombre posesivo corresponde?</summary><div class='answer'>My.</div></details>"
  },
  "interactive": {
    "title": "Practica espacios de nivel básico",
    "intro": "Toca cada espacio para revelar la respuesta y por qué.",
    "slides": [
      {
        "id": "s1",
        "icon": "🏙️",
        "title": "Preposición de lugar",
        "bubble": "\"I live ___ Medellín.\" — A. in B. on C. at D. for",
        "detail": "A (in) — con ciudades siempre usamos 'in'."
      },
      {
        "id": "s2",
        "icon": "⏰",
        "title": "Preposición de tiempo",
        "bubble": "\"I wake up ___ six o'clock.\" — A. in B. on C. at D. for",
        "detail": "C (at) — con horas exactas usamos 'at'."
      },
      {
        "id": "s3",
        "icon": "🚌",
        "title": "Preposición de medio",
        "bubble": "\"I go to school ___ bus.\" — A. by B. in C. on D. with",
        "detail": "A (by) — 'by bus/car/train' es la forma fija para medios de transporte."
      },
      {
        "id": "s4",
        "icon": "👵",
        "title": "Pronombre posesivo",
        "bubble": "\"I like to visit ___ grandparents.\" (sujeto: I) — A. her B. his C. my D. their",
        "detail": "C (my) — el sujeto es 'I', entonces el posesivo es 'my'."
      },
      {
        "id": "s5",
        "icon": "📅",
        "title": "Preposición de día",
        "bubble": "\"We go on vacation ___ December.\" — A. on B. in C. at D. for",
        "detail": "B (in) — con meses usamos 'in'."
      }
    ]
  },
  "practice": {
    "title": "Texto completo tipo examen (nivel básico)",
    "html": "<p class='lead-in'>Resuelve este texto completo, igual a como aparece en el examen real.</p><div class='reading-passage'><div class='passage-tag'>Texto</div><p>Every year, my family and I go ___(1)___ vacation in December. We usually travel ___(2)___ car to a small town near the coast. My father always drives because he knows ___(3)___ way better than anyone else. When we arrive, we stay ___(4)___ a small hotel close to the beach. In the evenings, we like ___(5)___ walk along the shore and watch the sunset.</p></div><details class='mini-check'><summary>Ver respuestas</summary><div class='answer'>1. on (go on vacation) · 2. by (by car) · 3. the (the way) · 4. at (stay at a hotel) · 5. to (like to walk).</div></details><div class='tip-box'><span class='icon'>✅</span><span>¿Notaste que ninguna respuesta depende de las otras? Cada espacio se resuelve con su propio contexto cercano.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras — no hay respuestas incorrectas aquí.",
    "fields": [
      {
        "id": "paso_previo",
        "label": "¿Cuál es el primer paso antes de responder cualquier espacio de un texto con blancos?",
        "type": "textarea",
        "placeholder": ""
      },
      {
        "id": "categorias_gramaticales",
        "label": "Nombra 3 categorías gramaticales que suelen evaluarse en esta parte.",
        "type": "text",
        "placeholder": ""
      },
      {
        "id": "regla_posesivos",
        "label": "Explica con tus palabras la regla para elegir un pronombre posesivo correcto.",
        "type": "textarea",
        "placeholder": ""
      },
      {
        "id": "preposicion_hora",
        "label": "¿Qué preposición usamos con una hora exacta, como 'six o'clock'?",
        "type": "text",
        "placeholder": ""
      }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 4 — Use of Language';

-- Quiz: Quiz — Texto con espacios I (nivel básico) (Parte 4 — Use of Language / readings)

delete from public.quiz_questions
where quiz_id in (
  select qz.id from public.quizzes qz
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language' and qz.stage = 'readings'
);

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Texto con espacios I (nivel básico)', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language'
on conflict (module_id, stage) do update set title = excluded.title, passing_score = excluded.passing_score, is_final = excluded.is_final, max_attempts = excluded.max_attempts, cooldown_hours = excluded.cooldown_hours;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '<p>Lee el texto completo y responde el espacio marcado.</p><div class=''cloze-passage''>My name is Laura and I live <mark>___(1)___</mark> Medellín with my family. Every morning I wake up ___(2)___ six o''clock and I have breakfast before school. I usually go to school ___(3)___ bus because it is faster than walking. After school, I do ___(4)___ homework and then I watch TV. On weekends, I like to visit ___(5)___ grandparents.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (1).</strong></p>'),
  (1, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>My name is Laura and I live ___(1)___ Medellín with my family. Every morning I wake up <mark>___(2)___</mark> six o''clock and I have breakfast before school. I usually go to school ___(3)___ bus because it is faster than walking. After school, I do ___(4)___ homework and then I watch TV. On weekends, I like to visit ___(5)___ grandparents.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (2).</strong></p>'),
  (2, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>My name is Laura and I live ___(1)___ Medellín with my family. Every morning I wake up ___(2)___ six o''clock and I have breakfast before school. I usually go to school <mark>___(3)___</mark> bus because it is faster than walking. After school, I do ___(4)___ homework and then I watch TV. On weekends, I like to visit ___(5)___ grandparents.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (3).</strong></p>'),
  (3, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>My name is Laura and I live ___(1)___ Medellín with my family. Every morning I wake up ___(2)___ six o''clock and I have breakfast before school. I usually go to school ___(3)___ bus because it is faster than walking. After school, I do <mark>___(4)___</mark> homework and then I watch TV. On weekends, I like to visit ___(5)___ grandparents.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (4).</strong></p>'),
  (4, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>My name is Laura and I live ___(1)___ Medellín with my family. Every morning I wake up ___(2)___ six o''clock and I have breakfast before school. I usually go to school ___(3)___ bus because it is faster than walking. After school, I do ___(4)___ homework and then I watch TV. On weekends, I like to visit <mark>___(5)___</mark> grandparents.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (5).</strong></p>')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'in',true,'Correcto: con ciudades usamos ''in''.'),(1,'on',false,'''On'' se usa con días, no con ciudades.'),(2,'at',false,'''At'' se usa con lugares puntuales u horas.'),(3,'for',false,'''For'' no indica ubicación aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'in',false,'''In'' se usa con partes largas del día, no horas exactas.'),(1,'on',false,'''On'' no se usa con horas.'),(2,'at',true,'Correcto: con horas exactas usamos ''at''.'),(3,'for',false,'''For'' no indica un momento puntual.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'by',true,'Correcto: ''by bus'' es la forma fija para medios de transporte.'),(1,'in',false,'No usamos ''in bus'' para transporte.'),(2,'on',false,'''On'' se usaría con ''on foot'', no ''on bus''.'),(3,'with',false,'''With'' no indica medio de transporte aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'she',false,'''She'' es pronombre sujeto, aquí se necesita un posesivo.'),(1,'he',false,'''He'' es pronombre sujeto, no posesivo.'),(2,'my',true,'Correcto: el sujeto es ''I'', entonces el posesivo es ''my''.'),(3,'their',false,'''Their'' no corresponde al sujeto ''I''.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'my',true,'Correcto: el sujeto sigue siendo ''I'', entonces ''my grandparents''.'),(1,'her',false,'''Her'' no corresponde al sujeto ''I''.'),(2,'his',false,'''His'' no corresponde al sujeto ''I''.'),(3,'our',false,'''Our'' implicaría un sujeto plural (''we''), pero el texto usa ''I''.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- Quiz: Quiz — Texto con espacios II (nivel básico) (Parte 4 — Use of Language / interactive)

delete from public.quiz_questions
where quiz_id in (
  select qz.id from public.quizzes qz
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language' and qz.stage = 'interactive'
);

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Texto con espacios II (nivel básico)', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language'
on conflict (module_id, stage) do update set title = excluded.title, passing_score = excluded.passing_score, is_final = excluded.is_final, max_attempts = excluded.max_attempts, cooldown_hours = excluded.cooldown_hours;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '<p>Lee el texto completo y responde el espacio marcado.</p><div class=''cloze-passage''>Every year, my family and I go <mark>___(1)___</mark> vacation in December. We usually travel ___(2)___ car to a small town near the coast. My father always drives because he knows ___(3)___ way better than anyone else. When we arrive, we stay ___(4)___ a small hotel close to the beach. In the evenings, we like ___(5)___ walk along the shore and watch the sunset.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (1).</strong></p>'),
  (1, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Every year, my family and I go ___(1)___ vacation in December. We usually travel <mark>___(2)___</mark> car to a small town near the coast. My father always drives because he knows ___(3)___ way better than anyone else. When we arrive, we stay ___(4)___ a small hotel close to the beach. In the evenings, we like ___(5)___ walk along the shore and watch the sunset.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (2).</strong></p>'),
  (2, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Every year, my family and I go ___(1)___ vacation in December. We usually travel ___(2)___ car to a small town near the coast. My father always drives because he knows <mark>___(3)___</mark> way better than anyone else. When we arrive, we stay ___(4)___ a small hotel close to the beach. In the evenings, we like ___(5)___ walk along the shore and watch the sunset.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (3).</strong></p>'),
  (3, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Every year, my family and I go ___(1)___ vacation in December. We usually travel ___(2)___ car to a small town near the coast. My father always drives because he knows ___(3)___ way better than anyone else. When we arrive, we stay <mark>___(4)___</mark> a small hotel close to the beach. In the evenings, we like ___(5)___ walk along the shore and watch the sunset.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (4).</strong></p>'),
  (4, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Every year, my family and I go ___(1)___ vacation in December. We usually travel ___(2)___ car to a small town near the coast. My father always drives because he knows ___(3)___ way better than anyone else. When we arrive, we stay ___(4)___ a small hotel close to the beach. In the evenings, we like <mark>___(5)___</mark> walk along the shore and watch the sunset.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (5).</strong></p>')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'on',true,'Correcto: ''go on vacation'' es la expresión fija.'),(1,'in',false,'No decimos ''go in vacation''.'),(2,'at',false,'No decimos ''go at vacation''.'),(3,'for',false,'No decimos ''go for vacation'' en este sentido.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'with',false,'No decimos ''travel with car'' para indicar medio de transporte.'),(1,'by',true,'Correcto: ''by car'' es la forma fija.'),(2,'in',false,'''In a car'' existe pero no encaja con ''travel ___ car'' como expresión fija.'),(3,'on',false,'No decimos ''travel on car''.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'a',false,'No es la primera mención de ''way'', se necesita artículo definido.'),(1,'an',false,'''Way'' no empieza con sonido vocálico ni es la opción correcta aquí.'),(2,'the',true,'Correcto: ''the way'' se refiere a un camino específico ya mencionado en contexto.'),(3,'this',false,'''This'' no encaja gramaticalmente en esta posición.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'on',false,'No decimos ''stay on a hotel''.'),(1,'in',false,'''In a hotel'' es posible pero no la expresión más natural con ''stay''.'),(2,'at',true,'Correcto: ''stay at a hotel'' es la expresión fija.'),(3,'to',false,'No decimos ''stay to a hotel''.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'to',true,'Correcto: ''like to walk'' — ''like'' se sigue de ''to + verbo''.'),(1,'for',false,'No decimos ''like for walk''.'),(2,'in',false,'No decimos ''like in walk''.'),(3,'at',false,'No decimos ''like at walk''.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;-- ================================================================
-- MÓDULO 7 — Parte 7: Texto con opción múltiple, nivel avanzado (4 opciones)
-- ================================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Parte 7: texto con espacios (nivel avanzado)",
    "subtitle": "Mismo formato que la Parte 4 — un texto con espacios y 4 opciones cada uno — pero con vocabulario más abstracto y conectores lógicos (although, however, therefore, despite) en vez de gramática básica.",
    "guide_html": "<p>Aquí ya no se trata de preposiciones simples: los espacios prueban concordancia verbal en oraciones más largas, y sobre todo <strong>conectores lógicos</strong> que unen ideas de contraste, consecuencia o adición. Es la parte que más preguntas aporta al examen (10 de 45) y la de mayor dificultad.</p><p>Vas a recorrer la ruta de siempre: 2 lecturas de estrategia con textos de ejemplo, un quiz tipo cloze avanzado, una lección interactiva, otro quiz, una práctica completa y el cierre.</p>",
    "objectives": [
      "Reconocer conectores lógicos de contraste (although, however, despite) vs. de consecuencia (therefore, so)",
      "Resolver concordancia verbal en oraciones con sujetos largos (ej: 'the companies... have allowed')",
      "Leer el texto completo para identificar el tono general (opinión, información, advertencia) antes de responder",
      "No dejarse llevar por una palabra aislada — el conector correcto depende de la relación entre TODA la idea anterior y la siguiente"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Conectores lógicos: la clave del nivel avanzado",
    "html": "<p class='lead-in'>La mayoría de espacios en esta parte no son sobre una palabra suelta — son sobre la RELACIÓN LÓGICA entre dos ideas. Si no identificas esa relación, cualquier opción puede sonar 'posible'.</p><h2>Conectores de contraste</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>although / though</div><div class='mean'>aunque — introduce una idea que contrasta con la siguiente</div></div><div class='vocab-item'><div class='word'>however</div><div class='mean'>sin embargo — conecta dos oraciones que se contrastan</div></div><div class='vocab-item'><div class='word'>despite</div><div class='mean'>a pesar de — se sigue de un sustantivo o gerundio, no de una oración completa</div></div></div><h2>Conectores de consecuencia</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>therefore</div><div class='mean'>por lo tanto — introduce una consecuencia lógica</div></div><div class='vocab-item'><div class='word'>so</div><div class='mean'>así que — versión más informal de 'therefore'</div></div></div><div class='tip-box'><span class='icon'>🧠</span><span><strong>Estrategia clave:</strong> antes de mirar las 4 opciones, pregúntate: '¿la idea que sigue CONTRASTA con la anterior, o es una CONSECUENCIA de ella?' Eso reduce las 4 opciones a 1 o 2 candidatas reales.</span></div><details class='mini-check'><summary>¿'Despite' se sigue de una oración completa o de un sustantivo/gerundio?</summary><div class='answer'>De un sustantivo o gerundio (ej: 'despite the rain', 'despite working hard') — no de una oración completa con sujeto y verbo conjugado.</div></details><details class='mini-check'><summary>¿Cuál es la diferencia de uso entre 'although' y 'however'?</summary><div class='answer'>'Although' conecta dos ideas dentro de la MISMA oración; 'however' suele empezar una oración nueva, después de un punto.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Concordancia verbal en oraciones largas",
    "html": "<p class='lead-in'>Otro tipo de espacio frecuente en el nivel avanzado: elegir entre 'have' y 'has', o entre un verbo singular y plural, cuando el sujeto está lejos del verbo o es una frase larga.</p><h2>Ejemplo</h2><p>\"Over the past decade, more companies ___ allowed employees to work from home.\"</p><p>El sujeto real es <strong>'companies'</strong> (plural), aunque hay varias palabras entre el sujeto y el espacio. La respuesta es <strong>have</strong>, no 'has'.</p><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Trampa típica:</strong> en oraciones largas, es fácil concordar el verbo con la palabra más cercana en vez del sujeto real. Vuelve siempre a identificar cuál es el sujeto verdadero de la oración.</span></div><h2>Método de 3 pasos</h2><ol><li>Lee el texto completo para captar el tono general (¿informa, argumenta, advierte?).</li><li>Para cada espacio, identifica si es un conector lógico o una concordancia verbal.</li><li>Si es conector: decide contraste vs. consecuencia. Si es verbo: encuentra el sujeto real, sin importar qué tan lejos esté.</li></ol><details class='mini-check'><summary>En \"more companies ___ allowed\", ¿cuál es el sujeto real?</summary><div class='answer'>'Companies' (plural) — por eso el verbo correcto es 'have', no 'has'.</div></details><details class='mini-check'><summary>¿Cuál es el método de 3 pasos para esta parte?</summary><div class='answer'>1) Leer todo el texto para el tono general. 2) Identificar si el espacio es conector o concordancia verbal. 3) Resolver según el tipo (contraste/consecuencia, o sujeto real).</div></details>"
  },
  "interactive": {
    "title": "Practica espacios de nivel avanzado",
    "intro": "Toca cada espacio para revelar la respuesta y por qué.",
    "slides": [
      {
        "id": "s1",
        "icon": "🏢",
        "title": "Concordancia verbal",
        "bubble": "\"More companies ___ allowed employees to work from home.\" — A. have B. has C. had D. having",
        "detail": "A (have) — el sujeto 'companies' es plural."
      },
      {
        "id": "s2",
        "icon": "⚖️",
        "title": "Conector de contraste",
        "bubble": "\"___ this shift can improve productivity, it also creates new challenges.\" — A. Because B. Although C. So D. Unless",
        "detail": "B (Although) — introduce un contraste dentro de la misma oración."
      },
      {
        "id": "s3",
        "icon": "➡️",
        "title": "Conector de consecuencia",
        "bubble": "\"Many managers have struggled to motivate their teams. ___, some businesses have found creative solutions.\" — A. However B. Despite C. Therefore D. Meanwhile",
        "detail": "A (However) — contrasta la dificultad con la solución encontrada."
      },
      {
        "id": "s4",
        "icon": "🎯",
        "title": "Concordancia verbal",
        "bubble": "\"Researchers ___ found that excessive use is linked to anxiety.\" — A. have B. has C. is D. are",
        "detail": "A (have) — el sujeto 'researchers' es plural."
      },
      {
        "id": "s5",
        "icon": "🚫",
        "title": "Preposición fija con 'despite'",
        "bubble": "\"___ these warnings, millions of users continue online.\" — A. Despite B. Since C. Unless D. Because",
        "detail": "A (Despite) — se sigue de un sustantivo ('these warnings'), no de una oración completa."
      }
    ]
  },
  "practice": {
    "title": "Texto completo tipo examen (nivel avanzado)",
    "html": "<p class='lead-in'>Resuelve este texto completo, con el nivel de dificultad real de la Parte 7.</p><div class='reading-passage'><div class='passage-tag'>Texto</div><p>Over the past decade, more companies ___(1)___ allowed employees to work from home. ___(2)___ this shift can improve productivity, it also creates new challenges for teams that are used to face-to-face communication. Many managers ___(3)___ struggled to keep their teams motivated without daily meetings in an office. ___(4)___, some businesses have found creative solutions, such as virtual coffee breaks and online team-building activities. ___(5)___ these efforts, experts agree that remote work is here to stay.</p></div><details class='mini-check'><summary>Ver respuestas</summary><div class='answer'>1. have (concordancia con 'companies') · 2. Although (contraste dentro de la oración) · 3. have (concordancia con 'managers') · 4. However (contraste entre la dificultad y la solución) · 5. Despite (se sigue de un sustantivo: 'these efforts').</div></details><div class='tip-box'><span class='icon'>✅</span><span>¿Notaste el patrón? 2 espacios de concordancia verbal y 3 de conectores lógicos — así se reparte normalmente esta parte en el examen real.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras — no hay respuestas incorrectas aquí.",
    "fields": [
      {
        "id": "contraste_consecuencia",
        "label": "Explica la diferencia entre un conector de contraste y uno de consecuencia, con un ejemplo de cada uno.",
        "type": "textarea",
        "placeholder": ""
      },
      {
        "id": "sujeto_real",
        "label": "¿Por qué es importante encontrar el 'sujeto real' de una oración larga antes de elegir el verbo?",
        "type": "textarea",
        "placeholder": ""
      },
      {
        "id": "despite_uso",
        "label": "¿'Despite' se usa antes de una oración completa o antes de un sustantivo/gerundio? Da un ejemplo.",
        "type": "text",
        "placeholder": ""
      },
      {
        "id": "diferencia_parte4_7",
        "label": "¿En qué se diferencia el nivel de dificultad de esta parte comparado con la Parte 4?",
        "type": "textarea",
        "placeholder": ""
      }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 7 — Texto con opción múltiple';

-- Quiz: Quiz — Texto con espacios I (nivel avanzado) (Parte 7 — Texto con opción múltiple / readings)

delete from public.quiz_questions
where quiz_id in (
  select qz.id from public.quizzes qz
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple' and qz.stage = 'readings'
);

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Texto con espacios I (nivel avanzado)', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple'
on conflict (module_id, stage) do update set title = excluded.title, passing_score = excluded.passing_score, is_final = excluded.is_final, max_attempts = excluded.max_attempts, cooldown_hours = excluded.cooldown_hours;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '<p>Lee el texto completo y responde el espacio marcado.</p><div class=''cloze-passage''>Over the past decade, more companies <mark>___(1)___</mark> allowed employees to work from home. ___(2)___ this shift can improve productivity, it also creates new challenges for teams that are used to face-to-face communication. Many managers ___(3)___ struggled to keep their teams motivated without daily meetings in an office. ___(4)___, some businesses have found creative solutions, such as virtual coffee breaks and online team-building activities. ___(5)___ these efforts, experts agree that remote work is here to stay.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (1).</strong></p>'),
  (1, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Over the past decade, more companies ___(1)___ allowed employees to work from home. <mark>___(2)___</mark> this shift can improve productivity, it also creates new challenges for teams that are used to face-to-face communication. Many managers ___(3)___ struggled to keep their teams motivated without daily meetings in an office. ___(4)___, some businesses have found creative solutions, such as virtual coffee breaks and online team-building activities. ___(5)___ these efforts, experts agree that remote work is here to stay.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (2).</strong></p>'),
  (2, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Over the past decade, more companies ___(1)___ allowed employees to work from home. ___(2)___ this shift can improve productivity, it also creates new challenges for teams that are used to face-to-face communication. Many managers <mark>___(3)___</mark> struggled to keep their teams motivated without daily meetings in an office. ___(4)___, some businesses have found creative solutions, such as virtual coffee breaks and online team-building activities. ___(5)___ these efforts, experts agree that remote work is here to stay.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (3).</strong></p>'),
  (3, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Over the past decade, more companies ___(1)___ allowed employees to work from home. ___(2)___ this shift can improve productivity, it also creates new challenges for teams that are used to face-to-face communication. Many managers ___(3)___ struggled to keep their teams motivated without daily meetings in an office. <mark>___(4)___</mark>, some businesses have found creative solutions, such as virtual coffee breaks and online team-building activities. ___(5)___ these efforts, experts agree that remote work is here to stay.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (4).</strong></p>'),
  (4, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Over the past decade, more companies ___(1)___ allowed employees to work from home. ___(2)___ this shift can improve productivity, it also creates new challenges for teams that are used to face-to-face communication. Many managers ___(3)___ struggled to keep their teams motivated without daily meetings in an office. ___(4)___, some businesses have found creative solutions, such as virtual coffee breaks and online team-building activities. <mark>___(5)___</mark> these efforts, experts agree that remote work is here to stay.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (5).</strong></p>')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'have',true,'Correcto: el sujeto ''companies'' es plural.'),(1,'has',false,'''Has'' se usa con sujeto singular; ''companies'' es plural.'),(2,'had',false,'Cambia el tiempo verbal sin motivo textual.'),(3,'having',false,'No es la forma conjugada requerida aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Because',false,'''Because'' introduce una causa, no un contraste.'),(1,'Although',true,'Correcto: introduce el contraste entre mejorar productividad y crear retos.'),(2,'So',false,'''So'' introduce una consecuencia, no un contraste inicial.'),(3,'Unless',false,'''Unless'' introduce una condición negativa, no aplica aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'have',true,'Correcto: el sujeto ''managers'' es plural.'),(1,'has',false,'''Has'' requiere sujeto singular.'),(2,'are',false,'No es la forma verbal correcta para ''struggled''.'),(3,'is',false,'No es la forma verbal correcta ni concuerda con el sujeto plural.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'However',true,'Correcto: contrasta la dificultad de los gerentes con las soluciones encontradas.'),(1,'Despite',false,'''Despite'' no puede iniciar una oración independiente seguida de coma con sujeto+verbo así.'),(2,'Therefore',false,'No es una consecuencia directa, es un contraste.'),(3,'Meanwhile',false,'No indica simultaneidad en este contexto, sino contraste.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Despite',true,'Correcto: se sigue de un sustantivo (''these efforts'').'),(1,'Although',false,'''Although'' necesita una oración completa después, no solo un sustantivo.'),(2,'Because',false,'''Because'' indica causa, no concesión.'),(3,'Unless',false,'''Unless'' indica condición negativa, no aplica aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- Quiz: Quiz — Texto con espacios II (nivel avanzado) (Parte 7 — Texto con opción múltiple / interactive)

delete from public.quiz_questions
where quiz_id in (
  select qz.id from public.quizzes qz
  join public.modules m on m.id = qz.module_id
  join public.courses c on c.id = m.course_id
  where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple' and qz.stage = 'interactive'
);

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Texto con espacios II (nivel avanzado)', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple'
on conflict (module_id, stage) do update set title = excluded.title, passing_score = excluded.passing_score, is_final = excluded.is_final, max_attempts = excluded.max_attempts, cooldown_hours = excluded.cooldown_hours;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '<p>Lee el texto completo y responde el espacio marcado.</p><div class=''cloze-passage''>Social media platforms <mark>___(1)___</mark> transformed the way people communicate around the world. ___(2)___ these tools allow instant contact with friends and family, they can also cause feelings of isolation. Researchers ___(3)___ found that excessive use is linked to anxiety in young people. ___(4)___, many experts recommend setting daily time limits. ___(5)___ these warnings, millions of users continue spending hours online every day.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (1).</strong></p>'),
  (1, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Social media platforms ___(1)___ transformed the way people communicate around the world. <mark>___(2)___</mark> these tools allow instant contact with friends and family, they can also cause feelings of isolation. Researchers ___(3)___ found that excessive use is linked to anxiety in young people. ___(4)___, many experts recommend setting daily time limits. ___(5)___ these warnings, millions of users continue spending hours online every day.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (2).</strong></p>'),
  (2, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Social media platforms ___(1)___ transformed the way people communicate around the world. ___(2)___ these tools allow instant contact with friends and family, they can also cause feelings of isolation. Researchers <mark>___(3)___</mark> found that excessive use is linked to anxiety in young people. ___(4)___, many experts recommend setting daily time limits. ___(5)___ these warnings, millions of users continue spending hours online every day.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (3).</strong></p>'),
  (3, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Social media platforms ___(1)___ transformed the way people communicate around the world. ___(2)___ these tools allow instant contact with friends and family, they can also cause feelings of isolation. Researchers ___(3)___ found that excessive use is linked to anxiety in young people. <mark>___(4)___</mark>, many experts recommend setting daily time limits. ___(5)___ these warnings, millions of users continue spending hours online every day.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (4).</strong></p>'),
  (4, '<p>Mismo texto. Responde el espacio marcado.</p><div class=''cloze-passage''>Social media platforms ___(1)___ transformed the way people communicate around the world. ___(2)___ these tools allow instant contact with friends and family, they can also cause feelings of isolation. Researchers ___(3)___ found that excessive use is linked to anxiety in young people. ___(4)___, many experts recommend setting daily time limits. <mark>___(5)___</mark> these warnings, millions of users continue spending hours online every day.</div><p style=''margin-top:8px;''><strong>Elige la opción correcta para el espacio (5).</strong></p>')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'have',true,'Correcto: el sujeto ''platforms'' es plural.'),(1,'has',false,'''Has'' requiere sujeto singular.'),(2,'had',false,'Cambia el tiempo verbal sin motivo textual.'),(3,'having',false,'No es la forma conjugada requerida aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Because',false,'''Because'' introduce causa, no contraste.'),(1,'Although',true,'Correcto: contrasta el contacto instantáneo con la sensación de aislamiento.'),(2,'So',false,'''So'' introduce consecuencia, no contraste inicial.'),(3,'Unless',false,'''Unless'' introduce una condición negativa, no aplica aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'have',true,'Correcto: el sujeto ''researchers'' es plural.'),(1,'has',false,'''Has'' requiere sujeto singular.'),(2,'is',false,'No concuerda con el sujeto plural.'),(3,'are',false,'No es la forma verbal correcta para ''found''.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Therefore',true,'Correcto: introduce la recomendación como consecuencia lógica del hallazgo anterior.'),(1,'However',false,'No hay contraste aquí, sino una consecuencia.'),(2,'Meanwhile',false,'No indica simultaneidad en este contexto.'),(3,'Because',false,'''Because'' no puede usarse así, iniciando una oración independiente con coma.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Despite',true,'Correcto: se sigue de un sustantivo (''these warnings'').'),(1,'Since',false,'''Since'' indica tiempo o causa, no concesión.'),(2,'Unless',false,'''Unless'' indica condición negativa, no aplica aquí.'),(3,'Because',false,'''Because'' indica causa, no concesión.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;