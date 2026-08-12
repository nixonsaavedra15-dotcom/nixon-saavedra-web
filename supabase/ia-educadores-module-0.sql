-- ============================================================
-- MÓDULO 0 — "Introducción" (IA para Educadores)
-- Generado siguiendo el mismo formato que module1-prototype.sql
-- ============================================================
-- Requiere haber corrido antes (en este orden):
--   1. schema.sql
--   2. admin-schema.sql
--   3. quiz-schema.sql
--   4. lesson-flow-schema.sql
--   5. seed-ia-educadores-modules.sql
--
-- Seguro de correr varias veces: los UPDATE se sobrescriben y los
-- INSERT usan "on conflict do nothing".
-- ============================================================

-- ------------------------------------------------------------
-- A) Contenido de la lección (lesson_json)
-- ------------------------------------------------------------
update public.modules set lesson_json = $JSON${
  "welcome": {
    "title": "Bienvenido al curso IA para Educadores",
    "subtitle": "En este curso vas a aprender a usar la inteligencia artificial generativa como una herramienta más de tu caja de herramientas docente — para planear más rápido, evaluar mejor y llegarle a cada estudiante, sin perder el criterio pedagógico que solo tú tienes.",
    "guide_html": "<p>Antes de arrancar, esta es la ruta que vas a recorrer en este módulo y en todos los que siguen, porque todos usan la misma estructura:</p><ul><li>Dos <strong>lecturas</strong> explicadas con calma, con ejemplos reales de aula.</li><li>Un <strong>quiz corto</strong> para confirmar que las lecturas quedaron claras.</li><li>Una <strong>sección interactiva</strong> tipo tarjetas, para repasar con otra forma de recordar.</li><li>Otro <strong>quiz corto</strong> sobre la parte interactiva.</li><li>Una <strong>lectura de práctica</strong> con un caso real de un docente colombiano.</li><li>Un <strong>formulario de cierre</strong> donde tú mismo resumes lo aprendido — con eso se sella el módulo y se desbloquea el siguiente.</li></ul><p>No hay afán: puedes repasar cada parte las veces que quieras antes de avanzar.</p>",
    "objectives": [
      "Entender el panorama general del curso y cómo se evalúa cada módulo.",
      "Distinguir entre la IA generativa y otras herramientas digitales que ya conoces.",
      "Identificar en qué momentos de tu semana docente la IA puede ahorrarte tiempo real.",
      "Reconocer, desde el primer día, que la IA es un asistente — no un reemplazo del criterio pedagógico."
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "La IA ya está en tu salón de clases (aunque no la hayas invitado)",
    "html": "<p class='lead-in'>Un martes cualquiera, una profesora de biología le pide a un estudiante que entregue un ensayo sobre fotosíntesis. Al leerlo, algo no cuadra: el vocabulario es demasiado uniforme, las frases tienen una cadencia extraña, casi de manual. Ella no lo sabe todavía, pero acaba de tener su primer encuentro real con la inteligencia artificial generativa — no porque la haya usado ella, sino porque uno de sus estudiantes sí.</p><p>Esta escena se repite todos los días en miles de colegios. La pregunta ya no es <em>si</em> la IA va a llegar al aula: ya llegó, de la mano de los estudiantes, mucho antes de que la mayoría de los docentes tuvieran la oportunidad de entenderla. Este curso parte de una idea simple: si tus estudiantes ya la usan, tú necesitas entenderla mejor que ellos — no para perseguirla, sino para dirigirla.</p><h2>¿Por qué esto es distinto a otras 'modas tecnológicas'?</h2><p>Ya has visto pasar tableros digitales, plataformas de gamificación, aulas virtuales. La IA generativa es diferente por una razón concreta: no es un canal nuevo para el mismo contenido, sino una herramienta que <strong>genera contenido nuevo</strong> — textos, preguntas, explicaciones, imágenes — a partir de una instrucción en lenguaje natural. Eso cambia lo que un docente puede producir en una hora de planeación.</p><table class='grammar-table'><tr><th>Herramienta digital 'clásica'</th><th>IA generativa</th></tr><tr><td>Organiza o muestra contenido que ya existe</td><td>Crea contenido nuevo a partir de una instrucción</td></tr><tr><td>Requiere que tú redactes todo el material</td><td>Redacta un primer borrador que tú ajustas y validas</td></tr><tr><td>Es neutral: no se equivoca en el contenido</td><td>Puede cometer errores factuales con total seguridad (alucinaciones)</td></tr></table><div class='tip-box'><span class='icon'>💡</span><span><strong>Tip clave:</strong> trata cada respuesta de una IA como el borrador entusiasta de un asistente nuevo: casi siempre útil, a veces brillante, pero que <strong>siempre</strong> necesita tu revisión antes de llegar a un estudiante.</span></div><details class='mini-check'><summary>¿Qué hace diferente a la IA generativa de un aula virtual o un buscador?</summary><div class='answer'>Que genera contenido nuevo a partir de una instrucción, en vez de solo organizar o mostrar contenido que ya existe.</div></details><details class='mini-check'><summary>Si un texto de un estudiante tiene vocabulario extrañamente uniforme, ¿qué deberías hacer primero?</summary><div class='answer'>No asumir automáticamente que usó IA de forma indebida — investigar con calma, porque también puede ser simplemente su estilo de escritura.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Qué evalúa este curso y cómo te acompaña",
    "html": "<p class='lead-in'>Este curso no busca convertirte en programador ni en experto en tecnología. Busca algo más específico: que salgas de cada módulo con una habilidad práctica que puedas usar en tu próxima clase, no solo con teoría.</p><h2>Cómo está organizado</h2><p>El curso tiene 9 módulos. Este módulo 0 te da el panorama. Los módulos 1 y 2 son fundamentos: cómo funciona la IA y cómo pedirle bien las cosas. Los módulos 3 a 6 son aplicados: planeación, evaluación, diversidad y ética. El módulo 7 es una caja de herramientas comparativa. El módulo 8 es tu proyecto final, donde integras todo en una secuencia didáctica real.</p><h2>Cómo se evalúa</h2><p>Cada módulo tiene dos cuestionarios cortos (5 preguntas cada uno, 75% para aprobar) y un formulario de cierre de reflexión que no se califica por correcto o incorrecto. El módulo 8 incluye el proyecto final, requisito para el certificado.</p><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Advertencia:</strong> este curso no te va a decir 'usa IA para todo'. Te va a enseñar a decidir cuándo sí conviene y cuándo no — hay tareas donde tu criterio humano no tiene reemplazo posible.</span></div><table class='grammar-table'><tr><th>Momento típico de tu semana</th><th>¿La IA ayuda aquí?</th></tr><tr><td>Redactar el primer borrador de una guía</td><td>Sí, mucho</td></tr><tr><td>Decidir la calificación final de un estudiante límite</td><td>No — es una decisión humana</td></tr><tr><td>Generar preguntas sobre un tema ya explicado</td><td>Sí, como punto de partida</td></tr><tr><td>Dar una devolución sobre un tema personal sensible</td><td>No — requiere empatía y contexto</td></tr></table><details class='mini-check'><summary>¿Qué porcentaje necesitas para aprobar cada cuestionario del curso?</summary><div class='answer'>75%.</div></details><details class='mini-check'><summary>¿El formulario de cierre se califica como correcto/incorrecto?</summary><div class='answer'>No — es un espacio de reflexión en tus propias palabras.</div></details>"
  },
  "interactive": {
    "title": "6 mitos sobre la IA en el aula",
    "intro": "Cada tarjeta esconde la explicación. Revísala después de pensar tu propia respuesta.",
    "slides": [
      {
        "id": "s1",
        "icon": "🤖",
        "title": "'La IA va a reemplazar a los docentes'",
        "bubble": "¿Es cierto?",
        "detail": "Falso. La IA no puede leer el ánimo de un salón, mediar un conflicto ni motivar a alguien en un mal momento. Es apoyo, no reemplazo."
      },
      {
        "id": "s2",
        "icon": "📋",
        "title": "'Si uso IA para planear, soy perezoso'",
        "bubble": "¿Es cierto?",
        "detail": "Falso. Es como usar una calculadora: libera tiempo cognitivo para lo que sí requiere tu criterio."
      },
      {
        "id": "s3",
        "icon": "✅",
        "title": "'Todo lo que responde la IA es correcto'",
        "bubble": "¿Es cierto?",
        "detail": "Falso, y es el mito más peligroso. La IA puede 'alucinar' datos con total naturalidad. Siempre se verifica."
      },
      {
        "id": "s4",
        "icon": "🔍",
        "title": "'Hay una app 100% confiable para detectar IA'",
        "bubble": "¿Es cierto?",
        "detail": "Falso. Los detectores tienen falsos positivos y negativos frecuentes."
      },
      {
        "id": "s5",
        "icon": "🌍",
        "title": "'La IA es igual de buena en español que en inglés'",
        "bubble": "¿Es cierto?",
        "detail": "Parcialmente falso. Muchos modelos rinden algo mejor en inglés; en español hay que revisar matices culturales."
      },
      {
        "id": "s6",
        "icon": "🔐",
        "title": "'Puedo pegar cualquier dato de un estudiante en un chat de IA'",
        "bubble": "¿Es cierto?",
        "detail": "Falso. Nombres o diagnósticos de menores no deben pegarse sin verificar la política de privacidad."
      }
    ]
  },
  "practice": {
    "title": "La primera semana de la profesora Ana",
    "html": "<div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Ana es profesora de ciencias sociales en un colegio público de Cali. Nunca ha usado IA generativa, pero decide probarla para preparar la clase del viernes sobre la Independencia de Colombia.</p><p>El lunes, le pide a la IA un resumen de causas de la Independencia. Recibe un texto claro, pero nota una fecha que no le cuadra con su libro de texto — la revisa en una fuente confiable y, en efecto, la IA se equivocó por un año. Ana entiende, en carne propia, la lección de verificar siempre.</p><p>El miércoles, en vez de pedir 'hazme un resumen', prueba algo distinto: le da a la IA el nivel de sus estudiantes, el tiempo de la clase y el objetivo puntual. La respuesta es mucho más útil — porque el prompt fue mucho más específico.</p><p>El viernes, dicta la clase con una guía que construyó en 20 minutos en vez de la hora y media habitual. Le queda tiempo extra, que usa para preparar material de refuerzo para tres estudiantes atrasados.</p></div><div class='tip-box'><span class='icon'>✅</span><span>La lección de Ana: la IA no le ahorró el trabajo de pensar la clase — se lo ahorró en la parte mecánica, y ese tiempo lo reinvirtió en lo que solo ella podía hacer.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en este módulo",
    "intro": "No hay respuestas correctas aquí — es un espacio para que pongas en tus propias palabras lo que aprendiste.",
    "fields": [
      {
        "id": "diferencia",
        "label": "En tus palabras: ¿qué diferencia hay entre la IA generativa y otras herramientas digitales que ya usabas?",
        "type": "textarea",
        "placeholder": "Por ejemplo..."
      },
      {
        "id": "momento_ahorro",
        "label": "Menciona un momento de tu semana docente donde crees que la IA te podría ahorrar tiempo real.",
        "type": "text",
        "placeholder": "Ej: redactar guías de trabajo"
      },
      {
        "id": "momento_no",
        "label": "Menciona un momento donde creas que NO deberías usar IA, y explica por qué.",
        "type": "textarea",
        "placeholder": "Ej: al calificar un caso límite, porque..."
      },
      {
        "id": "sorpresa",
        "label": "¿Qué fue lo que más te sorprendió de esta introducción?",
        "type": "textarea",
        "placeholder": "Escribe con confianza"
      }
    ]
  }
}$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ia-educadores')
and title = 'Introducción';

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Lecturas: panorama del curso (stage = 'readings')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: panorama del curso', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Introducción'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Una profesora nota que un texto entregado por un estudiante tiene un vocabulario extrañamente uniforme. ¿Cuál es la actitud recomendada?'),
  (1, '¿Cuál es la diferencia principal entre una herramienta digital ''clásica'' y la IA generativa?'),
  (2, '¿Cómo se recomienda tratar cada respuesta que da una IA?'),
  (3, '¿Qué porcentaje se necesita para aprobar cada cuestionario del curso?'),
  (4, 'Según la tabla de ''momentos típicos de la semana docente'', ¿en cuál caso la IA NO es recomendable?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Introducción'
  and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Asumir automáticamente que copió con IA y bajarle la nota',false,'Es un error común: el estilo uniforme no es prueba suficiente por sí sola.'),
  (1,'Investigar con calma antes de sacar conclusiones',true,'Correcto: no se debe asumir de inmediato, sino verificar con calma.'),
  (2,'Ignorarlo por completo',false,'Sí importa, pero la respuesta es investigar con criterio, no ignorar.'),
  (3,'Prohibir que todos los estudiantes usen computador',false,'Es una reacción desproporcionada que no resuelve el problema de fondo.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Introducción' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'La IA generativa es gratis y las otras no',false,'No es la diferencia central.'),
  (1,'La IA generativa genera contenido nuevo a partir de una instrucción',true,'Correcto: esa es la diferencia clave.'),
  (2,'Las herramientas clásicas son más rápidas',false,'No es el criterio que distingue a una de otra.'),
  (3,'No hay ninguna diferencia real',false,'Sí la hay, y es sustancial.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Introducción' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Como una verdad absoluta porque suena segura',false,'Justo el error que se advierte: sonar segura no significa ser correcta.'),
  (1,'Como el borrador entusiasta de un asistente nuevo, que siempre necesita revisión',true,'Correcto: es la metáfora usada en la lectura.'),
  (2,'Como algo que nunca se debe usar',false,'Sí es útil, pero con revisión.'),
  (3,'Como una opinión personal de la IA',false,'La IA no tiene opiniones; genera texto basado en patrones.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Introducción' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'50%',false,'No es el umbral definido.'),
  (1,'60%',false,'No es el umbral definido.'),
  (2,'75%',true,'Correcto.'),
  (3,'100%',false,'No se exige perfección.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Introducción' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Redactar el primer borrador de una guía de trabajo',false,'Ahí sí ayuda.'),
  (1,'Generar preguntas sobre un tema ya explicado',false,'Ahí sí ayuda como punto de partida.'),
  (2,'Decidir la calificación final de un estudiante límite',true,'Correcto: es una decisión humana que requiere contexto que la IA no tiene.'),
  (3,'Ninguna de las anteriores',false,'Hay tareas donde no debe usarse.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Introducción' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Repaso interactivo (stage = 'interactive')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Introducción'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Por qué la IA no puede reemplazar a un docente?'),
  (1, '¿Por qué usar IA para el primer borrador de una guía NO es ''pereza''?'),
  (2, '¿Cuál es el mito más peligroso según la sección interactiva?'),
  (3, '¿Qué tipo de información NO deberías pegar en un chat de IA sin verificar antes la política de privacidad?'),
  (4, '¿Qué le pasó a Ana el lunes cuando pidió un resumen sobre la Independencia de Colombia?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Introducción'
  and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Porque es muy costosa',false,'No es la razón.'),
  (1,'Porque no puede leer el ánimo de un salón ni mediar conflictos',true,'Correcto.'),
  (2,'Porque los colegios no la permiten',false,'No es el argumento pedagógico.'),
  (3,'Porque no sabe escribir bien',false,'De hecho puede escribir con fluidez.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Introducción' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Porque libera tiempo cognitivo para lo que sí requiere criterio docente',true,'Correcto: es la comparación con la calculadora.'),
  (1,'Porque hace exactamente lo mismo que haría un docente',false,'No es lo mismo: el docente sigue ajustando y validando.'),
  (2,'Porque no requiere ninguna revisión posterior',false,'Sí requiere revisión siempre.'),
  (3,'Porque los estudiantes no lo notan',false,'No es el argumento.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Introducción' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Que la IA reemplaza docentes',false,'Es un mito, pero no el señalado como el más peligroso.'),
  (1,'Que toda respuesta de la IA es correcta porque suena segura',true,'Correcto.'),
  (2,'Que hay una app 100% confiable para detectar IA',false,'Es un mito real, pero no el más peligroso.'),
  (3,'Que la IA es igual de buena en español que en inglés',false,'Es un matiz, no el mito más peligroso.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Introducción' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'El nombre de un libro de texto',false,'No es información sensible.'),
  (1,'Nombres completos o diagnósticos de estudiantes menores de edad',true,'Correcto.'),
  (2,'La fecha de un examen',false,'No es información sensible en sí misma.'),
  (3,'El nombre del colegio',false,'No es lo que se señala como sensible.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Introducción' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'La IA le dio información 100% correcta sin errores',false,'De hecho encontró un error de fecha.'),
  (1,'Detectó una fecha incorrecta y la verificó en otra fuente',true,'Correcto.'),
  (2,'Decidió no volver a usar la herramienta nunca más',false,'Al contrario, siguió usándola con más cuidado.'),
  (3,'Le pidió a un estudiante que verificara por ella',false,'Ella misma hizo la verificación.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Introducción' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

