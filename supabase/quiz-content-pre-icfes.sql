-- ============================================================
-- Contenido de cuestionarios — Pre-ICFES (9 módulos)
-- ============================================================
-- Requiere haber corrido antes: schema.sql, seed-pre-icfes-modules.sql
-- y quiz-schema.sql. Pega esto completo en SQL Editor y dale Run.
-- Todos los módulos son de intentos ilimitados, excepto "Simulacro
-- final", que es el examen de certificación (3 intentos, 24h de
-- espera antes del último intento).
-- ============================================================

-- ============================================================
-- Módulo 0: Introducción
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Introducción', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Introducción'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuántas preguntas tiene la prueba de inglés del ICFES?'),
  (1, '¿En cuántas partes está dividida la prueba?'),
  (2, 'Si terminas una parte y no estás seguro de una respuesta, ¿qué es lo más recomendable?'),
  (3, 'La prueba clasifica tu desempeño en varios niveles de dominio del inglés. ¿Cuál escala se parece más a la que usa el ICFES?'),
  (4, '¿Por qué es importante administrar bien el tiempo durante el examen?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Introducción'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id = qq.quiz_id join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values (0,'40',false,'No — la prueba tiene más preguntas que esas.'),(1,'55',true,'Correcto: la prueba consta de 55 preguntas en total.'),(2,'60',false,'Cerca, pero no — son 55 preguntas.'),(3,'25',false,'Muy pocas — la prueba tiene 55 preguntas.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Introducción' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id = qq.quiz_id join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values (0,'5',false,'No — son más partes que esas.'),(1,'7',true,'Correcto: la prueba está dividida en 7 partes.'),(2,'9',false,'Son menos partes que esas.'),(3,'3',false,'Son muchas más partes que esas.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Introducción' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id = qq.quiz_id join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0,'Descartar las opciones que claramente no encajan y elegir la más probable',true,'Correcto: nunca dejes una pregunta en blanco; usa el descarte razonado.'),
  (1,'Dejarla en blanco para no arriesgarte',false,'Una pregunta en blanco nunca suma puntos — siempre es mejor arriesgar con una opción razonada.'),
  (2,'Repetir la misma letra que en la pregunta anterior',false,'Eso no tiene ninguna base lógica y no mejora tus probabilidades.'),
  (3,'Copiarle a un compañero',false,'Además de no ser válido, no garantiza que la respuesta sea correcta.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Introducción' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id = qq.quiz_id join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0,'Del nivel más bajo hasta B1',true,'Correcto: el ICFES ubica tu resultado en niveles que van desde -A1 hasta B1.'),
  (1,'Del nivel C1 al C2',false,'Esos son niveles muy avanzados — no son el rango que evalúa esta prueba.'),
  (2,'Solo aprueba o reprueba, sin niveles',false,'El ICFES sí distingue niveles de desempeño, no es solo aprobar o reprobar.'),
  (3,'Del 1 al 100 como una nota escolar',false,'El resultado se reporta en niveles de dominio, no como una nota tradicional.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Introducción' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id = qq.quiz_id join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0,'Porque cada parte tiene tiempo límite y quedarte atascado en una pregunta te quita tiempo para las demás',true,'Exacto — avanza y vuelve después si es necesario.'),
  (1,'Porque el tiempo no importa en esta prueba',false,'El tiempo sí es limitado; administrarlo bien es clave.'),
  (2,'Porque debes terminar en la mitad del tiempo disponible',false,'No es necesario terminar antes de tiempo, solo no quedarte sin tiempo.'),
  (3,'Porque las preguntas más fáciles siempre están al final',false,'El orden de dificultad no sigue esa regla.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Introducción' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 1: Parte 1 — Avisos y vocabulario
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Avisos y vocabulario', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 1 — Avisos y vocabulario'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Lee el aviso: "NO PARKING. TOW-AWAY ZONE." ¿Dónde es más probable encontrar este aviso?'),
  (1, 'Aviso: "PLEASE KEEP OFF THE GRASS." ¿Qué le pide este aviso a la persona que lo lee?'),
  (2, '¿Qué palabra completa mejor: "The library is _____ on Sundays." (con el significado de "cerrada")'),
  (3, 'Aviso en un aeropuerto: "BAGGAGE CLAIM →". ¿Qué encontrarás siguiendo esa flecha?'),
  (4, 'La palabra "warning" en un aviso indica que...')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 1 — Avisos y vocabulario'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'En la puerta de un restaurante',false,'No — este aviso no tiene relación con restaurantes.'),(1,'En una zona de estacionamiento o vía pública',true,'Correcto: "No parking, tow-away zone" advierte que los carros mal estacionados serán remolcados.'),(2,'En la entrada de un museo',false,'No es un aviso típico de museos.'),(3,'En un salón de clases',false,'No tiene relación con un salón de clases.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Que no camine sobre el césped',true,'Correcto: "keep off" significa "mantente alejado de".'),(1,'Que corte el césped',false,'El aviso no habla de cortar el pasto.'),(2,'Que riegue las plantas',false,'No tiene relación con regar plantas.'),(3,'Que se siente en el pasto',false,'Es justo lo contrario de lo que pide el aviso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'open',false,'"Open" significa abierta, lo contrario de lo que buscamos.'),(1,'closed',true,'Correcto: "closed" significa cerrada.'),(2,'closing',false,'Es la forma en gerundio, no encaja gramaticalmente aquí.'),(3,'close',false,'Falta el verbo "to be" conjugado o el adjetivo correcto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'El lugar para recoger tus maletas',true,'Correcto: "baggage claim" es la zona de reclamo de equipaje.'),(1,'La sala de espera',false,'No es lo que indica ese aviso.'),(2,'El mostrador de check-in',false,'No es lo que indica ese aviso.'),(3,'La cafetería',false,'No es lo que indica ese aviso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'...te están dando la bienvenida',false,'"Warning" no es un saludo.'),(1,'...te están advirtiendo de un peligro o riesgo',true,'Correcto: "warning" significa advertencia.'),(2,'...te están felicitando',false,'"Warning" no tiene ese sentido.'),(3,'...te están invitando a un evento',false,'"Warning" no es una invitación.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 2: Parte 2 — Relación de enunciados
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Relación de enunciados', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué palabra en inglés se relaciona con: "A place where you buy medicine"?'),
  (1, '¿Qué palabra se relaciona con: "A person who teaches students"?'),
  (2, 'Para memorizar vocabulario nuevo de forma efectiva, ¿cuál es la estrategia MÁS recomendada?'),
  (3, '¿Qué palabra se relaciona con: "A vehicle that flies in the sky"?'),
  (4, '¿Qué palabra se relaciona con: "The first meal of the day"?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Bakery',false,'Esa es una panadería.'),(1,'Pharmacy',true,'Correcto: "pharmacy" es la farmacia.'),(2,'Library',false,'Esa es una biblioteca.'),(3,'Bank',false,'Ese es un banco.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Doctor',false,'Un doctor no enseña estudiantes, atiende pacientes.'),(1,'Teacher',true,'Correcto: "teacher" es quien enseña a los estudiantes.'),(2,'Waiter',false,'Un mesero atiende en un restaurante.'),(3,'Driver',false,'Un conductor maneja un vehículo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Memorizar listas larguísimas de palabras sueltas sin contexto',false,'Sin contexto es mucho más difícil recordarlas.'),(1,'Agrupar palabras por tema y usarlas en oraciones propias',true,'Correcto: aprender por temas y en contexto mejora la retención.'),(2,'Leer las palabras una sola vez y confiar en la memoria',false,'La repetición y el uso activo funcionan mucho mejor.'),(3,'Evitar escribir las palabras nuevas',false,'Escribirlas ayuda a fijarlas en la memoria.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Airplane',true,'Correcto: "airplane" es avión.'),(1,'Bicycle',false,'Una bicicleta no vuela.'),(2,'Ship',false,'Un barco no vuela.'),(3,'Train',false,'Un tren no vuela.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Dinner',false,'"Dinner" es la cena, la última comida del día.'),(1,'Breakfast',true,'Correcto: "breakfast" es el desayuno.'),(2,'Lunch',false,'"Lunch" es el almuerzo.'),(3,'Snack',false,'"Snack" es una merienda, no la primera comida.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 3: Parte 3 — Diálogos y conversación
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Diálogos y conversación', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '— "_____ you help me with this bag, please?" — "Of course!" ¿Qué modal completa mejor la petición cortés?'),
  (1, '"You _____ wear a seatbelt in the car." ¿Qué modal expresa una obligación o norma?'),
  (2, '— "_____ I open the window?" — "Yes, go ahead." ¿Qué modal se usa para pedir permiso?'),
  (3, '"If I were you, I _____ study more before the exam." ¿Qué modal da un consejo?'),
  (4, 'En un diálogo, alguien dice: "Shall we go to the movies tonight?" ¿Qué está haciendo?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Must',false,'"Must" suena a obligación, no a una petición cortés.'),(1,'Could',true,'Correcto: "Could you help me...?" es una forma cortés de pedir ayuda.'),(2,'Shall',false,'"Shall" se usa más para sugerencias formales, no para pedir un favor.'),(3,'May',false,'Es posible, pero menos natural aquí que "could".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'must',true,'Correcto: "must" expresa una obligación o regla.'),(1,'might',false,'"Might" expresa posibilidad, no obligación.'),(2,'would',false,'No expresa obligación en este contexto.'),(3,'could',false,'"Could" expresa habilidad o posibilidad, no obligación.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'May',true,'Correcto: "May I...?" es la forma clásica de pedir permiso.'),(1,'Will',false,'"Will" no se usa típicamente para pedir permiso.'),(2,'Must',false,'"Must" expresa obligación, no petición de permiso.'),(3,'Should',false,'"Should" da consejo, no pide permiso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'would',true,'Correcto: "I would study..." da un consejo hipotético.'),(1,'can',false,'No encaja con el sentido hipotético de "if I were you".'),(2,'must',false,'Es una obligación fuerte, no un consejo suave.'),(3,'shall',false,'No encaja en este tipo de consejo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Dando una orden',false,'"Shall we...?" no es una orden.'),(1,'Haciendo una sugerencia',true,'Correcto: "Shall we...?" es una forma de proponer un plan juntos.'),(2,'Pidiendo disculpas',false,'No tiene relación con disculparse.'),(3,'Prohibiendo algo',false,'No tiene relación con una prohibición.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 4: Parte 4 — Use of Language
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Use of Language', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"She is interested _____ learning new languages." ¿Qué preposición completa la oración?'),
  (1, '"This book is _____ than the one I read last year." (comparativo de "interesting")'),
  (2, '"Everest is _____ mountain in the world." (superlativo de "tall")'),
  (3, '"_____ finished the homework before dinner." ¿Qué pronombre sujeto completa mejor la oración (refiriéndose a "María y yo")?'),
  (4, '"He speaks English very _____." (adverbio de "good")')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'on',false,'No es la combinación correcta con "interested".'),(1,'in',true,'Correcto: "interested in" es la combinación correcta.'),(2,'at',false,'No es la combinación correcta con "interested".'),(3,'for',false,'No es la combinación correcta con "interested".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'more interesting',true,'Correcto: los adjetivos largos usan "more" + adjetivo para el comparativo.'),(1,'interestinger',false,'No es una forma válida en inglés.'),(2,'most interesting',false,'Ese es el superlativo, no el comparativo.'),(3,'as interesting',false,'Esa forma se usa para comparaciones de igualdad, no de superioridad.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'the tallest',true,'Correcto: el superlativo de adjetivos cortos es "the" + adjetivo + "-est".'),(1,'taller',false,'Es comparativo, no superlativo.'),(2,'the more tall',false,'No es la forma correcta.'),(3,'tallest',false,'Falta el artículo "the" antes del superlativo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Us',false,'"Us" es pronombre objeto, no sujeto.'),(1,'We',true,'Correcto: "we" es el pronombre sujeto para "María y yo".'),(2,'Them',false,'No corresponde a la primera persona plural.'),(3,'Our',false,'Es un adjetivo posesivo, no un pronombre sujeto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'good',false,'"Good" es adjetivo; para modificar un verbo se necesita un adverbio.'),(1,'well',true,'Correcto: "well" es el adverbio correspondiente a "good".'),(2,'best',false,'Es un superlativo, no encaja aquí.'),(3,'better',false,'Es un comparativo, no encaja aquí sin una comparación explícita.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 5: Parte 5 — Lectura literal
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Lectura literal', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 5 — Lectura literal'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Texto: "Anna works at a hospital. She starts her shift at 7 a.m. and finishes at 3 p.m. During her lunch break, she usually eats a sandwich in the hospital cafeteria. After work, she goes home and walks her dog before dinner." ¿A qué hora empieza el turno de Anna?'),
  (1, 'Según el mismo texto, ¿dónde come Anna durante su descanso?'),
  (2, '¿Qué hace Anna después del trabajo, antes de cenar?'),
  (3, '¿Dónde trabaja Anna?'),
  (4, '¿Qué come Anna en su descanso?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 5 — Lectura literal'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'3 p.m.',false,'Esa es la hora en que termina, no en que empieza.'),(1,'7 a.m.',true,'Correcto: el texto dice "starts her shift at 7 a.m."'),(2,'9 a.m.',false,'No aparece esa hora en el texto.'),(3,'12 p.m.',false,'No aparece esa hora en el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'En su casa',false,'El texto dice que come en la cafetería del hospital.'),(1,'En la cafetería del hospital',true,'Correcto: "in the hospital cafeteria".'),(2,'En un restaurante',false,'No es lo que dice el texto.'),(3,'No come nada',false,'El texto dice que come un sándwich.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Duerme una siesta',false,'El texto no menciona eso.'),(1,'Camina con su perro',true,'Correcto: "she goes home and walks her dog before dinner".'),(2,'Va al gimnasio',false,'El texto no menciona eso.'),(3,'Ve televisión',false,'El texto no menciona eso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'En una escuela',false,'El texto dice que trabaja en un hospital.'),(1,'En un hospital',true,'Correcto: "Anna works at a hospital".'),(2,'En un banco',false,'El texto dice que trabaja en un hospital.'),(3,'En una tienda',false,'El texto dice que trabaja en un hospital.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Un sándwich',true,'Correcto: "she usually eats a sandwich".'),(1,'Una ensalada',false,'El texto dice que come un sándwich.'),(2,'Una sopa',false,'El texto dice que come un sándwich.'),(3,'Nada, ayuna',false,'El texto dice que sí come algo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 6: Parte 6 — Lectura inferencial
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Lectura inferencial', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 6 — Lectura inferencial'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Texto: "Marco wanted to go hiking on Saturday. However, the weather forecast predicted heavy rain. Because he didn''t want to get sick, he decided to stay home and watch movies instead. Therefore, he rescheduled the hike for the following weekend." ¿Por qué Marco decidió NO ir de excursión?'),
  (1, 'En el mismo texto, la palabra "however" indica...'),
  (2, '¿Qué se puede inferir que hará Marco el próximo fin de semana?'),
  (3, '¿Qué función cumple la palabra "therefore" en la última oración del texto?'),
  (4, '¿Qué tipo de persona parece ser Marco, según sus decisiones en el texto?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 6 — Lectura inferencial'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Porque no le gusta el senderismo',false,'El texto dice que sí quería ir de excursión.'),(1,'Porque se pronosticaba lluvia fuerte y no quería enfermarse',true,'Correcto: se infiere de "However... heavy rain" y "Because he didn''t want to get sick".'),(2,'Porque tenía que trabajar',false,'El texto no menciona trabajo.'),(3,'Porque perdió sus botas de excursión',false,'El texto no menciona eso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'...una razón',false,'Esa función la cumple "because", no "however".'),(1,'...un contraste con lo anterior',true,'Correcto: "however" introduce una idea que contrasta con la anterior.'),(2,'...una conclusión',false,'Esa función la cumple "therefore", no "however".'),(3,'...un ejemplo',false,'No es la función de "however" aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Ir de excursión',true,'Correcto: "he rescheduled the hike for the following weekend".'),(1,'Quedarse en casa otra vez',false,'El texto dice que reprogramó la excursión.'),(2,'Viajar a otra ciudad',false,'El texto no menciona eso.'),(3,'No se puede saber',false,'Sí se puede inferir directamente del texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Presenta una consecuencia o conclusión',true,'Correcto: "therefore" significa "por lo tanto" e introduce una consecuencia.'),(1,'Presenta una opción',false,'No es la función de "therefore".'),(2,'Presenta una pregunta',false,'No es la función de "therefore".'),(3,'Presenta una disculpa',false,'No es la función de "therefore".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Alguien imprudente que ignora el clima',false,'Es lo contrario: sí tomó en cuenta el clima.'),(1,'Alguien precavido que cuida su salud',true,'Correcto: decidió quedarse en casa para no enfermarse — eso muestra precaución.'),(2,'Alguien a quien no le importa el senderismo',false,'El texto dice que sí quería ir de excursión.'),(3,'Alguien indeciso que no planea nada',false,'Al contrario, reprogramó su plan con una fecha concreta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 7: Parte 7 — Texto con opción múltiple
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Cuestionario — Texto con opción múltiple', 75, false, null, 0
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"Traveling by train is often _____ relaxing than flying." (comparativo de "relaxing")'),
  (1, '"Before you travel, you should check _____ passport is still valid." (posesivo)'),
  (2, '"Football is one of _____ popular sports in the world." (superlativo)'),
  (3, '"Many cultures celebrate the New Year _____ fireworks and music." (preposición)'),
  (4, '"If you visit Japan, you _____ try the local street food." (recomendación)')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'more',true,'Correcto: "more relaxing" — comparativo de un adjetivo largo.'),(1,'most',false,'Ese es el superlativo, no el comparativo.'),(2,'much',false,'Se puede usar como intensificador, pero no forma el comparativo por sí solo.'),(3,'many',false,'No se usa con adjetivos de esta forma.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'you',false,'No es un adjetivo posesivo.'),(1,'your',true,'Correcto: "your passport" — adjetivo posesivo.'),(2,'yours',false,'"Yours" se usa sin sustantivo después, no antes de "passport".'),(3,'you''re',false,'Es la contracción de "you are", no un posesivo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'the most',true,'Correcto: "the most popular" — superlativo de un adjetivo largo.'),(1,'more',false,'Ese es el comparativo, no el superlativo.'),(2,'most',false,'Falta el artículo "the" antes del superlativo.'),(3,'much',false,'No forma un superlativo correcto aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'with',true,'Correcto: "celebrate... with fireworks" usa "with" para indicar los medios de la celebración.'),(1,'on',false,'No es la preposición natural en este contexto.'),(2,'at',false,'No es la preposición natural en este contexto.'),(3,'from',false,'No es la preposición natural en este contexto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'should',true,'Correcto: "should" se usa para dar una recomendación.'),(1,'must not',false,'Eso sería una prohibición, contrario al sentido de la oración.'),(2,'can''t',false,'No encaja con el sentido de recomendación.'),(3,'isn''t',false,'No es un modal ni encaja gramaticalmente.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

-- ============================================================
-- Módulo 8: Simulacro final (EXAMEN DE CERTIFICACIÓN — 3 intentos, 24h de espera)
-- ============================================================
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours)
select m.id, 'Simulacro final — Examen de certificación', 75, true, 3, 24
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Simulacro final'
on conflict (module_id) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Aviso: "STAFF ONLY. DO NOT ENTER." ¿Qué significa este aviso?'),
  (1, '"You _____ smoke inside the building. It''s strictly prohibited." ¿Qué modal expresa prohibición?'),
  (2, '"This exam is _____ than I expected." (comparativo de "difficult")'),
  (3, 'Texto: "The museum opens at 9 a.m. and closes at 5 p.m., Tuesday to Sunday. It is closed on Mondays." ¿Qué día está cerrado el museo?'),
  (4, 'Texto: "Laura studied all week for her exam. However, she forgot her calculator on exam day. Therefore, she had to solve the math problems by hand." ¿Qué se puede inferir sobre Laura?'),
  (5, '¿Qué palabra se relaciona con: "A document you need to travel to another country"?'),
  (6, '— "_____ you pass me the salt, please?" — "Sure, here you go." ¿Qué modal es más natural en esta petición cortés?'),
  (7, '"Colombia is famous for _____ beautiful beaches and mountains." (posesivo)')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Simulacro final'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Solo el personal autorizado puede entrar',true,'Correcto: "staff only" limita el acceso al personal.'),(1,'Está prohibido para todos, incluso el personal',false,'El aviso permite el paso al personal ("staff only").'),(2,'Es la entrada principal',false,'No es lo que indica este aviso.'),(3,'Es una zona de descanso',false,'No es lo que indica este aviso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Simulacro final' and qq.order_index=0
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'must not',true,'Correcto: "must not" expresa prohibición.'),(1,'don''t have to',false,'Eso expresa que algo no es obligatorio, no que esté prohibido.'),(2,'may',false,'No expresa prohibición.'),(3,'could',false,'No expresa prohibición.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Simulacro final' and qq.order_index=1
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'more difficult',true,'Correcto: comparativo de un adjetivo largo con "more".'),(1,'difficulter',false,'No es una forma válida en inglés.'),(2,'most difficult',false,'Ese es el superlativo, no el comparativo.'),(3,'as difficult',false,'Se usa para comparaciones de igualdad, no de superioridad.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Simulacro final' and qq.order_index=2
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Domingo',false,'El museo sí abre los domingos según el texto.'),(1,'Lunes',true,'Correcto: "It is closed on Mondays".'),(2,'Martes',false,'El museo abre los martes según el texto.'),(3,'Nunca cierra',false,'El texto dice que cierra los lunes.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Simulacro final' and qq.order_index=3
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'No estudió lo suficiente',false,'El texto dice que sí estudió toda la semana.'),(1,'Tuvo que adaptarse a un imprevisto el día del examen',true,'Correcto: olvidó la calculadora y tuvo que resolver a mano.'),(2,'No presentó el examen',false,'El texto no dice eso.'),(3,'Reprobó el examen',false,'El texto no menciona el resultado del examen.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Simulacro final' and qq.order_index=4
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Ticket',false,'Es el tiquete, no el documento de identidad para viajar.'),(1,'Passport',true,'Correcto: "passport" es el pasaporte.'),(2,'Map',false,'Un mapa no es un documento de identidad.'),(3,'Suitcase',false,'Una maleta no es un documento.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Simulacro final' and qq.order_index=5
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Could',true,'Correcto: "Could you pass me...?" es una petición cortés natural.'),(1,'Must',false,'Suena a orden, no a petición cortés.'),(2,'Shall',false,'No es lo más natural para pedir algo en la mesa.'),(3,'Need',false,'No es un modal apropiado para una petición cortés.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Simulacro final' and qq.order_index=6
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'it''s',false,'"It''s" es la contracción de "it is", no un posesivo.'),(1,'its',true,'Correcto: "its" es el adjetivo posesivo para "it" (el país).'),(2,'their',false,'"Their" se usa para plural, no para "Colombia" como singular.'),(3,'his',false,'No corresponde a "Colombia".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Simulacro final' and qq.order_index=7
on conflict (question_id, order_index) do nothing;
