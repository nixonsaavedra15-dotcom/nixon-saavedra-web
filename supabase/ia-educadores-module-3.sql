-- ============================================================
-- MÓDULO 3 — "Planeación de clases y material didáctico" (IA para Educadores)
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
    "title": "De la idea al material listo: planear más rápido sin perder calidad",
    "subtitle": "Vas a construir un flujo de trabajo repetible para pasar de un objetivo de aprendizaje a una guía, una rúbrica o una presentación lista para usar.",
    "guide_html": "<p>En este módulo aplicamos lo aprendido sobre prompts a la planeación real de tus clases.</p>",
    "objectives": [
      "Usar la IA para generar guías alineadas a un objetivo de aprendizaje específico.",
      "Diseñar presentaciones y material visual de apoyo.",
      "Construir rúbricas de evaluación claras y accionables.",
      "Reconocer qué partes de la planeación siguen requiriendo tu ajuste manual."
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "De objetivo de aprendizaje a guía de trabajo, en tres pasos",
    "html": "<p class='lead-in'>La planeación suele empezar con un objetivo claro pero termina consumiendo tiempo en la parte mecánica. Ahí es donde la IA rinde más.</p><h2>El flujo de tres pasos</h2><table class='grammar-table'><tr><th>Paso</th><th>Lo que aporta la IA</th><th>Lo que aportas tú</th></tr><tr><td>1. Objetivo</td><td>—</td><td>Precisión pedagógica</td></tr><tr><td>2. Estructura</td><td>Redacción, ejercicios progresivos</td><td>Verificar que tenga sentido para tu grupo</td></tr><tr><td>3. Ajuste final</td><td>—</td><td>Contexto real de tus estudiantes</td></tr></table><p>No 'enseñar fracciones', sino 'que los estudiantes identifiquen fracciones equivalentes usando representación gráfica'. Luego pide una estructura, no solo contenido: 'Genera una guía de 20 minutos con explicación breve, 4 ejercicios de dificultad progresiva y una pregunta de cierre.'</p><div class='tip-box'><span class='icon'>💡</span><span><strong>Tip clave:</strong> guarda los prompts que te dieron buenos resultados en un documento personal para reutilizarlos.</span></div><details class='mini-check'><summary>¿Cuál es el primer paso del flujo de tres pasos?</summary><div class='answer'>Definir el objetivo de aprendizaje con precisión.</div></details><details class='mini-check'><summary>¿Qué parte del proceso sigue siendo insustituible del docente?</summary><div class='answer'>El ajuste final según el contexto real de los estudiantes.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Presentaciones y rúbricas: material visual y de evaluación con IA",
    "html": "<p class='lead-in'>Dos de los materiales que más tiempo consumen son las presentaciones y las rúbricas. La IA puede acelerar ambos.</p><h2>Presentaciones: pide contenido y estructura</h2><p>La mayoría de las IA de texto generan el contenido y la estructura (título, puntos clave, sugerencia de imagen), no el diseño visual final. Ejemplo: 'Genera el esquema de 8 diapositivas sobre el sistema solar para grado 4, con título, 3 puntos clave y sugerencia de imagen por diapositiva.'</p><h2>Rúbricas: la claridad importa más que la extensión</h2><table class='grammar-table'><tr><th>Elemento</th><th>Pregunta que responde</th></tr><tr><td>Criterios</td><td>¿Qué exactamente estoy evaluando?</td></tr><tr><td>Niveles de desempeño</td><td>¿Cuántos escalones de calidad?</td></tr><tr><td>Descripción observable</td><td>¿Qué se ve en cada nivel?</td></tr><tr><td>Formato</td><td>¿Cómo la vas a usar?</td></tr></table><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Advertencia:</strong> una rúbrica de IA debe alinearse con los criterios institucionales de tu colegio antes de aplicarla formalmente.</span></div><details class='mini-check'><summary>¿Qué genera realmente una IA de texto cuando le pides 'una presentación'?</summary><div class='answer'>El contenido y la estructura, no el archivo de diseño final.</div></details><details class='mini-check'><summary>Menciona los cuatro elementos mínimos de una buena rúbrica.</summary><div class='answer'>Criterios, niveles de desempeño, descripción observable y formato.</div></details>"
  },
  "interactive": {
    "title": "El flujo completo, paso a paso",
    "intro": "Repasa cada paso del flujo de planeación.",
    "slides": [
      {
        "id": "s1",
        "icon": "🎯",
        "title": "Objetivo preciso",
        "bubble": "¿Qué significa?",
        "detail": "No 'enseñar el pasado simple', sino 'que conjuguen 5 verbos regulares en oraciones sobre su fin de semana'."
      },
      {
        "id": "s2",
        "icon": "📝",
        "title": "Pide estructura, no solo contenido",
        "bubble": "¿Ejemplo?",
        "detail": "'Guía de 15 min con explicación + tabla + 5 oraciones + 1 pregunta de producción libre.'"
      },
      {
        "id": "s3",
        "icon": "🔍",
        "title": "Revisa el resultado con ojo crítico",
        "bubble": "¿Qué revisar?",
        "detail": "¿Los ejemplos tienen sentido cultural? ¿La dificultad es progresiva de verdad?"
      },
      {
        "id": "s4",
        "icon": "✏️",
        "title": "Ajusta lo que no encaje",
        "bubble": "¿Cómo?",
        "detail": "Cambia un ejemplo genérico por uno con contexto local que conecte más."
      },
      {
        "id": "s5",
        "icon": "💾",
        "title": "Guarda el prompt que funcionó",
        "bubble": "¿Para qué?",
        "detail": "La próxima vez reutilizas la misma estructura de prompt."
      },
      {
        "id": "s6",
        "icon": "📊",
        "title": "Aplica el mismo flujo a una rúbrica",
        "bubble": "¿Cómo?",
        "detail": "Criterios + niveles + descripción observable + formato, alineados al colegio."
      }
    ]
  },
  "practice": {
    "title": "La coordinadora Lina y el banco de guías reutilizables",
    "html": "<div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Lina coordina el área de lenguaje en Bucaramanga. Construye con la IA un prompt 'maestro' para guías de comprensión de lectura: rol de profesora de lenguaje, contexto de grado configurable, tarea de 5 preguntas (2 literales, 2 inferenciales, 1 crítica), formato de tabla.</p><p>Cada docente del área lo usa pegando su texto y ajustando solo el grado. En un mes, el equipo tiene más de 30 guías coherentes en estructura.</p><p>Para las rúbricas hace algo parecido: genera un borrador alineado a los 4 criterios institucionales, lo valida con la coordinación académica, y esa queda como plantilla oficial.</p></div><div class='tip-box'><span class='icon'>✅</span><span>El mayor ahorro de tiempo no viene de usar la IA una vez — viene de construir plantillas reutilizables que todo un equipo puede adaptar.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en este módulo",
    "intro": "Responde en tus propias palabras.",
    "fields": [
      {
        "id": "tres_pasos",
        "label": "¿Cuáles son los tres pasos del flujo para pasar de un objetivo a una guía?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "presentacion",
        "label": "¿Qué le pedirías a una IA para generar el esquema de una presentación de tu materia?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "rubrica",
        "label": "Menciona los cuatro elementos mínimos de una buena rúbrica.",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "plantilla",
        "label": "¿Qué material de tu semana te gustaría convertir en plantilla reutilizable?",
        "type": "textarea",
        "placeholder": "..."
      }
    ]
  }
}$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ia-educadores')
and title = 'Planeación de clases y material didáctico';

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Lecturas: planeación con IA (stage = 'readings')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: planeación con IA', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Planeación de clases y material didáctico'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál es el primer paso del flujo de tres pasos para generar una guía?'),
  (1, '¿Qué aporta el docente en el paso 3 (ajuste final)?'),
  (2, 'Cuando le pides a una IA de texto ''una presentación'', ¿qué obtienes generalmente?'),
  (3, '¿Cuáles son los cuatro elementos mínimos de una rúbrica generada con IA?'),
  (4, '¿Qué se debe hacer antes de aplicar formalmente una rúbrica generada por IA?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Planeación de clases y material didáctico'
  and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Pedir ejercicios sin ningún objetivo definido',false,'Es justo lo que se debe evitar.'),
  (1,'Definir el objetivo de aprendizaje con precisión',true,'Correcto.'),
  (2,'Elegir el diseño visual del documento',false,'No es el primer paso.'),
  (3,'Compartir la guía con otros docentes',false,'No es parte del flujo de generación.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Planeación de clases y material didáctico' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Nada, ese paso lo hace la IA sola',false,'Es el paso donde el docente es insustituible.'),
  (1,'Contexto real de los estudiantes y ejemplos culturalmente relevantes',true,'Correcto.'),
  (2,'Solo la corrección ortográfica',false,'No es lo principal.'),
  (3,'La traducción del documento a otro idioma',false,'No es parte del ajuste.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Planeación de clases y material didáctico' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'El archivo de PowerPoint con diseño visual completo',false,'Generalmente no.'),
  (1,'El contenido y la estructura: títulos, puntos clave y sugerencias visuales',true,'Correcto.'),
  (2,'Solo una imagen de portada',false,'No es lo principal.'),
  (3,'Nada, las IA de texto no pueden ayudar con presentaciones',false,'Sí pueden ayudar.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Planeación de clases y material didáctico' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Criterios, niveles de desempeño, descripción observable y formato',true,'Correcto.'),
  (1,'Título, fecha, firma y sello',false,'No son elementos pedagógicos.'),
  (2,'Solo la nota final numérica',false,'Una rúbrica es más que una nota.'),
  (3,'El nombre del colegio y el logo',false,'No son elementos centrales.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Planeación de clases y material didáctico' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Aplicarla directamente sin revisión',false,'Es lo que la advertencia dice que no se debe hacer.'),
  (1,'Alinearla con los criterios institucionales del colegio si existen',true,'Correcto.'),
  (2,'Traducirla a otro idioma primero',false,'No tiene relación.'),
  (3,'Esperar un año antes de usarla',false,'No es una recomendación.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Planeación de clases y material didáctico' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Repaso interactivo (stage = 'interactive')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Planeación de clases y material didáctico'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Cuál es un ejemplo de objetivo de aprendizaje ''preciso''?'),
  (1, '¿Qué se recomienda hacer con un prompt que ya dio buenos resultados?'),
  (2, 'En el caso de Lina, ¿qué logró su equipo en un mes gracias al ''prompt maestro''?'),
  (3, '¿Qué hizo Lina antes de dejar una rúbrica como ''plantilla oficial''?'),
  (4, '¿De dónde viene el mayor ahorro de tiempo al usar IA en planeación, según el caso de Lina?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Planeación de clases y material didáctico'
  and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'''Enseñar el pasado simple''',false,'Es demasiado genérico.'),
  (1,'''Que los estudiantes conjuguen 5 verbos regulares en oraciones sobre su fin de semana''',true,'Correcto.'),
  (2,'''Hacer una clase sobre inglés''',false,'Es demasiado genérico.'),
  (3,'''Terminar el libro antes de vacaciones''',false,'No es un objetivo de aprendizaje específico.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Planeación de clases y material didáctico' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Borrarlo inmediatamente después de usarlo',false,'Es lo contrario a lo recomendado.'),
  (1,'Guardarlo para reutilizarlo en temas similares',true,'Correcto.'),
  (2,'Compartirlo únicamente por redes sociales',false,'No es parte de la recomendación.'),
  (3,'Usarlo solo una vez y nunca más',false,'Contradice la idea de reutilización.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Planeación de clases y material didáctico' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Un banco de más de 30 guías coherentes entre sí en estructura',true,'Correcto.'),
  (1,'Reducir el número de docentes del área',false,'No es lo que ocurrió.'),
  (2,'Eliminar por completo la planeación manual',false,'Se aceleró, no se eliminó el criterio docente.'),
  (3,'Cambiar el currículo institucional',false,'No es parte del caso.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Planeación de clases y material didáctico' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'La aplicó directamente sin ningún ajuste',false,'Al contrario, la validó primero.'),
  (1,'La validó con la coordinación académica, alineándola a los criterios institucionales',true,'Correcto.'),
  (2,'La tradujo a otro idioma',false,'No es parte del proceso.'),
  (3,'Esperó a que otro colegio la aprobara primero',false,'No es lo que ocurrió.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Planeación de clases y material didáctico' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'De usarla una sola vez para una clase puntual',false,'Es lo contrario a la conclusión.'),
  (1,'De construir plantillas reutilizables que todo un equipo puede adaptar',true,'Correcto.'),
  (2,'De comprar la versión más cara de la herramienta',false,'No es el factor determinante.'),
  (3,'De reducir el número de guías que se generan',false,'No es la conclusión.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Planeación de clases y material didáctico' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

