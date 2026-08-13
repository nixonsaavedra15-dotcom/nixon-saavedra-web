-- ============================================================
-- Inglés B1 — Lote 6: Unidad 6 (Health & Lifestyle)
-- ============================================================
-- Requiere haber corrido antes: seed-ingles-b1-modules.sql y los
-- batches anteriores. Seguro de correr varias veces.
-- ============================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Unidad 6 — Health & Lifestyle",
    "subtitle": "Ya conoces el first conditional — ahora vamos a usarlo a fondo, en un tema donde aplica todos los días: la salud.",
    "guide_html": "<p>Esta unidad retoma el <strong>first conditional</strong> que vimos en la Unidad 3, pero ahora en profundidad y aplicado a un tema muy cotidiano: la salud y el estilo de vida. También vamos a ver cómo dar consejos de forma natural (más allá de 'should'), y vocabulario sobre bienestar, ejercicio y hábitos saludables.</p>",
    "objectives": [
      "Usar el first conditional con seguridad en distintos contextos",
      "Dar consejos de salud usando varias estructuras (should, if I were you, why don't you)",
      "Usar vocabulario de bienestar y hábitos saludables",
      "Hablar de tus propios hábitos de salud en inglés"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Small Changes, Big Difference",
    "html": "<p class='lead-in'>Lee este artículo sobre hábitos saludables. Fíjate en las estructuras condicionales y los consejos.</p><div class='reading-passage'><span class='passage-tag'>Wellness Blog</span>If you sleep less than six hours a night, you'll probably feel tired and less focused during the day. Doctors say that if you drink enough water, your energy levels will improve noticeably. Also, if you sit for most of the day, it's a good idea to take a short walk every hour — even five minutes will make a difference. If I were you, I'd try to go to bed and wake up at the same time every day; your body will thank you. Why don't you try cooking at home more often? If you eat more fruit and vegetables, you'll probably notice you have more energy within just a couple of weeks. Small changes really do add up.</div><h2>Vocabulario — Salud y bienestar</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>to feel focused</div><div class='mean'>sentirse concentrado</div></div><div class='vocab-item'><div class='word'>energy levels</div><div class='mean'>niveles de energía</div></div><div class='vocab-item'><div class='word'>to add up</div><div class='mean'>sumar, acumularse</div></div><div class='vocab-item'><div class='word'>a habit</div><div class='mean'>un hábito</div></div><div class='vocab-item'><div class='word'>to get enough sleep</div><div class='mean'>dormir lo suficiente</div></div><div class='vocab-item'><div class='word'>to work out</div><div class='mean'>hacer ejercicio</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>\"If I were you, I'd...\" es una forma muy común de dar consejo — literalmente \"si yo fuera tú\", aunque técnicamente use una estructura de segundo condicional (la veremos a fondo en la Unidad 8).</span></div><details class='mini-check'><summary>Según el texto, ¿qué pasa si duermes menos de 6 horas?</summary><div class='answer'>Probablemente te sentirás cansado y menos concentrado durante el día.</div></details><details class='mini-check'><summary>¿Qué sugiere el texto en vez de estar sentado todo el día?</summary><div class='answer'>Caminar unos minutos cada hora (take a short walk every hour).</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "First Conditional a fondo — y cómo dar consejos",
    "html": "<p class='lead-in'>Ya conoces la estructura básica. Ahora veamos variantes y matices.</p><table class='grammar-table'><tr><th>Estructura</th><th>Ejemplo</th></tr><tr><td>If + present simple, will + base</td><td>If you drink enough water, your energy <strong>will improve</strong>.</td></tr><tr><td>If + present simple, imperative</td><td>If you feel tired, <strong>take</strong> a short break.</td></tr><tr><td>If + present simple, modal (can/might)</td><td>If you exercise regularly, you <strong>might sleep</strong> better.</td></tr></table><h2>Formas de dar consejo</h2><div class='example-box'><div class='line'><span class='speaker'>should</span> You should drink more water.</div><div class='line'><span class='speaker'>if I were you</span> If I were you, I'd go to bed earlier.</div><div class='line'><span class='speaker'>why don't you</span> Why don't you try meditation?</div><div class='line'><span class='speaker'>it's a good idea to</span> It's a good idea to stretch before exercising.</div></div><div class='tip-box'><span class='icon'>💡</span><span>Variar entre estas cuatro formas de dar consejo hace que suenes mucho más natural — usar siempre \"should\" suena repetitivo y un poco robótico.</span></div><h2>Conectores de causa y efecto</h2><div class='connector-flow'><span class='conn-chip'>because</span><span class='conn-arrow'>→</span><span class='conn-chip'>as a result</span><span class='conn-arrow'>→</span><span class='conn-chip'>that's why</span><span class='conn-arrow'>→</span><span class='conn-chip'>therefore</span></div><h2>Phrasal verbs de salud</h2><div class='phrasal-grid'><div class='phrasal-item'><div class='pv'>work out</div><div class='pv-mean'>hacer ejercicio</div><div class='pv-ex'>I work out three times a week.</div></div><div class='phrasal-item'><div class='pv'>give up</div><div class='pv-mean'>dejar (un hábito), rendirse</div><div class='pv-ex'>He gave up smoking last year.</div></div><div class='phrasal-item'><div class='pv'>cut down on</div><div class='pv-mean'>reducir (algo)</div><div class='pv-ex'>I'm cutting down on sugar.</div></div><div class='phrasal-item'><div class='pv'>calm down</div><div class='pv-mean'>calmarse, relajarse</div><div class='pv-ex'>Yoga helps me calm down.</div></div></div><div class='mindmap-wrap'><div class='mindmap-hub'>Estilo de vida saludable</div><div class='mindmap-branches'><div class='mindmap-node'><div class='node-title'>Sueño</div><div class='node-items'>to get enough sleep, a habit</div></div><div class='mindmap-node'><div class='node-title'>Ejercicio</div><div class='node-items'>to work out, to stretch</div></div><div class='mindmap-node'><div class='node-title'>Alimentación</div><div class='node-items'>to cut down on, balanced diet</div></div><div class='mindmap-node'><div class='node-title'>Mente</div><div class='node-items'>to calm down, stress, to relax</div></div></div></div><details class='mini-check'><summary>Además de \"should\", ¿qué otras 3 formas de dar consejo viste en esta lección?</summary><div class='answer'>\"If I were you...\", \"Why don''t you...?\" y \"It''s a good idea to...\".</div></details>"
  },
  "interactive": {
    "title": "Flashcards — Dando consejos de salud",
    "intro": "Toca cada tarjeta para ver un ejemplo distinto de consejo.",
    "slides": [
      { "id":"s1", "icon":"💧", "title":"should", "bubble":"Da un consejo sobre tomar agua usando 'should'.", "detail":"You should drink more water every day." },
      { "id":"s2", "icon":"😴", "title":"if I were you", "bubble":"Da un consejo sobre dormir usando 'if I were you'.", "detail":"If I were you, I'd go to bed earlier." },
      { "id":"s3", "icon":"🧘", "title":"why don't you", "bubble":"Sugiere una actividad relajante.", "detail":"Why don't you try meditation or yoga?" },
      { "id":"s4", "icon":"🏃", "title":"work out", "bubble":"¿Qué significa este phrasal verb?", "detail":"Hacer ejercicio — 'I work out three times a week.'" },
      { "id":"s5", "icon":"🚭", "title":"give up", "bubble":"¿Qué significa este phrasal verb?", "detail":"Dejar un hábito o rendirse — 'He gave up smoking last year.'" },
      { "id":"s6", "icon":"🍬", "title":"cut down on", "bubble":"¿Qué significa este phrasal verb?", "detail":"Reducir algo — 'I'm cutting down on sugar.'" }
    ]
  },
  "practice": {
    "title": "Ahora te toca a ti",
    "html": "<p class='lead-in'>Lee este ejemplo y luego escribe tus propios consejos de salud.</p><div class='reading-passage'><div class='passage-tag'>Example</div>If you want more energy, you should try sleeping eight hours a night. Why don't you also cut down on coffee in the afternoon? If I were you, I'd start with small changes — as a result, they're much easier to keep long-term.</div><div class='tip-box'><span class='icon'>✍️</span><span><strong>Actividad de escritura:</strong> escribe 3 consejos de salud (uno con 'should', otro con 'if I were you', y otro con first conditional). Pueden ser consejos que tú mismo sigues o te gustaría seguir.</span></div>"
  },
  "speaking_tasks": [
    {
      "id": "u6-speaking-1",
      "label": "Habla en voz alta (30-45 segundos, en inglés) dando un consejo de salud a un amigo. Usa al menos dos formas distintas de dar consejo.",
      "keywords": ["should", "if", "were", "why", "healthy", "sleep", "exercise", "water"],
      "min_words": 25,
      "min_seconds": 20
    }
  ],
  "closing_form": {
    "title": "Sella lo aprendido en esta unidad",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id": "formas_consejo", "label": "Escribe 3 formas distintas de dar un consejo en inglés (con ejemplo).", "type": "textarea", "placeholder": "" },
      { "id": "first_conditional_salud", "label": "Escribe un first conditional sobre salud (if + presente, will + verbo).", "type": "textarea", "placeholder": "" },
      { "id": "mis_habitos", "label": "Escribe 2-3 oraciones en inglés sobre tus propios hábitos de salud.", "type": "textarea", "placeholder": "" },
      { "id": "dificultad", "label": "¿Qué fue lo más difícil de esta unidad para ti?", "type": "textarea", "placeholder": "" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 6 — Health & Lifestyle';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: Health & Lifestyle', 70, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 6 — Health & Lifestyle'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Según el texto, ¿qué pasa si duermes menos de 6 horas?'),
  (1, '¿Qué sugiere el texto en vez de estar sentado todo el día?'),
  (2, '¿Qué significa "energy levels"?'),
  (3, '¿Qué significa "to add up" en el texto?'),
  (4, '¿Qué recomienda el texto sobre cocinar?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 6 — Health & Lifestyle' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Te sentirás cansado y menos concentrado',true,'Correcto.'),(1,'B. Tendrás más energía',false,'Es lo opuesto a lo que dice el texto.'),(2,'C. No pasa nada',false,'El texto sí menciona consecuencias.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 6 — Health & Lifestyle' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Caminar unos minutos cada hora',true,'Correcto.'),(1,'B. Dormir más',false,'Ese es otro consejo del texto, pero no el relacionado con estar sentado.'),(2,'C. Tomar café',false,'No se menciona el café en el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 6 — Health & Lifestyle' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Niveles de energía',true,'Correcto.'),(1,'B. Niveles de estrés',false,'No es el significado de "energy levels".'),(2,'C. Horas de sueño',false,'No es el significado directo de la expresión.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 6 — Health & Lifestyle' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Sumar, acumularse',true,'Correcto: "small changes really do add up".'),(1,'B. Sumar dinero',false,'No es literalmente sobre dinero en este contexto.'),(2,'C. Terminar algo',false,'No es el significado de "add up" aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 6 — Health & Lifestyle' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Cocinar más en casa',true,'Correcto: "why don''t you try cooking at home more often?".'),(1,'B. Comer solo una vez al día',false,'No se menciona esto en el texto.'),(2,'C. Evitar cocinar',false,'Es lo opuesto a la recomendación del texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 6 — Health & Lifestyle' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 70, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 6 — Health & Lifestyle'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál de estas NO es una forma de dar consejo en inglés?'),
  (1, 'Completa: "If I ___ you, I''d sleep more."'),
  (2, '¿Qué significa el phrasal verb "give up"?'),
  (3, '¿Qué significa el phrasal verb "cut down on"?'),
  (4, '¿Qué significa el phrasal verb "work out" en este contexto?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 6 — Health & Lifestyle' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Why don''t you...?',false,'Sí es una forma de dar consejo (sugerencia).'),(1,'B. I don''t care',true,'Correcto: esta expresión no da ningún consejo, expresa indiferencia.'),(2,'C. If I were you...',false,'Sí es una forma común de dar consejo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 6 — Health & Lifestyle' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. am',false,'La expresión fija usa "were", no "am", incluso con "I".'),(1,'B. were',true,'Correcto: "If I were you..." es una expresión fija.'),(2,'C. was',false,'La forma correcta en esta expresión fija es "were", no "was".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 6 — Health & Lifestyle' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Dejar un hábito o rendirse',true,'Correcto: "he gave up smoking last year".'),(1,'B. Empezar algo nuevo',false,'Es lo contrario al significado de "give up".'),(2,'C. Subir de peso',false,'No es el significado de "give up".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 6 — Health & Lifestyle' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Reducir algo',true,'Correcto: "I''m cutting down on sugar".'),(1,'B. Cortar algo por completo',false,'"Cut down on" es reducir, no eliminar completamente.'),(2,'C. Aumentar algo',false,'Es lo opuesto al significado real.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 6 — Health & Lifestyle' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Hacer ejercicio',true,'Correcto: "I work out three times a week".'),(1,'B. Resolver un problema',false,'"Work out" tiene ese significado en otros contextos, pero aquí es sobre ejercicio.'),(2,'C. Trabajar horas extra',false,'No es el significado en este contexto de salud.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 6 — Health & Lifestyle' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
