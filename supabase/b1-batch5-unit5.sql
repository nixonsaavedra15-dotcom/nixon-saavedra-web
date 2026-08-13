-- ============================================================
-- Inglés B1 — Lote 5: Unidad 5 (The World of Work)
-- ============================================================
-- Requiere haber corrido antes: seed-ingles-b1-modules.sql y los
-- batches anteriores. Seguro de correr varias veces.
-- ============================================================

update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Unidad 5 — The World of Work",
    "subtitle": "'Must', 'have to' y 'should' se traducen parecido al español, pero no significan exactamente lo mismo.",
    "guide_html": "<p>Esta unidad gira en torno al mundo laboral: entrevistas, correos formales, y cómo hablar de obligaciones y consejos en inglés. Vamos a ver los <strong>modales de obligación</strong> (must, have to) y los de <strong>consejo</strong> (should), que son esenciales para sonar natural en un contexto profesional.</p>",
    "objectives": [
      "Usar correctamente 'must', 'have to' y 'should'",
      "Reconocer y usar vocabulario de entrevistas y trabajo",
      "Escribir un correo formal en inglés",
      "Hablar sobre tu experiencia laboral o profesional"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Preparing for a Job Interview",
    "html": "<p class='lead-in'>Lee estos consejos para una entrevista de trabajo. Fíjate en los modales.</p><div class='reading-passage'><span class='passage-tag'>Career Tips Blog</span>Before any job interview, you have to research the company — interviewers always notice when candidates haven't done this. You should also prepare answers for common questions, like \"What are your strengths?\" or \"Why do you want this job?\". On the day, you must arrive at least ten minutes early; being late is one of the biggest mistakes you can make. You don't have to memorize a script, but you should practise out loud at least once. And remember: you shouldn't badmouth your previous employer, no matter how bad the experience was. Finally, you have to send a short thank-you email within 24 hours — it shows professionalism and genuine interest.</div><h2>Vocabulario — Trabajo y entrevistas</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>a candidate</div><div class='mean'>un candidato</div></div><div class='vocab-item'><div class='word'>a strength</div><div class='mean'>una fortaleza</div></div><div class='vocab-item'><div class='word'>to badmouth</div><div class='mean'>hablar mal de alguien</div></div><div class='vocab-item'><div class='word'>an employer</div><div class='mean'>un empleador</div></div><div class='vocab-item'><div class='word'>a deadline</div><div class='mean'>una fecha límite</div></div><div class='vocab-item'><div class='word'>to apply for a position</div><div class='mean'>postularse a un cargo</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>\"You have to\" y \"you don't have to\" no son opuestos exactos: \"have to\" = obligación, \"don't have to\" = NO es necesario (pero puedes hacerlo si quieres).</span></div><details class='mini-check'><summary>¿Qué se recomienda enviar después de la entrevista?</summary><div class='answer'>Un correo corto de agradecimiento (a thank-you email), dentro de las 24 horas.</div></details><details class='mini-check'><summary>¿Qué NO deberías hacer, según el texto?</summary><div class='answer'>Hablar mal de tu empleador anterior (badmouth your previous employer).</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Must, Have To y Should — y el correo formal",
    "html": "<p class='lead-in'>Tres modales, tres matices distintos.</p><table class='grammar-table'><tr><th>Modal</th><th>Uso</th><th>Ejemplo</th></tr><tr><td>must</td><td>Obligación fuerte, a menudo por decisión personal o regla estricta</td><td>You <strong>must</strong> arrive early.</td></tr><tr><td>have to</td><td>Obligación externa (una regla, la empresa, la ley)</td><td>You <strong>have to</strong> research the company.</td></tr><tr><td>should</td><td>Consejo o recomendación, no obligatorio</td><td>You <strong>should</strong> practise out loud.</td></tr></table><div class='example-box'><div class='line'><span class='speaker'>✅</span> You don't have to wear a suit (no es obligatorio, pero puedes).</div><div class='line'><span class='speaker'>✅</span> You mustn't be late (está prohibido — muy diferente a \"don't have to\").</div></div><div class='tip-box'><span class='icon'>💡</span><span>Ojo con esta trampa: <strong>\"don't have to\"</strong> = no es necesario, pero <strong>\"mustn't\"</strong> = está prohibido. Son casi opuestos, aunque se parezcan.</span></div><h2>Estructura de un correo formal</h2><div class='connector-flow'><span class='conn-chip'>Dear Mr./Ms. ...</span><span class='conn-arrow'>→</span><span class='conn-chip'>I am writing to...</span><span class='conn-arrow'>→</span><span class='conn-chip'>I would like to...</span><span class='conn-arrow'>→</span><span class='conn-chip'>Best regards,</span></div><h2>Phrasal verbs de trabajo</h2><div class='phrasal-grid'><div class='phrasal-item'><div class='pv'>apply for</div><div class='pv-mean'>postularse a</div><div class='pv-ex'>I applied for the marketing position.</div></div><div class='phrasal-item'><div class='pv'>fill in / fill out</div><div class='pv-mean'>llenar (un formulario)</div><div class='pv-ex'>Please fill in this form.</div></div><div class='phrasal-item'><div class='pv'>follow up</div><div class='pv-mean'>dar seguimiento</div><div class='pv-ex'>I'll follow up next week.</div></div><div class='phrasal-item'><div class='pv'>take on</div><div class='pv-mean'>asumir (una responsabilidad)</div><div class='pv-ex'>She took on a new project.</div></div></div><div class='mindmap-wrap'><div class='mindmap-hub'>El mundo laboral</div><div class='mindmap-branches'><div class='mindmap-node'><div class='node-title'>Buscar empleo</div><div class='node-items'>a candidate, to apply, a CV</div></div><div class='mindmap-node'><div class='node-title'>La entrevista</div><div class='node-items'>a strength, a weakness</div></div><div class='mindmap-node'><div class='node-title'>En el trabajo</div><div class='node-items'>a deadline, a colleague, a task</div></div><div class='mindmap-node'><div class='node-title'>Comunicación</div><div class='node-items'>a formal email, to follow up</div></div></div></div><details class='mini-check'><summary>¿Cuál es la diferencia entre \"don't have to\" y \"mustn't\"?</summary><div class='answer'>\"Don''t have to\" significa que algo no es necesario (pero se puede hacer); \"mustn''t\" significa que algo está prohibido.</div></details>"
  },
  "interactive": {
    "type": "match",
    "title": "Empareja cada expresión con su significado",
    "intro": "Encuentra la pareja correcta para cada tarjeta.",
    "pairs": [
      { "left": "must", "right": "Obligación fuerte, regla estricta" },
      { "left": "have to", "right": "Obligación externa (empresa, ley)" },
      { "left": "should", "right": "Consejo, no obligatorio" },
      { "left": "mustn't", "right": "Está prohibido" },
      { "left": "don't have to", "right": "No es necesario, pero se puede" },
      { "left": "a candidate", "right": "Un candidato" },
      { "left": "follow up", "right": "Dar seguimiento" },
      { "left": "a deadline", "right": "Una fecha límite" }
    ]
  },
  "practice": {
    "title": "Ahora te toca a ti",
    "html": "<p class='lead-in'>Lee este ejemplo de correo formal y luego escribe el tuyo.</p><div class='reading-passage'><div class='passage-tag'>Example — formal email</div>Dear Ms. Herrera,<br><br>I am writing to apply for the Marketing Assistant position advertised on your website. I have three years of experience in digital marketing and I believe I would be a strong addition to your team. I have attached my CV for your consideration.<br><br>I would be available for an interview at any time that suits you.<br><br>Best regards,<br>Laura Gómez</div><div class='tip-box'><span class='icon'>✍️</span><span><strong>Actividad de escritura:</strong> escribe un correo formal corto (5-7 oraciones) solicitando información sobre un trabajo o postulándote a uno. Usa al menos <strong>un modal (must/have to/should)</strong> y la estructura formal que vimos.</span></div>"
  },
  "speaking_tasks": [
    {
      "id": "u5-speaking-1",
      "label": "Habla en voz alta (30-45 segundos, en inglés) sobre tu trabajo o profesión ideal. Usa al menos un modal (must, have to o should).",
      "keywords": ["have to", "must", "should", "work", "job", "company", "team", "responsible"],
      "min_words": 25,
      "min_seconds": 20
    }
  ],
  "closing_form": {
    "title": "Sella lo aprendido en esta unidad",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id": "modales", "label": "Explica la diferencia entre 'must', 'have to' y 'should' con tus propias palabras.", "type": "textarea", "placeholder": "" },
      { "id": "trampa_mustnt", "label": "Explica la diferencia entre 'don't have to' y 'mustn't'.", "type": "textarea", "placeholder": "" },
      { "id": "mi_trabajo", "label": "Escribe 2-3 oraciones en inglés sobre tu trabajo o profesión.", "type": "textarea", "placeholder": "" },
      { "id": "dificultad", "label": "¿Qué fue lo más difícil de esta unidad para ti?", "type": "textarea", "placeholder": "" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ingles-b1')
and title = 'Unit 5 — The World of Work';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: The World of Work', 70, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 5 — The World of Work'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué se recomienda enviar después de la entrevista?'),
  (1, '¿Qué NO deberías hacer, según el texto?'),
  (2, '¿Qué significa "a candidate"?'),
  (3, '¿Qué significa "a strength" en el contexto de una entrevista?'),
  (4, '¿Qué significa "badmouth"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 5 — The World of Work' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Un correo de agradecimiento',true,'Correcto: "a thank-you email".'),(1,'B. Una llamada telefónica',false,'El texto habla de un correo, no de una llamada.'),(2,'C. Un regalo',false,'No se menciona ningún regalo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 5 — The World of Work' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Hablar mal del empleador anterior',true,'Correcto.'),(1,'B. Llegar temprano',false,'Llegar temprano sí se recomienda, no es algo a evitar.'),(2,'C. Investigar la empresa',false,'Investigar la empresa también se recomienda.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 5 — The World of Work' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Un candidato',true,'Correcto.'),(1,'B. Un jefe',false,'No es el significado de "candidate".'),(2,'C. Un formulario',false,'No es el significado de "candidate".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 5 — The World of Work' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Una fortaleza',true,'Correcto.'),(1,'B. Una debilidad',false,'Es lo opuesto a "strength".'),(2,'C. Un salario',false,'No es el significado de "strength".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 5 — The World of Work' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Hablar mal de alguien',true,'Correcto.'),(1,'B. Felicitar a alguien',false,'Es lo contrario al significado real.'),(2,'C. Ignorar a alguien',false,'No es el significado de "badmouth".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 5 — The World of Work' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 70, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-b1' and m.title = 'Unit 5 — The World of Work'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué significa "mustn''t"?'),
  (1, '¿Qué significa "don''t have to"?'),
  (2, '¿Cuál se usa para dar un consejo, no una obligación?'),
  (3, '¿Cómo empieza normalmente un correo formal en inglés?'),
  (4, '¿Qué significa el phrasal verb "follow up"?')
) as v(order_index, prompt)
where c.slug = 'ingles-b1' and m.title = 'Unit 5 — The World of Work' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Está prohibido',true,'Correcto.'),(1,'B. No es necesario',false,'Ese es el significado de "don''t have to", no "mustn''t".'),(2,'C. Es obligatorio',false,'"Mustn''t" es justamente lo opuesto — una prohibición.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 5 — The World of Work' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. No es necesario, pero se puede hacer',true,'Correcto.'),(1,'B. Está prohibido',false,'Ese es el significado de "mustn''t", no "don''t have to".'),(2,'C. Es obligatorio',false,'"Don''t have to" es lo contrario a una obligación.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 5 — The World of Work' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. should',true,'Correcto: "should" se usa para consejos, no obligaciones.'),(1,'B. must',false,'"Must" es obligación fuerte, no un consejo.'),(2,'C. have to',false,'"Have to" es obligación externa, no un consejo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 5 — The World of Work' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Dear Mr./Ms. + apellido',true,'Correcto.'),(1,'B. Hey there!',false,'Es demasiado informal para un correo formal.'),(2,'C. What''s up?',false,'Es una expresión muy informal, no apropiada para un correo formal.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 5 — The World of Work' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'A. Dar seguimiento',true,'Correcto: "I''ll follow up next week".'),(1,'B. Seguir a alguien en redes sociales',false,'No es ese el significado en este contexto laboral.'),(2,'C. Caminar detrás de alguien',false,'No es el significado de "follow up".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-b1' and m.title='Unit 5 — The World of Work' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
