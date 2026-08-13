-- ============================================================
-- Inglés B1 — Lote 2: Unidad 2 (Stories From the Past)
-- ============================================================
-- Requiere haber corrido antes: seed-ingles-b1-modules.sql,
-- b1-batch1-intro-unit1.sql. Seguro de correr varias veces.
-- ============================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Unidad 2 — Stories From the Past",
    "subtitle": "Toda buena conversación en inglés, tarde o temprano, termina contando una historia. Vamos a aprender a hacerlo bien.",
    "guide_html": "<p>El pasado en inglés no es solo una regla gramatical — es la base para contar anécdotas, chistes, viajes y experiencias. En esta unidad vas a aprender a combinar <strong>past simple</strong> y <strong>past continuous</strong> para dar contexto a tus historias, a usar los verbos irregulares más comunes con soltura, y a conectar tus ideas como lo haría alguien contando una historia real, no leyendo una lista de eventos.</p>",
    "objectives": [
      "Usar correctamente past simple y past continuous, y combinarlos con 'when' y 'while'",
      "Reconocer y usar los verbos irregulares más comunes del inglés",
      "Conectar una historia con secuenciadores narrativos naturales",
      "Contar una anécdota personal, en inglés, con una estructura clara"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "A Weekend I'll Never Forget",
    "html": "<p class='lead-in'>Lee esta anécdota de Marcus. Fíjate en los verbos en pasado — algunos son regulares (terminan en -ed) y otros son irregulares.</p><div class='reading-passage'><span class='passage-tag'>Marcus's Story</span>Last summer, my friends and I decided to go camping in the mountains. We drove for about three hours and finally found a beautiful spot near a lake. While we were setting up the tent, it suddenly started to rain — really hard! We didn't have time to finish, so we ran to the car and waited there for almost an hour. When the rain stopped, we went back and finished putting up the tent, but everything was soaking wet. That night, we made a small fire and told stories until midnight. The next morning, we woke up and saw the most incredible view — mist over the lake, birds everywhere. It turned out to be one of the best trips we ever had, even with the terrible start!</div><h2>Vocabulario — Anécdotas y viajes</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>to set up (a tent)</div><div class='mean'>armar (una carpa)</div></div><div class='vocab-item'><div class='word'>soaking wet</div><div class='mean'>completamente empapado</div></div><div class='vocab-item'><div class='word'>a spot</div><div class='mean'>un lugar, un sitio</div></div><div class='vocab-item'><div class='word'>mist</div><div class='mean'>neblina</div></div><div class='vocab-item'><div class='word'>it turned out to be...</div><div class='mean'>resultó ser...</div></div><div class='vocab-item'><div class='word'>incredible</div><div class='mean'>increíble</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>Nota cómo Marcus mezcla <strong>past simple</strong> (acciones completas: \"we drove\", \"it started to rain\") con <strong>past continuous</strong> (una acción en progreso: \"while we were setting up the tent\") — así es como se cuenta una historia real en inglés.</span></div><details class='mini-check'><summary>¿Qué pasó justo cuando estaban armando la carpa?</summary><div class='answer'>Empezó a llover fuerte de repente (it suddenly started to rain).</div></details><details class='mini-check'><summary>¿Cómo terminó el viaje, según Marcus?</summary><div class='answer'>Resultó ser uno de los mejores viajes que han tenido, a pesar del mal comienzo.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Past Simple vs. Past Continuous — y los verbos irregulares",
    "html": "<p class='lead-in'>Vamos a ver la diferencia con calma, y después vas a tener a mano la lista de verbos irregulares más comunes.</p><table class='grammar-table'><tr><th>Tiempo</th><th>Uso</th><th>Ejemplo</th></tr><tr><td>Past Simple</td><td>Una acción completa en el pasado</td><td>It <strong>started</strong> to rain.</td></tr><tr><td>Past Continuous</td><td>Una acción en progreso, interrumpida por otra</td><td>We <strong>were setting up</strong> the tent <strong>when</strong> it started to rain.</td></tr></table><h2>'When' y 'while' — no son intercambiables</h2><div class='example-box'><div class='line'><span class='speaker'>WHEN</span> + past simple (la acción que interrumpe): <strong>When</strong> it started to rain, we ran to the car.</div><div class='line'><span class='speaker'>WHILE</span> + past continuous (la acción en progreso): <strong>While</strong> we were setting up the tent, it started to rain.</div></div><h2>Verbos irregulares más comunes</h2><table class='grammar-table verb-table'><tr><th class='vt-base'>Base</th><th class='vt-past'>Past Simple</th><th class='vt-part'>Past Participle</th></tr><tr><td>go</td><td>went</td><td>gone</td></tr><tr><td>see</td><td>saw</td><td>seen</td></tr><tr><td>make</td><td>made</td><td>made</td></tr><tr><td>find</td><td>found</td><td>found</td></tr><tr><td>tell</td><td>told</td><td>told</td></tr><tr><td>drive</td><td>drove</td><td>driven</td></tr><tr><td>run</td><td>ran</td><td>run</td></tr><tr><td>wake</td><td>woke</td><td>woken</td></tr><tr><td>begin</td><td>began</td><td>begun</td></tr><tr><td>break</td><td>broke</td><td>broken</td></tr><tr><td>bring</td><td>brought</td><td>brought</td></tr><tr><td>buy</td><td>bought</td><td>bought</td></tr><tr><td>come</td><td>came</td><td>come</td></tr><tr><td>eat</td><td>ate</td><td>eaten</td></tr><tr><td>fall</td><td>fell</td><td>fallen</td></tr><tr><td>feel</td><td>felt</td><td>felt</td></tr><tr><td>get</td><td>got</td><td>got/gotten</td></tr><tr><td>give</td><td>gave</td><td>given</td></tr><tr><td>know</td><td>knew</td><td>known</td></tr><tr><td>leave</td><td>left</td><td>left</td></tr><tr><td>lose</td><td>lost</td><td>lost</td></tr><tr><td>meet</td><td>met</td><td>met</td></tr><tr><td>say</td><td>said</td><td>said</td></tr><tr><td>take</td><td>took</td><td>taken</td></tr><tr><td>think</td><td>thought</td><td>thought</td></tr><tr><td>write</td><td>wrote</td><td>written</td></tr></table><div class='tip-box'><span class='icon'>💡</span><span>No intentes memorizar los 26 de una sola vez. Es mucho mejor aprender 4 o 5 por semana <strong>usándolos en oraciones reales</strong> — así se quedan de verdad.</span></div><h2>Conectando tu historia</h2><div class='connector-flow'><span class='conn-chip'>First,...</span><span class='conn-arrow'>→</span><span class='conn-chip'>Then,...</span><span class='conn-arrow'>→</span><span class='conn-chip'>Suddenly,...</span><span class='conn-arrow'>→</span><span class='conn-chip'>After that,...</span><span class='conn-arrow'>→</span><span class='conn-chip'>In the end,...</span></div><h2>Phrasal verbs para contar historias</h2><div class='phrasal-grid'><div class='phrasal-item'><div class='pv'>turn out</div><div class='pv-mean'>resultar (ser)</div><div class='pv-ex'>It turned out to be a great trip.</div></div><div class='phrasal-item'><div class='pv'>end up</div><div class='pv-mean'>terminar (haciendo algo no planeado)</div><div class='pv-ex'>We ended up sleeping in the car.</div></div><div class='phrasal-item'><div class='pv'>run into</div><div class='pv-mean'>encontrarse con alguien por casualidad</div><div class='pv-ex'>I ran into an old friend at the airport.</div></div><div class='phrasal-item'><div class='pv'>find out</div><div class='pv-mean'>enterarse de algo</div><div class='pv-ex'>We found out the campsite was closed.</div></div></div><div class='mindmap-wrap'><div class='mindmap-hub'>Cómo contar una buena historia</div><div class='mindmap-branches'><div class='mindmap-node'><div class='node-title'>Inicio</div><div class='node-items'>contexto: dónde, cuándo, quién</div></div><div class='mindmap-node'><div class='node-title'>Complicación</div><div class='node-items'>algo inesperado — 'suddenly...'</div></div><div class='mindmap-node'><div class='node-title'>Desarrollo</div><div class='node-items'>qué hicieron para resolverlo</div></div><div class='mindmap-node'><div class='node-title'>Final</div><div class='node-items'>cómo terminó — 'in the end...'</div></div></div></div><details class='mini-check'><summary>¿Cuál va con 'when' y cuál con 'while'?</summary><div class='answer'>'When' + past simple (la interrupción); 'while' + past continuous (la acción en progreso).</div></details>"
  },
  "interactive": {
    "title": "Flashcards — verbos irregulares",
    "intro": "Toca cada burbuja para revelar el pasado y el participio.",
    "slides": [
      { "id":"s1", "icon":"🚗", "title":"go", "bubble":"¿Cuál es el pasado y el participio de 'go'?", "detail":"went / gone — 'I went to the mountains last summer.'" },
      { "id":"s2", "icon":"👀", "title":"see", "bubble":"¿Cuál es el pasado y el participio de 'see'?", "detail":"saw / seen — 'We saw an incredible view.'" },
      { "id":"s3", "icon":"🔥", "title":"make", "bubble":"¿Cuál es el pasado y el participio de 'make'?", "detail":"made / made — 'We made a small fire.'" },
      { "id":"s4", "icon":"🏃", "title":"run", "bubble":"¿Cuál es el pasado y el participio de 'run'?", "detail":"ran / run — 'We ran to the car.'" },
      { "id":"s5", "icon":"💔", "title":"break", "bubble":"¿Cuál es el pasado y el participio de 'break'?", "detail":"broke / broken — 'The tent pole broke in the wind.'" },
      { "id":"s6", "icon":"🗣️", "title":"tell", "bubble":"¿Cuál es el pasado y el participio de 'tell'?", "detail":"told / told — 'We told stories until midnight.'" }
    ]
  },
  "practice": {
    "title": "Ahora te toca a ti",
    "html": "<p class='lead-in'>Veamos otro ejemplo, y luego te toca contar tu propia historia.</p><div class='reading-passage'><div class='passage-tag'>Example</div>Last year, I was walking home when I ran into an old school friend I hadn't seen in years. We ended up talking for two hours in a café! While we were catching up, we found out we both had moved to the same neighborhood without knowing it. It turned out to be one of the best surprises of the year.</div><div class='tip-box'><span class='icon'>✍️</span><span><strong>Actividad de escritura:</strong> escribe una anécdota corta (6-8 oraciones) sobre algo que te pasó. Usa al menos <strong>3 verbos irregulares</strong>, <strong>una combinación de when/while</strong>, y un phrasal verb de esta unidad.</span></div>"
  },
  "speaking_tasks": [
    {
      "id": "u2-speaking-1",
      "label": "Cuenta en voz alta una anécdota corta (real o inventada), en inglés (30-45 segundos). Usa al menos 2 verbos irregulares y un conector como 'suddenly' o 'in the end'.",
      "keywords": ["went", "saw", "made", "ran", "found", "told", "suddenly", "then", "after", "end", "while", "when"],
      "min_words": 25,
      "min_seconds": 20
    }
  ],
  "closing_form": {
    "title": "Sella lo aprendido en esta unidad",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id": "when_while", "label": "Explica la diferencia entre 'when' y 'while' con un ejemplo propio.", "type": "textarea", "placeholder": "" },
      { "id": "verbos_irregulares", "label": "Escribe 3 verbos irregulares (base, pasado y participio) que quieras recordar.", "type": "textarea", "placeholder": "" },
      { "id": "mi_anecdota", "label": "Escribe 2-3 oraciones en inglés sobre algo que te pasó, usando el pasado.", "type": "textarea", "placeholder": "" },
      { "id": "dificultad", "label": "¿Qué fue lo más difícil de esta unidad para ti?", "type": "textarea", "placeholder": "" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 2 — Stories From the Past';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: Stories From the Past', 70, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 2 — Stories From the Past'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué pasó mientras armaban la carpa?'),
  (1, '¿Qué significa "soaking wet"?'),
  (2, '¿Cuál es el pasado del verbo "go"?'),
  (3, '¿Cuál es el pasado del verbo "see"?'),
  (4, '¿Qué significa "it turned out to be..."?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 2 — Stories From the Past' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Empezó a llover fuerte',true,'Correcto: "while we were setting up the tent, it suddenly started to rain".'),(1,'B. Se les acabó la comida',false,'El texto no menciona nada sobre comida en ese momento.'),(2,'C. Encontraron a otro grupo de campistas',false,'No se menciona a otro grupo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 2 — Stories From the Past' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Completamente empapado',true,'Correcto.'),(1,'B. Muy sucio',false,'"Soaking wet" es sobre estar mojado, no sucio.'),(2,'C. Congelado de frío',false,'No es sobre el frío, sino sobre estar mojado.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 2 — Stories From the Past' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. goed',false,'"Go" es irregular, no termina en -ed.'),(1,'B. went',true,'Correcto: go → went → gone.'),(2,'C. gone',false,'"Gone" es el participio, no el pasado simple.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 2 — Stories From the Past' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. seed',false,'"See" es irregular, no termina en -ed.'),(1,'B. saw',true,'Correcto: see → saw → seen.'),(2,'C. seen',false,'"Seen" es el participio, no el pasado simple.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 2 — Stories From the Past' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Resultó ser',true,'Correcto: "it turned out to be" significa "resultó ser".'),(1,'B. Se le olvidó',false,'No tiene ese significado.'),(2,'C. Se dio media vuelta',false,'"Turn out" en este caso no significa "voltear", sino "resultar".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 2 — Stories From the Past' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 70, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 2 — Stories From the Past'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuándo usamos "when" en una historia?'),
  (1, '¿Cuándo usamos "while" en una historia?'),
  (2, '¿Cuál es el pasado del verbo "break"?'),
  (3, '¿Qué significa el phrasal verb "run into"?'),
  (4, '¿Qué significa el phrasal verb "end up"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 2 — Stories From the Past' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Con la acción que interrumpe, + past simple',true,'Correcto: "when" va con la acción corta que interrumpe.'),(1,'B. Con la acción en progreso, + past continuous',false,'Esa es la regla para "while", no "when".'),(2,'C. Solo en preguntas',false,'"When" no está limitado a preguntas.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 2 — Stories From the Past' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Con la acción en progreso, + past continuous',true,'Correcto: "while" acompaña la acción que estaba pasando.'),(1,'B. Con la acción que interrumpe, + past simple',false,'Esa es la regla para "when", no "while".'),(2,'C. Solo con verbos irregulares',false,'"While" no depende de si el verbo es regular o irregular.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 2 — Stories From the Past' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. breaked',false,'"Break" es irregular.'),(1,'B. broke',true,'Correcto: break → broke → broken.'),(2,'C. broken',false,'"Broken" es el participio, no el pasado simple.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 2 — Stories From the Past' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Encontrarse con alguien por casualidad',true,'Correcto.'),(1,'B. Correr una carrera',false,'"Run into" no es literalmente correr.'),(2,'C. Chocar con un carro',false,'No se refiere a un choque de vehículos en este contexto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 2 — Stories From the Past' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Terminar haciendo algo no planeado',true,'Correcto: "we ended up sleeping in the car" = terminamos durmiendo en el carro, sin planearlo.'),(1,'B. Terminar una relación',false,'No es ese el significado en este contexto.'),(2,'C. Empezar algo nuevo',false,'"End up" es sobre cómo termina algo, no cómo empieza.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 2 — Stories From the Past' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
