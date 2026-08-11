-- ============================================================
-- PROTOTIPO — Módulo 1 "Parte 1 — Avisos y vocabulario" (Pre-ICFES)
-- Lección multi-paso completa, para aprobación antes de replicar
-- en los otros 8 módulos.
-- ============================================================
-- Requiere haber corrido antes (en este orden):
--   1. schema.sql
--   2. admin-schema.sql
--   3. quiz-schema.sql
--   4. seed-pre-icfes-modules.sql
--   5. lesson-flow-schema.sql   <-- el nuevo, agrega lesson_json/stage/etc.
--
-- Qué hace este script:
--   A) Llena modules.lesson_json del módulo 1 con la lección completa:
--      bienvenida + guía rápida, 2 lecturas, lección interactiva
--      (tipo Genially, con burbujas que se revelan), lectura de
--      práctica con un caso de la vida real, y el formulario de cierre.
--   B) Crea los DOS cuestionarios del módulo (stage 'readings' y
--      'interactive'), cada uno con 5 preguntas retadoras de
--      comprensión — basadas EXCLUSIVAMENTE en lo que ya se explicó
--      en las lecturas / la lección interactiva de este mismo script.
--
-- Es seguro correrlo varias veces: los UPDATE se sobrescriben y los
-- INSERT usan "on conflict do nothing" con la llave (module_id, stage)
-- y (quiz_id, order_index) / (question_id, order_index).
--
-- Nota: el módulo 1 ya tenía un cuestionario viejo (stage='main', de
-- quiz-content-pre-icfes.sql). Ese queda huérfano pero inofensivo:
-- en cuanto lesson_json no es null, leccion.html ignora por completo
-- el formato antiguo y usa esta lección nueva.
-- ============================================================

