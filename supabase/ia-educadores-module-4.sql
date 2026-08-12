-- ============================================================
-- MÓDULO 4 — "Evaluación y retroalimentación con IA" (IA para Educadores)
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
    "title": "Evaluar mejor, no solo más rápido",
    "subtitle": "La IA puede ayudarte a generar exámenes, dar retroalimentación personalizada y entender mejor el uso indebido — sin que la evaluación deje de ser justa y humana.",
    "guide_html": "<p>En este módulo vemos cómo diversificar tus instrumentos de evaluación y dar mejor retroalimentación con apoyo de IA.</p>",
    "objectives": [
      "Diseñar instrumentos de evaluación variados con apoyo de IA.",
      "Usar IA para dar retroalimentación más detallada y personalizada.",
      "Comprender las limitaciones reales de los detectores de texto de IA.",
      "Diseñar actividades más resistentes al uso indebido de IA."
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Más allá de la opción múltiple: variedad con IA",
    "html": "<p class='lead-in'>El uso más común de IA en evaluación es generar opción múltiple. Pero limitarse a eso desaprovecha una ventaja real: generar variedad con el mismo esfuerzo.</p><table class='grammar-table'><tr><th>Tipo de instrumento</th><th>Qué evalúa mejor</th></tr><tr><td>Opción múltiple</td><td>Reconocimiento, comprensión literal</td></tr><tr><td>Preguntas abiertas cortas</td><td>Comprensión con producción propia</td></tr><tr><td>Estudio de caso</td><td>Aplicación y análisis</td></tr><tr><td>Autoevaluación guiada</td><td>Metacognición</td></tr></table><h2>El ajuste de dificultad progresiva</h2><p>Puedes pedirle a la IA que distribuya la dificultad: primeras preguntas de reconocimiento directo, luego de aplicación, y la última de análisis crítico.</p><div class='tip-box'><span class='icon'>💡</span><span><strong>Tip clave:</strong> pide siempre que la IA incluya, junto a cada pregunta, qué habilidad específica evalúa.</span></div><details class='mini-check'><summary>Menciona dos instrumentos más allá de la opción múltiple.</summary><div class='answer'>Preguntas abiertas cortas y estudios de caso.</div></details><details class='mini-check'><summary>¿Qué le puedes pedir a la IA para lograr dificultad progresiva?</summary><div class='answer'>Que distribuya explícitamente la dificultad.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Retroalimentación personalizada y los límites de los detectores de IA",
    "html": "<p class='lead-in'>Dar retroalimentación detallada a 35 estudiantes es una de las tareas que más tiempo consume. La IA puede ayudar, siempre que le des el contexto correcto.</p><p>Ejemplo: 'Con base en esta rúbrica, dame retroalimentación sobre este ensayo. Señala 2 fortalezas y 2 aspectos a mejorar, con tono alentador para grado 8.'</p><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Advertencia:</strong> la retroalimentación de IA siempre debe pasar por tu lectura antes de entregarse.</span></div><h2>Sobre los detectores de 'texto hecho con IA'</h2><table class='grammar-table'><tr><th>Lo que SÍ hacen</th><th>Lo que NO garantizan</th></tr><tr><td>Dan una probabilidad estadística</td><td>Certeza al 100%</td></tr><tr><td>Sirven como señal de alerta inicial</td><td>Ser prueba suficiente para una sanción</td></tr><tr><td>Funcionan algo mejor en textos largos</td><td>Ser confiables en textos cortos</td></tr></table><p>La estrategia recomendada combina el detector como punto de partida, una conversación directa, y rediseñar la actividad.</p><details class='mini-check'><summary>¿Qué debe darle el docente a la IA para retroalimentación personalizada?</summary><div class='answer'>El criterio de evaluación, el nivel del estudiante y el tono deseado.</div></details><details class='mini-check'><summary>¿Un detector de texto de IA da certeza del 100%?</summary><div class='answer'>No — da una probabilidad estadística con falsos positivos y negativos.</div></details>"
  },
  "interactive": {
    "title": "Rediseña la actividad, no solo prohíbas",
    "intro": "Revisa cómo rediseñar cada actividad.",
    "slides": [
      {
        "id": "s1",
        "icon": "📄",
        "title": "Ensayo genérico en casa",
        "bubble": "¿Cómo rediseñarlo?",
        "detail": "Fácil de resolver con IA. Rediseño: conectar con una experiencia personal reciente que la IA no puede inventar."
      },
      {
        "id": "s2",
        "icon": "🎤",
        "title": "Presentación oral en vivo con preguntas",
        "bubble": "¿Resistente a IA?",
        "detail": "Sí: exige respuesta espontánea frente al grupo."
      },
      {
        "id": "s3",
        "icon": "✍️",
        "title": "Trabajo escrito en clase, con borrador previo",
        "bubble": "¿Cómo funciona?",
        "detail": "Combina lo mejor: el borrador puede usar IA, la versión final demuestra el proceso propio."
      },
      {
        "id": "s4",
        "icon": "📊",
        "title": "Análisis de un caso muy local",
        "bubble": "¿Resistente a IA?",
        "detail": "Sí: requiere conocimiento del contexto real que el estudiante tiene y la IA no."
      },
      {
        "id": "s5",
        "icon": "🗣️",
        "title": "Defensa oral del propio trabajo",
        "bubble": "¿Para qué sirve?",
        "detail": "Si no puede explicar lo que 'escribió', es señal más confiable que cualquier detector."
      },
      {
        "id": "s6",
        "icon": "📓",
        "title": "Bitácora de proceso",
        "bubble": "¿Qué aporta?",
        "detail": "Hace visible el proceso de pensamiento, no solo el resultado final."
      }
    ]
  },
  "practice": {
    "title": "El profesor Esteban y el caso del ensayo perfecto",
    "html": "<div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Esteban recibe un ensayo notablemente más pulido que entregas anteriores. Recuerda: un detector automático no es prueba suficiente por sí solo.</p><p>Revisa si el estudiante había entregado borradores previos — no había, la actividad solo pedía el producto final. Tiene una conversación respetuosa, pidiéndole explicar oralmente dos decisiones de su argumento.</p><p>El estudiante explica su argumento con solidez: sí lo escribió él, pero usó IA para 'pulir' la redacción — algo no prohibido explícitamente. Esteban aclara su política hacia adelante y rediseña su próxima actividad con bitácora de proceso.</p></div><div class='tip-box'><span class='icon'>✅</span><span>La sospecha bien manejada termina en una conversación que aclara expectativas, no en una acusación apresurada.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en este módulo",
    "intro": "Responde en tus propias palabras.",
    "fields": [
      {
        "id": "detector",
        "label": "¿Por qué un detector de texto de IA no debería ser la única prueba para una sanción?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "instrumento",
        "label": "Menciona un instrumento de evaluación distinto a opción múltiple que te gustaría probar.",
        "type": "text",
        "placeholder": "..."
      },
      {
        "id": "rediseno",
        "label": "¿Cómo rediseñarías una actividad de tu materia para hacerla más resistente al uso indebido?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "politica",
        "label": "¿Qué política sobre uso de IA vas a comunicar a tus estudiantes?",
        "type": "textarea",
        "placeholder": "..."
      }
    ]
  }
}$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ia-educadores')
and title = 'Evaluación y retroalimentación con IA';

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Lecturas: evaluación con IA (stage = 'readings')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: evaluación con IA', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Evaluación y retroalimentación con IA'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál es un error común al usar IA para evaluación?'),
  (1, '¿Qué le puedes pedir a la IA para lograr dificultad progresiva en un examen?'),
  (2, '¿Qué debe hacer siempre el docente antes de entregar retroalimentación de IA?'),
  (3, '¿Qué NO garantiza un detector de texto de IA?'),
  (4, '¿Cuál es la estrategia más efectiva frente al uso indebido de IA en evaluaciones?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Evaluación y retroalimentación con IA'
  and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Usarla solo para opción múltiple, sin aprovechar otros formatos',true,'Correcto.'),
  (1,'Usarla para redactar rúbricas',false,'No es un error.'),
  (2,'Usarla para dar retroalimentación',false,'No es un error.'),
  (3,'Pedir que incluya la habilidad que evalúa cada pregunta',false,'Es una buena práctica.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Evaluación y retroalimentación con IA' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Que todas las preguntas tengan la misma dificultad',false,'Es lo contrario.'),
  (1,'Que distribuya explícitamente la dificultad',true,'Correcto.'),
  (2,'Que elimine las preguntas difíciles',false,'No es lo que se pide.'),
  (3,'Que traduzca el examen a otro idioma',false,'No tiene relación.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Evaluación y retroalimentación con IA' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Entregarla directamente sin revisión',false,'Es lo que se advierte que no se debe hacer.'),
  (1,'Leerla y ajustarla con el contexto real del estudiante',true,'Correcto.'),
  (2,'Traducirla a otro idioma primero',false,'No es parte de la recomendación.'),
  (3,'Compartirla primero con los padres',false,'No es la recomendación.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Evaluación y retroalimentación con IA' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Una probabilidad estadística',false,'Eso sí lo hace.'),
  (1,'Una certeza al 100%',true,'Correcto.'),
  (2,'Servir como señal de alerta inicial',false,'Eso sí lo puede hacer.'),
  (3,'Funcionar algo mejor en textos largos',false,'Eso sí es cierto.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Evaluación y retroalimentación con IA' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Prohibir el uso de computadores en todo el colegio',false,'Es desproporcionada.'),
  (1,'Confiar únicamente en un detector automático',false,'Se advierte contra depender solo de eso.'),
  (2,'Rediseñar la actividad para que sea más difícil de resolver solo con IA',true,'Correcto.'),
  (3,'Ignorar el problema por completo',false,'No es una estrategia válida.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Evaluación y retroalimentación con IA' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Repaso interactivo (stage = 'interactive')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Evaluación y retroalimentación con IA'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Por qué un ensayo genérico en casa es fácil de resolver solo con IA?'),
  (1, '¿Qué hace más confiable verificar si un estudiante comprendió su propio trabajo?'),
  (2, '¿Qué aporta pedir una ''bitácora de proceso'' en vez de solo el producto final?'),
  (3, 'En el caso de Esteban, ¿qué hizo antes de acusar al estudiante?'),
  (4, '¿Qué descubrió Esteban al conversar con el estudiante?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Evaluación y retroalimentación con IA'
  and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Porque no requiere conexión con una experiencia personal específica',true,'Correcto.'),
  (1,'Porque los estudiantes no tienen computador en casa',false,'No es la razón.'),
  (2,'Porque el tema es demasiado difícil',false,'El problema es la genericidad.'),
  (3,'Porque la IA no puede escribir ensayos',false,'Sí puede, ese es el riesgo.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Evaluación y retroalimentación con IA' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Pedirle que lo traduzca a otro idioma',false,'No es la estrategia mencionada.'),
  (1,'Pedirle que defienda oralmente su propio trabajo escrito',true,'Correcto.'),
  (2,'Revisar solo la ortografía del texto',false,'No es un indicador de comprensión.'),
  (3,'Comparar la extensión del texto con otros estudiantes',false,'No es lo que se propone.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Evaluación y retroalimentación con IA' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Hace visible el proceso de pensamiento del estudiante',true,'Correcto.'),
  (1,'Reduce el tiempo de evaluación del docente a cero',false,'No es lo que se plantea.'),
  (2,'Elimina la necesidad de dar retroalimentación',false,'No elimina la retroalimentación.'),
  (3,'Prohíbe cualquier uso de IA en el proceso',false,'No prohíbe el uso, lo hace visible.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Evaluación y retroalimentación con IA' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Le bajó la nota de inmediato sin conversar',false,'No es lo que hizo.'),
  (1,'Revisó el proceso previo y tuvo una conversación respetuosa',true,'Correcto.'),
  (2,'Usó únicamente un detector automático como prueba definitiva',false,'Evitó depender solo de eso.'),
  (3,'Ignoró la situación por completo',false,'No la ignoró.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Evaluación y retroalimentación con IA' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Que el estudiante no había escrito nada del ensayo',false,'De hecho sí lo había escrito él.'),
  (1,'Que el estudiante escribió el argumento pero usó IA para pulir la redacción',true,'Correcto.'),
  (2,'Que el estudiante había copiado de un compañero',false,'No es lo que ocurrió.'),
  (3,'Que el detector automático tenía toda la razón',false,'El caso muestra lo contrario.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Evaluación y retroalimentación con IA' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

