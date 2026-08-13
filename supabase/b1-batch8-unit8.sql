-- ============================================================
-- Inglés B1 — Lote 8: Unidad 8 (Environment & Society)
-- ============================================================
-- Requiere haber corrido antes: seed-ingles-b1-modules.sql y los
-- batches anteriores. Seguro de correr varias veces.
-- ============================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Unidad 8 — Environment & Society",
    "subtitle": "\"If everyone recycled, the planet would be healthier\" — bienvenido al mundo hipotético del second conditional.",
    "guide_html": "<p>En esta unidad hablamos de medio ambiente y sociedad, comparando situaciones (comparativos y superlativos) e imaginando escenarios hipotéticos con el <strong>second conditional</strong> — algo distinto al first conditional que ya conoces, porque aquí hablamos de situaciones improbables o imaginarias, no de planes reales.</p>",
    "objectives": [
      "Usar correctamente comparativos y superlativos",
      "Formar y usar el second conditional para situaciones hipotéticas",
      "Usar vocabulario de medio ambiente y sostenibilidad",
      "Hablar de cambios que te gustaría ver en el mundo"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "If We All Did a Little More",
    "html": "<p class='lead-in'>Lee este texto sobre sostenibilidad. Fíjate en las comparaciones y las situaciones hipotéticas.</p><div class='reading-passage'><span class='passage-tag'>Environment Today</span>Plastic pollution is one of the biggest problems our planet faces today — it's more dangerous than most people realise, and it's getting worse every year. If everyone recycled properly, we would produce much less waste. If more people used public transport instead of cars, cities would be cleaner and quieter. Some countries are already doing better than others: for example, some European countries recycle a lot more than the world average. If I had more time, I would volunteer for a local environmental group — it's one of the easiest ways to make a real difference. The most important thing to remember is that small actions, multiplied by millions of people, can create huge change.</div><h2>Vocabulario — Medio ambiente</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>pollution</div><div class='mean'>contaminación</div></div><div class='vocab-item'><div class='word'>waste</div><div class='mean'>desperdicio, basura</div></div><div class='vocab-item'><div class='word'>to recycle</div><div class='mean'>reciclar</div></div><div class='vocab-item'><div class='word'>sustainable</div><div class='mean'>sostenible</div></div><div class='vocab-item'><div class='word'>to make a difference</div><div class='mean'>hacer la diferencia</div></div><div class='vocab-item'><div class='word'>a resource</div><div class='mean'>un recurso</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>\"If everyone recycled, we <strong>would produce</strong> less waste\" — usamos second conditional porque es una situación hipotética (no es lo que realmente pasa ahora).</span></div><details class='mini-check'><summary>Según el texto, ¿qué pasaría si más gente usara transporte público?</summary><div class='answer'>Las ciudades serían más limpias y silenciosas.</div></details><details class='mini-check'><summary>¿Qué haría el autor si tuviera más tiempo?</summary><div class='answer'>Sería voluntario en un grupo ambiental local.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Comparativos, Superlativos y el Second Conditional",
    "html": "<p class='lead-in'>Vamos por partes: primero las comparaciones, luego el mundo hipotético.</p><table class='grammar-table'><tr><th>Tipo</th><th>Regla</th><th>Ejemplo</th></tr><tr><td>Comparativo (cortos)</td><td>adjetivo + -er + than</td><td>cleaner <strong>than</strong>, bigger <strong>than</strong></td></tr><tr><td>Comparativo (largos)</td><td>more + adjetivo + than</td><td><strong>more</strong> dangerous <strong>than</strong></td></tr><tr><td>Superlativo (cortos)</td><td>the + adjetivo + -est</td><td>the clean<strong>est</strong></td></tr><tr><td>Superlativo (largos)</td><td>the most + adjetivo</td><td>the <strong>most</strong> important</td></tr></table><h2>Second Conditional</h2><table class='grammar-table'><tr><th>Estructura</th><th>Ejemplo</th></tr><tr><td>If + past simple, would + base</td><td>If everyone <strong>recycled</strong>, we <strong>would produce</strong> less waste.</td></tr></table><div class='example-box'><div class='line'><span class='speaker'>First conditional</span> If it rains, I'll stay home. (real, posible)</div><div class='line'><span class='speaker'>Second conditional</span> If I were rich, I would travel the world. (hipotético, improbable)</div></div><div class='tip-box'><span class='icon'>💡</span><span>Con \"be\", en el second conditional usamos <strong>\"were\"</strong> para todas las personas (I were, he were, she were) — no \"was\", aunque suene raro. Es una excepción muy común.</span></div><h2>Conectores comparativos</h2><div class='connector-flow'><span class='conn-chip'>compared to</span><span class='conn-arrow'>→</span><span class='conn-chip'>unlike</span><span class='conn-arrow'>→</span><span class='conn-chip'>whereas</span><span class='conn-arrow'>→</span><span class='conn-chip'>on the other hand</span></div><h2>Phrasal verbs de sostenibilidad</h2><div class='phrasal-grid'><div class='phrasal-item'><div class='pv'>throw away</div><div class='pv-mean'>botar, desechar</div><div class='pv-ex'>Don't throw away plastic bottles.</div></div><div class='phrasal-item'><div class='pv'>clean up</div><div class='pv-mean'>limpiar</div><div class='pv-ex'>We cleaned up the beach on Saturday.</div></div><div class='phrasal-item'><div class='pv'>cut back on</div><div class='pv-mean'>reducir el consumo de</div><div class='pv-ex'>We should cut back on plastic.</div></div><div class='phrasal-item'><div class='pv'>look after</div><div class='pv-mean'>cuidar de</div><div class='pv-ex'>We need to look after our planet.</div></div></div><div class='mindmap-wrap'><div class='mindmap-hub'>Medio ambiente y sociedad</div><div class='mindmap-branches'><div class='mindmap-node'><div class='node-title'>Problemas</div><div class='node-items'>pollution, waste, climate change</div></div><div class='mindmap-node'><div class='node-title'>Soluciones</div><div class='node-items'>to recycle, sustainable, a resource</div></div><div class='mindmap-node'><div class='node-title'>Acción individual</div><div class='node-items'>to make a difference, volunteer</div></div><div class='mindmap-node'><div class='node-title'>Comparaciones</div><div class='node-items'>cleaner than, the most important</div></div></div></div><details class='mini-check'><summary>¿Qué forma de \"be\" se usa en el second conditional, incluso con \"I\"?</summary><div class='answer'>\"Were\" — se dice \"if I were\", no \"if I was\".</div></details>"
  },
  "interactive": {
    "title": "Flashcards — Comparativos y second conditional",
    "intro": "Toca cada tarjeta para revelar la forma correcta.",
    "slides": [
      { "id":"s1", "icon":"🌍", "title":"dangerous (largo)", "bubble":"¿Cómo se forma el comparativo de un adjetivo largo?", "detail":"more dangerous than — se usa 'more' + adjetivo + 'than'." },
      { "id":"s2", "icon":"🧼", "title":"clean (corto)", "bubble":"¿Cómo se forma el comparativo de un adjetivo corto?", "detail":"cleaner than — se añade '-er' al final." },
      { "id":"s3", "icon":"⭐", "title":"important (superlativo)", "bubble":"¿Cómo se forma el superlativo de un adjetivo largo?", "detail":"the most important — se usa 'the most' + adjetivo." },
      { "id":"s4", "icon":"🔮", "title":"If I were rich...", "bubble":"¿Qué tipo de condicional es este y por qué?", "detail":"Second conditional — es una situación hipotética, poco probable." },
      { "id":"s5", "icon":"🗑️", "title":"throw away", "bubble":"¿Qué significa este phrasal verb?", "detail":"Botar o desechar algo — 'Don't throw away plastic bottles.'" },
      { "id":"s6", "icon":"🧹", "title":"clean up", "bubble":"¿Qué significa este phrasal verb?", "detail":"Limpiar — 'We cleaned up the beach on Saturday.'" }
    ]
  },
  "practice": {
    "title": "Ahora te toca a ti",
    "html": "<p class='lead-in'>Lee este ejemplo y luego imagina tu propio mundo hipotético.</p><div class='reading-passage'><div class='passage-tag'>Example</div>If I were the mayor of my city, I would create more parks and bike lanes. Cities with more green spaces are healthier than cities without them. If everyone cut back on plastic, our oceans would be much cleaner.</div><div class='tip-box'><span class='icon'>✍️</span><span><strong>Actividad de escritura:</strong> escribe un párrafo corto (5-7 oraciones) sobre qué cambiarías en tu ciudad o en el mundo si pudieras. Usa <strong>al menos 2 second conditionals</strong> y <strong>un comparativo o superlativo</strong>.</span></div>"
  },
  "speaking_tasks": [
    {
      "id": "u8-speaking-1",
      "label": "Habla en voz alta (30-45 segundos, en inglés) sobre qué harías si pudieras cambiar algo del medio ambiente. Usa al menos un second conditional.",
      "keywords": ["if", "would", "were", "recycle", "environment", "planet", "better", "cleaner"],
      "min_words": 25,
      "min_seconds": 20
    }
  ],
  "closing_form": {
    "title": "Sella lo aprendido en esta unidad",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id": "second_conditional", "label": "Explica con tus palabras cuándo se usa el second conditional.", "type": "textarea", "placeholder": "" },
      { "id": "comparativo_propio", "label": "Escribe un comparativo y un superlativo con tus propias palabras.", "type": "textarea", "placeholder": "" },
      { "id": "mi_mundo_ideal", "label": "Escribe 2-3 oraciones en inglés sobre qué cambiarías en el mundo si pudieras.", "type": "textarea", "placeholder": "" },
      { "id": "dificultad", "label": "¿Qué fue lo más difícil de esta unidad para ti?", "type": "textarea", "placeholder": "" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 8 — Environment & Society';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: Environment & Society', 70, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 8 — Environment & Society'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Según el texto, ¿qué pasaría si más gente usara transporte público?'),
  (1, '¿Qué haría el autor si tuviera más tiempo?'),
  (2, '¿Qué significa "to make a difference"?'),
  (3, '¿Qué significa "sustainable"?'),
  (4, '¿Qué países recicla más, según el texto?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 8 — Environment & Society' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Las ciudades serían más limpias y silenciosas',true,'Correcto.'),(1,'B. Habría más contaminación',false,'Es lo opuesto a lo que dice el texto.'),(2,'C. No cambiaría nada',false,'El texto sí menciona un cambio positivo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 8 — Environment & Society' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Sería voluntario en un grupo ambiental',true,'Correcto.'),(1,'B. Viajaría por el mundo',false,'No es lo que dice este texto sobre el autor.'),(2,'C. Cambiaría de trabajo',false,'No se menciona esto en el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 8 — Environment & Society' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Hacer la diferencia',true,'Correcto.'),(1,'B. Cambiar de opinión',false,'No es el significado de la expresión.'),(2,'C. Diferenciarse de los demás',false,'No es el significado en este contexto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 8 — Environment & Society' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Sostenible',true,'Correcto.'),(1,'B. Contaminante',false,'Es prácticamente lo opuesto a "sustainable".'),(2,'C. Costoso',false,'No es el significado de "sustainable".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 8 — Environment & Society' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Algunos países europeos',true,'Correcto: "some European countries recycle a lot more than the world average".'),(1,'B. Todos los países por igual',false,'El texto dice que hay diferencias entre países.'),(2,'C. Ningún país recicla bien',false,'El texto menciona países que sí reciclan bien.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 8 — Environment & Society' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 70, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 8 — Environment & Society'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál es la forma correcta de "be" en el second conditional, incluso con "I"?'),
  (1, '¿Cuál es el comparativo correcto de "dangerous" (adjetivo largo)?'),
  (2, '¿Cuál es el superlativo correcto de "clean" (adjetivo corto)?'),
  (3, '¿Qué significa el phrasal verb "throw away"?'),
  (4, '¿Qué significa el phrasal verb "look after"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 8 — Environment & Society' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. was',false,'En el second conditional se usa "were", no "was", incluso con "I".'),(1,'B. were',true,'Correcto: "if I were rich...".'),(2,'C. am',false,'"Am" no se usa en la estructura del second conditional.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 8 — Environment & Society' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. dangerouser than',false,'Los adjetivos largos no se comparan con "-er".'),(1,'B. more dangerous than',true,'Correcto: adjetivos largos usan "more" + adjetivo.'),(2,'C. most dangerous than',false,'"Most" se usa para el superlativo, no el comparativo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 8 — Environment & Society' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. the most clean',false,'Los adjetivos cortos no usan "the most".'),(1,'B. the cleanest',true,'Correcto: adjetivos cortos usan "the" + adjetivo + "-est".'),(2,'C. the cleaner',false,'"Cleaner" es el comparativo, no el superlativo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 8 — Environment & Society' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Botar, desechar',true,'Correcto.'),(1,'B. Guardar algo',false,'Es lo opuesto al significado real.'),(2,'C. Reciclar',false,'No es exactamente el mismo significado que "recycle".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 8 — Environment & Society' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Cuidar de algo o alguien',true,'Correcto: "we need to look after our planet".'),(1,'B. Buscar algo perdido',false,'No es el significado de "look after".'),(2,'C. Mirar hacia atrás',false,'No es el significado de "look after".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 8 — Environment & Society' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
