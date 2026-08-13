-- ============================================================
-- Inglés B1 — Lote 4: Unidad 4 (Travelling)
-- ============================================================
-- Requiere haber corrido antes: seed-ingles-b1-modules.sql y los
-- batches anteriores. Seguro de correr varias veces.
-- ============================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Unidad 4 — Travelling",
    "subtitle": "¿Alguna vez has probado comida tailandesa? ¿Cuándo fue la última vez que viajaste? Dos preguntas, dos tiempos verbales distintos.",
    "guide_html": "<p>En esta unidad aprendemos a hablar de <strong>experiencias</strong> (cosas que has hecho alguna vez en tu vida, sin decir cuándo exactamente) usando el <strong>present perfect</strong>, y a diferenciarlo del <strong>past simple</strong>, que se usa cuando el momento sí es específico. También vamos a ver 'for' y 'since', dos palabras que confunden a casi todos los estudiantes de inglés — y vamos a aprender vocabulario para hablar de viajes y dar recomendaciones.</p>",
    "objectives": [
      "Diferenciar present perfect y past simple para hablar de experiencias",
      "Usar correctamente 'for' y 'since'",
      "Usar vocabulario de viajes y dar recomendaciones",
      "Contar tus propias experiencias de viaje en inglés"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Places I've Been, Places I Want to Go",
    "html": "<p class='lead-in'>Lee lo que Daniela escribió sobre sus viajes. Fíjate en cuándo usa present perfect y cuándo usa past simple.</p><div class='reading-passage'><span class='passage-tag'>Daniela's travel notes</span>I've travelled to five countries so far, but Peru is still my favourite. I went there in 2019 with two friends, and we spent almost two weeks exploring Cusco and Machu Picchu. I've also been to Ecuador and Chile, but I haven't visited Argentina yet — it's on my list! Last year, I finally tried Vietnamese food for the first time, and I loved it so much that I've eaten it at least ten times since then. I've been saving money for a trip to Japan for almost two years now, and I'm planning to go next spring. Have you ever travelled alone? I did it once, in 2021, and it completely changed how I see travelling.</div><h2>Vocabulario — Viajes</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>so far</div><div class='mean'>hasta ahora</div></div><div class='vocab-item'><div class='word'>to explore</div><div class='mean'>explorar</div></div><div class='vocab-item'><div class='word'>it''s on my list</div><div class='mean'>está en mi lista de pendientes</div></div><div class='vocab-item'><div class='word'>to save money</div><div class='mean'>ahorrar dinero</div></div><div class='vocab-item'><div class='word'>alone</div><div class='mean'>solo/a</div></div><div class='vocab-item'><div class='word'>an itinerary</div><div class='mean'>un itinerario</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>\"I've travelled to five countries\" (present perfect) = una experiencia general, sin fecha. \"I went there in 2019\" (past simple) = un momento específico y ya cerrado.</span></div><details class='mini-check'><summary>¿A qué país fue Daniela en 2019?</summary><div class='answer'>A Perú (I went there in 2019).</div></details><details class='mini-check'><summary>¿Qué país todavía no ha visitado?</summary><div class='answer'>Argentina (I haven''t visited Argentina yet).</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Present Perfect vs. Past Simple — y 'for' / 'since'",
    "html": "<p class='lead-in'>Esta es probablemente la diferencia gramatical más importante del nivel B1. Vamos con calma.</p><table class='grammar-table'><tr><th>Tiempo</th><th>Uso</th><th>Ejemplo</th></tr><tr><td>Present Perfect</td><td>Experiencia de vida, sin momento específico</td><td>I<strong>'ve been</strong> to Ecuador and Chile.</td></tr><tr><td>Past Simple</td><td>Un momento específico y cerrado (fecha, año, \"last year\")</td><td>I <strong>went</strong> to Peru <strong>in 2019</strong>.</td></tr></table><div class='example-box'><div class='line'><span class='speaker'>✅</span> Have you ever been to Japan? — pregunta por experiencia, sin momento específico.</div><div class='line'><span class='speaker'>✅</span> When did you go to Japan? — pregunta por un momento específico → requiere past simple en la respuesta.</div></div><h2>'For' vs. 'Since'</h2><table class='grammar-table'><tr><th>Palabra</th><th>Se usa con</th><th>Ejemplo</th></tr><tr><td>for</td><td>una duración (cantidad de tiempo)</td><td><strong>for</strong> two years, <strong>for</strong> a week</td></tr><tr><td>since</td><td>un punto de inicio (fecha, momento)</td><td><strong>since</strong> 2020, <strong>since</strong> last spring</td></tr></table><div class='tip-box'><span class='icon'>💡</span><span>Truco rápido: si puedes contar los años/meses/semanas, usa <strong>for</strong>. Si es un punto fijo en el tiempo (un año, una fecha, un evento), usa <strong>since</strong>.</span></div><h2>Conectores para dar recomendaciones</h2><div class='connector-flow'><span class='conn-chip'>I'd recommend...</span><span class='conn-arrow'>→</span><span class='conn-chip'>You should try...</span><span class='conn-arrow'>→</span><span class='conn-chip'>Don't miss...</span><span class='conn-arrow'>→</span><span class='conn-chip'>Make sure you...</span></div><h2>Phrasal verbs de viaje</h2><div class='phrasal-grid'><div class='phrasal-item'><div class='pv'>check in</div><div class='pv-mean'>registrarse (hotel/aeropuerto)</div><div class='pv-ex'>We checked in at 3 pm.</div></div><div class='phrasal-item'><div class='pv'>set off</div><div class='pv-mean'>partir, emprender el viaje</div><div class='pv-ex'>We set off early in the morning.</div></div><div class='phrasal-item'><div class='pv'>take off</div><div class='pv-mean'>despegar (avión)</div><div class='pv-ex'>The plane took off on time.</div></div><div class='phrasal-item'><div class='pv'>get around</div><div class='pv-mean'>moverse, desplazarse (en una ciudad)</div><div class='pv-ex'>It''s easy to get around by bus.</div></div></div><div class='mindmap-wrap'><div class='mindmap-hub'>Vocabulario de viajes</div><div class='mindmap-branches'><div class='mindmap-node'><div class='node-title'>Antes del viaje</div><div class='node-items'>to book, an itinerary, to pack</div></div><div class='mindmap-node'><div class='node-title'>En el aeropuerto</div><div class='node-items'>check in, take off, a delay</div></div><div class='mindmap-node'><div class='node-title'>En el destino</div><div class='node-items'>to explore, get around, a local</div></div><div class='mindmap-node'><div class='node-title'>Recomendaciones</div><div class='node-items'>I''d recommend, don''t miss</div></div></div></div><div class='tip-box'><span class='icon'>🌍</span><span><strong>Cultura:</strong> en varios países de habla inglesa (especialmente Reino Unido y Australia) es muy común tomarse un \"gap year\" — un año libre, generalmente después del colegio o la universidad, para viajar o hacer voluntariado antes de empezar a trabajar.</span></div><details class='mini-check'><summary>¿Cuándo se usa 'since' en vez de 'for'?</summary><div class='answer'>Cuando el punto de referencia es un momento fijo en el tiempo (una fecha, un año, un evento), no una duración contable.</div></details>"
  },
  "interactive": {
    "title": "Flashcards — Present Perfect vs. Past Simple",
    "intro": "Toca cada tarjeta para revelar la explicación.",
    "slides": [
      { "id":"s1", "icon":"🌎", "title":"I've been to Chile", "bubble":"¿Present perfect o past simple? ¿Por qué?", "detail":"Present perfect — es una experiencia de vida, sin decir cuándo exactamente." },
      { "id":"s2", "icon":"📅", "title":"I went there in 2019", "bubble":"¿Present perfect o past simple? ¿Por qué?", "detail":"Past simple — el año 2019 es un momento específico y cerrado." },
      { "id":"s3", "icon":"⏳", "title":"for two years", "bubble":"¿'For' o 'since'? ¿Por qué?", "detail":"'For' — se usa con una duración que se puede contar." },
      { "id":"s4", "icon":"📍", "title":"since 2020", "bubble":"¿'For' o 'since'? ¿Por qué?", "detail":"'Since' — se usa con un punto fijo de inicio en el tiempo." },
      { "id":"s5", "icon":"✈️", "title":"take off", "bubble":"¿Qué significa este phrasal verb?", "detail":"Despegar — se usa para aviones: 'The plane took off on time.'" },
      { "id":"s6", "icon":"🏨", "title":"check in", "bubble":"¿Qué significa este phrasal verb?", "detail":"Registrarse — en un hotel o aeropuerto: 'We checked in at 3 pm.'" }
    ]
  },
  "practice": {
    "title": "Ahora te toca a ti",
    "html": "<p class='lead-in'>Lee este ejemplo de recomendación y luego escribe la tuya.</p><div class='reading-passage'><div class='passage-tag'>Example</div>If you ever visit Cartagena, I'd recommend walking around the old city in the early morning, before it gets too hot. You should try the local street food, and don't miss the sunset at the wall — it's one of the most beautiful views I've ever seen.</div><div class='tip-box'><span class='icon'>✍️</span><span><strong>Actividad de escritura:</strong> escribe una recomendación de viaje (5-7 oraciones) sobre un lugar que conozcas bien. Usa <strong>present perfect</strong> para mencionar una experiencia, <strong>past simple</strong> para un momento específico, y al menos <strong>una expresión de recomendación</strong>.</span></div>"
  },
  "speaking_tasks": [
    {
      "id": "u4-speaking-1",
      "label": "Habla en voz alta (30-45 segundos, en inglés) sobre un lugar que hayas visitado. Usa present perfect para la experiencia general y past simple para un momento específico.",
      "keywords": ["been", "went", "have", "visited", "travelled", "recommend", "ago", "since", "for"],
      "min_words": 25,
      "min_seconds": 20
    }
  ],
  "closing_form": {
    "title": "Sella lo aprendido en esta unidad",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id": "diferencia_pp_ps", "label": "Explica con tus palabras cuándo usar present perfect y cuándo past simple.", "type": "textarea", "placeholder": "" },
      { "id": "for_since", "label": "Escribe un ejemplo con 'for' y otro con 'since'.", "type": "textarea", "placeholder": "" },
      { "id": "mi_viaje", "label": "Escribe 2-3 oraciones en inglés sobre un viaje o experiencia que hayas tenido.", "type": "textarea", "placeholder": "" },
      { "id": "dificultad", "label": "¿Qué fue lo más difícil de esta unidad para ti?", "type": "textarea", "placeholder": "" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 4 — Travelling';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: Travelling', 70, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 4 — Travelling'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿A qué país fue Daniela en 2019?'),
  (1, '¿Qué país todavía no ha visitado?'),
  (2, '¿Qué significa "so far"?'),
  (3, '¿Qué significa "it''s on my list"?'),
  (4, '¿Cuántas veces ha comido comida vietnamita desde que la probó?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 4 — Travelling' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Perú',true,'Correcto: "I went there in 2019" se refiere a Perú.'),(1,'B. Chile',false,'A Chile fue en otro momento, no específico.'),(2,'C. Ecuador',false,'A Ecuador también fue, pero sin fecha específica mencionada.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 4 — Travelling' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Argentina',true,'Correcto: "I haven''t visited Argentina yet".'),(1,'B. Chile',false,'A Chile sí ha ido.'),(2,'C. Perú',false,'A Perú sí ha ido, en 2019.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 4 — Travelling' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Hasta ahora',true,'Correcto.'),(1,'B. Hace mucho tiempo',false,'No es el significado de "so far".'),(2,'C. Nunca más',false,'No es el significado de "so far".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 4 — Travelling' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Está en mi lista de pendientes',true,'Correcto.'),(1,'B. Ya lo hice',false,'Es lo contrario — significa que aún no lo ha hecho.'),(2,'C. Lo olvidé por completo',false,'No es el significado de la expresión.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 4 — Travelling' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Al menos diez veces',true,'Correcto: "I''ve eaten it at least ten times since then".'),(1,'B. Solo una vez más',false,'El texto dice al menos diez veces, no una.'),(2,'C. Nunca más',false,'El texto dice que sí la ha vuelto a comer, varias veces.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 4 — Travelling' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 70, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 4 — Travelling'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál se usa para una experiencia de vida, sin momento específico?'),
  (1, '¿Cuál se usa con un punto fijo de inicio (como un año)?'),
  (2, '¿Cuál se usa con una duración que se puede contar?'),
  (3, '¿Qué significa el phrasal verb "check in"?'),
  (4, '¿Qué significa el phrasal verb "get around"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 4 — Travelling' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Present perfect',true,'Correcto.'),(1,'B. Past simple',false,'El past simple se usa para momentos específicos, no experiencias generales.'),(2,'C. Present continuous',false,'No se usa para hablar de experiencias de vida.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 4 — Travelling' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. since',true,'Correcto: "since" se usa con un punto fijo de inicio.'),(1,'B. for',false,'"For" se usa con duración, no con un punto fijo.'),(2,'C. ago',false,'"Ago" se usa de forma distinta, no en esta estructura.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 4 — Travelling' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. for',true,'Correcto: "for" se usa con una duración contable, como "for two years".'),(1,'B. since',false,'"Since" se usa con un punto fijo, no con duración.'),(2,'C. from',false,'"From" no se usa en esta estructura del present perfect.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 4 — Travelling' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Registrarse (hotel/aeropuerto)',true,'Correcto.'),(1,'B. Salir de un lugar',false,'No es el significado de "check in".'),(2,'C. Revisar el equipaje',false,'No es exactamente ese el significado.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 4 — Travelling' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Moverse o desplazarse en una ciudad',true,'Correcto: "it''s easy to get around by bus".'),(1,'B. Dar la vuelta al mundo',false,'No es el significado literal en este contexto.'),(2,'C. Perderse en una ciudad',false,'No es el significado de "get around".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 4 — Travelling' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
