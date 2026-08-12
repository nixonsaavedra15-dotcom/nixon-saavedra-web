-- ============================================================
-- MÓDULO 2 — "Ingeniería de prompts para el aula" (IA para Educadores)
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
    "title": "El arte de pedir bien: cómo estructurar un prompt que funcione",
    "subtitle": "La diferencia entre una respuesta mediocre y una que puedes usar directamente en clase casi siempre está en cómo pediste, no en qué herramienta usaste.",
    "guide_html": "<p>En este módulo aprendes la estructura de 4 partes de un buen prompt, y por qué iterar es parte normal del proceso.</p>",
    "objectives": [
      "Aplicar la estructura de cuatro partes de un buen prompt (rol, contexto, tarea, formato).",
      "Usar la iteración como estrategia normal de trabajo.",
      "Adaptar el nivel de un mismo contenido para distintos grados con un solo cambio.",
      "Evitar los errores más comunes de prompts vagos."
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Por qué 'hazme un examen de historia' casi nunca funciona bien",
    "html": "<p class='lead-in'>Muchos docentes prueban la IA una sola vez, con una instrucción corta, reciben algo genérico y concluyen que 'la IA no sirve para esto'. El problema casi nunca es la herramienta: un prompt vago produce una respuesta vaga.</p><h2>La estructura de las cuatro partes</h2><table class='grammar-table'><tr><th>Parte</th><th>Qué responde</th><th>Ejemplo</th></tr><tr><td>Rol</td><td>¿Quién debe 'actuar' como la IA?</td><td>'Actúa como profesor experto en historia'</td></tr><tr><td>Contexto</td><td>¿Para quién es? ¿Qué ya saben?</td><td>'Grado 9, ya vieron la Colonia'</td></tr><tr><td>Tarea</td><td>¿Qué necesitas exactamente?</td><td>'Genera 8 preguntas de opción múltiple'</td></tr><tr><td>Formato</td><td>¿Cómo debe entregarse?</td><td>'En tabla, con respuesta marcada'</td></tr></table><p>Compara: <strong>Prompt vago:</strong> 'Hazme un examen de historia.' <strong>Prompt con las 4 partes:</strong> 'Actúa como profesor de historia de secundaria. Necesito 8 preguntas de opción múltiple sobre las causas de la Independencia de Colombia, para grado 9 que ya vio la Colonia. Entrégalas en tabla con 4 opciones, respuesta correcta marcada y justificación de una línea.'</p><div class='tip-box'><span class='icon'>💡</span><span><strong>Tip clave:</strong> si tu resultado sale genérico, casi siempre falta contexto o formato. Prueba agregando solo la parte que falta.</span></div><details class='mini-check'><summary>¿Cuáles son las cuatro partes de un buen prompt educativo?</summary><div class='answer'>Rol, contexto, tarea y formato.</div></details><details class='mini-check'><summary>Si un resultado sale genérico, ¿qué suele faltar primero?</summary><div class='answer'>El contexto o el formato.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Iterar no es fallar: es la forma normal de trabajar con IA",
    "html": "<p class='lead-in'>Trabajar con IA generativa se parece más a una conversación de ajuste que a una búsqueda de una sola respuesta correcta. Iterar — pedir ajustes — es parte normal del proceso.</p><h2>Ejemplo de conversación real</h2><div class='reading-passage'><div class='passage-tag'>Paso a paso</div><p>1. Prompt: 'Genera una guía de lectura sobre un cuento para grado 10.' 2. Resultado: correcto, pero preguntas muy literales. 3. Ajuste: 'Quiero que la mitad sean de análisis e inferencia.' 4. Resultado: mejor, pero lenguaje muy formal. 5. Ajuste: 'Simplifica el lenguaje.' 6. Resultado final: listo para usar.</p></div><h2>Un mismo contenido, distintos niveles</h2><table class='grammar-table'><tr><th>Instrucción de nivel</th><th>Resultado esperado</th></tr><tr><td>'...para grado 3, vocabulario simple'</td><td>Explicación breve, ejemplos cotidianos</td></tr><tr><td>'...para grado 9, vocabulario académico'</td><td>Explicación más completa</td></tr><tr><td>'...para un grupo con ritmos distintos'</td><td>Explicación en capas</td></tr></table><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Advertencia:</strong> no confundas iterar con empezar de cero cada vez. Pide el ajuste puntual sobre lo ya generado.</span></div><details class='mini-check'><summary>¿Qué significa 'iterar' un prompt?</summary><div class='answer'>Pedir ajustes sobre una respuesta ya generada.</div></details><details class='mini-check'><summary>¿Cómo adaptas el mismo contenido a distintos grados sin rehacer todo?</summary><div class='answer'>Cambiando solo la instrucción de nivel/contexto.</div></details>"
  },
  "interactive": {
    "title": "Antes y después: mejora el prompt",
    "intro": "Compara el prompt vago con la versión mejorada.",
    "slides": [
      {
        "id": "s1",
        "icon": "➕",
        "title": "'Hazme actividades de matemáticas'",
        "bubble": "¿Cómo mejorarlo?",
        "detail": "Mejor: 'Profesor de grado 5. 6 problemas de fracciones con contexto cotidiano, lista numerada, solución al final.'"
      },
      {
        "id": "s2",
        "icon": "🏛️",
        "title": "'Explícame la Revolución Francesa'",
        "bubble": "¿Cómo mejorarlo?",
        "detail": "Mejor: 'Para grado 8 sin conocimiento previo, 4 párrafos cortos, con un ejemplo cotidiano de desigualdad.'"
      },
      {
        "id": "s3",
        "icon": "📖",
        "title": "'Dame preguntas de un cuento'",
        "bubble": "¿Cómo mejorarlo?",
        "detail": "Mejor: '5 preguntas de análisis (no literales) sobre este cuento, para debate oral en grado 11.'"
      },
      {
        "id": "s4",
        "icon": "📋",
        "title": "'Hazme una rúbrica'",
        "bubble": "¿Cómo mejorarlo?",
        "detail": "Mejor: 'Rúbrica de ensayo argumentativo grado 10, 4 criterios, 3 niveles, en tabla.'"
      },
      {
        "id": "s5",
        "icon": "✂️",
        "title": "'Simplifica este texto'",
        "bubble": "¿Cómo mejorarlo?",
        "detail": "Mejor: 'Para grado 4 con dificultades de lectura, frases de máximo 12 palabras.'"
      },
      {
        "id": "s6",
        "icon": "🔁",
        "title": "'Hazlo más corto' (sin contexto)",
        "bubble": "¿Cómo mejorarlo?",
        "detail": "Mejor: 'Reduce a la mitad, conservando las preguntas de análisis.'"
      }
    ]
  },
  "practice": {
    "title": "El profesor Camilo y las tres versiones de la misma guía",
    "html": "<div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Camilo enseña ciencias naturales con estudiantes de ritmos muy distintos. Redacta un solo prompt base sobre el ciclo del agua, con rol, contexto, tarea y formato bien definidos. Luego pide tres iteraciones con un único cambio: el nivel.</p><p>Versión A: vocabulario simple, tres preguntas literales. Versión B: agrega una pregunta de '¿por qué crees que...?'. Versión C: conecta el tema con el cambio climático.</p><p>En 15 minutos tiene tres versiones coherentes entre sí, porque partieron del mismo prompt base.</p></div><div class='tip-box'><span class='icon'>✅</span><span>La lección de Camilo: un prompt bien estructurado es reutilizable, y ahí está el verdadero ahorro de tiempo.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en este módulo",
    "intro": "Responde en tus propias palabras.",
    "fields": [
      {
        "id": "cuatro_partes",
        "label": "¿Cuáles son las cuatro partes de un buen prompt y para qué sirve cada una?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "reescribe",
        "label": "Escribe un prompt vago que usarías y reescríbelo aplicando las 4 partes.",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "niveles",
        "label": "¿En qué situación de tu materia te serviría adaptar un contenido a distintos niveles?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "dificultad",
        "label": "¿Qué fue lo que más te costó de este módulo?",
        "type": "textarea",
        "placeholder": "..."
      }
    ]
  }
}$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ia-educadores')
and title = 'Ingeniería de prompts para el aula';

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Lecturas: estructura del prompt (stage = 'readings')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: estructura del prompt', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Ingeniería de prompts para el aula'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuáles son las cuatro partes de un buen prompt educativo?'),
  (1, 'Un docente escribe ''hazme un examen de historia'' y recibe algo genérico. ¿Causa más probable?'),
  (2, '¿Qué significa ''iterar'' un prompt?'),
  (3, '¿Qué cambia entre un prompt para grado 3 y uno para grado 9 sobre el mismo tema?'),
  (4, '¿Qué recomienda la advertencia sobre iterar?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Ingeniería de prompts para el aula'
  and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Rol, contexto, tarea y formato',true,'Correcto.'),
  (1,'Título, resumen, conclusión y bibliografía',false,'No es la estructura propuesta.'),
  (2,'Pregunta, respuesta, ejemplo y cierre',false,'No corresponde.'),
  (3,'Fecha, autor, tema y nivel',false,'No es la estructura descrita.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ingeniería de prompts para el aula' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'La IA tiene un error técnico',false,'No es un problema técnico.'),
  (1,'El prompt es demasiado vago, falta contexto y formato',true,'Correcto.'),
  (2,'La herramienta no sirve para historia',false,'El problema es cómo se pidió.'),
  (3,'Hay que pagar una versión más cara',false,'No es la solución.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ingeniería de prompts para el aula' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Repetir exactamente el mismo prompt varias veces',false,'No es repetir igual.'),
  (1,'Pedir ajustes sobre una respuesta ya generada',true,'Correcto.'),
  (2,'Cambiar de herramienta de IA cada vez que algo falla',false,'No es lo propuesto.'),
  (3,'Escribir el prompt en otro idioma',false,'No tiene relación.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ingeniería de prompts para el aula' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'El tema completo, hay que empezar de cero',false,'No es necesario.'),
  (1,'Solo la instrucción de nivel/vocabulario esperado',true,'Correcto.'),
  (2,'Nada, deben ser exactamente iguales',false,'Sí deben adaptarse.'),
  (3,'El nombre de la herramienta de IA',false,'No tiene relación.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ingeniería de prompts para el aula' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'No confundir iterar con empezar de cero cada vez',true,'Correcto.'),
  (1,'No confundir iterar con guardar el prompt',false,'No es lo que advierte.'),
  (2,'No confundir iterar con traducir el prompt',false,'No tiene relación.'),
  (3,'No confundir iterar con compartir el prompt',false,'No es el punto.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ingeniería de prompts para el aula' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Repaso interactivo (stage = 'interactive')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Ingeniería de prompts para el aula'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué le falta al prompt ''Hazme actividades de matemáticas''?'),
  (1, '¿Qué tipo de preguntas se piden en vez de preguntas literales sobre el cuento?'),
  (2, '¿Qué elemento agrega valor a la rúbrica frente a solo pedir ''hazme una rúbrica''?'),
  (3, 'En el caso de Camilo, ¿qué le permitió generar tres versiones coherentes en 15 minutos?'),
  (4, '¿Por qué Camilo considera que el prompt bien estructurado ''se nota más a lo largo de la semana''?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Ingeniería de prompts para el aula'
  and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Rol, contexto de grado, tema específico y formato de entrega',true,'Correcto.'),
  (1,'Nada, está completo',false,'Está incompleto.'),
  (2,'Solo le falta el nombre del profesor',false,'No es un elemento necesario.'),
  (3,'Solo le falta estar en inglés',false,'El idioma no es el problema.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ingeniería de prompts para el aula' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Preguntas de opción múltiple únicamente',false,'No es lo que pide ese ejemplo.'),
  (1,'Preguntas de análisis, pensadas para un debate oral',true,'Correcto.'),
  (2,'Preguntas de verdadero o falso',false,'No es el formato solicitado.'),
  (3,'Preguntas sin relación con el cuento',false,'Deben estar basadas en el cuento.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ingeniería de prompts para el aula' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Especifica criterios, niveles de desempeño y formato de tabla',true,'Correcto.'),
  (1,'Pide que esté en otro idioma',false,'No es parte del ejemplo.'),
  (2,'Pide que sea lo más larga posible',false,'No es un criterio mencionado.'),
  (3,'No especifica nada adicional',false,'Sí especifica varios elementos.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ingeniería de prompts para el aula' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Escribir tres prompts completamente distintos desde cero',false,'Partió de un solo prompt base.'),
  (1,'Partir de un prompt base bien estructurado e iterar solo el nivel',true,'Correcto.'),
  (2,'Pedirle a otro colega que ayudara con dos versiones',false,'No es lo que ocurrió.'),
  (3,'Usar tres herramientas de IA diferentes',false,'Usó la misma con iteraciones.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ingeniería de prompts para el aula' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Porque es reutilizable para adaptar contenido varias veces',true,'Correcto.'),
  (1,'Porque solo funciona una vez y luego hay que botarlo',false,'Es lo contrario.'),
  (2,'Porque la IA cobra menos si el prompt es largo',false,'No tiene relación con costos.'),
  (3,'Porque los estudiantes lo prefieren en video',false,'No es parte del caso.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ingeniería de prompts para el aula' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

