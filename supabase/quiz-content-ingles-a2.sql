-- ============================================================
-- Contenido de cuestionarios — Inglés A2 (8 módulos)
-- ============================================================
-- Requiere haber corrido antes: schema.sql, seed-ingles-a2.sql y
-- quiz-schema.sql. Pega esto completo en SQL Editor y dale Run.
-- Todos los módulos son de intentos ilimitados, excepto
-- "Certificación", que es el examen final (3 intentos, 24h de
-- espera antes del último intento).
-- ============================================================

-- ============================================================
-- Módulo 0: Introducción
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Introducción', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Introducción'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuántas horas dura el curso de Inglés A2?'),
  (1, '¿A qué nivel equivale este curso?'),
  (2, '¿Cuáles son las 5 habilidades que se trabajan en este curso?'),
  (3, '¿Qué necesitas para aprobar el examen final y obtener tu certificado?'),
  (4, '¿Qué herramienta se usa en el curso para practicar Speaking (grabar tu voz)?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Introducción'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'20 horas',false,'El curso tiene más horas que esas.'),(1,'40 horas',true,'Correcto: el curso tiene 40 horas de contenido.'),(2,'60 horas',false,'El curso tiene menos horas que esas.'),(3,'10 horas',false,'El curso tiene muchas más horas que esas.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Introducción' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'C1 Advanced',false,'Ese es un nivel mucho más avanzado.'),(1,'A2 / Cambridge KEY',true,'Correcto: el curso corresponde al nivel A2, equivalente a Cambridge KEY.'),(2,'B2 First',false,'Ese es un nivel más avanzado que A2.'),(3,'Nativo',false,'El curso está pensado para nivel A2, no para hablantes nativos.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Introducción' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Solo gramática y vocabulario',false,'El curso cubre más habilidades que esas dos.'),(1,'Gramática, writing, reading, listening y speaking',true,'Correcto: el curso cubre las cinco habilidades del idioma.'),(2,'Solo listening y speaking',false,'El curso cubre más habilidades que esas dos.'),(3,'Solo writing y reading',false,'El curso cubre más habilidades que esas dos.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Introducción' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Una nota de al menos 75/100',true,'Correcto: necesitas 75/100 o más para aprobar cada módulo y el examen final.'),(1,'Asistir a una clase presencial',false,'El curso es 100% en línea, a tu ritmo.'),(2,'Pagar una cuota adicional',false,'No hay costos adicionales para certificarte.'),(3,'Nada, el certificado es automático',false,'El certificado se emite solo después de aprobar todos los módulos.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Introducción' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Zoom',false,'Zoom no es la herramienta usada para las grabaciones de Speaking.'),(1,'Vocaroo',true,'Correcto: el curso usa Vocaroo para las actividades de grabación de voz.'),(2,'Google Meet',false,'No es la herramienta usada para las grabaciones de Speaking.'),(3,'WhatsApp',false,'No es la herramienta usada para las grabaciones de Speaking.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Introducción' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 1: Gramática A2 — Presente simple
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Presente simple', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Gramática A2 — Presente simple'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"She _____ to the gym every morning." (presente simple, tercera persona)'),
  (1, '"_____ you like coffee?" (pregunta en presente simple)'),
  (2, '"My brother _____ not like vegetables." (negativo, tercera persona)'),
  (3, '¿Cuál pregunta en presente simple con "where" está correctamente formada?'),
  (4, '"They _____ breakfast at 7 a.m. every day." (afirmativo, plural)')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Gramática A2 — Presente simple'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'go',false,'Falta la "s" de la tercera persona singular.'),(1,'goes',true,'Correcto: con "she/he/it" se agrega "s" en presente simple.'),(2,'going',false,'Esa forma se usa con "is/are" (presente continuo), no sola.'),(3,'gone',false,'Esa es la forma de participio, no de presente simple.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Gramática A2 — Presente simple' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Does',false,'"Does" se usa con "he/she/it", no con "you".'),(1,'Do',true,'Correcto: "Do you like...?" — con "you" se usa "do".'),(2,'Are',false,'No se usa "to be" para preguntar sobre gustos con este verbo.'),(3,'Is',false,'No se usa "to be" para preguntar sobre gustos con este verbo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Gramática A2 — Presente simple' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'do',false,'Con "my brother" (tercera persona) se usa "does", no "do".'),(1,'does',true,'Correcto: "does not" (doesn''t) con tercera persona singular.'),(2,'is',false,'No es el auxiliar correcto para este verbo en presente simple.'),(3,'don''t',false,'"Don''t" no concuerda con la tercera persona singular.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Gramática A2 — Presente simple' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Where you live?',false,'Falta el auxiliar "do".'),(1,'Where do you live?',true,'Correcto: sigue el orden Wh + auxiliar + sujeto + verbo.'),(2,'Where you do live?',false,'El orden del auxiliar está mal ubicado.'),(3,'Where does you live?',false,'Con "you" se usa "do", no "does".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Gramática A2 — Presente simple' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'eats',false,'Con "they" (plural) no se agrega "s" al verbo.'),(1,'eat',true,'Correcto: con sujetos plurales el verbo va sin "s" en presente simple.'),(2,'eating',false,'Esa forma requiere "is/are" antes (presente continuo).'),(3,'ate',false,'Esa es la forma de pasado simple, no presente.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Gramática A2 — Presente simple' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 2: Gramática A2 — To Be, preposiciones y adverbios
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — To Be, preposiciones y adverbios', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Gramática A2 — To Be, preposiciones y adverbios'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"I _____ a student at this school." (verbo to be, primera persona)'),
  (1, '"They _____ happy about the news." (verbo to be, plural)'),
  (2, '"The keys are _____ the table." (preposición: "sobre")'),
  (3, '"We usually go to school _____ 7:30 in the morning." (preposición de tiempo)'),
  (4, '"He runs very _____." (adverbio de "quick")')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Gramática A2 — To Be, preposiciones y adverbios'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'is',false,'"Is" se usa con "he/she/it", no con "I".'),(1,'am',true,'Correcto: "I am" es la forma correcta de "to be" con "I".'),(2,'are',false,'"Are" se usa con "you/we/they", no con "I".'),(3,'be',false,'Falta conjugar el verbo "to be".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Gramática A2 — To Be, preposiciones y adverbios' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'is',false,'"Is" se usa con sujetos singulares, no con "they".'),(1,'are',true,'Correcto: con "they" se usa "are".'),(2,'am',false,'"Am" solo se usa con "I".'),(3,'was',false,'Esa es la forma de pasado, y la oración está en presente.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Gramática A2 — To Be, preposiciones y adverbios' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'on',true,'Correcto: "on the table" — sobre la mesa.'),(1,'in',false,'"In" se usaría si estuvieran dentro de algo, no encima.'),(2,'at',false,'No es la preposición de lugar correcta aquí.'),(3,'under',false,'"Under" significa "debajo de", justo lo contrario.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Gramática A2 — To Be, preposiciones y adverbios' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'in',false,'"In" se usa para meses, años o partes largas del día, no para una hora exacta.'),(1,'at',true,'Correcto: "at" se usa con horas exactas, como "at 7:30".'),(2,'on',false,'"On" se usa con días y fechas, no con horas.'),(3,'for',false,'No es la preposición de tiempo correcta aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Gramática A2 — To Be, preposiciones y adverbios' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'quick',false,'"Quick" es adjetivo; se necesita un adverbio para modificar el verbo "runs".'),(1,'quickly',true,'Correcto: "quickly" es el adverbio correspondiente a "quick".'),(2,'quicker',false,'Es un comparativo, no un adverbio simple.'),(3,'quickness',false,'Es un sustantivo, no un adverbio.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Gramática A2 — To Be, preposiciones y adverbios' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 3: Writing
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Writing', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Writing'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál conector es más apropiado para AGREGAR una idea? "I like tennis. _____, I enjoy swimming."'),
  (1, '¿Qué conector expresa CONTRASTE? "The weather was cold. _____, we went for a walk."'),
  (2, '¿Qué conector expresa CAUSA o RAZÓN? "I stayed home _____ I was sick."'),
  (3, 'Al escribir un texto corto en inglés, ¿cuál es una buena práctica para que se entienda mejor?'),
  (4, '¿Qué conector es correcto? "She studied hard, _____ she passed the exam."')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Writing'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'However',false,'"However" introduce un contraste, no agrega una idea similar.'),(1,'Also',true,'Correcto: "also" agrega información similar.'),(2,'Because',false,'"Because" da una razón, no agrega una idea.'),(3,'Although',false,'"Although" introduce un contraste, no una idea adicional.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Writing' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Also',false,'"Also" agrega una idea similar, no contrasta.'),(1,'However',true,'Correcto: "however" introduce una idea que contrasta con la anterior.'),(2,'And',false,'"And" simplemente une ideas, no contrasta.'),(3,'So',false,'"So" expresa consecuencia, no contraste.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Writing' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'because',true,'Correcto: "because" introduce una razón.'),(1,'but',false,'"But" expresa contraste, no una razón.'),(2,'so',false,'"So" expresa consecuencia, no causa — sería al revés.'),(3,'although',false,'"Although" introduce un contraste, no una razón.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Writing' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Escribir oraciones muy largas sin puntuación',false,'Eso dificulta la comprensión del texto.'),(1,'Usar oraciones claras y conectores para unir ideas',true,'Correcto: la claridad y los conectores hacen el texto más fácil de seguir.'),(2,'Evitar usar mayúsculas',false,'Las mayúsculas son necesarias para nombres propios y el inicio de oraciones.'),(3,'Repetir la misma palabra en cada oración',false,'Repetir demasiado hace el texto menos natural.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Writing' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'so',true,'Correcto: "so" introduce una consecuencia lógica.'),(1,'because',false,'Invertiría la relación causa-efecto de la oración.'),(2,'however',false,'No expresa la consecuencia que necesita esta oración.'),(3,'although',false,'"Although" introduce un contraste, no encaja con el sentido de la oración.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Writing' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 4: Reading
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Reading', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Reading'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Texto: "Tom lives in a small apartment near the city center. Every morning, he takes the bus to work because it is faster than walking. He works as a chef in a busy restaurant. After work, he likes to cook new recipes at home and share photos with his friends online." ¿Cómo va Tom al trabajo?'),
  (1, 'Según el mismo texto, ¿cuál es la profesión de Tom?'),
  (2, '¿Por qué Tom prefiere el bus en vez de caminar?'),
  (3, '¿Qué le gusta hacer a Tom después del trabajo?'),
  (4, '¿Qué hace Tom con las fotos de sus recetas?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Reading'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Caminando',false,'El texto dice que va en bus.'),(1,'En bus',true,'Correcto: "he takes the bus to work".'),(2,'En bicicleta',false,'El texto dice que va en bus.'),(3,'En carro',false,'El texto dice que va en bus.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Chef',true,'Correcto: "he works as a chef".'),(1,'Profesor',false,'El texto dice que es chef.'),(2,'Conductor de bus',false,'El texto dice que es chef.'),(3,'Fotógrafo',false,'El texto dice que es chef.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Porque es más barato',false,'El texto no menciona el precio.'),(1,'Porque es más rápido',true,'Correcto: "because it is faster than walking".'),(2,'Porque no le gusta caminar',false,'El texto no dice eso.'),(3,'Porque vive muy lejos',false,'El texto dice que vive cerca del centro.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Ver televisión',false,'El texto no menciona eso.'),(1,'Cocinar nuevas recetas',true,'Correcto: "he likes to cook new recipes at home".'),(2,'Hacer ejercicio',false,'El texto no menciona eso.'),(3,'Dormir temprano',false,'El texto no menciona eso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Las guarda solo para él',false,'El texto dice que las comparte.'),(1,'Las comparte con sus amigos en línea',true,'Correcto: "share photos with his friends online".'),(2,'Las imprime',false,'El texto no menciona eso.'),(3,'Las borra',false,'El texto no menciona eso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Reading' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 5: Listening
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Listening', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Listening'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Transcripción: "Waiter: Good evening! Are you ready to order? Customer: Yes, I''d like the chicken salad, please. Waiter: Would you like anything to drink? Customer: Just water, thank you." ¿Qué pide el cliente para comer?'),
  (1, 'Según la misma conversación, ¿qué pide el cliente para tomar?'),
  (2, '¿Quién habla primero en la conversación?'),
  (3, 'Al practicar listening, ¿cuál es una estrategia recomendada?'),
  (4, '¿Qué tipo de expresión es "Good evening"?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Listening'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Chicken salad',true,'Correcto: "I''d like the chicken salad".'),(1,'Chicken soup',false,'El cliente pidió ensalada, no sopa.'),(2,'Fruit salad',false,'El cliente pidió ensalada de pollo, no de fruta.'),(3,'Pizza',false,'No es lo que pidió el cliente.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Listening' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Coffee',false,'El cliente pidió agua, no café.'),(1,'Water',true,'Correcto: "Just water, thank you".'),(2,'Juice',false,'El cliente pidió agua, no jugo.'),(3,'Nothing',false,'Sí pidió algo: agua.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Listening' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'El cliente',false,'El mesero habla primero.'),(1,'El mesero',true,'Correcto: "Waiter: Good evening!" habla primero.'),(2,'Ninguno, es un monólogo',false,'Es un diálogo entre dos personas.'),(3,'No se puede saber',false,'Sí se puede saber, está indicado en la transcripción.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Listening' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Escuchar el audio una sola vez y no repetirlo nunca',false,'Repetir el audio ayuda mucho más a comprenderlo.'),(1,'Escuchar el audio varias veces: primero la idea general, luego los detalles',true,'Correcto: repetir el audio ayuda a captar primero el sentido general y después los detalles.'),(2,'Leer la transcripción antes de intentar escuchar',false,'Es mejor intentar escuchar primero sin apoyo, para entrenar el oído.'),(3,'Evitar practicar con conversaciones reales',false,'Practicar con conversaciones reales es justamente lo recomendado.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Listening' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Una despedida',false,'"Good evening" se usa al llegar, no al despedirse.'),(1,'Un saludo',true,'Correcto: "Good evening" es un saludo usado por la tarde/noche.'),(2,'Una pregunta',false,'No es una pregunta.'),(3,'Una orden',false,'No es una orden.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Listening' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 6: Speaking
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Speaking', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Speaking'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Al grabar tu práctica de Speaking en Vocaroo, ¿qué es lo más importante?'),
  (1, '¿Cuál es una buena forma de practicar pronunciación según el curso?'),
  (2, 'Frase para presentarte: "Hi, my name is Laura and I _____ from Bogotá." ¿Qué verbo completa correctamente?'),
  (3, '¿Cuál expresión es apropiada para pedirle a alguien que repita algo que no entendiste?'),
  (4, 'Para sonar más natural al hablar, ¿qué recomienda el curso?')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Speaking'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Hablar lo más rápido posible',false,'La velocidad no es lo más importante, sí la claridad.'),(1,'Hablar con claridad, aunque cometas algún error',true,'Correcto: la claridad y la fluidez importan más que la perfección.'),(2,'No grabar si no estás seguro',false,'La práctica requiere grabarte, incluso con errores — así se aprende.'),(3,'Leer el texto sin pronunciarlo en voz alta',false,'El objetivo de Speaking es practicar la pronunciación en voz alta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Speaking' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Imitar (shadowing) a hablantes nativos en videos cortos',true,'Correcto: el "shadowing" ayuda a mejorar pronunciación y ritmo.'),(1,'Evitar escuchar inglés hablado',false,'Escuchar inglés hablado es esencial para mejorar la pronunciación.'),(2,'Memorizar reglas gramaticales sin practicar hablar',false,'La gramática ayuda, pero no reemplaza la práctica oral.'),(3,'Hablar solo en tu idioma nativo',false,'Eso no ayuda a practicar el inglés hablado.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Speaking' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'am',true,'Correcto: "I am from Bogotá" — verbo to be con "I".'),(1,'is',false,'"Is" no se usa con "I".'),(2,'are',false,'"Are" no se usa con "I".'),(3,'be',false,'Falta conjugar el verbo "to be".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Speaking' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Shut up, please.',false,'Es una expresión grosera, no apropiada.'),(1,'Could you repeat that, please?',true,'Correcto: es una forma cortés de pedir que repitan.'),(2,'I don''t care.',false,'No es una forma cortés ni apropiada.'),(3,'Never mind that.',false,'No pide que repitan, más bien cambia de tema.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Speaking' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Aprender frases y expresiones útiles de memoria, no solo palabras sueltas',true,'Correcto: las expresiones completas ayudan a sonar más natural.'),(1,'Traducir palabra por palabra desde el español',false,'Eso suele sonar poco natural en inglés.'),(2,'Hablar solo con oraciones de una palabra',false,'Eso limita mucho la comunicación real.'),(3,'No practicar en voz alta nunca',false,'La práctica en voz alta es esencial para el Speaking.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Speaking' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 7: Certificación (EXAMEN FINAL — 3 intentos, 24h de espera)
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Examen de certificación — Inglés A2', 75, true, 3, 24
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ingles-a2' and m.title = 'Certificación'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"My sister _____ (to work) at a hospital." (presente simple, tercera persona)'),
  (1, '"_____ you free tomorrow?" (verbo to be)'),
  (2, '"The cat is sleeping _____ the sofa." (preposición: encima de)'),
  (3, 'Texto: "Sara loves animals. Every weekend, she volunteers at an animal shelter, where she feeds the dogs and cleans their cages. She hopes to become a veterinarian one day." ¿Qué hace Sara los fines de semana?'),
  (4, 'Según el mismo texto, ¿qué espera Sara para el futuro?'),
  (5, '¿Qué conector completa mejor: "I wanted to go out, _____ it was raining."'),
  (6, '"_____ do you usually have for breakfast?" ¿Qué palabra Wh- completa mejor la pregunta?'),
  (7, '"He runs _____ than his brother." (comparativo de "fast")')
) as v(order_index, prompt)
where c.slug = 'ingles-a2' and m.title = 'Certificación'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'work',false,'Falta la "s" de la tercera persona singular.'),(1,'works',true,'Correcto: tercera persona singular + "s".'),(2,'working',false,'Esa forma requiere "is/are" antes.'),(3,'worked',false,'Esa es la forma de pasado, no de presente.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Certificación' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Do',false,'Con adjetivos como "free" se usa el verbo to be, no "do".'),(1,'Are',true,'Correcto: con "you" + adjetivo se usa el verbo to be: "Are you free?"'),(2,'Does',false,'No es el auxiliar correcto para esta pregunta.'),(3,'Is',false,'"Is" no se usa con "you".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Certificación' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'on',true,'Correcto: "on the sofa" — encima del sofá.'),(1,'in',false,'"In" implicaría estar dentro de algo, no encima.'),(2,'at',false,'No es la preposición de lugar correcta aquí.'),(3,'under',false,'"Under" significa "debajo de", lo contrario.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Certificación' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Trabaja en una veterinaria',false,'Aún no es veterinaria; el texto dice que espera serlo algún día.'),(1,'Es voluntaria en un refugio de animales',true,'Correcto: "she volunteers at an animal shelter".'),(2,'Cuida a su propio perro',false,'El texto no menciona una mascota propia.'),(3,'Estudia en la universidad',false,'El texto no menciona eso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Certificación' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Ser veterinaria',true,'Correcto: "she hopes to become a veterinarian one day".'),(1,'Ser doctora de personas',false,'El texto dice que quiere trabajar con animales, no personas.'),(2,'Viajar por el mundo',false,'El texto no menciona eso.'),(3,'Trabajar en un banco',false,'El texto no menciona eso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Certificación' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'but',true,'Correcto: "but" expresa contraste entre las dos ideas.'),(1,'so',false,'"So" implicaría consecuencia, no contraste.'),(2,'because',false,'No expresa el contraste necesario aquí.'),(3,'and',false,'"And" no expresa el contraste necesario aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Certificación' and qq.order_index=5
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'What',true,'Correcto: "What do you have for breakfast?" pregunta por una cosa/comida.'),(1,'Who',false,'"Who" pregunta por una persona.'),(2,'Where',false,'"Where" pregunta por un lugar.'),(3,'When',false,'Es gramaticalmente posible, pero no encaja con el sentido de pedir el tipo de comida.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Certificación' and qq.order_index=6
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'faster',true,'Correcto: los adjetivos/adverbios cortos forman el comparativo con "-er".'),(1,'more fast',false,'"Fast" es una palabra corta; no se usa "more" con ella.'),(2,'fastest',false,'Es superlativo, no comparativo.'),(3,'fastly',false,'No es una palabra válida en inglés.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ingles-a2' and m.title='Certificación' and qq.order_index=7
on conflict (question_id, order_index) do nothing;
