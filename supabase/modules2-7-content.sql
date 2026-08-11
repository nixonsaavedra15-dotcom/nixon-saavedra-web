-- ============================================================
-- Lección multi-paso — Módulos 2 a 7 (Pre-ICFES)
-- Replica la estructura aprobada en el Módulo 1 (ver
-- supabase/module1-prototype.sql) para los 6 módulos restantes de
-- "Partes" del examen. El módulo 8 "Simulacro final" NO se toca
-- aquí — ese pasa a ser reemplazado más adelante por los dos
-- simulacros completos (fase aparte, en pausa).
--
-- Requiere haber corrido antes: schema.sql, admin-schema.sql,
-- quiz-schema.sql, seed-pre-icfes-modules.sql,
-- lesson-flow-schema.sql, module1-prototype.sql.
--
-- Igual que el módulo 1: cada módulo queda con 2 lecturas, 2 quizzes
-- (stage 'readings' y 'interactive'), una lección interactiva, una
-- lectura de práctica y un formulario de cierre. Los quizzes viejos
-- (stage='main', de quiz-content-pre-icfes.sql) quedan huérfanos
-- pero inofensivos: en cuanto lesson_json no es null, leccion.html
-- ignora el formato antiguo.
--
-- Seguro de correr varias veces.
-- ============================================================