-- ------------------------------------------------------------
-- A) Contenido de la lección (lesson_json)
-- ------------------------------------------------------------
update public.modules set lesson_json = $JSON$
{
  "welcome": {
    "title": "Bienvenido a la Parte 1: Avisos y vocabulario",
    "subtitle": "En esta lección aprendes a leer avisos y letreros en inglés como los que aparecen en la Parte 1 del examen — sin traducir palabra por palabra, entendiendo la idea de un vistazo.",
    "guide_html": "<p>Antes de arrancar, esta es la ruta que vas a recorrer en esta lección (y en todas las que siguen, porque todas usan la misma estructura):</p><ul><li><strong>Dos lecturas</strong> explicadas con calma, con ejemplos y vocabulario real.</li><li>Un <strong>quiz corto</strong> para confirmar que las lecturas quedaron claras.</li><li>Una <strong>lección interactiva</strong> tipo infografía, para repasar con imágenes y burbujas que revelan la explicación al tocarlas.</li><li>Otro <strong>quiz corto</strong> sobre la parte interactiva.</li><li>Una <strong>lectura de práctica</strong> con un caso de la vida real, para ver todo lo aprendido aplicado.</li><li>Un <strong>formulario de cierre</strong> donde tú mismo resumes lo aprendido — con eso se sella el módulo y se desbloquea el siguiente.</li></ul><p>No hay afán: puedes repasar cada parte las veces que quieras antes de avanzar.</p>",
    "objectives": [
      "Reconocer el propósito de un aviso o letrero en inglés sin traducirlo palabra por palabra",
      "Identificar en qué lugar (aeropuerto, calle, tienda, oficina) aparecería cada aviso",
      "Usar correctamente adjetivos como <em>open</em> y <em>closed</em> junto al verbo <em>to be</em>",
      "Aplicar la estrategia de la 'palabra clave' para resolver preguntas de la Parte 1 del examen"
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Los avisos no se traducen: se interpretan",
    "html": "<p class='lead-in'>Imagina que caminas por un aeropuerto en Bogotá y ves un letrero enorme que dice <strong>BAGGAGE CLAIM</strong>. No necesitas saber que <em>baggage</em> significa 'equipaje' y <em>claim</em> significa 'reclamar' para entender qué hacer: ves el letrero, ves las maletas dando vueltas en la banda, y ya sabes que ahí recoges tu equipaje. Así es exactamente como debes leer los avisos en la Parte 1 del examen del ICFES: <strong>por el contexto, no palabra por palabra.</strong></p><h2>¿Qué evalúa realmente esta parte?</h2><p>La Parte 1 del examen te muestra cinco avisos y te pregunta <em>dónde</em> los verías o <em>qué</em> te están pidiendo. No te pide traducir. Te pide reconocer el <strong>propósito comunicativo</strong>: ¿es una prohibición? ¿una indicación? ¿una advertencia? Ese propósito casi siempre se entiende con una sola palabra clave dentro del aviso.</p><h2>Avisos que debes reconocer de memoria</h2><div class='sign-box'><div class='sign-text'>NO PARKING — TOW-AWAY ZONE</div><div class='sign-meaning'>Se ve en calles y zonas de estacionamiento. <em>Tow-away</em> significa 'remolcado' — es decir, si dejas el carro ahí, te lo pueden llevar la grúa.</div></div><div class='sign-box'><div class='sign-text'>PLEASE KEEP OFF THE GRASS</div><div class='sign-meaning'><em>Keep off</em> significa 'mantente alejado de'. Se ve en parques y jardines: te pide no pisar ni sentarte sobre el pasto.</div></div><div class='sign-box'><div class='sign-text'>BAGGAGE CLAIM →</div><div class='sign-meaning'>Se ve en aeropuertos: la flecha te lleva a la zona donde recoges tus maletas después de un vuelo.</div></div><div class='tip-box'><span class='icon'>💡</span><span>Estrategia clave: cuando leas un aviso, busca <strong>una sola palabra</strong> que reconozcas (parking, grass, baggage) y pregúntate: ¿en qué lugar del mundo real tendría sentido este aviso? Esa pregunta casi siempre te lleva a la respuesta correcta.</span></div><details class='mini-check'><summary>¿Qué significa 'keep off the grass'?</summary><div class='answer'>Que no camines ni te sientes sobre el pasto — 'keep off' = mantente alejado de.</div></details><details class='mini-check'><summary>¿Dónde verías el aviso 'baggage claim'?</summary><div class='answer'>En un aeropuerto, señalando dónde recoger tu equipaje.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Advertencias, restricciones y el verbo 'to be'",
    "html": "<p class='lead-in'>Hay dos tipos de avisos que aparecen todo el tiempo en el examen y que muchos estudiantes confunden: los que <strong>advierten</strong> un peligro y los que <strong>restringen</strong> el paso. Y hay una estructura gramatical — abierto/cerrado — que se pregunta una y otra vez. Vamos a dejar ambas cosas absolutamente claras.</p><h2>Advertencia vs. restricción</h2><div class='sign-box'><div class='sign-text'>WARNING</div><div class='sign-meaning'><em>Warning</em> significa 'advertencia'. No es un saludo ni una invitación: indica que hay un peligro o riesgo cerca (piso mojado, alto voltaje, animales, etc.).</div></div><div class='sign-box'><div class='sign-text'>STAFF ONLY — DO NOT ENTER</div><div class='sign-meaning'>Se ve en oficinas, cocinas de restaurantes y tiendas: solo el personal autorizado (<em>staff</em>) puede pasar por esa puerta. Un cliente normal no debe entrar.</div></div><p>La diferencia es clave para el examen: <strong>WARNING</strong> te avisa de un peligro; <strong>STAFF ONLY</strong> te prohíbe el paso a un lugar. Ninguno de los dos te está saludando ni invitando a nada — es un error común confundirlos con avisos amables.</p><h2>Vocabulario: abierto o cerrado</h2><div class='vocab-grid'><div class='vocab-item'><div class='word'>open</div><div class='mean'>abierto</div></div><div class='vocab-item'><div class='word'>closed</div><div class='mean'>cerrado</div></div></div><p>Fíjate en la estructura: <em>'The library is <strong>closed</strong> on Sundays'</em>. Usamos el adjetivo <strong>closed</strong> (no el verbo <em>close</em> sin conjugar) después del verbo <em>to be</em> (is/are). Es el mismo patrón que ya conoces de 'She is happy' o 'They are tired': verbo to be + adjetivo.</p><table class='grammar-table'><tr><th>Correcto</th><th>Incorrecto</th></tr><tr><td>The store <strong>is closed</strong>.</td><td>The store <strong>close</strong>.</td></tr><tr><td>The doors <strong>are open</strong>.</td><td>The doors <strong>opening</strong>.</td></tr></table><details class='mini-check'><summary>¿Qué indica la palabra 'warning' en un aviso?</summary><div class='answer'>Que hay un peligro o riesgo cerca — es una advertencia, no un saludo.</div></details><details class='mini-check'><summary>¿Por qué decimos 'the library IS CLOSED' y no 'the library CLOSE'?</summary><div class='answer'>Porque closed es un adjetivo que va después del verbo to be conjugado (is/are), igual que 'she is happy'.</div></details>"
  },
  "interactive": {
    "title": "Repasemos con imágenes: toca cada aviso",
    "intro": "Cada burbuja esconde la explicación. Tócala para revelarla — así refuerzas lo que ya leíste, pero con otra forma de recordarlo.",
    "slides": [
      { "id":"s1", "icon":"🚫", "title":"NO PARKING — TOW-AWAY ZONE", "bubble":"¿Dónde crees que verías este aviso, y qué te pasa si lo ignoras?", "detail":"Lo ves en calles o zonas de parqueo. Si dejas el carro ahí, te lo puede remolcar la grúa (tow-away)." },
      { "id":"s2", "icon":"🌱", "title":"KEEP OFF THE GRASS", "bubble":"¿Qué acción te pide exactamente esta frase?", "detail":"Te pide no caminar ni sentarte sobre el pasto. 'Keep off' = mantente alejado de algo." },
      { "id":"s3", "icon":"🧳", "title":"BAGGAGE CLAIM", "bubble":"¿En qué tipo de lugar aparece siempre este aviso?", "detail":"Solo en aeropuertos: es la zona donde recoges tu equipaje después de un vuelo." },
      { "id":"s4", "icon":"⚠️", "title":"WARNING", "bubble":"¿Es un saludo, una invitación o algo más?", "detail":"Es una advertencia de peligro o riesgo — nunca un saludo ni una invitación." },
      { "id":"s5", "icon":"🔒", "title":"STAFF ONLY — DO NOT ENTER", "bubble":"¿Quién SÍ puede cruzar esta puerta?", "detail":"Solo el personal autorizado (staff). Un visitante o cliente normal no debe entrar." },
      { "id":"s6", "icon":"🕐", "title":"The store is CLOSED on Sundays", "bubble":"¿Por qué usamos 'closed' y no 'close' en esta frase?", "detail":"Porque closed es un adjetivo que acompaña al verbo to be (is/are) — el mismo patrón que 'she is happy'." }
    ]
  },
  "practice": {
    "title": "Un sábado cualquiera: los avisos en la vida real",
    "html": "<p class='lead-in'>Veamos todo lo aprendido aplicado a una situación cotidiana — así es como realmente vas a usar este vocabulario, no solo en un examen.</p><div class='reading-passage'><div class='passage-tag'>Caso real</div><p><strong>Camila</strong> llega al aeropuerto El Dorado a recoger a su prima que viene de Miami. Apenas entra, ve un letrero enorme: <strong>BAGGAGE CLAIM →</strong>. Sin pensarlo dos veces, sigue la flecha — sabe que ahí va a esperar las maletas.</p><p>Mientras espera, ve una puerta con un aviso: <strong>STAFF ONLY — DO NOT ENTER</strong>. Camila entiende que esa puerta no es para pasajeros, así que se queda del lado correcto.</p><p>De camino a la salida, pasa por un jardín pequeño con un cartel: <strong>PLEASE KEEP OFF THE GRASS</strong>. En vez de cortar camino por el pasto (como pensaba hacer), rodea por la acera.</p><p>Ya afuera, quiere parquear un momento para esperar a su prima, pero ve: <strong>NO PARKING — TOW-AWAY ZONE</strong>. Decide dar la vuelta a la manzana en vez de arriesgarse a que le remolquen el carro.</p><p>Por último, pasa frente a una farmacia y ve un aviso en la puerta: <strong>WARNING: WET FLOOR</strong>. Camila entiende que hay riesgo de resbalar, así que entra con cuidado.</p></div><div class='tip-box'><span class='icon'>✅</span><span>En ningún momento Camila tradujo cada palabra — reconoció el propósito de cada aviso por su palabra clave y actuó en consecuencia. Esa es exactamente la habilidad que te evalúa la Parte 1 del examen.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en esta lección",
    "intro": "No hay respuestas 'correctas' aquí — es un espacio para que pongas en tus propias palabras lo que aprendiste. Eso ayuda a que el conocimiento quede fijo.",
    "fields": [
      { "id":"estrategia", "label":"En tus palabras: ¿cuál es la estrategia para entender un aviso en inglés sin traducirlo palabra por palabra?", "type":"textarea", "placeholder":"Por ejemplo: busco una palabra clave y pienso en qué lugar tendría sentido..." },
      { "id":"aviso_nuevo", "label":"Menciona un aviso de esta lección y en qué lugar lo verías.", "type":"text", "placeholder":"Ej: 'Baggage claim' se ve en un aeropuerto" },
      { "id":"gramatica", "label":"Completa y explica: 'The store is _____ today.' ¿Por qué usarías esa palabra y no otra forma del verbo?", "type":"textarea", "placeholder":"Ej: closed / open, porque va después de 'is' como adjetivo..." },
      { "id":"dificultad", "label":"¿Qué fue lo que más te costó entender de esta lección y cómo lo resolviste?", "type":"textarea", "placeholder":"Escribe con confianza, esto es solo para ti" }
    ]
  }
}
$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 1 — Avisos y vocabulario';

-- ------------------------------------------------------------
-- B) Quiz 1 — sobre las dos lecturas (stage = 'readings')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: avisos y vocabulario', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 1 — Avisos y vocabulario'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Lees el aviso "NO PARKING — TOW-AWAY ZONE" junto a una calle. Si dejas tu carro ahí, ¿qué es lo más probable que pase?'),
  (1, 'Un parque tiene el aviso "PLEASE KEEP OFF THE GRASS". ¿Qué NO deberías hacer?'),
  (2, 'En un aeropuerto ves "BAGGAGE CLAIM →". ¿Para qué sirve seguir esa flecha?'),
  (3, '¿Cuál de estas frases usa correctamente el adjetivo "closed"?'),
  (4, 'Ves un aviso "WARNING: WET FLOOR" en una tienda. ¿Qué actitud deberías tomar?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 1 — Avisos y vocabulario'
  and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Te lo pueden remolcar con una grúa',true,'Correcto: "tow-away zone" significa que los carros mal estacionados serán remolcados.'),
  (1,'Te dan un descuento por parquear ahí',false,'Todo lo contrario: el aviso es una prohibición, no una promoción.'),
  (2,'Nada, puedes parquear tranquilo',false,'El aviso advierte justo lo opuesto: no debes parquear ahí.'),
  (3,'Te dan indicaciones para llegar a otro lugar',false,'No es un aviso de direcciones, es una prohibición de parqueo.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Caminar o sentarte sobre el pasto',true,'Correcto: "keep off the grass" pide que te mantengas alejado del pasto.'),
  (1,'Tomar fotos del parque',false,'El aviso no menciona nada sobre fotos.'),
  (2,'Entrar al parque',false,'El aviso no prohíbe entrar al parque, solo pisar el pasto.'),
  (3,'Sentarte en una banca',false,'Las bancas no son el pasto — el aviso no las menciona.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Te lleva a la zona para recoger tus maletas',true,'Correcto: "baggage claim" es la zona de reclamo de equipaje.'),
  (1,'Te lleva a la sala de abordaje',false,'No es lo que indica ese aviso.'),
  (2,'Te lleva al mostrador de check-in',false,'No es lo que indica ese aviso.'),
  (3,'Te lleva a la zona de migración',false,'No es lo que indica ese aviso.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'The library is closed on Sundays.',true,'Correcto: "closed" va después del verbo to be (is), igual que un adjetivo.'),
  (1,'The library close on Sundays.',false,'Falta el verbo to be conjugado; "close" sin conjugar no funciona así.'),
  (2,'The library closing on Sundays.',false,'El gerundio "closing" no encaja en esta estructura.'),
  (3,'The library closed are on Sundays.',false,'El orden de las palabras no es correcto.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Caminar con cuidado, porque hay riesgo de resbalar',true,'Correcto: "warning" indica peligro — en este caso, piso mojado.'),
  (1,'Ignorarlo, es solo un saludo',false,'"Warning" nunca es un saludo, es una advertencia de riesgo.'),
  (2,'Correr para salir rápido de la tienda',false,'Correr en un piso mojado sería justo lo contrario de lo recomendable.'),
  (3,'Pedir un descuento en la caja',false,'El aviso no tiene relación con descuentos.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- ------------------------------------------------------------
-- C) Quiz 2 — sobre la lección interactiva (stage = 'interactive')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'pre-icfes' and m.title = 'Parte 1 — Avisos y vocabulario'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Relaciona: si ves una puerta con "STAFF ONLY — DO NOT ENTER" siendo un cliente, ¿qué deberías hacer?'),
  (1, '¿Cuál es la diferencia principal entre un aviso de "WARNING" y uno de "STAFF ONLY"?'),
  (2, 'Si un letrero dice "The doors are open", ¿qué función cumple la palabra "open" en esa frase?'),
  (3, 'Estás en un centro comercial y ves "NO PARKING — TOW-AWAY ZONE" frente a la entrada principal. ¿Qué decisión es la más prudente?'),
  (4, '¿Por qué la estrategia de "buscar la palabra clave" funciona mejor que traducir todo el aviso palabra por palabra?')
) as v(order_index, prompt)
where c.slug = 'pre-icfes' and m.title = 'Parte 1 — Avisos y vocabulario'
  and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'No entrar por esa puerta',true,'Correcto: "staff only" significa que solo el personal autorizado puede pasar.'),
  (1,'Entrar igual, es solo una sugerencia',false,'No es una sugerencia: es una restricción de acceso.'),
  (2,'Tocar la puerta y esperar',false,'El aviso no invita a esperar en la puerta, simplemente prohíbe el paso a quien no es personal.'),
  (3,'Buscar a un guardia para pedir permiso',false,'No es necesario ni lo que indica el aviso: simplemente no debes entrar.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'"Warning" avisa de un peligro; "staff only" restringe el acceso a un lugar',true,'Correcto: son dos propósitos distintos — advertir vs. prohibir el paso.'),
  (1,'Son exactamente lo mismo, ambos son saludos',false,'Ninguno de los dos es un saludo.'),
  (2,'"Warning" prohíbe el paso y "staff only" advierte peligro',false,'Es al revés: revisa el significado de cada uno.'),
  (3,'No hay ninguna diferencia entre ellos',false,'Sí la hay: uno advierte, el otro restringe el acceso.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Es un adjetivo que describe el estado de las puertas',true,'Correcto: "open" describe el estado de "the doors", después del verbo to be.'),
  (1,'Es un verbo en infinitivo',false,'No está funcionando como verbo principal en esta frase, sino como adjetivo tras "are".'),
  (2,'Es un sustantivo',false,'"Open" aquí no nombra una cosa, describe un estado.'),
  (3,'Es una orden o mandato',false,'La frase describe un estado, no está dando una orden.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Buscar otro lugar para parquear',true,'Correcto: el aviso indica que los carros ahí serán remolcados — lo prudente es parquear en otro lugar.'),
  (1,'Parquear igual porque es un centro comercial',false,'El tipo de lugar no cambia el significado del aviso: sigue prohibido parquear ahí.'),
  (2,'Dejar el carro solo unos minutos',false,'El riesgo de que lo remolquen existe desde el primer minuto.'),
  (3,'Ignorar el aviso porque está en inglés',false,'El idioma del aviso no cambia su validez ni su significado.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Porque en el examen el tiempo es limitado y la palabra clave suele ser suficiente para entender el propósito del aviso',true,'Correcto: es una estrategia de eficiencia, no de "hacer trampa" — el propósito de un aviso casi siempre se entiende con una palabra clave.'),
  (1,'Porque las palabras en inglés no tienen traducción',false,'Sí la tienen; el punto es que no siempre es necesario traducir para entender el propósito.'),
  (2,'Porque el ICFES prohíbe traducir',false,'El examen no prohíbe nada de eso; es una estrategia práctica para ahorrar tiempo.'),
  (3,'Porque todos los avisos significan lo mismo',false,'No todos significan lo mismo — por eso hay que identificar la palabra clave de cada uno.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='pre-icfes' and m.title='Parte 1 — Avisos y vocabulario' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;
