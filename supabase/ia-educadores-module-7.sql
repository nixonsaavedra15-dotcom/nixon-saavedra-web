-- ============================================================
-- MÓDULO 7 — "Caja de herramientas docente" (IA para Educadores)
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
    "title": "No necesitas 10 herramientas: necesitas saber cuál usar y cuándo",
    "subtitle": "Vas a conocer, de forma comparativa y práctica, las herramientas de IA más relevantes para un docente hoy — sin publicidad, con criterio de uso real de aula.",
    "guide_html": "<p>En este módulo comparamos herramientas de texto, imágenes, presentaciones y documentos, y armamos tu kit mínimo.</p>",
    "objectives": [
      "Comparar las fortalezas relativas de las principales herramientas de IA de texto.",
      "Identificar herramientas específicas para presentaciones, imágenes y documentos.",
      "Elegir la herramienta adecuada según la tarea concreta, no según la moda.",
      "Construir tu propio kit mínimo de 2 o 3 herramientas."
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Herramientas de texto: no hay una sola 'mejor', hay una más adecuada para cada tarea",
    "html": "<p class='lead-in'>Es común preguntar '¿cuál es la mejor IA?'. La pregunta más útil es otra: '¿cuál es la más adecuada para esta tarea puntual?'.</p><table class='grammar-table'><tr><th>Herramienta</th><th>Fortaleza relativa</th></tr><tr><td>Tipo ChatGPT</td><td>Muy versátil, buena para lluvia de ideas y borradores rápidos</td></tr><tr><td>Tipo Claude</td><td>Buena para instrucciones largas y documentos extensos</td></tr><tr><td>Tipo Gemini</td><td>Integración con documentos y correos de Google</td></tr><tr><td>Especializadas en educación</td><td>Plantillas específicas (rúbricas, planeadores)</td></tr></table><div class='tip-box'><span class='icon'>💡</span><span><strong>Tip clave:</strong> no necesitas dominar cinco herramientas. La mayoría de las tareas se resuelven con una sola herramienta de texto general, bien usada.</span></div><details class='mini-check'><summary>¿Cuál es la pregunta más útil en vez de 'cuál es la mejor IA'?</summary><div class='answer'>Cuál es la más adecuada para esta tarea puntual.</div></details><details class='mini-check'><summary>¿Es necesario dominar cinco herramientas distintas?</summary><div class='answer'>No — la mayoría de las tareas se resuelven bien con una sola herramienta general.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Más allá del texto: imágenes, presentaciones y organización",
    "html": "<p class='lead-in'>El texto es solo una parte de tu trabajo. Hay herramientas específicas para otros materiales, con el mismo criterio: elegir según la tarea.</p><h2>Generación de imágenes</h2><p>Sirven para ilustraciones de apoyo o íconos cuando no encuentras una imagen con licencia libre.</p><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Advertencia:</strong> verifica los términos de uso, especialmente si el material se va a publicar fuera del aula.</span></div><table class='grammar-table'><tr><th>Tarea</th><th>Tipo de herramienta</th></tr><tr><td>Redactar una guía o rúbrica</td><td>Herramienta de texto general</td></tr><tr><td>Generar una ilustración</td><td>Herramienta de generación de imágenes</td></tr><tr><td>Armar una presentación visual</td><td>Herramienta de presentaciones con IA</td></tr><tr><td>Resumir un documento largo</td><td>Herramienta con capacidad de 'leer' documentos</td></tr></table><h2>Tu kit mínimo</h2><p>No necesitas empezar con las cuatro categorías. Construye tu kit con 2 o 3 herramientas: una de texto general, y una o dos especializadas según lo que más uses.</p><details class='mini-check'><summary>¿Qué se debe verificar antes de usar una imagen de IA en material público?</summary><div class='answer'>Los términos de uso comercial y que sea apropiada y precisa.</div></details><details class='mini-check'><summary>¿Cuántas herramientas se recomiendan al empezar?</summary><div class='answer'>Un kit mínimo de 2 o 3: una de texto general más 1-2 especializadas.</div></details>"
  },
  "interactive": {
    "title": "¿Qué herramienta usarías?",
    "intro": "Elige la herramienta adecuada para cada tarea.",
    "slides": [
      {
        "id": "s1",
        "icon": "✍️",
        "title": "Primer borrador de una guía sobre un tema nuevo",
        "bubble": "¿Qué herramienta?",
        "detail": "Herramienta de texto general."
      },
      {
        "id": "s2",
        "icon": "🖼️",
        "title": "Ícono simple sin licencia libre disponible",
        "bubble": "¿Qué herramienta?",
        "detail": "Herramienta de generación de imágenes."
      },
      {
        "id": "s3",
        "icon": "📊",
        "title": "Presentación visual lista en 20 minutos",
        "bubble": "¿Qué herramienta?",
        "detail": "Herramienta de presentaciones con IA, ajustando después el diseño."
      },
      {
        "id": "s4",
        "icon": "📄",
        "title": "Leer un lineamiento de 40 páginas antes de una reunión",
        "bubble": "¿Qué herramienta?",
        "detail": "Herramienta con capacidad de 'leer' y resumir documentos largos."
      },
      {
        "id": "s5",
        "icon": "📝",
        "title": "Adaptar un texto largo con instrucciones muy detalladas",
        "bubble": "¿Qué herramienta?",
        "detail": "Herramienta de texto con buen manejo de instrucciones largas."
      },
      {
        "id": "s6",
        "icon": "🔄",
        "title": "Ya uso una herramienta que me funciona bien para casi todo",
        "bubble": "¿Cambio?",
        "detail": "No es necesario cambiar: es la elección correcta si te funciona."
      }
    ]
  },
  "practice": {
    "title": "El profesor Rodrigo arma su kit mínimo",
    "html": "<div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Rodrigo enseña artes en Manizales y se siente abrumado por la cantidad de herramientas mencionadas en redes. Decide elegir según la tarea, no acumular por acumular.</p><p>Hace un inventario: redacta guías (texto), necesita referencias visuales (imagen), y ocasionalmente presentaciones. Arma su kit: una herramienta de texto general que ya domina, y la de imágenes/presentaciones integrada en la plataforma de diseño que su colegio ya tiene licenciada.</p><p>Tres tareas, dos herramientas, cero suscripciones nuevas.</p></div><div class='tip-box'><span class='icon'>✅</span><span>El objetivo no es coleccionar herramientas de IA — es resolver bien las tareas reales con el menor número posible, aprovechando primero lo que tu colegio ya tiene.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en este módulo",
    "intro": "Responde en tus propias palabras.",
    "fields": [
      {
        "id": "pregunta",
        "label": "¿Por qué 'cuál es la más adecuada para esta tarea' es mejor pregunta que 'cuál es la mejor IA'?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "inventario",
        "label": "Haz el inventario de tu semana: ¿qué tareas son de texto, imagen, presentación o documentos?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "kit",
        "label": "Define tu propio kit mínimo de 2 o 3 herramientas.",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "interes",
        "label": "¿Qué herramienta de este módulo te interesa explorar primero y por qué?",
        "type": "textarea",
        "placeholder": "..."
      }
    ]
  }
}$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ia-educadores')
and title = 'Caja de herramientas docente';

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Lecturas: caja de herramientas (stage = 'readings')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: caja de herramientas', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Caja de herramientas docente'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál es la pregunta más útil en vez de ''cuál es la mejor IA''?'),
  (1, '¿Qué fortaleza relativa se menciona para herramientas tipo Claude?'),
  (2, '¿Qué se debe verificar antes de usar una imagen de IA en material público?'),
  (3, '¿Para qué tarea se recomienda una herramienta con capacidad de ''leer'' documentos largos?'),
  (4, '¿Cuál es la recomendación sobre el ''kit mínimo'' de herramientas al empezar?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Caja de herramientas docente'
  and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'¿Cuánto cuesta cada herramienta?',false,'No es el criterio central.'),
  (1,'¿Cuál es la más adecuada para esta tarea puntual?',true,'Correcto.'),
  (2,'¿Cuál usan más mis colegas?',false,'No es el criterio propuesto.'),
  (3,'¿Cuál tiene el nombre más conocido?',false,'No es el criterio recomendado.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Caja de herramientas docente' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Integración directa con correos de Google',false,'Esa se atribuye a Gemini.'),
  (1,'Buen manejo de instrucciones largas y documentos extensos',true,'Correcto.'),
  (2,'Plantillas específicas para planeadores',false,'Corresponde a herramientas especializadas.'),
  (3,'Ser la única gratuita del mercado',false,'No es un dato mencionado.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Caja de herramientas docente' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'El color predominante de la imagen',false,'No es el criterio relevante.'),
  (1,'Los términos de uso (licencia comercial) y que sea apropiada y precisa',true,'Correcto.'),
  (2,'Que tenga más de 1000 píxeles de ancho',false,'No es un criterio mencionado.'),
  (3,'Nada, las imágenes de IA siempre son de uso libre',false,'Es lo contrario.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Caja de herramientas docente' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Para generar ilustraciones de apoyo',false,'Corresponde a imágenes.'),
  (1,'Para resumir un documento institucional largo',true,'Correcto.'),
  (2,'Para dar retroalimentación oral en clase',false,'No es la tarea asociada.'),
  (3,'Para calificar exámenes automáticamente',false,'No es la función descrita.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Caja de herramientas docente' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Dominar las cinco categorías desde el primer día',false,'Es lo opuesto.'),
  (1,'Usar una herramienta de texto general más 1-2 especializadas',true,'Correcto.'),
  (2,'Cambiar de herramienta cada semana para probarlas todas',false,'No es la recomendación.'),
  (3,'No usar ninguna herramienta hasta terminar el curso',false,'Contradice el enfoque práctico.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Caja de herramientas docente' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Repaso interactivo (stage = 'interactive')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Caja de herramientas docente'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué herramienta usarías para un ícono simple sin licencia libre?'),
  (1, '¿Qué herramienta usarías para leer un lineamiento de 40 páginas antes de una reunión?'),
  (2, 'Si ya usas una herramienta de texto que te funciona bien para casi todo, ¿qué se recomienda?'),
  (3, 'En el caso de Rodrigo, ¿qué hizo antes de elegir sus herramientas?'),
  (4, '¿Cuál es la lección final del caso de Rodrigo?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Caja de herramientas docente'
  and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Herramienta de generación de imágenes',true,'Correcto.'),
  (1,'Herramienta de texto general',false,'No es la más adecuada.'),
  (2,'Herramienta de organización de documentos',false,'No corresponde.'),
  (3,'No existe ninguna herramienta para esto',false,'Sí existe.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Caja de herramientas docente' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Una herramienta de generación de imágenes',false,'No corresponde.'),
  (1,'Una herramienta con capacidad de ''leer'' y resumir documentos largos',true,'Correcto.'),
  (2,'Una herramienta de presentaciones',false,'No es la tarea.'),
  (3,'Ninguna, hay que leerlo manualmente siempre',false,'La IA sí puede apoyar.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Caja de herramientas docente' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Cambiar inmediatamente a una herramienta nueva',false,'Es lo opuesto.'),
  (1,'No es necesario cambiar: es la elección correcta si te funciona',true,'Correcto.'),
  (2,'Usar dos herramientas de texto general al mismo tiempo siempre',false,'No es lo recomendado.'),
  (3,'Dejar de usar IA por completo',false,'No tiene relación.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Caja de herramientas docente' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Compró la suscripción más cara disponible',false,'Al contrario.'),
  (1,'Hizo un inventario de las tareas reales de su semana',true,'Correcto.'),
  (2,'Le preguntó a sus estudiantes cuál usar',false,'No es lo que se describe.'),
  (3,'Eligió herramientas al azar',false,'Fue un proceso basado en su inventario.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Caja de herramientas docente' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Coleccionar la mayor cantidad de herramientas de IA posible',false,'Es lo opuesto.'),
  (1,'Resolver bien las tareas reales con el menor número de herramientas posible',true,'Correcto.'),
  (2,'Nunca usar herramientas que el colegio ya tenga licenciadas',false,'Es lo contrario.'),
  (3,'Usar una herramienta distinta para cada clase que dicta',false,'No es la estrategia que siguió.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Caja de herramientas docente' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