-- ================================================================
-- MÓDULO 2 — Parte 2: Relación de enunciados
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Parte 2: Relación de enunciados",
    "subtitle": "Esta parte no evalúa gramática: evalúa cuánto vocabulario tienes y qué tan rápido conectas una definición con la palabra correcta.",
    "guide_html": "<p>Vas a recorrer la misma ruta de siempre: 2 lecturas de vocabulario agrupado por temas, un quiz, una lección interactiva para repasar con imágenes, otro quiz, una lectura de práctica con un caso real, y el formulario de cierre.</p>",
    "objectives": [
      "Relacionar una definición en inglés con la palabra correcta, sin traducir de memoria",
      "Agrupar vocabulario por temas (lugares, profesiones, transporte, comidas, documentos) para memorizarlo mejor",
      "Reconocer palabras 'distractoras' que no encajan con la definición"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Vocabulario por temas: lugares y profesiones",
    "html": "<p class='lead-in'>Esta parte del examen te da una definición corta en inglés (ej: 'a place where you buy medicine') y tú debes encontrar, entre 8 opciones, la palabra que encaja. No se trata de gramática — se trata de cuánto vocabulario reconoces y qué tan rápido lo conectas.</p><h2>Lugares</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>pharmacy</div><div class='mean'>farmacia — donde compras medicinas</div></div><div class='vocab-item'><div class='word'>bakery</div><div class='mean'>panadería</div></div><div class='vocab-item'><div class='word'>library</div><div class='mean'>biblioteca</div></div><div class='vocab-item'><div class='word'>bank</div><div class='mean'>banco</div></div></div><h2>Profesiones</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>teacher</div><div class='mean'>profesor(a) — enseña a estudiantes</div></div><div class='vocab-item'><div class='word'>doctor</div><div class='mean'>médico(a)</div></div><div class='vocab-item'><div class='word'>waiter</div><div class='mean'>mesero</div></div><div class='vocab-item'><div class='word'>driver</div><div class='mean'>conductor</div></div></div><div class='tip-box'><span class='icon'>🧠</span><span><strong>Cómo memorizar de verdad:</strong> no repitas listas sueltas. Agrupa las palabras por tema (como hicimos arriba) y úsalas en una oración propia — eso multiplica tu retención comparado con solo leerlas una vez.</span></div><details class='mini-check'><summary>¿Qué palabra se relaciona con 'a person who teaches students'?</summary><div class='answer'>Teacher.</div></details><details class='mini-check'><summary>¿Cuál es la mejor forma de memorizar vocabulario nuevo?</summary><div class='answer'>Agruparlo por tema y usarlo en oraciones propias, no memorizar listas sueltas sin contexto.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Transporte, comidas y documentos de viaje",
    "html": "<p class='lead-in'>Sigamos con tres grupos más de vocabulario que aparecen todo el tiempo en esta parte del examen. La estrategia es la misma: agrupar, no memorizar listas sueltas.</p><h2>Medios de transporte</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>airplane</div><div class='mean'>avión — vuela</div></div><div class='vocab-item'><div class='word'>bicycle</div><div class='mean'>bicicleta</div></div><div class='vocab-item'><div class='word'>ship</div><div class='mean'>barco</div></div><div class='vocab-item'><div class='word'>train</div><div class='mean'>tren</div></div></div><h2>Comidas del día</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>breakfast</div><div class='mean'>desayuno — la primera comida del día</div></div><div class='vocab-item'><div class='word'>lunch</div><div class='mean'>almuerzo</div></div><div class='vocab-item'><div class='word'>dinner</div><div class='mean'>cena — la última comida del día</div></div><div class='vocab-item'><div class='word'>snack</div><div class='mean'>merienda</div></div></div><h2>Documentos de viaje</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>passport</div><div class='mean'>pasaporte — documento para viajar a otro país</div></div><div class='vocab-item'><div class='word'>ticket</div><div class='mean'>tiquete — para abordar un vuelo o un tren</div></div></div><div class='tip-box'><span class='icon'>💡</span><span>Fíjate en las palabras que suenan parecido en español (<em>pasaporte/passport</em>) — son un regalo. Pero cuidado con las que se parecen y NO significan lo mismo, esas son las verdaderas trampas del examen.</span></div><details class='mini-check'><summary>¿Cuál es la última comida del día?</summary><div class='answer'>Dinner (cena).</div></details><details class='mini-check'><summary>¿Qué necesitas, además del pasaporte, para abordar un vuelo?</summary><div class='answer'>Un ticket (tiquete).</div></details>"
  },
  "interactive": {
    "title": "Repasemos el vocabulario con imágenes",
    "intro": "Toca cada burbuja para revelar la palabra correcta.",
    "slides": [
      { "id":"s1", "icon":"💊", "title":"Places", "bubble":"¿Dónde comprarías medicina?", "detail":"Pharmacy — farmacia." },
      { "id":"s2", "icon":"📚", "title":"Places", "bubble":"¿Dónde pides libros prestados?", "detail":"Library — biblioteca." },
      { "id":"s3", "icon":"🩺", "title":"Professions", "bubble":"¿Quién te atiende cuando estás enfermo?", "detail":"Doctor — médico." },
      { "id":"s4", "icon":"🚆", "title":"Transport", "bubble":"¿Cuál transporte va sobre rieles?", "detail":"Train — tren." },
      { "id":"s5", "icon":"🍽️", "title":"Meals", "bubble":"¿Cuál es la última comida del día?", "detail":"Dinner — cena." },
      { "id":"s6", "icon":"🎫", "title":"Travel docs", "bubble":"¿Qué necesitas, además del pasaporte, para abordar un tren o avión?", "detail":"Ticket — tiquete." }
    ]
  },
  "practice": {
    "title": "El martes de Sofía: vocabulario en acción",
    "html": "<p class='lead-in'>Veamos todo este vocabulario aplicado a un día cualquiera — así es como realmente lo vas a usar.</p><div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Sofía empieza su día temprano: pasa por la <strong>pharmacy</strong> a comprar unas pastillas para su mamá. De camino a su trabajo, deja unos libros en la <strong>library</strong> — se le habían vencido hace días.</p><p>Toma el <strong>train</strong> hasta el centro, donde trabaja como <strong>teacher</strong> en un colegio. A la hora del <strong>lunch</strong>, come rápido con sus compañeros antes de volver a clase.</p><p>Por la tarde, revisa su correo: le confirman el <strong>ticket</strong> para un vuelo el próximo mes — pero primero debe verificar que su <strong>passport</strong> siga vigente.</p><p>Al llegar a casa, prepara <strong>dinner</strong> para su familia y, antes de dormir, pasa por el <strong>bank</strong> a sacar dinero para el fin de semana.</p></div><div class='tip-box'><span class='icon'>✅</span><span>¿Viste cuántas palabras nuevas usó Sofía en un solo día? Así de presente está este vocabulario en la vida real — por eso vale la pena aprenderlo por temas, no de memoria suelta.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras — no hay respuestas incorrectas aquí.",
    "fields": [
      { "id":"palabras_nuevas", "label":"Escribe 3 palabras nuevas que aprendiste hoy y su significado.", "type":"textarea", "placeholder":"Ej: bakery = panadería..." },
      { "id":"por_que_agrupar", "label":"¿Por qué agrupar vocabulario por temas ayuda más que memorizar listas sueltas?", "type":"textarea", "placeholder":"" },
      { "id":"oracion_propia", "label":"Escribe una oración propia usando la palabra 'ticket' o 'passport'.", "type":"text", "placeholder":"" },
      { "id":"tema_dificil", "label":"¿Qué grupo de vocabulario te costó más recordar: lugares, profesiones, transporte, comidas o documentos?", "type":"text", "placeholder":"" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 2 — Relación de enunciados';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: vocabulario por temas', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados'
on conflict (module_id, stage) do nothing;

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
where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Bakery',false,'Esa es una panadería.'),(1,'Pharmacy',true,'Correcto: "pharmacy" es la farmacia.'),(2,'Library',false,'Esa es una biblioteca.'),(3,'Bank',false,'Ese es un banco.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Doctor',false,'Un doctor no enseña estudiantes, atiende pacientes.'),(1,'Teacher',true,'Correcto: "teacher" es quien enseña a los estudiantes.'),(2,'Waiter',false,'Un mesero atiende en un restaurante.'),(3,'Driver',false,'Un conductor maneja un vehículo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Memorizar listas larguísimas de palabras sueltas sin contexto',false,'Sin contexto es mucho más difícil recordarlas.'),(1,'Agrupar palabras por tema y usarlas en oraciones propias',true,'Correcto: aprender por temas y en contexto mejora la retención.'),(2,'Leer las palabras una sola vez y confiar en la memoria',false,'La repetición y el uso activo funcionan mucho mejor.'),(3,'Evitar escribir las palabras nuevas',false,'Escribirlas ayuda a fijarlas en la memoria.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Airplane',true,'Correcto: "airplane" es avión.'),(1,'Bicycle',false,'Una bicicleta no vuela.'),(2,'Ship',false,'Un barco no vuela.'),(3,'Train',false,'Un tren no vuela.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Dinner',false,'"Dinner" es la cena, la última comida del día.'),(1,'Breakfast',true,'Correcto: "breakfast" es el desayuno.'),(2,'Lunch',false,'"Lunch" es el almuerzo.'),(3,'Snack',false,'"Snack" es una merienda, no la primera comida.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué palabra se relaciona con: "A place where you borrow books"?'),
  (1, '¿Qué palabra se relaciona con: "A person who serves food in a restaurant"?'),
  (2, '¿Qué palabra se relaciona con: "A vehicle that travels on rails"?'),
  (3, '¿Qué palabra se relaciona con: "The last meal of the day"?'),
  (4, '¿Qué palabra se relaciona con: "A small paper that allows you to travel on a plane or train"?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 2 — Relación de enunciados' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Bank',false,'Un banco no presta libros.'),(1,'Library',true,'Correcto: "library" es la biblioteca.'),(2,'Bakery',false,'Una panadería no presta libros.'),(3,'Pharmacy',false,'Una farmacia no presta libros.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Driver',false,'Un conductor maneja un vehículo, no sirve comida.'),(1,'Waiter',true,'Correcto: "waiter" es el mesero.'),(2,'Teacher',false,'Un profesor enseña, no sirve comida.'),(3,'Doctor',false,'Un médico atiende pacientes, no sirve comida.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Ship',false,'Un barco viaja por agua, no por rieles.'),(1,'Train',true,'Correcto: "train" es el tren, viaja sobre rieles.'),(2,'Bicycle',false,'Una bicicleta no usa rieles.'),(3,'Airplane',false,'Un avión vuela, no usa rieles.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Breakfast',false,'"Breakfast" es la primera comida, no la última.'),(1,'Dinner',true,'Correcto: "dinner" es la cena, la última comida del día.'),(2,'Lunch',false,'"Lunch" es el almuerzo, a mitad del día.'),(3,'Snack',false,'"Snack" es una merienda entre comidas.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Ticket',true,'Correcto: "ticket" es el tiquete que necesitas además del pasaporte.'),(1,'Passport',false,'El pasaporte ya se menciona en la pregunta como algo aparte.'),(2,'Bank',false,'Un banco no tiene relación con abordar un vuelo.'),(3,'Snack',false,'Una merienda no tiene relación con abordar un vuelo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 2 — Relación de enunciados' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;


-- ================================================================
-- MÓDULO 3 — Parte 3: Diálogos y conversación
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Parte 3: Diálogos y conversación",
    "subtitle": "Vas a leer mini-diálogos y elegir el modal que mejor encaja según la intención: ¿cortesía, permiso, obligación, prohibición, consejo o plan juntos?",
    "guide_html": "<p>La misma ruta de siempre: 2 lecturas, un quiz, una lección interactiva, otro quiz, una práctica con un diálogo real, y el formulario de cierre.</p>",
    "objectives": [
      "Reconocer la intención detrás de un modal (could, may, must, must not, should/would, shall)",
      "Elegir el modal correcto según el contexto de una conversación corta",
      "Distinguir obligación (must) de prohibición (must not)"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Cortesía, permiso y obligación",
    "html": "<p class='lead-in'>Cada modal en inglés tiene una 'personalidad': algunos son corteses, otros dan órdenes, otros piden permiso. Si aprendes a reconocer esa personalidad, resolver esta parte del examen se vuelve casi automático.</p><table class='grammar-table'><tr><th>Modal</th><th>Para qué se usa</th><th>Ejemplo</th></tr><tr><td>could</td><td>Petición cortés</td><td>'Could you help me with this bag?'</td></tr><tr><td>may</td><td>Pedir permiso</td><td>'May I open the window?'</td></tr><tr><td>must</td><td>Obligación / norma</td><td>'You must wear a seatbelt.'</td></tr><tr><td>must not</td><td>Prohibición</td><td>'You must not smoke inside.'</td></tr></table><div class='example-box'><div class='line'><span class='speaker'>A:</span> Could you help me with this bag, please?</div><div class='line'><span class='speaker'>B:</span> Of course!</div></div><div class='example-box'><div class='line'><span class='speaker'>A:</span> May I open the window?</div><div class='line'><span class='speaker'>B:</span> Yes, go ahead.</div></div><div class='tip-box'><span class='icon'>🔑</span><span>'Must' y 'must not' se parecen mucho por escrito, pero significan casi lo opuesto: 'must' = tienes que hacerlo; 'must not' = está prohibido hacerlo. Nunca los confundas.</span></div><details class='mini-check'><summary>¿Qué modal usarías para pedir permiso educadamente?</summary><div class='answer'>May — 'May I...?'</div></details><details class='mini-check'><summary>¿Qué diferencia hay entre 'must' y 'must not'?</summary><div class='answer'>'Must' expresa una obligación ('tienes que'); 'must not' expresa una prohibición ('no debes / está prohibido').</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Consejos y planes en conjunto",
    "html": "<p class='lead-in'>Ahora veamos los modales que se usan para aconsejar a alguien o para proponer un plan juntos — son un poco más suaves que 'must', pero igual de frecuentes en el examen.</p><table class='grammar-table'><tr><th>Modal</th><th>Para qué se usa</th><th>Ejemplo</th></tr><tr><td>should / would</td><td>Consejo</td><td>'If I were you, I would study more.'</td></tr><tr><td>shall</td><td>Proponer un plan juntos</td><td>'Shall we go to the movies?'</td></tr></table><div class='example-box'><div class='line'><span class='speaker'>A:</span> Shall we go to the movies tonight?</div><div class='line'><span class='speaker'>B:</span> Sounds good!</div></div><p>Fíjate en el patrón de 'shall': casi siempre va con 'we' porque propone hacer algo <strong>juntos</strong>, no una orden ni un favor para uno solo.</p><div class='tip-box'><span class='icon'>🎯</span><span>Truco rápido para el examen: si la pregunta pide 'cortesía' piensa en <strong>could</strong>; si pide 'permiso' piensa en <strong>may</strong>; si pide 'obligación' piensa en <strong>must</strong>; si pide 'consejo' piensa en <strong>should/would</strong>; si pide 'plan juntos' piensa en <strong>shall</strong>.</span></div><details class='mini-check'><summary>¿Qué modal usarías para proponer un plan con un amigo?</summary><div class='answer'>Shall — 'Shall we...?'</div></details><details class='mini-check'><summary>¿Qué modal da un consejo hipotético ('si yo fuera tú')?</summary><div class='answer'>Would — 'If I were you, I would...'</div></details>"
  },
  "interactive": {
    "title": "Repasemos los modales con imágenes",
    "intro": "Cada burbuja esconde la intención del modal. Tócala para revelarla.",
    "slides": [
      { "id":"s1", "icon":"🙏", "title":"COULD", "bubble":"¿Qué intención tiene 'Could you help me?'", "detail":"Es una petición cortés — pides un favor con amabilidad." },
      { "id":"s2", "icon":"🚪", "title":"MAY", "bubble":"¿Qué intención tiene 'May I open the window?'", "detail":"Es pedir permiso para hacer algo." },
      { "id":"s3", "icon":"📋", "title":"MUST", "bubble":"¿Qué intención tiene 'You must wear a seatbelt'?", "detail":"Es una obligación o norma — tienes que hacerlo." },
      { "id":"s4", "icon":"🚭", "title":"MUST NOT", "bubble":"¿Qué intención tiene 'You must not smoke inside'?", "detail":"Es una prohibición — está terminantemente prohibido." },
      { "id":"s5", "icon":"💭", "title":"SHOULD / WOULD", "bubble":"¿Qué intención tiene 'I would study more'?", "detail":"Es un consejo — una sugerencia, no una orden." },
      { "id":"s6", "icon":"🎬", "title":"SHALL", "bubble":"¿Qué intención tiene 'Shall we go to the movies?'", "detail":"Es proponer un plan juntos." }
    ]
  },
  "practice": {
    "title": "En la oficina: los modales en una conversación real",
    "html": "<p class='lead-in'>Veamos estos modales aplicados a una conversación cotidiana en una oficina — así es exactamente como los vas a escuchar o leer en la vida real.</p><div class='reading-passage'><div class='passage-tag'>Caso real</div><p><strong>Laura:</strong> Excuse me, <strong>could</strong> you send me that report before lunch?</p><p><strong>Carlos:</strong> Of course! By the way, <strong>may</strong> I use your printer? Mine is broken.</p><p><strong>Laura:</strong> Sure, go ahead. Just remember: everyone <strong>must</strong> save their files before 5 p.m. — it's company policy. And you <strong>must not</strong> leave the printer room without turning off the lights.</p><p><strong>Carlos:</strong> Got it. If I were you, I <strong>would</strong> also back up the files on the shared drive, just in case.</p><p><strong>Laura:</strong> Good idea. <strong>Shall</strong> we grab a coffee after we finish?</p><p><strong>Carlos:</strong> Sounds good!</p></div><div class='tip-box'><span class='icon'>✅</span><span>En un solo diálogo aparecieron los 6 modales que estudiaste, cada uno con su intención exacta: petición cortés, permiso, obligación, prohibición, consejo y plan juntos.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "No hay respuestas incorrectas — escribe con tus propias palabras.",
    "fields": [
      { "id":"mini_dialogo", "label":"Escribe tu propio mini-diálogo usando al menos 2 modales diferentes.", "type":"textarea", "placeholder":"A: Could you...? B: ..." },
      { "id":"prohibicion", "label":"¿Qué modal usarías para prohibir algo?", "type":"text", "placeholder":"" },
      { "id":"diferencia_may_could", "label":"Explica con tus palabras la diferencia entre pedir permiso (may) y hacer una petición cortés (could).", "type":"textarea", "placeholder":"" },
      { "id":"modal_dificil", "label":"¿Cuál modal se te dificulta más recordar y por qué?", "type":"textarea", "placeholder":"" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 3 — Diálogos y conversación';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: modales', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación'
on conflict (module_id, stage) do nothing;

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
where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Must',false,'"Must" suena a obligación, no a una petición cortés.'),(1,'Could',true,'Correcto: "Could you help me...?" es una forma cortés de pedir ayuda.'),(2,'Shall',false,'"Shall" se usa más para sugerencias formales, no para pedir un favor.'),(3,'May',false,'Es posible, pero menos natural aquí que "could".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'must',true,'Correcto: "must" expresa una obligación o regla.'),(1,'might',false,'"Might" expresa posibilidad, no obligación.'),(2,'would',false,'No expresa obligación en este contexto.'),(3,'could',false,'"Could" expresa habilidad o posibilidad, no obligación.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'May',true,'Correcto: "May I...?" es la forma clásica de pedir permiso.'),(1,'Will',false,'"Will" no se usa típicamente para pedir permiso.'),(2,'Must',false,'"Must" expresa obligación, no petición de permiso.'),(3,'Should',false,'"Should" da consejo, no pide permiso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'would',true,'Correcto: "I would study..." da un consejo hipotético.'),(1,'can',false,'No encaja con el sentido hipotético de "if I were you".'),(2,'must',false,'Es una obligación fuerte, no un consejo suave.'),(3,'shall',false,'No encaja en este tipo de consejo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Dando una orden',false,'"Shall we...?" no es una orden.'),(1,'Haciendo una sugerencia',true,'Correcto: "Shall we...?" es una forma de proponer un plan juntos.'),(2,'Pidiendo disculpas',false,'No tiene relación con disculparse.'),(3,'Prohibiendo algo',false,'No tiene relación con una prohibición.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"You _____ smoke inside the building. It''s strictly forbidden." ¿Qué modal expresa prohibición?'),
  (1, 'En el diálogo "— Could you help me with this bag? — Of course!", ¿qué función cumple "could"?'),
  (2, 'En el diálogo "— May I use your phone? — Sure.", ¿qué función cumple "may"?'),
  (3, 'En el diálogo "— Shall we go to the movies? — Sounds good!", ¿qué función cumple "shall"?'),
  (4, '¿Cuál es la diferencia principal entre "must" y "must not"?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 3 — Diálogos y conversación' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'must not',true,'Correcto: "must not" expresa prohibición.'),(1,'don''t have to',false,'Eso expresa que algo no es obligatorio, no que esté prohibido.'),(2,'may',false,'No expresa prohibición.'),(3,'could',false,'No expresa prohibición.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Es una petición cortés',true,'Correcto: "could" en este contexto pide un favor con amabilidad.'),(1,'Es una orden',false,'No es una orden, es una petición amable.'),(2,'Es una prohibición',false,'No tiene ningún sentido de prohibición.'),(3,'Es un plan juntos',false,'No propone un plan compartido, pide un favor individual.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Está pidiendo permiso',true,'Correcto: "May I...?" pide permiso para usar el teléfono.'),(1,'Está dando una orden',false,'No da una orden, pide permiso.'),(2,'Está dando un consejo',false,'No es un consejo.'),(3,'Está prohibiendo algo',false,'No tiene sentido de prohibición.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Está proponiendo un plan juntos',true,'Correcto: "Shall we...?" propone hacer algo en conjunto.'),(1,'Está pidiendo permiso',false,'No pide permiso, propone un plan.'),(2,'Está dando una orden',false,'No es una orden.'),(3,'Está prohibiendo algo',false,'No tiene sentido de prohibición.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'"Must" es obligación y "must not" es prohibición',true,'Correcto: son casi opuestos, aunque se ven parecidos escritos.'),(1,'Son exactamente lo mismo',false,'No son lo mismo: expresan ideas casi opuestas.'),(2,'"Must" es prohibición y "must not" es obligación',false,'Es al revés.'),(3,'Ninguno de los dos se usa en inglés moderno',false,'Ambos son de uso muy frecuente.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 3 — Diálogos y conversación' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;


-- ================================================================
-- MÓDULO 4 — Parte 4: Use of Language
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Parte 4: Use of Language",
    "subtitle": "Esta es la parte con más preguntas del examen — y también la que mejor puedes dominar, porque se basa en reglas claras, no en vocabulario suelto.",
    "guide_html": "<p>La misma ruta de siempre: 2 lecturas de gramática, un quiz, una lección interactiva, otro quiz, una práctica con un caso real, y el formulario de cierre.</p>",
    "objectives": [
      "Usar correctamente preposiciones fijas junto a adjetivos (interested in, afraid of, good at)",
      "Formar comparativos y superlativos, tanto de adjetivos cortos como largos",
      "Elegir el pronombre sujeto correcto y distinguir adjetivo (good) de adverbio (well)"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Preposiciones fijas y comparativos/superlativos",
    "html": "<p class='lead-in'>Esta parte del examen premia a quien conoce reglas fijas — no hay que adivinar, hay que reconocer el patrón. Empecemos por dos de los más frecuentes.</p><h2>Preposiciones que van pegadas a un adjetivo</h2><p>Algunos adjetivos siempre usan la misma preposición — hay que memorizarlos como pareja fija: <strong>interested in</strong> (interesado en), <strong>afraid of</strong> (asustado de), <strong>good at</strong> (bueno en).</p><div class='example-box'><div class='line'>'She is interested <strong>in</strong> learning new languages.'</div></div><h2>Comparativos y superlativos</h2><table class='grammar-table'><tr><th>Tipo de adjetivo</th><th>Comparativo</th><th>Superlativo</th></tr><tr><td>Corto (tall)</td><td>taller</td><td>the tallest</td></tr><tr><td>Largo (interesting)</td><td>more interesting</td><td>the most interesting</td></tr></table><p>Regla rápida: adjetivos <strong>cortos</strong> (1 sílaba, a veces 2) agregan <strong>-er / -est</strong>. Adjetivos <strong>largos</strong> usan <strong>more / the most</strong> delante. El superlativo siempre lleva <strong>'the'</strong> adelante.</p><details class='mini-check'><summary>¿Cómo se forma el comparativo de un adjetivo largo como 'interesting'?</summary><div class='answer'>Con 'more' delante: more interesting.</div></details><details class='mini-check'><summary>¿Qué preposición acompaña siempre a 'interested'?</summary><div class='answer'>'In' — interested in.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Pronombres sujeto y adjetivo vs. adverbio",
    "html": "<p class='lead-in'>Terminemos con dos reglas que se confunden fácilmente: cuándo usar 'we' en vez de 'us', y cuándo usar 'good' en vez de 'well' (o viceversa).</p><h2>Pronombres sujeto</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>I, you, he, she, it</div><div class='mean'>singular</div></div><div class='vocab-item'><div class='word'>we, you, they</div><div class='mean'>plural — 'María y yo' = we</div></div></div><p>Tip: si la frase original dice 'María y yo hicimos la tarea', en inglés se convierte en <strong>'We</strong> did the homework', nunca en 'Us did...' — 'us' solo se usa como objeto, no como sujeto.</p><h2>Adjetivo vs. adverbio</h2><p><strong>good</strong> (adjetivo, describe un sustantivo) → <strong>well</strong> (adverbio, describe un verbo). Ej: 'He speaks English very <strong>well</strong>' (no 'very good').</p><div class='tip-box'><span class='icon'>💡</span><span>Pregúntate: ¿la palabra describe una <em>cosa/persona</em> (sustantivo) o una <em>acción</em> (verbo)? Si describe una acción, casi siempre necesitas el adverbio (well), no el adjetivo (good).</span></div><details class='mini-check'><summary>¿'Good' o 'well' para describir cómo habla alguien?</summary><div class='answer'>Well — porque describe al verbo 'speaks', y para eso se usa un adverbio.</div></details><details class='mini-check'><summary>¿Qué pronombre sujeto usarías para 'María y yo'?</summary><div class='answer'>We.</div></details>"
  },
  "interactive": {
    "title": "Repasemos las reglas con imágenes",
    "intro": "Toca cada burbuja para revelar la regla completa.",
    "slides": [
      { "id":"s1", "icon":"🎯", "title":"interested IN", "bubble":"¿Qué preposición va siempre con 'interested'?", "detail":"In — 'interested in something'." },
      { "id":"s2", "icon":"😨", "title":"afraid OF", "bubble":"¿Qué preposición va siempre con 'afraid'?", "detail":"Of — 'afraid of something'." },
      { "id":"s3", "icon":"⭐", "title":"good AT", "bubble":"¿Qué preposición va siempre con 'good'?", "detail":"At — 'good at something'." },
      { "id":"s4", "icon":"📏", "title":"Adjetivos cortos", "bubble":"¿Cómo se forma el comparativo de 'tall'?", "detail":"Agregando -er: taller." },
      { "id":"s5", "icon":"📐", "title":"Adjetivos largos", "bubble":"¿Cómo se forma el comparativo de 'interesting'?", "detail":"Con 'more' delante: more interesting." },
      { "id":"s6", "icon":"🗣️", "title":"good vs. well", "bubble":"¿'Good' o 'well' para describir un verbo?", "detail":"Well — los adverbios describen verbos, no los adjetivos." }
    ]
  },
  "practice": {
    "title": "Dos hermanos comprando una laptop",
    "html": "<p class='lead-in'>Veamos toda esta gramática aplicada a una situación cotidiana: dos hermanos comparando opciones antes de comprar algo.</p><div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Juan is <strong>interested in</strong> technology, so he researched laptops for a week. His sister Ana is <strong>good at</strong> finding good deals online.</p><p>They compared two laptops: the first one is <strong>cheaper</strong>, but the second one is <strong>more powerful</strong>. After thinking about it, Ana said: 'This one is <strong>the most expensive</strong>, but it's also <strong>the best</strong> for gaming.'</p><p>Juan was a little <strong>afraid of</strong> spending too much money, but Ana convinced him it was worth it. In the end, <strong>they</strong> decided together, and Juan said the laptop worked really <strong>well</strong> for his university projects.</p></div><div class='tip-box'><span class='icon'>✅</span><span>En una sola conversación aparecieron preposiciones fijas, comparativos, superlativos, pronombres y la diferencia entre adjetivo y adverbio — exactamente lo que evalúa esta parte del examen.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras — esto no se califica.",
    "fields": [
      { "id":"oracion_preposicion", "label":"Escribe una oración usando 'interested in' o 'good at'.", "type":"textarea", "placeholder":"" },
      { "id":"regla_comparativo", "label":"¿Cuál es la regla para el comparativo de un adjetivo corto vs. uno largo?", "type":"textarea", "placeholder":"" },
      { "id":"good_well", "label":"Completa: 'She sings very ___.' (adjetivo o adverbio de good)", "type":"text", "placeholder":"" },
      { "id":"dificultad", "label":"¿Qué parte de esta lección se te dificultó más?", "type":"textarea", "placeholder":"" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 4 — Use of Language';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: preposiciones y comparativos', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language'
on conflict (module_id, stage) do nothing;

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
where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'on',false,'No es la combinación correcta con "interested".'),(1,'in',true,'Correcto: "interested in" es la combinación correcta.'),(2,'at',false,'No es la combinación correcta con "interested".'),(3,'for',false,'No es la combinación correcta con "interested".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'more interesting',true,'Correcto: los adjetivos largos usan "more" + adjetivo para el comparativo.'),(1,'interestinger',false,'No es una forma válida en inglés.'),(2,'most interesting',false,'Ese es el superlativo, no el comparativo.'),(3,'as interesting',false,'Esa forma se usa para comparaciones de igualdad, no de superioridad.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'the tallest',true,'Correcto: el superlativo de adjetivos cortos es "the" + adjetivo + "-est".'),(1,'taller',false,'Es comparativo, no superlativo.'),(2,'the more tall',false,'No es la forma correcta.'),(3,'tallest',false,'Falta el artículo "the" antes del superlativo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Us',false,'"Us" es pronombre objeto, no sujeto.'),(1,'We',true,'Correcto: "we" es el pronombre sujeto para "María y yo".'),(2,'Them',false,'No corresponde a la primera persona plural.'),(3,'Our',false,'Es un adjetivo posesivo, no un pronombre sujeto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'good',false,'"Good" es adjetivo; para modificar un verbo se necesita un adverbio.'),(1,'well',true,'Correcto: "well" es el adverbio correspondiente a "good".'),(2,'best',false,'Es un superlativo, no encaja aquí.'),(3,'better',false,'Es un comparativo, no encaja aquí sin una comparación explícita.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"He is afraid _____ spiders." ¿Qué preposición completa la oración?'),
  (1, '"She is good _____ playing chess." ¿Qué preposición completa la oración?'),
  (2, '"This is the _____ book I''ve ever read." (superlativo largo de "boring")'),
  (3, '"My brother is _____ than me." (comparativo corto de "short")'),
  (4, '"_____ finished their project on time." ¿Qué pronombre sujeto usarías para referirte a "Carlos and Ana"?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 4 — Use of Language' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'of',true,'Correcto: "afraid of" es la combinación fija.'),(1,'from',false,'No es la combinación correcta con "afraid".'),(2,'in',false,'No es la combinación correcta con "afraid".'),(3,'about',false,'No es la combinación correcta con "afraid".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'at',true,'Correcto: "good at" es la combinación fija.'),(1,'in',false,'No es la combinación correcta con "good".'),(2,'for',false,'No es la combinación correcta con "good".'),(3,'with',false,'No es la combinación correcta con "good".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'most boring',false,'Falta el artículo "the" antes del superlativo.'),(1,'the most boring',true,'Correcto: superlativo de un adjetivo largo con "the most".'),(2,'boringest',false,'No es una forma válida en inglés.'),(3,'more boring',false,'Ese es el comparativo, no el superlativo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'shorter',true,'Correcto: adjetivo corto + "-er".'),(1,'more short',false,'Los adjetivos cortos no usan "more".'),(2,'shortest',false,'Ese es el superlativo, falta "the" y no es lo que pide la oración.'),(3,'shortly',false,'"Shortly" es un adverbio con otro significado, no el comparativo de "short".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'They',true,'Correcto: "they" es el pronombre sujeto para "Carlos and Ana".'),(1,'He',false,'"He" es singular, no corresponde a dos personas.'),(2,'It',false,'"It" se usa para cosas u objetos, no personas.'),(3,'Their',false,'Es un adjetivo posesivo, no un pronombre sujeto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 4 — Use of Language' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;


-- ================================================================
-- MÓDULO 5 — Parte 5: Lectura literal
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Parte 5: Lectura literal",
    "subtitle": "Es la más fácil de las dos partes de comprensión de lectura: la respuesta siempre está escrita tal cual en el texto. Tu trabajo es encontrarla, no interpretarla.",
    "guide_html": "<p>La misma ruta de siempre: 2 lecturas (cada una con su propio texto de práctica), un quiz, una lección interactiva, otro quiz, una práctica con un caso real, y el formulario de cierre.</p>",
    "objectives": [
      "Encontrar información explícita en un texto corto, sin necesidad de interpretar",
      "Usar la estrategia de escaneo por palabras clave para ahorrar tiempo",
      "Reconocer las trampas más comunes de esta parte (datos parecidos que confunden)"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Escaneo por palabras clave: el texto de Anna",
    "html": "<p class='lead-in'>La lectura literal no requiere que entiendas cada palabra del texto — requiere que sepas <strong>buscar</strong>. Vamos a practicar con el texto de Anna.</p><div class='reading-passage'><span class='passage-tag'>Texto de práctica</span>Anna works at a hospital. She starts her shift at 7 a.m. and finishes at 3 p.m. During her lunch break, she usually eats a sandwich in the hospital cafeteria. After work, she goes home and walks her dog before dinner.</div><h2>Estrategia: escaneo por palabras clave</h2><p>No leas el texto como una novela. Lee primero la <strong>pregunta</strong>, identifica la palabra clave (ej: 'shift', 'lunch', 'after work') y busca esa misma idea en el texto — la respuesta casi siempre usa palabras muy parecidas.</p><table class='grammar-table'><tr><th>Pregunta</th><th>Palabra clave a buscar</th><th>Dónde está en el texto</th></tr><tr><td>¿A qué hora empieza su turno?</td><td>starts / shift</td><td>'starts her shift at 7 a.m.'</td></tr><tr><td>¿Dónde come?</td><td>lunch break</td><td>'in the hospital cafeteria'</td></tr><tr><td>¿Qué hace después del trabajo?</td><td>after work</td><td>'goes home and walks her dog'</td></tr></table><details class='mini-check'><summary>¿A qué hora termina el turno de Anna?</summary><div class='answer'>A las 3 p.m. — pero ojo, si te preguntan cuándo EMPIEZA, la respuesta es 7 a.m.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Un segundo texto y las trampas más comunes",
    "html": "<p class='lead-in'>Practiquemos con un segundo texto, esta vez sobre un chef, y hablemos de las trampas que más hacen perder puntos en esta parte.</p><div class='reading-passage'><span class='passage-tag'>Texto de práctica</span>Tom is a chef at a small restaurant downtown. He arrives at 6 a.m. to prepare the ingredients for the day. His restaurant opens at 11 a.m. and closes at 10 p.m. On Mondays, the restaurant is closed for cleaning.</div><table class='grammar-table'><tr><th>Pregunta</th><th>Palabra clave</th><th>Dónde está en el texto</th></tr><tr><td>¿A qué hora abre el restaurante?</td><td>opens</td><td>'opens at 11 a.m.'</td></tr><tr><td>¿Qué día está cerrado?</td><td>closed</td><td>'closed on Mondays'</td></tr></table><div class='tip-box'><span class='icon'>📖</span><span>Cuidado con las <strong>trampas</strong>: el texto de Tom menciona 3 horas distintas (6 a.m., 11 a.m., 10 p.m.) y un día de cierre. Si lees rápido y sin enfocarte en la palabra clave exacta de la pregunta, es fácil confundir 'llega' con 'abre'.</span></div><details class='mini-check'><summary>¿A qué hora llega Tom a preparar los ingredientes?</summary><div class='answer'>A las 6 a.m. — distinto de la hora de apertura del restaurante (11 a.m.).</div></details><details class='mini-check'><summary>¿Qué día cierra el restaurante de Tom?</summary><div class='answer'>Los lunes, para limpieza.</div></details>"
  },
  "interactive": {
    "title": "Repasemos con imágenes: encuentra el dato",
    "intro": "Cada burbuja te pregunta un dato literal. Tócala para revelar dónde está en el texto.",
    "slides": [
      { "id":"s1", "icon":"🏥", "title":"Anna", "bubble":"¿A qué hora empieza su turno?", "detail":"7 a.m. — 'starts her shift at 7 a.m.'" },
      { "id":"s2", "icon":"🥪", "title":"Anna", "bubble":"¿Dónde come durante su descanso?", "detail":"En la cafetería del hospital — 'in the hospital cafeteria'." },
      { "id":"s3", "icon":"🐕", "title":"Anna", "bubble":"¿Qué hace después del trabajo?", "detail":"Camina con su perro — 'walks her dog before dinner'." },
      { "id":"s4", "icon":"👨‍🍳", "title":"Tom", "bubble":"¿A qué hora llega a preparar los ingredientes?", "detail":"6 a.m. — antes de que abra el restaurante." },
      { "id":"s5", "icon":"🚪", "title":"Tom", "bubble":"¿A qué hora abre su restaurante?", "detail":"11 a.m." },
      { "id":"s6", "icon":"🧹", "title":"Tom", "bubble":"¿Qué día está cerrado?", "detail":"Los lunes, para limpieza." }
    ]
  },
  "practice": {
    "title": "Leyendo un aviso real: horario de una farmacia",
    "html": "<p class='lead-in'>La lectura literal no es solo para textos largos — la usas todo el tiempo para leer horarios, avisos y letreros reales.</p><div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Imagina que ves este aviso en la puerta de una farmacia: <strong>'Open Monday to Saturday, 7 a.m. to 9 p.m. Closed on Sundays and public holidays.'</strong></p><p>Son las 6:30 p.m. de un sábado y necesitas comprar medicina urgente. Usando la misma estrategia de escaneo: buscas la palabra clave 'Saturday' en el aviso, confirmas que abre 'Monday to Saturday' hasta las 9 p.m., y concluyes que sí puedes ir — todavía hay media hora antes del cierre.</p></div><div class='tip-box'><span class='icon'>✅</span><span>Así de simple y así de útil es la lectura literal en la vida real: encontrar el dato exacto que necesitas, sin adivinar ni interpretar de más.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id":"estrategia_escaneo", "label":"Explica en tus palabras en qué consiste la estrategia de 'escaneo por palabras clave'.", "type":"textarea", "placeholder":"" },
      { "id":"dato_anna_tom", "label":"Menciona un dato literal del texto de Anna o de Tom y en qué parte del texto lo encontraste.", "type":"text", "placeholder":"" },
      { "id":"trampa_comun", "label":"¿Cuál es la trampa más común en esta parte del examen y cómo la evitas?", "type":"textarea", "placeholder":"" },
      { "id":"dificultad", "label":"¿Qué fue lo que más te costó de esta lección?", "type":"textarea", "placeholder":"" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 5 — Lectura literal';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: Anna y Tom', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 5 — Lectura literal'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Según el texto de Anna, ¿a qué hora empieza su turno?'),
  (1, 'Según el mismo texto, ¿dónde come Anna durante su descanso?'),
  (2, '¿Qué hace Anna después del trabajo, antes de cenar?'),
  (3, 'Según el texto de Tom, ¿a qué hora abre su restaurante?'),
  (4, '¿Qué día está cerrado el restaurante de Tom?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 5 — Lectura literal' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'3 p.m.',false,'Esa es la hora en que termina, no en que empieza.'),(1,'7 a.m.',true,'Correcto: el texto dice "starts her shift at 7 a.m."'),(2,'9 a.m.',false,'No aparece esa hora en el texto.'),(3,'12 p.m.',false,'No aparece esa hora en el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'En su casa',false,'El texto dice que come en la cafetería del hospital.'),(1,'En la cafetería del hospital',true,'Correcto: "in the hospital cafeteria".'),(2,'En un restaurante',false,'No es lo que dice el texto.'),(3,'No come nada',false,'El texto dice que come un sándwich.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Duerme una siesta',false,'El texto no menciona eso.'),(1,'Camina con su perro',true,'Correcto: "she goes home and walks her dog before dinner".'),(2,'Va al gimnasio',false,'El texto no menciona eso.'),(3,'Ve televisión',false,'El texto no menciona eso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'6 a.m.',false,'Esa es la hora en que Tom llega, no en que abre el restaurante.'),(1,'11 a.m.',true,'Correcto: "His restaurant opens at 11 a.m."'),(2,'10 p.m.',false,'Esa es la hora de cierre, no de apertura.'),(3,'9 a.m.',false,'No aparece esa hora en el texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Domingo',false,'El texto no menciona los domingos.'),(1,'Lunes',true,'Correcto: "On Mondays, the restaurant is closed for cleaning."'),(2,'Sábado',false,'No es lo que dice el texto.'),(3,'Nunca cierra',false,'El texto dice que cierra los lunes.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 5 — Lectura literal'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Dónde trabaja Anna?'),
  (1, '¿Qué come Anna en su descanso?'),
  (2, '¿A qué hora llega Tom a preparar los ingredientes?'),
  (3, '¿Qué tipo de negocio tiene Tom?'),
  (4, '¿Cuál es la trampa más común en la lectura literal?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 5 — Lectura literal' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'En una escuela',false,'El texto dice que trabaja en un hospital.'),(1,'En un hospital',true,'Correcto: "Anna works at a hospital".'),(2,'En un banco',false,'El texto dice que trabaja en un hospital.'),(3,'En una tienda',false,'El texto dice que trabaja en un hospital.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Un sándwich',true,'Correcto: "she usually eats a sandwich".'),(1,'Una ensalada',false,'El texto dice que come un sándwich.'),(2,'Una sopa',false,'El texto dice que come un sándwich.'),(3,'Nada, ayuna',false,'El texto dice que sí come algo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'11 a.m.',false,'Esa es la hora en que abre el restaurante, no en que llega Tom.'),(1,'6 a.m.',true,'Correcto: "He arrives at 6 a.m. to prepare the ingredients".'),(2,'10 p.m.',false,'Esa es la hora de cierre.'),(3,'7 a.m.',false,'No aparece esa hora en el texto de Tom.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Un restaurante',true,'Correcto: "Tom is a chef at a small restaurant downtown".'),(1,'Un hospital',false,'Ese es el lugar de trabajo de Anna, no de Tom.'),(2,'Una escuela de cocina',false,'El texto no menciona eso.'),(3,'Un supermercado',false,'El texto no menciona eso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Confundir datos parecidos (varias horas o fechas en el mismo texto)',true,'Correcto: por eso es clave leer bien qué pide exactamente la pregunta.'),(1,'No saber suficiente vocabulario',false,'La lectura literal no depende tanto del vocabulario como del escaneo cuidadoso.'),(2,'Que el texto esté en pasado',false,'El tiempo verbal no es la trampa principal de esta parte.'),(3,'Que las preguntas estén en español',false,'Las preguntas suelen estar en español, pero esa no es la trampa.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 5 — Lectura literal' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;


-- ================================================================
-- MÓDULO 6 — Parte 6: Lectura inferencial
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Parte 6: Lectura inferencial",
    "subtitle": "Un paso más allá de la lectura literal: la respuesta no está escrita directamente, pero el texto te da pistas suficientes para deducirla con seguridad.",
    "guide_html": "<p>La misma ruta de siempre: 2 lecturas (cada una con su texto), un quiz, una lección interactiva, otro quiz, una práctica real, y el formulario de cierre.</p>",
    "objectives": [
      "Identificar conectores lógicos (however, because, therefore) y usarlos como pistas",
      "Deducir información que el texto no dice directamente, pero sí sugiere",
      "Descartar inferencias que contradigan un hecho explícito del texto"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Conectores que son pistas de oro: el texto de Marco",
    "html": "<p class='lead-in'>Inferir no es adivinar — es unir las pistas que el texto SÍ te da. Los conectores lógicos son la mejor pista de todas.</p><div class='reading-passage'><span class='passage-tag'>Texto de práctica</span>Marco wanted to go hiking on Saturday. However, the weather forecast predicted heavy rain. Because he didn't want to get sick, he decided to stay home and watch movies instead. Therefore, he rescheduled the hike for the following weekend.</div><table class='grammar-table'><tr><th>Conector</th><th>Función</th><th>Ejemplo en el texto</th></tr><tr><td>however</td><td>Contraste — algo cambia lo anterior</td><td>'However, the weather forecast predicted rain'</td></tr><tr><td>because</td><td>Razón / causa</td><td>'Because he didn't want to get sick'</td></tr><tr><td>therefore</td><td>Consecuencia / conclusión</td><td>'Therefore, he rescheduled the hike'</td></tr></table><p>El texto nunca dice 'Marco es precavido' — pero decidió quedarse en casa <em>para no enfermarse</em>, así que sí podemos inferir que es una persona cuidadosa con su salud.</p><details class='mini-check'><summary>¿Qué se puede inferir sobre lo que hará Marco el próximo fin de semana?</summary><div class='answer'>Que irá de excursión — el texto dice 'he rescheduled the hike for the following weekend'.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Un segundo texto y cómo inferir sin equivocarte",
    "html": "<p class='lead-in'>Practiquemos con un segundo texto y dejemos clara la regla de oro para no fallar en esta parte.</p><div class='reading-passage'><span class='passage-tag'>Texto de práctica</span>Elena had been saving money for a new phone. However, when she saw the price of the latest model, she decided to buy last year's version instead. Because it was much cheaper, she was able to save the rest of her money for a trip.</div><h2>Cómo inferir sin equivocarte</h2><p>Pregúntate: ¿qué información junta el texto para llevarte a esa conclusión, aunque no lo diga con esas palabras exactas? El texto nunca dice 'Elena es una persona práctica', pero sus decisiones (comprar el modelo más barato, ahorrar para un viaje) sí lo sugieren.</p><div class='tip-box'><span class='icon'>🔍</span><span>Regla de oro: si una opción de respuesta contradice algo que el texto SÍ dice explícitamente, descártala de inmediato — una inferencia nunca puede contradecir un hecho literal del texto.</span></div><details class='mini-check'><summary>¿Por qué compró Elena el modelo del año pasado?</summary><div class='answer'>Porque era mucho más barato, y así pudo ahorrar el resto del dinero para un viaje.</div></details><details class='mini-check'><summary>¿Qué tipo de persona parece Elena según sus decisiones?</summary><div class='answer'>Alguien práctica, que prioriza sus metas financieras sobre un gusto inmediato.</div></details>"
  },
  "interactive": {
    "title": "Repasemos con imágenes: conecta las pistas",
    "intro": "Toca cada burbuja para revelar qué infiere el texto.",
    "slides": [
      { "id":"s1", "icon":"🌧️", "title":"Marco", "bubble":"¿Por qué decidió NO ir de excursión?", "detail":"Por la lluvia pronosticada y para no enfermarse — 'however' + 'because'." },
      { "id":"s2", "icon":"🥾", "title":"Marco", "bubble":"¿Qué hará el próximo fin de semana?", "detail":"Ir de excursión — 'he rescheduled the hike for the following weekend'." },
      { "id":"s3", "icon":"📱", "title":"Elena", "bubble":"¿Por qué compró el modelo más antiguo?", "detail":"Porque era más barato y así pudo ahorrar para un viaje." },
      { "id":"s4", "icon":"🧠", "title":"Elena", "bubble":"¿Qué tipo de persona parece ser?", "detail":"Práctica — prioriza sus metas financieras." },
      { "id":"s5", "icon":"🔗", "title":"HOWEVER", "bubble":"¿Qué función tiene este conector?", "detail":"Introduce un contraste con la idea anterior." },
      { "id":"s6", "icon":"➡️", "title":"THEREFORE", "bubble":"¿Qué función tiene este conector?", "detail":"Introduce una consecuencia o conclusión." }
    ]
  },
  "practice": {
    "title": "Un mensaje de WhatsApp: inferir en la vida real",
    "html": "<p class='lead-in'>Inferir no es solo para exámenes — lo haces todo el tiempo leyendo mensajes de amigos.</p><div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Tu amigo te escribe: <strong>'I studied all week for the test. However, I only slept 3 hours last night. Because I was so tired, I almost fell asleep during the exam. Therefore, I'm not sure how well I did.'</strong></p><p>Sin que lo diga directamente, puedes inferir que tu amigo está preocupado por su resultado, y que probablemente debería dormir mejor antes de la próxima prueba — todo eso se deduce de los conectores 'however', 'because' y 'therefore', igual que hiciste con los textos de Marco y Elena.</p></div><div class='tip-box'><span class='icon'>✅</span><span>La próxima vez que leas un mensaje o un texto en inglés, fíjate en estos conectores — te van a decir mucho más de lo que dicen las palabras literales.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id":"conector_favorito", "label":"Elige un conector (however, because o therefore) y explica su función con tus palabras.", "type":"textarea", "placeholder":"" },
      { "id":"inferencia_propia", "label":"Escribe una inferencia que hiciste sobre Marco o Elena y en qué parte del texto te basaste.", "type":"textarea", "placeholder":"" },
      { "id":"regla_oro", "label":"¿Cuál es la regla de oro para no equivocarte al inferir?", "type":"text", "placeholder":"" },
      { "id":"dificultad", "label":"¿Qué fue lo más difícil de esta lección?", "type":"textarea", "placeholder":"" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 6 — Lectura inferencial';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: Marco y Elena', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 6 — Lectura inferencial'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Por qué Marco decidió NO ir de excursión el sábado?'),
  (1, 'En el texto de Marco, la palabra "however" indica...'),
  (2, '¿Qué se puede inferir que hará Marco el próximo fin de semana?'),
  (3, '¿Por qué Elena compró el modelo del año pasado en vez del más nuevo?'),
  (4, '¿Qué se puede inferir sobre la personalidad de Elena?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 6 — Lectura inferencial' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Porque no le gusta el senderismo',false,'El texto dice que sí quería ir de excursión.'),(1,'Porque se pronosticaba lluvia fuerte y no quería enfermarse',true,'Correcto: se infiere de "However... heavy rain" y "Because he didn''t want to get sick".'),(2,'Porque tenía que trabajar',false,'El texto no menciona trabajo.'),(3,'Porque perdió sus botas de excursión',false,'El texto no menciona eso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'...una razón',false,'Esa función la cumple "because", no "however".'),(1,'...un contraste con lo anterior',true,'Correcto: "however" introduce una idea que contrasta con la anterior.'),(2,'...una conclusión',false,'Esa función la cumple "therefore", no "however".'),(3,'...un ejemplo',false,'No es la función de "however" aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Ir de excursión',true,'Correcto: "he rescheduled the hike for the following weekend".'),(1,'Quedarse en casa otra vez',false,'El texto dice que reprogramó la excursión.'),(2,'Viajar a otra ciudad',false,'El texto no menciona eso.'),(3,'No se puede saber',false,'Sí se puede inferir directamente del texto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Porque era el único disponible en la tienda',false,'El texto no menciona disponibilidad.'),(1,'Porque era mucho más barato',true,'Correcto: "Because it was much cheaper".'),(2,'Porque no le gustaba el modelo nuevo',false,'El texto no dice eso — solo compara precios.'),(3,'Porque se lo regalaron',false,'El texto no menciona eso.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Alguien impulsiva que gasta sin pensar',false,'Es lo contrario: sus decisiones muestran planeación.'),(1,'Alguien práctica que prioriza sus metas financieras',true,'Correcto: ahorró comprando el modelo más barato para poder viajar.'),(2,'Alguien a quien no le interesa la tecnología',false,'El texto dice que sí quería un teléfono nuevo.'),(3,'Alguien indecisa que no planea nada',false,'Al contrario, tomó una decisión clara con un objetivo (el viaje).')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 6 — Lectura inferencial'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué función cumple la palabra "therefore" en el texto de Marco?'),
  (1, 'En el texto de Elena, ¿qué función cumple la palabra "because"?'),
  (2, 'Si una opción de respuesta contradice un hecho explícito del texto, ¿qué debes hacer?'),
  (3, '¿Qué tienen en común las decisiones de Marco y de Elena?'),
  (4, '¿Qué tipo de persona parece Marco según sus decisiones en el texto?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 6 — Lectura inferencial' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Presenta una consecuencia o conclusión',true,'Correcto: "therefore" significa "por lo tanto" e introduce una consecuencia.'),(1,'Presenta una opción',false,'No es la función de "therefore".'),(2,'Presenta una pregunta',false,'No es la función de "therefore".'),(3,'Presenta una disculpa',false,'No es la función de "therefore".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Presenta una razón o causa',true,'Correcto: "because" introduce la razón por la que Elena tomó esa decisión.'),(1,'Presenta un contraste',false,'Esa función la cumple "however".'),(2,'Presenta una conclusión',false,'Esa función la cumple "therefore".'),(3,'Presenta un ejemplo',false,'No es la función de "because" aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Descartarla de inmediato',true,'Correcto: una inferencia nunca puede contradecir un hecho literal del texto.'),(1,'Elegirla igual si suena razonable',false,'Nunca — si contradice el texto, es incorrecta sin importar qué tan razonable suene.'),(2,'Marcarla como posible pero no segura',false,'Debe descartarse por completo, no dejarse como duda.'),(3,'Preguntarle al profesor',false,'En el examen debes decidir tú mismo usando esta regla.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Ambos tomaron una decisión práctica basada en las circunstancias',true,'Correcto: Marco pospuso su plan por el clima, Elena ajustó su compra por el precio — ambos son ejemplos de decisiones prácticas.'),(1,'Ambos cancelaron sus planes por completo',false,'Marco solo reprogramó, no canceló; Elena sí compró, solo cambió de modelo.'),(2,'Ambos gastaron más de lo planeado',false,'Es lo contrario en el caso de Elena, que ahorró dinero.'),(3,'Ninguno de los dos pensó en el futuro',false,'Al contrario, ambos textos muestran decisiones pensadas hacia adelante.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Alguien imprudente que ignora el clima',false,'Es lo contrario: sí tomó en cuenta el clima.'),(1,'Alguien precavido que cuida su salud',true,'Correcto: decidió quedarse en casa para no enfermarse — eso muestra precaución.'),(2,'Alguien a quien no le importa el senderismo',false,'El texto dice que sí quería ir de excursión.'),(3,'Alguien indeciso que no planea nada',false,'Al contrario, reprogramó su plan con una fecha concreta.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 6 — Lectura inferencial' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;


-- ================================================================
-- MÓDULO 7 — Parte 7: Texto con opción múltiple
-- ================================================================
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Parte 7: Texto con opción múltiple",
    "subtitle": "Aquí lees un texto corto sobre temas generales y eliges la palabra que mejor completa cada espacio — combinando gramática y sentido del texto completo. Es la parte con más preguntas del examen.",
    "guide_html": "<p>La misma ruta de siempre: 2 lecturas, un quiz, una lección interactiva, otro quiz, una práctica real, y el formulario de cierre.</p>",
    "objectives": [
      "Reconocer los puntos gramaticales que más se repiten en esta parte: comparativos/superlativos largos, posesivos y preposiciones",
      "Distinguir correctamente 'its' de 'it's'",
      "Elegir el modal correcto (should) para expresar recomendación dentro de un texto"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Los puntos gramaticales que se repiten aquí",
    "html": "<p class='lead-in'>Esta parte combina TODO lo que ya aprendiste — comparativos, posesivos, preposiciones y modales — dentro de un solo texto. Vamos a identificarlos uno por uno.</p><div class='reading-passage'><span class='passage-tag'>Texto de práctica</span>Traveling by train is often more relaxing than flying. Before you travel, you should check your passport is still valid. Football is one of the most popular sports in the world, and many cultures celebrate the New Year with fireworks and music. If you visit Japan, you should try the local street food.</div><table class='grammar-table'><tr><th>Punto</th><th>Regla</th><th>Ejemplo del texto</th></tr><tr><td>Comparativo largo</td><td>more + adjetivo</td><td>more relaxing</td></tr><tr><td>Posesivos</td><td>my, your, his, her, its, our, their</td><td>your passport</td></tr><tr><td>Superlativo largo</td><td>the most + adjetivo</td><td>the most popular</td></tr><tr><td>Preposición de medio</td><td>with</td><td>celebrate with fireworks</td></tr><tr><td>Recomendación</td><td>should</td><td>you should try...</td></tr></table><details class='mini-check'><summary>¿Qué modal usarías para recomendar probar la comida callejera?</summary><div class='answer'>Should — 'you should try the local street food.'</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Adjetivos posesivos, uno por uno, y 'its' vs. 'it's'",
    "html": "<p class='lead-in'>El error más común en esta parte es confundir 'its' con 'it's' — vamos a dejarlo absolutamente claro, y a practicar con un segundo texto cultural.</p><h2>Adjetivos posesivos, uno por uno</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>my / your</div><div class='mean'>mi / tu, su (de usted)</div></div><div class='vocab-item'><div class='word'>his / her / its</div><div class='mean'>su (de él) / su (de ella) / su (de eso: un país, un objeto)</div></div><div class='vocab-item'><div class='word'>our / their</div><div class='mean'>nuestro / su (de ellos)</div></div></div><p><strong>Its</strong> se usa para cosas, animales, países: 'Colombia is famous for <strong>its</strong> beaches' (no 'it's', que es la contracción de 'it is').</p><div class='reading-passage'><span class='passage-tag'>Texto de práctica</span>Brazil is famous for its carnival, one of the biggest celebrations in the world. It's a tradition that brings together music, dance, and colorful costumes. Every year, millions of visitors travel to see its parades.</div><div class='tip-box'><span class='icon'>🔑</span><span>Truco: si puedes reemplazar la palabra por 'it is' y la oración sigue teniendo sentido, usa <strong>it's</strong>. Si no, usa <strong>its</strong> (posesivo).</span></div><details class='mini-check'><summary>¿'Its' o 'it's' para decir que un país es famoso por SUS playas?</summary><div class='answer'>Its (posesivo) — 'it's' significa 'it is' y no encaja aquí.</div></details>"
  },
  "interactive": {
    "title": "Repasemos la gramática con imágenes",
    "intro": "Toca cada burbuja para revelar la regla.",
    "slides": [
      { "id":"s1", "icon":"🚂", "title":"Comparativo largo", "bubble":"¿Cómo se dice 'más relajante' en inglés?", "detail":"More relaxing — adjetivo largo + more." },
      { "id":"s2", "icon":"🛂", "title":"Posesivo YOUR", "bubble":"¿Qué posesivo usarías para 'tu pasaporte'?", "detail":"Your passport." },
      { "id":"s3", "icon":"⚽", "title":"Superlativo largo", "bubble":"¿Cómo se dice 'el más popular' en inglés?", "detail":"The most popular — adjetivo largo + the most." },
      { "id":"s4", "icon":"🎆", "title":"Preposición WITH", "bubble":"¿Qué preposición se usa para 'celebrar CON fuegos artificiales'?", "detail":"With — celebrate with fireworks." },
      { "id":"s5", "icon":"🎭", "title":"ITS (posesivo)", "bubble":"¿'Its' o 'it's' para 'Brasil es famoso por SUS carnavales'?", "detail":"Its — es un posesivo, no la contracción de 'it is'." },
      { "id":"s6", "icon":"🍢", "title":"SHOULD", "bubble":"¿Qué modal usarías para recomendar algo sin obligar?", "detail":"Should — you should try..." }
    ]
  },
  "practice": {
    "title": "Un blog de viajes: toda la gramática junta",
    "html": "<p class='lead-in'>Veamos toda esta gramática aplicada a un fragmento real de blog de viajes.</p><div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Peru is famous for <strong>its</strong> ancient ruins, especially Machu Picchu. Visiting by train is <strong>more comfortable</strong> than hiking, but hiking the Inca Trail is <strong>the most rewarding</strong> experience for adventurous travelers.</p><p>If you visit Cusco, you <strong>should</strong> try the local dishes and celebrate <strong>with</strong> the locals during festival season. <strong>It's</strong> an unforgettable trip — just make sure <strong>your</strong> passport doesn't expire before you go.</p></div><div class='tip-box'><span class='icon'>✅</span><span>En un párrafo corto aparecieron comparativos, superlativos, posesivos, 'its' vs. 'it's' y 'should' — exactamente la combinación que evalúa esta parte del examen.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "Responde con tus propias palabras.",
    "fields": [
      { "id":"its_itsapostrofe", "label":"Explica con tus palabras la diferencia entre 'its' e 'it's'.", "type":"textarea", "placeholder":"" },
      { "id":"oracion_comparativo", "label":"Escribe una oración usando un comparativo largo (more + adjetivo).", "type":"text", "placeholder":"" },
      { "id":"recomendacion", "label":"Escribe una recomendación usando 'should', como en los textos de esta lección.", "type":"text", "placeholder":"" },
      { "id":"dificultad", "label":"¿Qué punto gramatical de esta lección se te dificulta más?", "type":"textarea", "placeholder":"" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 7 — Texto con opción múltiple';

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: gramática mixta', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple'
on conflict (module_id, stage) do nothing;

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
where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple' and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'more',true,'Correcto: "more relaxing" — comparativo de un adjetivo largo.'),(1,'most',false,'Ese es el superlativo, no el comparativo.'),(2,'much',false,'Se puede usar como intensificador, pero no forma el comparativo por sí solo.'),(3,'many',false,'No se usa con adjetivos de esta forma.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'you',false,'No es un adjetivo posesivo.'),(1,'your',true,'Correcto: "your passport" — adjetivo posesivo.'),(2,'yours',false,'"Yours" se usa sin sustantivo después, no antes de "passport".'),(3,'you''re',false,'Es la contracción de "you are", no un posesivo.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'the most',true,'Correcto: "the most popular" — superlativo de un adjetivo largo.'),(1,'more',false,'Ese es el comparativo, no el superlativo.'),(2,'most',false,'Falta el artículo "the" antes del superlativo.'),(3,'much',false,'No forma un superlativo correcto aquí.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'with',true,'Correcto: "celebrate... with fireworks" usa "with" para indicar los medios de la celebración.'),(1,'on',false,'No es la preposición natural en este contexto.'),(2,'at',false,'No es la preposición natural en este contexto.'),(3,'from',false,'No es la preposición natural en este contexto.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'should',true,'Correcto: "should" se usa para dar una recomendación.'),(1,'must not',false,'Eso sería una prohibición, contrario al sentido de la oración.'),(2,'can''t',false,'No encaja con el sentido de recomendación.'),(3,'isn''t',false,'No es un modal ni encaja gramaticalmente.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '"The company increased _____ profits this year." (posesivo de "it")'),
  (1, '"This is _____ book, not mine." (posesivo de "her")'),
  (2, '"_____ raining outside." ¿"Its" o "it''s"?'),
  (3, 'En el texto de Perú, ¿qué modal se usa para recomendar probar los platos locales?'),
  (4, '"Brazil is famous for _____ carnival." (posesivo de países)')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 7 — Texto con opción múltiple' and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'its',true,'Correcto: "its profits" — posesivo de una empresa (cosa/entidad).'),(1,'it''s',false,'"It''s" es la contracción de "it is" y no encaja aquí.'),(2,'their',false,'"Their" es para varias personas u organizaciones en plural, no encaja con "the company" en singular en este uso.'),(3,'it',false,'Falta la forma posesiva.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=0 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'her',true,'Correcto: "her book" — posesivo de "she".'),(1,'she',false,'"She" es pronombre sujeto, no posesivo.'),(2,'hers',false,'"Hers" se usa sin sustantivo después, no antes de "book".'),(3,'his',false,'"His" es el posesivo de "he", no de "she".')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=1 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'It''s',true,'Correcto: "It''s raining" = "It is raining" — es la contracción, no el posesivo.'),(1,'Its',false,'"Its" es un posesivo y no encaja aquí — no hay ningún sustantivo que "posea" la lluvia.'),(2,'Their',false,'No corresponde a esta oración.'),(3,'His',false,'No corresponde a esta oración.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=2 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'Should',true,'Correcto: "you should try the local dishes" — recomendación.'),(1,'Must not',false,'Eso sería una prohibición, no una recomendación.'),(2,'Can''t',false,'No encaja con el sentido de recomendación.'),(3,'Isn''t',false,'No es un modal.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=3 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values (0,'its',true,'Correcto: "its carnival" — posesivo de un país (cosa/entidad).'),(1,'it''s',false,'"It''s" es la contracción de "it is" y no encaja aquí.'),(2,'their',false,'"Their" no corresponde a "Brazil" en singular en este uso.'),(3,'it',false,'Falta la forma posesiva.')) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 7 — Texto con opción múltiple' and qq.order_index=4 and exists(select 1 from public.quizzes qz2 where qz2.id=qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
