-- ============================================================
-- Inglés B1 — Lote 7: Unidad 7 (Technology & Communication)
-- ============================================================
-- Requiere haber corrido antes: seed-ingles-b1-modules.sql y los
-- batches anteriores. Seguro de correr varias veces.
-- ============================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Unidad 7 — Technology & Communication",
    "subtitle": "\"The app was updated\" en vez de \"they updated the app\" — bienvenido al mundo de la voz pasiva.",
    "guide_html": "<p>En esta unidad aprendemos la <strong>voz pasiva</strong>, una estructura muy usada en inglés cuando lo importante es la acción o el resultado, no quién la hizo — algo muy común al hablar de tecnología (\"the phone was released\", \"the app is used by millions\"). También veremos vocabulario de tecnología y redes sociales, y conectores de causa y efecto.</p>",
    "objectives": [
      "Formar y usar correctamente la voz pasiva en presente y pasado",
      "Usar conectores de causa y efecto",
      "Usar vocabulario de tecnología y comunicación digital",
      "Hablar sobre el uso de la tecnología en tu vida diaria"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "How Technology Changed the Way We Talk",
    "html": "<p class='lead-in'>Lee este texto sobre tecnología y comunicación. Fíjate en las oraciones en voz pasiva.</p><div class='reading-passage'><span class='passage-tag'>Tech & Society</span>Smartphones are used by billions of people every day, and the way we communicate has completely changed as a result. Messages used to be written by hand or typed on a computer; now they're sent instantly through apps. Video calls, which were considered unusual just twenty years ago, are now used for everything from job interviews to family dinners. Because so much communication happens online, many people say that face-to-face conversations are being replaced by screens. As a result, some experts recommend having phone-free hours at home. On the other hand, technology has also made it possible to stay connected with people who live far away — something that wasn't easy before smartphones were invented.</div><h2>Vocabulario — Tecnología</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>a device</div><div class='mean'>un dispositivo</div></div><div class='vocab-item'><div class='word'>face-to-face</div><div class='mean'>cara a cara</div></div><div class='vocab-item'><div class='word'>to be connected</div><div class='mean'>estar conectado</div></div><div class='vocab-item'><div class='word'>to update (an app)</div><div class='mean'>actualizar (una app)</div></div><div class='vocab-item'><div class='word'>a notification</div><div class='mean'>una notificación</div></div><div class='vocab-item'><div class='word'>screen time</div><div class='mean'>tiempo de pantalla</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>\"Smartphones <strong>are used</strong> by billions of people\" — aquí lo importante es el smartphone y la acción, no quién específicamente lo usa. Por eso se usa voz pasiva.</span></div><details class='mini-check'><summary>¿Qué recomiendan algunos expertos, según el texto?</summary><div class='answer'>Tener horas sin teléfono en casa (phone-free hours).</div></details><details class='mini-check'><summary>¿Qué ventaja de la tecnología menciona el texto?</summary><div class='answer'>Que permite mantenerse en contacto con personas que viven lejos.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "La Voz Pasiva — y los conectores de causa/efecto",
    "html": "<p class='lead-in'>La voz pasiva cambia el enfoque de la oración: en vez del sujeto que hace la acción, ponemos al frente lo que la recibe.</p><table class='grammar-table'><tr><th>Voz activa</th><th>Voz pasiva</th></tr><tr><td>People use smartphones every day.</td><td>Smartphones <strong>are used</strong> every day.</td></tr><tr><td>They invented the internet in the 20th century.</td><td>The internet <strong>was invented</strong> in the 20th century.</td></tr><tr><td>Someone updated the app yesterday.</td><td>The app <strong>was updated</strong> yesterday.</td></tr></table><div class='example-box'><div class='line'><span class='speaker'>Presente pasivo</span> is/are + past participle → The app <strong>is updated</strong> every month.</div><div class='line'><span class='speaker'>Pasado pasivo</span> was/were + past participle → The phone <strong>was released</strong> last year.</div></div><div class='tip-box'><span class='icon'>💡</span><span>Usamos voz pasiva cuando no sabemos quién hizo la acción, no importa quién la hizo, o queremos poner el foco en el resultado — muy común en noticias y textos técnicos.</span></div><h2>Conectores de causa y efecto</h2><div class='connector-flow'><span class='conn-chip'>because</span><span class='conn-arrow'>→</span><span class='conn-chip'>as a result</span><span class='conn-arrow'>→</span><span class='conn-chip'>therefore</span><span class='conn-arrow'>→</span><span class='conn-chip'>due to</span><span class='conn-arrow'>→</span><span class='conn-chip'>because of this</span></div><h2>Phrasal verbs de tecnología</h2><div class='phrasal-grid'><div class='phrasal-item'><div class='pv'>log in / log out</div><div class='pv-mean'>iniciar / cerrar sesión</div><div class='pv-ex'>I logged in with my email.</div></div><div class='phrasal-item'><div class='pv'>turn on / turn off</div><div class='pv-mean'>encender / apagar</div><div class='pv-ex'>Turn off notifications at night.</div></div><div class='phrasal-item'><div class='pv'>back up</div><div class='pv-mean'>respaldar (datos)</div><div class='pv-ex'>Always back up your files.</div></div><div class='phrasal-item'><div class='pv'>scroll through</div><div class='pv-mean'>desplazarse por (una pantalla)</div><div class='pv-ex'>I scrolled through my feed for an hour.</div></div></div><div class='mindmap-wrap'><div class='mindmap-hub'>Tecnología y comunicación</div><div class='mindmap-branches'><div class='mindmap-node'><div class='node-title'>Dispositivos</div><div class='node-items'>a device, a screen, to charge</div></div><div class='mindmap-node'><div class='node-title'>Redes sociales</div><div class='node-items'>a notification, to scroll, a post</div></div><div class='mindmap-node'><div class='node-title'>Comunicación</div><div class='node-items'>face-to-face, a video call</div></div><div class='mindmap-node'><div class='node-title'>Hábitos digitales</div><div class='node-items'>screen time, to log out</div></div></div></div><details class='mini-check'><summary>¿Cuándo se usa la voz pasiva en vez de la activa?</summary><div class='answer'>Cuando no sabemos quién hizo la acción, no importa quién la hizo, o queremos enfocarnos en el resultado.</div></details>"
  },
  "interactive": {
    "type": "match",
    "title": "Empareja cada oración activa con su versión pasiva",
    "intro": "Encuentra la pareja correcta de cada oración.",
    "pairs": [
      { "left": "People use this app every day.", "right": "This app is used every day." },
      { "left": "They invented the internet.", "right": "The internet was invented." },
      { "left": "Someone updated the phone.", "right": "The phone was updated." },
      { "left": "log in", "right": "Iniciar sesión" },
      { "left": "back up", "right": "Respaldar datos" },
      { "left": "scroll through", "right": "Desplazarse por una pantalla" },
      { "left": "because of this", "right": "Debido a esto" },
      { "left": "a device", "right": "Un dispositivo" }
    ]
  },
  "practice": {
    "title": "Ahora te toca a ti",
    "html": "<p class='lead-in'>Lee este ejemplo y luego practica la voz pasiva.</p><div class='reading-passage'><div class='passage-tag'>Example</div>This laptop was bought two years ago. It's used every day for work, and it was updated last week. Because it's used so much, the battery isn't as good as before — as a result, I need to charge it twice a day now.</div><div class='tip-box'><span class='icon'>✍️</span><span><strong>Actividad de escritura:</strong> escribe un párrafo corto (5-7 oraciones) sobre un dispositivo que usas mucho. Usa al menos <strong>3 oraciones en voz pasiva</strong> y <strong>un conector de causa/efecto</strong>.</span></div>"
  },
  "speaking_tasks": [
    {
      "id": "u7-speaking-1",
      "label": "Habla en voz alta (30-45 segundos, en inglés) sobre cómo usas la tecnología en tu día a día. Intenta usar al menos una oración en voz pasiva.",
      "keywords": ["used", "phone", "app", "technology", "screen", "because", "connected", "online"],
      "min_words": 25,
      "min_seconds": 20
    }
  ],
  "closing_form": {
    "title": "Sella lo aprendido en esta unidad",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id": "voz_pasiva", "label": "Explica con tus palabras cuándo se usa la voz pasiva en inglés.", "type": "textarea", "placeholder": "" },
      { "id": "ejemplo_pasiva", "label": "Convierte esta oración a voz pasiva: 'Someone stole my phone.'", "type": "textarea", "placeholder": "" },
      { "id": "mi_tecnologia", "label": "Escribe 2-3 oraciones en inglés sobre cómo usas la tecnología.", "type": "textarea", "placeholder": "" },
      { "id": "dificultad", "label": "¿Qué fue lo más difícil de esta unidad para ti?", "type": "textarea", "placeholder": "" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 7 — Technology & Communication';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: Technology & Communication', 70, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 7 — Technology & Communication'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué recomiendan algunos expertos, según el texto?'),
  (1, '¿Qué ventaja de la tecnología menciona el texto?'),
  (2, '¿Qué significa "face-to-face"?'),
  (3, '¿Qué significa "screen time"?'),
  (4, '¿Cómo se enviaban los mensajes antes, según el texto?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 7 — Technology & Communication' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Tener horas sin teléfono en casa',true,'Correcto: "phone-free hours at home".'),(1,'B. Comprar más dispositivos',false,'No es lo que recomiendan los expertos en el texto.'),(2,'C. Usar solo videollamadas',false,'No se menciona esa recomendación.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 7 — Technology & Communication' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Permite mantenerse en contacto con gente lejana',true,'Correcto.'),(1,'B. Reemplaza totalmente el contacto humano',false,'El texto no dice que sea totalmente positivo así.'),(2,'C. Elimina el estrés',false,'No se menciona nada sobre el estrés.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 7 — Technology & Communication' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Cara a cara',true,'Correcto.'),(1,'B. Por teléfono',false,'No es el significado de "face-to-face".'),(2,'C. Por escrito',false,'No es el significado de "face-to-face".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 7 — Technology & Communication' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Tiempo de pantalla',true,'Correcto.'),(1,'B. Tiempo de descanso',false,'No es el significado de "screen time".'),(2,'C. Tiempo de trabajo',false,'No es el significado de "screen time".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 7 — Technology & Communication' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. A mano o escritos en computador',true,'Correcto: "written by hand or typed on a computer".'),(1,'B. Solo por correo postal',false,'No se menciona el correo postal.'),(2,'C. No se enviaban mensajes',false,'El texto dice que sí se escribían, de otra forma.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 7 — Technology & Communication' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 70, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 7 — Technology & Communication'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál es la voz pasiva de "They invented the internet"?'),
  (1, '¿Cuándo se usa la voz pasiva?'),
  (2, '¿Qué significa el phrasal verb "back up" (datos)?'),
  (3, '¿Qué significa el phrasal verb "scroll through"?'),
  (4, '¿Qué significa el phrasal verb "log in"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 7 — Technology & Communication' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. The internet was invented.',true,'Correcto: sujeto + was + past participle.'),(1,'B. The internet invented.',false,'Falta el verbo auxiliar "was".'),(2,'C. The internet is invented.',false,'Debe estar en pasado, no en presente.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 7 — Technology & Communication' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Cuando no importa o no sabemos quién hizo la acción',true,'Correcto.'),(1,'B. Solo en preguntas',false,'La voz pasiva no está limitada a preguntas.'),(2,'C. Solo con verbos irregulares',false,'La voz pasiva se usa con cualquier verbo transitivo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 7 — Technology & Communication' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Respaldar datos',true,'Correcto: "always back up your files".'),(1,'B. Borrar datos',false,'Es lo opuesto al significado real.'),(2,'C. Compartir datos',false,'No es el significado de "back up" en este contexto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 7 — Technology & Communication' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Desplazarse por una pantalla',true,'Correcto: "I scrolled through my feed for an hour".'),(1,'B. Escribir en una pantalla',false,'No es el significado de "scroll through".'),(2,'C. Romper una pantalla',false,'No es el significado de "scroll through".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 7 — Technology & Communication' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Iniciar sesión',true,'Correcto.'),(1,'B. Cerrar sesión',false,'Ese es el significado de "log out", no "log in".'),(2,'C. Crear una cuenta nueva',false,'No es el significado de "log in".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 7 — Technology & Communication' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
