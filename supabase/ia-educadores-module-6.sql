-- ============================================================
-- MÓDULO 6 — "Ética, sesgos y uso responsable de la IA" (IA para Educadores)
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
    "title": "Usar IA con criterio: privacidad, sesgos y propiedad intelectual",
    "subtitle": "Vas a entender los riesgos éticos más relevantes para un docente al usar IA, y cómo tomar decisiones responsables sin necesitar ser experto en tecnología.",
    "guide_html": "<p>En este módulo vemos privacidad de datos de menores, sesgos algorítmicos, propiedad intelectual, y qué dice la evidencia sobre el uso de IA en tus estudiantes.</p>",
    "objectives": [
      "Aplicar buenas prácticas de privacidad de datos de menores al usar IA.",
      "Reconocer ejemplos concretos de sesgo algorítmico en contenido generado por IA.",
      "Entender los aspectos básicos de propiedad intelectual al usar IA en el aula.",
      "Construir, en tus propias palabras, una política de aula clara sobre el uso de IA."
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "Privacidad de datos de menores: lo que nunca debe pegarse en un chat de IA",
    "html": "<p class='lead-in'>En Colombia, los datos de niños, niñas y adolescentes tienen protección legal reforzada (Ley 1581 de 2012). No toda información puede pegarse libremente en un chat, aunque sea gratuito o de una empresa conocida.</p><h2>La regla práctica: anonimiza antes de pegar</h2><table class='grammar-table'><tr><th>En vez de pegar esto...</th><th>Pega esto</th></tr><tr><td>'María José Rodríguez, con diagnóstico de TDAH, tiene dificultad para...'</td><td>'Un estudiante con dificultad para mantener la atención...'</td></tr><tr><td>El correo del estudiante</td><td>(No se pega ningún dato de contacto)</td></tr><tr><td>'La calificación de Andrea fue 2.3'</td><td>'Un estudiante con desempeño bajo...'</td></tr></table><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Advertencia:</strong> revisa la política de privacidad de la herramienta. Ante la duda: si no lo dirías en voz alta en una reunión abierta de padres, no lo pegues en un chat de IA.</span></div><details class='mini-check'><summary>¿Qué pregunta deberías hacerte antes de pegar información de un estudiante?</summary><div class='answer'>Si se puede anonimizar sin que la tarea pierda utilidad.</div></details><details class='mini-check'><summary>¿Cuál es la 'regla más segura' ante la duda?</summary><div class='answer'>Si no lo dirías en voz alta en una reunión abierta de padres, no lo pegues.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Sesgos algorítmicos y propiedad intelectual: dos riesgos menos visibles",
    "html": "<p class='lead-in'>Además de la privacidad, hay dos riesgos que pasan desapercibidos: los sesgos en el contenido generado, y las dudas sobre propiedad intelectual del material producido.</p><h2>Sesgo algorítmico</h2><div class='reading-passage'><div class='passage-tag'>Ejemplo real</div><p>Un docente pidió '5 ejemplos de profesiones para vocabulario' y notó que las profesiones de mayor estatus se asociaban a un género y las de servicio a otro. Al pedir explícitamente 'variar el género y evitar estereotipos', el resultado mejoró notablemente.</p></div><div class='tip-box'><span class='icon'>💡</span><span><strong>Tip clave:</strong> pedir diversidad en el prompt reduce el sesgo, pero no lo elimina del todo. La revisión crítica sigue siendo la última línea de defensa.</span></div><h2>Propiedad intelectual: qué sí y qué no</h2><table class='grammar-table'><tr><th>Situación</th><th>Consideración</th></tr><tr><td>Generar una guía con IA para tu clase</td><td>Generalmente sin problema</td></tr><tr><td>Pedir que 'escriba en el estilo de' un autor vivo</td><td>Zona gris</td></tr><tr><td>Usar imágenes de IA en material que se va a vender</td><td>Revisar términos de uso comercial</td></tr></table><details class='mini-check'><summary>Menciona un ejemplo de sesgo algorítmico.</summary><div class='answer'>Roles de género estereotipados en ejemplos de profesiones.</div></details><details class='mini-check'><summary>¿Pedir diversidad en el prompt elimina completamente el sesgo?</summary><div class='answer'>No — lo reduce, pero la revisión crítica del docente sigue siendo necesaria.</div></details>"
  },
  "interactive": {
    "title": "Semáforo ético: verde, amarillo o rojo",
    "intro": "Clasifica cada situación.",
    "slides": [
      {
        "id": "s1",
        "icon": "🟢",
        "title": "Pedir una guía genérica sobre fracciones",
        "bubble": "¿Qué color?",
        "detail": "Verde: no involucra datos personales ni riesgos de sesgo relevantes."
      },
      {
        "id": "s2",
        "icon": "🔴",
        "title": "Pegar nombre y diagnóstico de un estudiante en un chat gratuito",
        "bubble": "¿Qué color?",
        "detail": "Rojo: información sensible de un menor que debe anonimizarse."
      },
      {
        "id": "s3",
        "icon": "🟡",
        "title": "Pedir '5 ejemplos de profesiones exitosas' sin pedir diversidad",
        "bubble": "¿Qué color?",
        "detail": "Amarillo: riesgo de sesgo de género o cultural."
      },
      {
        "id": "s4",
        "icon": "🟢",
        "title": "Describir a un estudiante como 'buen manejo de vocabulario'",
        "bubble": "¿Qué color?",
        "detail": "Verde: describe el nivel sin usar datos identificables."
      },
      {
        "id": "s5",
        "icon": "🔴",
        "title": "Publicar como propio un cuento 100% generado por IA en un concurso",
        "bubble": "¿Qué color?",
        "detail": "Rojo: cuestión de honestidad académica."
      },
      {
        "id": "s6",
        "icon": "🟡",
        "title": "Usar una imagen de IA en un afiche que se va a vender",
        "bubble": "¿Qué color?",
        "detail": "Amarillo: revisar primero los términos de uso comercial."
      }
    ]
  },
  "practice": {
    "title": "IA en profesores vs. IA en estudiantes: lo que dice la evidencia, y el caso del profesor Diego",
    "html": "<div class='tip-box'><span class='icon'>📌</span><span><strong>Antes del caso:</strong> la evidencia reciente (2025-2026) muestra que la diferencia no es 'profesores sí, estudiantes no' — es cómo se usa la IA. Un estudio con 666 participantes encontró que el uso frecuente y pasivo de IA (aceptar la respuesta sin cuestionarla) se correlaciona con caída en pensamiento crítico ('cognitive offloading'). Pero un ensayo controlado de Harvard (2025) encontró que estudiantes con un tutor de IA bien diseñado, usado activamente, aprendieron significativamente más en menos tiempo. La combinación IA + acompañamiento humano supera tanto a la IA sola como a la enseñanza tradicional sola.</span></div><div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Diego enseña filosofía en Pereira y construye la política de uso de IA junto con sus estudiantes de grado 11, como actividad de pensamiento crítico. Les presenta el semáforo ético y les pide clasificar 10 situaciones reales en grupos.</p><p>Al final, el grupo redacta tres reglas: 1) cualquier uso de IA en una entrega debe declararse, 2) nunca se pega información personal de un compañero en un chat de IA, 3) la defensa oral del propio trabajo sigue siendo la prueba final de comprensión.</p></div><div class='tip-box'><span class='icon'>✅</span><span>Una política construida con los estudiantes genera más compromiso que una lista de prohibiciones impuesta.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en este módulo",
    "intro": "Responde en tus propias palabras.",
    "fields": [
      {
        "id": "privacidad",
        "label": "¿Por qué no toda información de un estudiante puede pegarse libremente en un chat de IA?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "sesgo",
        "label": "Menciona un ejemplo de sesgo que podrías anticipar en tu materia y cómo lo prevendrías.",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "regla",
        "label": "Escribe una regla clara que te gustaría establecer con tus estudiantes sobre el uso de IA.",
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
and title = 'Ética, sesgos y uso responsable de la IA';

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Lecturas: ética y uso responsable (stage = 'readings')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: ética y uso responsable', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Ética, sesgos y uso responsable de la IA'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué protección legal reforzada existe en Colombia respecto a los datos de menores?'),
  (1, '¿Cuál es la ''regla más segura'' ante la duda de qué información pegar en un chat de IA?'),
  (2, '¿Qué mejoró el resultado al pedir ejemplos de profesiones, según el ejemplo real?'),
  (3, '¿Pedir diversidad en un prompt elimina completamente el sesgo?'),
  (4, '¿Qué se recomienda antes de usar imágenes de IA en material que se va a vender?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Ética, sesgos y uso responsable de la IA'
  and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Ninguna, se tratan igual que los de adultos',false,'Hay un tratamiento especial.'),
  (1,'La Ley 1581 de 2012 establece un tratamiento especial para datos de menores',true,'Correcto.'),
  (2,'Solo aplica a estudiantes universitarios',false,'Aplica a niños, niñas y adolescentes.'),
  (3,'Solo aplica si el estudiante tiene un diagnóstico médico',false,'No es una condición.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ética, sesgos y uso responsable de la IA' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Pegar toda la información posible',false,'Es lo opuesto.'),
  (1,'Si no lo dirías en voz alta en una reunión abierta de padres, no lo pegues',true,'Correcto.'),
  (2,'Preguntarle primero a la IA si puede guardar el dato',false,'No es la estrategia.'),
  (3,'Pegar solo el nombre, nunca el diagnóstico',false,'La recomendación es anonimizar.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ética, sesgos y uso responsable de la IA' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Pedir explícitamente variar el género y evitar estereotipos',true,'Correcto.'),
  (1,'Pedir el resultado en otro idioma',false,'No es lo que se describe.'),
  (2,'Pedir menos ejemplos en total',false,'No es lo que mejoró el resultado.'),
  (3,'No hacer ningún cambio',false,'De hecho el resultado inicial mostraba sesgo.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ética, sesgos y uso responsable de la IA' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Sí, lo elimina por completo siempre',false,'No lo elimina del todo.'),
  (1,'No, lo reduce, pero la revisión crítica sigue siendo necesaria',true,'Correcto.'),
  (2,'No tiene ningún efecto sobre el sesgo',false,'Sí tiene un efecto.'),
  (3,'Solo funciona si se pide en inglés',false,'No es una condición mencionada.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ética, sesgos y uso responsable de la IA' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Nada, siempre se puede usar libremente',false,'Hay que revisar los términos.'),
  (1,'Revisar los términos de uso comercial de la herramienta',true,'Correcto.'),
  (2,'Pedir permiso a cada estudiante del colegio',false,'No es el procedimiento.'),
  (3,'Está prohibido en todos los casos',false,'No es una prohibición absoluta.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ética, sesgos y uso responsable de la IA' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Repaso interactivo (stage = 'interactive')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Ética, sesgos y uso responsable de la IA'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué color corresponde a pegar nombre y diagnóstico de un estudiante en un chat gratuito?'),
  (1, '¿Por qué publicar como propio un cuento 100% de IA en un concurso escolar se marca en rojo?'),
  (2, 'Según la evidencia reciente, ¿qué determina si el uso de IA perjudica o ayuda a un estudiante?'),
  (3, 'En el caso de Diego, ¿qué actividad usó para construir la política de uso de IA?'),
  (4, '¿Cuál es la lección final del caso de Diego?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Ética, sesgos y uso responsable de la IA'
  and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Verde',false,'No es de bajo riesgo.'),
  (1,'Amarillo',false,'El riesgo es mayor.'),
  (2,'Rojo',true,'Correcto.'),
  (3,'No aplica ningún color',false,'Sí aplica, y es rojo.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ética, sesgos y uso responsable de la IA' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Porque los concursos prohíben computadores',false,'No es la razón.'),
  (1,'Porque es una cuestión de honestidad académica y de las bases del concurso',true,'Correcto.'),
  (2,'Porque la IA no puede escribir cuentos',false,'Sí puede, ese es el punto.'),
  (3,'Porque está penalizado por la ley colombiana',false,'No es el marco legal referido.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ética, sesgos y uso responsable de la IA' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Si es profesor o estudiante',false,'No es la variable clave según la evidencia.'),
  (1,'Si el uso es activo (cuestiona, contrasta) o pasivo (delega el juicio sin revisar)',true,'Correcto.'),
  (2,'El precio de la herramienta que use',false,'No es lo que muestra la evidencia.'),
  (3,'La edad del estudiante únicamente',false,'No es el factor determinante.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ética, sesgos y uso responsable de la IA' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Una charla unilateral sin participación de los estudiantes',false,'Es lo opuesto.'),
  (1,'Clasificar en grupos 10 situaciones reales usando el semáforo ético',true,'Correcto.'),
  (2,'Un examen individual sobre las normas del colegio',false,'No es la actividad descrita.'),
  (3,'Prohibir el uso de IA sin ninguna discusión',false,'No es el enfoque que tomó.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ética, sesgos y uso responsable de la IA' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Genera menos compromiso que una lista impuesta de prohibiciones',false,'Es lo opuesto.'),
  (1,'Genera más compromiso real y es en sí misma una lección de pensamiento ético aplicado',true,'Correcto.'),
  (2,'No tiene ningún efecto en el comportamiento de los estudiantes',false,'Contradice la conclusión.'),
  (3,'Solo funciona en la materia de filosofía',false,'Es un enfoque generalizable.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Ética, sesgos y uso responsable de la IA' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

