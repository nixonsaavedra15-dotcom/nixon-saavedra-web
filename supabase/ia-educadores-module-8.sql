-- ============================================================
-- MÓDULO 8 — "Proyecto final y certificación" (IA para Educadores)
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
    "title": "Diseña tu clase con IA: proyecto final integrador",
    "subtitle": "Vas a integrar todo lo aprendido en los 8 módulos anteriores en una secuencia didáctica real, lista para usar con tus estudiantes. Es el requisito final para obtener tu certificado.",
    "guide_html": "<p>Este módulo cierra el curso con tu proyecto final: una secuencia didáctica completa aplicando todo lo aprendido.</p>",
    "objectives": [
      "Diseñar una secuencia didáctica completa usando IA con criterio propio.",
      "Aplicar los principios de privacidad, sesgo y uso responsable en un caso propio.",
      "Autoevaluar tu proyecto con la misma rúbrica que se usará para certificarlo.",
      "Presentar y defender tu proyecto, demostrando comprensión propia."
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Qué debe incluir tu proyecto final",
    "html": "<p class='lead-in'>Tu proyecto final es una secuencia didáctica real, de un tema de tu materia, que podrías usar la próxima semana en tu salón.</p><h2>Las cinco piezas obligatorias</h2><table class='grammar-table'><tr><th>Pieza</th><th>Qué debe demostrar</th></tr><tr><td>1. Objetivo de aprendizaje preciso</td><td>Específico y medible, no genérico</td></tr><tr><td>2. Al menos 2 prompts documentados</td><td>Que aplicaste rol, contexto, tarea y formato</td></tr><tr><td>3. Guía con material en capas</td><td>Que consideraste ritmos distintos de aprendizaje</td></tr><tr><td>4. Instrumento de evaluación variado</td><td>Más allá del reconocimiento simple</td></tr><tr><td>5. Nota de verificación ética</td><td>Privacidad, sesgo y honestidad académica</td></tr></table><div class='tip-box'><span class='icon'>💡</span><span><strong>Tip clave:</strong> no necesitas que cada pieza sea perfecta — necesitas que muestre que aplicaste el criterio del módulo correspondiente.</span></div><details class='mini-check'><summary>¿Cuáles son las cinco piezas obligatorias del proyecto final?</summary><div class='answer'>Objetivo preciso, prompts documentados, guía en capas, evaluación variada y nota ética.</div></details><details class='mini-check'><summary>¿Qué demuestra la nota de verificación ética?</summary><div class='answer'>Que el docente revisó privacidad, sesgo y honestidad académica en su propio material.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Cómo se evalúa el proyecto y cómo se obtiene el certificado",
    "html": "<p class='lead-in'>El proyecto se evalúa con una rúbrica de cuatro criterios, la misma que usarás para autoevaluarte.</p><table class='grammar-table'><tr><th>Criterio</th><th>Nivel logrado</th></tr><tr><td>Aplicación del prompt</td><td>Los prompts muestran rol, contexto, tarea y formato claros</td></tr><tr><td>Atención a la diversidad</td><td>La guía incluye capa base y de profundización</td></tr><tr><td>Evaluación variada</td><td>Va más allá de la opción múltiple</td></tr><tr><td>Criterio ético</td><td>La nota identifica riesgos reales y cómo se mitigaron</td></tr></table><h2>El paso final: defensa breve</h2><p>Se pide una defensa breve y escrita: dos o tres párrafos explicando por qué tomaste las decisiones que tomaste, no qué generó la IA.</p><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Advertencia:</strong> un proyecto que solo copia lo generado por la IA, sin ajustes ni defensa con criterio propio, no cumple el nivel logrado en la rúbrica.</span></div><details class='mini-check'><summary>¿Por qué conocer la rúbrica de antemano no es 'hacer trampa'?</summary><div class='answer'>Porque es la misma transparencia que se recomienda en cualquier evaluación bien diseñada.</div></details><details class='mini-check'><summary>¿Qué debe explicar la defensa breve?</summary><div class='answer'>Por qué el docente tomó las decisiones pedagógicas que tomó.</div></details>"
  },
  "interactive": {
    "title": "Checklist final antes de entregar",
    "intro": "Revisa cada punto antes de enviar tu proyecto.",
    "slides": [
      {
        "id": "s1",
        "icon": "🎯",
        "title": "¿Mi objetivo es específico y medible?",
        "bubble": "Revisa",
        "detail": "Que no sea una frase genérica tipo 'enseñar el tema X'."
      },
      {
        "id": "s2",
        "icon": "💬",
        "title": "¿Documenté al menos 2 prompts con las 4 partes?",
        "bubble": "Revisa",
        "detail": "Repasa el Módulo 2 si alguna parte falta."
      },
      {
        "id": "s3",
        "icon": "📚",
        "title": "¿Mi guía tiene capa base y de profundización?",
        "bubble": "Revisa",
        "detail": "Repasa el Módulo 5 si solo tienes una versión única."
      },
      {
        "id": "s4",
        "icon": "📝",
        "title": "¿Mi evaluación va más allá de la opción múltiple?",
        "bubble": "Revisa",
        "detail": "Repasa el Módulo 4 si solo generaste preguntas cerradas."
      },
      {
        "id": "s5",
        "icon": "🔒",
        "title": "¿Verifiqué privacidad, sesgo y honestidad?",
        "bubble": "Revisa",
        "detail": "Repasa el Módulo 6 si tu nota ética es genérica."
      },
      {
        "id": "s6",
        "icon": "🗣️",
        "title": "¿Mi defensa explica el POR QUÉ, no solo el QUÉ?",
        "bubble": "Revisa",
        "detail": "Es el criterio que más distingue un proyecto logrado."
      }
    ]
  },
  "practice": {
    "title": "El proyecto final de la profesora Natalia",
    "html": "<div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Natalia enseña ciencias en grado 6 y elige una secuencia sobre los estados de la materia. Su objetivo: 'que los estudiantes expliquen, con un ejemplo cotidiano propio, por qué el agua cambia de estado según la temperatura'.</p><p>Documenta dos prompts: uno para la guía base, otro para la capa de profundización conectando con el ciclo del agua. Su evaluación combina opción múltiple con un estudio de caso donde el estudiante explica un ejemplo distinto al de la guía.</p><p>En su defensa, explica por qué pidió un ejemplo distinto: para verificar comprensión real, no memorización — una decisión suya, no algo que la IA sugirió.</p></div><div class='tip-box'><span class='icon'>✅</span><span>Un proyecto sólido no se nota por cuánto generó la IA, sino por cuántas decisiones pedagógicas deliberadas tomó la docente.</span></div>"
  },
  "closing_form": {
    "title": "Entrega tu proyecto final",
    "intro": "Este es el formulario de entrega del proyecto final del curso.",
    "fields": [
      {
        "id": "objetivo",
        "label": "Objetivo de aprendizaje de tu secuencia didáctica (específico y medible).",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "prompts",
        "label": "Pega tus 2 prompts documentados, indicando qué parte (rol/contexto/tarea/formato) usaste en cada uno.",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "guia_evaluacion",
        "label": "Describe tu guía en capas (base + profundización) y tu instrumento de evaluación variado.",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "nota_etica",
        "label": "Nota de verificación ética: ¿qué revisaste de privacidad, sesgo y honestidad académica?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "defensa",
        "label": "Defensa breve (2-3 párrafos): ¿por qué tomaste las decisiones pedagógicas que tomaste?",
        "type": "textarea",
        "placeholder": "..."
      }
    ]
  }
}$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ia-educadores')
and title = 'Proyecto final y certificación';

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Lecturas: proyecto final (integrador) (stage = 'readings')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: proyecto final (integrador)', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Proyecto final y certificación'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuáles son las cinco piezas obligatorias del proyecto final?'),
  (1, '¿Qué distingue el nivel ''logrado'' del criterio ''Atención a la diversidad''?'),
  (2, '¿Por qué conocer la rúbrica de antemano no es ''hacer trampa''?'),
  (3, '¿Qué debe explicar la defensa breve del proyecto final?'),
  (4, '¿Qué ocurre con un proyecto que solo copia lo generado por la IA sin ajustes?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Proyecto final y certificación'
  and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Objetivo, prompts documentados, guía en capas, evaluación variada y nota ética',true,'Correcto.'),
  (1,'Solo un examen de opción múltiple',false,'Es justo lo que se pide evitar como única forma de evaluación.'),
  (2,'Una presentación en PowerPoint únicamente',false,'No es lo que exige el proyecto.'),
  (3,'Un video grabado del docente',false,'No es parte de los requisitos.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Proyecto final y certificación' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Que la guía tenga muchas imágenes',false,'No es el criterio.'),
  (1,'Que la guía incluya claramente una capa base y una de profundización',true,'Correcto.'),
  (2,'Que la guía esté en inglés',false,'No es un criterio.'),
  (3,'Que la guía tenga más de 10 páginas',false,'La extensión no es el criterio.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Proyecto final y certificación' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Porque es la misma transparencia recomendada al diseñar cualquier evaluación',true,'Correcto.'),
  (1,'Porque las rúbricas nunca son vinculantes',false,'No es el argumento.'),
  (2,'Porque el proyecto no se califica realmente',false,'Sí se califica.'),
  (3,'Porque solo aplica a estudiantes, no a docentes',false,'Aplica al proyecto del docente.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Proyecto final y certificación' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Todo lo que la IA generó, palabra por palabra',false,'No es el enfoque.'),
  (1,'Por qué el docente tomó cada decisión pedagógica',true,'Correcto.'),
  (2,'Cuánto tiempo tomó escribir los prompts',false,'No es el criterio evaluado.'),
  (3,'El nombre de la herramienta de IA utilizada, únicamente',false,'No es suficiente.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Proyecto final y certificación' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Cumple automáticamente el nivel logrado en todos los criterios',false,'Es lo opuesto.'),
  (1,'No cumple el nivel logrado porque no demuestra decisiones pedagógicas propias',true,'Correcto.'),
  (2,'Se evalúa con una rúbrica distinta y más flexible',false,'No es lo que indica la lectura.'),
  (3,'No se puede entregar bajo ninguna circunstancia',false,'Sí se puede entregar, pero no cumplirá los niveles logrados.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Proyecto final y certificación' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Repaso interactivo (integrador) (stage = 'interactive')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo (integrador)', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Proyecto final y certificación'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, 'Si tu guía solo tiene una versión única sin diferenciación, ¿qué módulo deberías repasar?'),
  (1, '¿Cuál es el criterio que más distingue un proyecto ''logrado'' de uno ''en desarrollo''?'),
  (2, 'En el proyecto de Natalia, ¿por qué su evaluación incluye un ejemplo cotidiano DISTINTO al de la guía?'),
  (3, '¿Qué ajuste hizo Natalia en su nota de verificación ética?'),
  (4, '¿Cuál es la lección final del caso de Natalia?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Proyecto final y certificación'
  and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Módulo 2 (prompts)',false,'No es el módulo relacionado.'),
  (1,'Módulo 5 (atención a la diversidad)',true,'Correcto.'),
  (2,'Módulo 7 (caja de herramientas)',false,'No es el módulo relacionado.'),
  (3,'Módulo 0 (introducción)',false,'No es el módulo relacionado.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Proyecto final y certificación' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Que la guía tenga colores llamativos',false,'No es un criterio.'),
  (1,'Que la defensa explique el POR QUÉ de cada decisión, no solo el QUÉ generó la IA',true,'Correcto.'),
  (2,'Que se use la herramienta de IA más costosa disponible',false,'No es un criterio de evaluación.'),
  (3,'Que el proyecto tenga la mayor cantidad de páginas posible',false,'La extensión no es el criterio central.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Proyecto final y certificación' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Para hacer el examen más largo',false,'No es la razón.'),
  (1,'Para verificar comprensión real y no solo memorización',true,'Correcto.'),
  (2,'Porque la IA se lo pidió sin que ella lo decidiera',false,'Fue una decisión pedagógica propia.'),
  (3,'Porque no encontró el ejemplo original',false,'No es la razón dada.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Proyecto final y certificación' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Evitó asumir electrodomésticos que no todos los estudiantes tienen en casa',true,'Correcto.'),
  (1,'Eliminó por completo cualquier ejemplo cotidiano',false,'No es lo que hizo.'),
  (2,'Usó nombres reales de sus estudiantes',false,'Es lo contrario.'),
  (3,'No hizo ningún ajuste ético',false,'Sí hizo un ajuste explícito.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Proyecto final y certificación' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Un proyecto sólido se nota por cuánto contenido generó la IA',false,'Es lo opuesto.'),
  (1,'Un proyecto sólido se nota por cuántas decisiones pedagógicas deliberadas tomó el docente',true,'Correcto.'),
  (2,'Un proyecto sólido no necesita instrumento de evaluación',false,'Contradice los requisitos.'),
  (3,'Un proyecto sólido debe evitar cualquier uso de IA',false,'El punto es usarla con criterio.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Proyecto final y certificación' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

