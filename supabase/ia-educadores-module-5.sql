-- ============================================================
-- MÓDULO 5 — "Atención a la diversidad con IA" (IA para Educadores)
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
    "title": "Un mismo contenido, muchos caminos para llegar a él",
    "subtitle": "Vas a usar la IA para adaptar contenidos a necesidades educativas especiales, distintos ritmos de aprendizaje y contextos multilingües — sin bajar las expectativas de aprendizaje.",
    "guide_html": "<p>En este módulo vemos cómo adaptar un mismo objetivo de aprendizaje a distintos caminos.</p>",
    "objectives": [
      "Adaptar un mismo contenido para NEE sin simplificar el objetivo de aprendizaje.",
      "Diseñar material en capas para grupos con ritmos distintos.",
      "Usar IA como apoyo para estudiantes que aprenden español como segunda lengua.",
      "Reconocer los límites de la IA en decisiones de inclusión que requieren un profesional."
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Adaptar no es simplificar el objetivo: es cambiar el camino",
    "html": "<p class='lead-in'>Un error frecuente es confundir 'adaptar' con 'bajar el nivel del objetivo de aprendizaje'. La adaptación bien hecha mantiene el mismo objetivo, pero cambia el camino.</p><h2>El principio del 'mismo destino, ruta distinta'</h2><table class='grammar-table'><tr><th>Estudiante</th><th>Mismo objetivo</th><th>Camino adaptado</th></tr><tr><td>Con TDAH</td><td>Identificar la idea principal</td><td>Texto en fragmentos cortos con verificación</td></tr><tr><td>Con dislexia</td><td>Identificar la idea principal</td><td>Frases cortas, más espaciado, apoyo de audio</td></tr><tr><td>Con altas capacidades</td><td>Identificar la idea principal</td><td>Mismo texto + pregunta extra de conexión</td></tr></table><div class='tip-box'><span class='icon'>💡</span><span><strong>Tip clave:</strong> pide siempre el texto original y el adaptado uno junto al otro, para verificar que la idea principal no se perdió.</span></div><details class='mini-check'><summary>¿Qué significa 'adaptar' según el principio del mismo destino, ruta distinta?</summary><div class='answer'>Mantener el mismo objetivo de aprendizaje, cambiando el camino para llegar a él.</div></details><details class='mini-check'><summary>¿Por qué conviene pedir el texto original y el adaptado juntos?</summary><div class='answer'>Para verificar que la adaptación no distorsionó la idea principal.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Ritmos distintos en el mismo salón, y el apoyo a estudiantes multilingües",
    "html": "<p class='lead-in'>En casi cualquier salón conviven estudiantes que terminan una actividad en 10 minutos con otros que necesitan 30. El material 'en capas' es una de las aplicaciones más prácticas de la IA.</p><p>Ejemplo: 'Genera una guía con una capa base de 4 preguntas de comprensión directa, y una capa de profundización con 2 preguntas opcionales conectando con el cambio climático.'</p><h2>Apoyo a estudiantes multilingües</h2><table class='grammar-table'><tr><th>Necesidad</th><th>Cómo puede ayudar la IA</th><th>Qué NO reemplaza</th></tr><tr><td>Vocabulario nuevo</td><td>Glosario simple con definiciones</td><td>Acompañamiento de un docente especializado</td></tr><tr><td>Instrucciones</td><td>Simplificar o traducir instrucciones cortas</td><td>Evaluación diagnóstica formal de nivel</td></tr><tr><td>Diagnóstico formal (TEA, etc.)</td><td>Adaptar formato y ritmo, con apoyo</td><td>El PIAR diseñado por un profesional</td></tr></table><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Advertencia:</strong> para estudiantes con Plan Individual de Ajustes Razonables (PIAR), la IA apoya según las indicaciones del plan — nunca sustituye la evaluación del profesional.</span></div><details class='mini-check'><summary>¿Qué problema resuelve el material 'en capas'?</summary><div class='answer'>Que quien termina rápido no se quede sin actividad y quien necesita más tiempo no se sienta presionado.</div></details><details class='mini-check'><summary>¿Puede la IA reemplazar el diseño de un PIAR?</summary><div class='answer'>No — puede apoyar según las indicaciones del plan, pero el diseño es del profesional.</div></details>"
  },
  "interactive": {
    "title": "Mismo objetivo, camino adaptado",
    "intro": "Revisa cómo se adapta cada situación.",
    "slides": [
      {
        "id": "s1",
        "icon": "📖",
        "title": "Texto largo y denso",
        "bubble": "¿Camino adaptado?",
        "detail": "Dividirlo en fragmentos cortos con preguntas de verificación, sin cambiar la idea principal."
      },
      {
        "id": "s2",
        "icon": "⏱️",
        "title": "Estudiante que termina siempre primero",
        "bubble": "¿Camino adaptado?",
        "detail": "Capa de profundización que conecta el tema con algo ya visto, no 'más de lo mismo'."
      },
      {
        "id": "s3",
        "icon": "🗣️",
        "title": "Estudiante que está aprendiendo español",
        "bubble": "¿Camino adaptado?",
        "detail": "Glosario simple de palabras clave, generado con IA como apoyo complementario."
      },
      {
        "id": "s4",
        "icon": "✋",
        "title": "Estudiante con dificultades de atención",
        "bubble": "¿Camino adaptado?",
        "detail": "Instrucciones en pasos numerados cortos, con pausa de verificación entre cada uno."
      },
      {
        "id": "s5",
        "icon": "📋",
        "title": "Estudiante con PIAR activo",
        "bubble": "¿Camino adaptado?",
        "detail": "Material según las indicaciones del plan, revisado junto al profesional de apoyo."
      },
      {
        "id": "s6",
        "icon": "🎨",
        "title": "Estudiante con estilo de aprendizaje visual",
        "bubble": "¿Camino adaptado?",
        "detail": "Pedir a la IA que sugiera un diagrama del mismo contenido, además del texto."
      }
    ]
  },
  "practice": {
    "title": "La profesora Marcela y los tres caminos hacia el mismo texto",
    "html": "<div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Marcela tiene grado 7 con diversidad amplia: un estudiante con dislexia, dos estudiantes venezolanos consolidando su español, y varios que terminan rápido.</p><p>Para una lectura sobre el ciclo del agua, pide tres versiones con la misma idea principal: una con frases cortas y apoyo de audio (validada con la psicopedagoga, porque el estudiante tiene PIAR); una con glosario bilingüe básico; y la estándar con capa de profundización.</p><p>Las tres se responden con la misma pregunta de cierre en el tablero, así todo el grupo participa de la misma discusión.</p></div><div class='tip-box'><span class='icon'>✅</span><span>La diversidad del salón no es un obstáculo — es la razón por la que necesitas más de un camino hacia el mismo objetivo.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en este módulo",
    "intro": "Responde en tus propias palabras.",
    "fields": [
      {
        "id": "mismo_destino",
        "label": "¿Qué significa 'mismo destino, ruta distinta' aplicado a la adaptación de contenidos?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "capas",
        "label": "Describe cómo diseñarías material en capas para un tema de tu materia.",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "limite",
        "label": "¿En qué situación necesitarías obligatoriamente un profesional especializado?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "reflexion",
        "label": "¿Qué fue lo que más te hizo reflexionar de este módulo?",
        "type": "textarea",
        "placeholder": "..."
      }
    ]
  }
}$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ia-educadores')
and title = 'Atención a la diversidad con IA';

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Lecturas: adaptación con IA (stage = 'readings')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: adaptación con IA', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Atención a la diversidad con IA'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál es el error frecuente al adaptar material para NEE?'),
  (1, 'Según ''mismo destino, ruta distinta'', ¿qué se mantiene igual entre los caminos?'),
  (2, '¿Por qué conviene pedir el texto original y el adaptado juntos?'),
  (3, '¿Qué problema resuelve el material ''en capas''?'),
  (4, '¿Qué NO puede hacer la IA respecto a un PIAR?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Atención a la diversidad con IA'
  and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Confundir ''adaptar'' con ''bajar el nivel del objetivo de aprendizaje''',true,'Correcto.'),
  (1,'Usar demasiadas imágenes',false,'No es el error señalado.'),
  (2,'Adaptar el material con demasiada anticipación',false,'No es un error mencionado.'),
  (3,'Pedir ayuda a un profesional especializado',false,'Es una buena práctica.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Atención a la diversidad con IA' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'El formato del material',false,'El formato es lo que cambia.'),
  (1,'El objetivo de aprendizaje',true,'Correcto.'),
  (2,'El tiempo asignado a la actividad',false,'Puede cambiar.'),
  (3,'El nombre del estudiante',false,'No es relevante.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Atención a la diversidad con IA' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Para ahorrar espacio en el documento',false,'No es la razón principal.'),
  (1,'Para verificar que la adaptación no distorsionó la idea principal',true,'Correcto.'),
  (2,'Para que el estudiante los compare él mismo',false,'Es una verificación del docente.'),
  (3,'No hay ninguna razón particular',false,'Sí la hay.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Atención a la diversidad con IA' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Que todos trabajen exactamente al mismo ritmo',false,'Es lo contrario.'),
  (1,'Que quien termina rápido no se quede sin actividad y quien necesita más tiempo no se sienta presionado',true,'Correcto.'),
  (2,'Que se elimine la necesidad de corregir tareas',false,'No es el propósito.'),
  (3,'Que se reduzca el número de estudiantes por grupo',false,'No tiene relación.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Atención a la diversidad con IA' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Generar material según las indicaciones del plan',false,'Eso sí lo puede apoyar.'),
  (1,'Reemplazar la evaluación y el diseño del profesional especializado',true,'Correcto.'),
  (2,'Simplificar instrucciones cortas',false,'Eso sí es un apoyo válido.'),
  (3,'Generar un glosario de vocabulario',false,'Eso también es válido.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Atención a la diversidad con IA' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Repaso interactivo (stage = 'interactive')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Atención a la diversidad con IA'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué se recomienda para un estudiante que ''termina siempre primero''?'),
  (1, '¿Qué papel juega la IA frente a un estudiante con PIAR activo?'),
  (2, 'En el caso de Marcela, ¿qué tuvieron en común las tres versiones del texto?'),
  (3, '¿Por qué Marcela validó la versión para el estudiante con dislexia con la psicopedagoga?'),
  (4, '¿Cuál es la lección final del caso de Marcela?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Atención a la diversidad con IA'
  and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Más ejercicios idénticos a los ya resueltos',false,'Se advierte que no sea ''más de lo mismo''.'),
  (1,'Una capa de profundización que conecta el tema con algo ya visto',true,'Correcto.'),
  (2,'Ninguna actividad adicional, simplemente esperar',false,'Es el problema que se busca evitar.'),
  (3,'Una tarea de otro tema completamente distinto',false,'No es lo que se propone.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Atención a la diversidad con IA' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Diseña el plan completo de forma autónoma',false,'Es lo que se advierte que no debe pasar.'),
  (1,'Genera material según las indicaciones del plan, revisado junto al profesional',true,'Correcto.'),
  (2,'No tiene ningún papel en estos casos',false,'Sí puede apoyar, dentro de los límites.'),
  (3,'Reemplaza por completo al profesional especializado',false,'Nunca lo reemplaza.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Atención a la diversidad con IA' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'La misma idea principal y la misma pregunta de cierre',true,'Correcto.'),
  (1,'Estar escritas completamente en inglés',false,'No es lo que ocurrió.'),
  (2,'Tener exactamente el mismo número de palabras',false,'No es el criterio.'),
  (3,'Ser evaluadas con notas distintas según la versión',false,'No es parte del caso.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Atención a la diversidad con IA' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Porque el estudiante tiene un PIAR activo y ese acompañamiento no se reemplaza con IA',true,'Correcto.'),
  (1,'Porque la ley lo exige para cualquier adaptación de texto',false,'No es la razón general.'),
  (2,'Porque la IA no puede adaptar textos para dislexia',false,'Sí puede ayudar, pero con validación en este caso.'),
  (3,'Porque el estudiante lo pidió directamente',false,'No es lo que se describe.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Atención a la diversidad con IA' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'La diversidad del salón dificulta demasiado el objetivo común, mejor evitarlo',false,'Es lo opuesto a la conclusión.'),
  (1,'La diversidad requiere más de un camino hacia el mismo objetivo, y la IA ayuda a construirlos',true,'Correcto.'),
  (2,'Solo se debe usar una versión del material para todo el grupo',false,'Contradice el enfoque de rutas distintas.'),
  (3,'La IA debe usarse únicamente con estudiantes migrantes',false,'Se aplicó a distintos perfiles.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Atención a la diversidad con IA' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

