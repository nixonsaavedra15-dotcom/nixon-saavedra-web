-- ============================================================
-- MÓDULO 1 — "Fundamentos de la IA generativa" (IA para Educadores)
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
    "title": "Cómo 'piensan' los modelos de lenguaje (sin volverte programador)",
    "subtitle": "Vas a entender, con analogías simples, qué hace que un chat de IA responda como responde — y por qué a veces se equivoca con total seguridad.",
    "guide_html": "<p>En este módulo vemos los fundamentos técnicos que necesitas para usar la IA con criterio: cómo funciona por dentro, y qué son las 'alucinaciones'.</p>",
    "objectives": [
      "Explicar en términos simples qué es un modelo de lenguaje (LLM) y qué son los 'tokens'.",
      "Entender qué es una 'alucinación' y por qué ocurre.",
      "Diferenciar entre IA generativa de texto, de imagen y de voz.",
      "Aplicar el hábito de verificación como parte natural de tu flujo de trabajo."
    ]
  },
  "reading1": {
    "tag": "Lectura 1 de 2",
    "title": "No es magia: es predicción de palabras, a gran escala",
    "html": "<p class='lead-in'>Cuando le escribes a una IA 'Escribe un poema sobre el río Magdalena', muchos docentes imaginan que la IA 'entiende' el río Magdalena como lo entendería una persona. En realidad ocurre algo distinto y, entendido bien, te va a ayudar a usar la herramienta con más criterio.</p><p>Un modelo de lenguaje (LLM) fue entrenado leyendo enormes cantidades de texto y aprendió patrones estadísticos sobre qué palabra suele seguir a cuál. Cuando le pides algo, el modelo <strong>predice, palabra por palabra, cuál es la continuación más probable</strong> dado todo lo que ha 'leído' antes.</p><h2>¿Qué es un 'token'?</h2><p>El modelo no procesa palabras completas, sino fragmentos llamados <strong>tokens</strong>. Esto explica por qué a veces la IA se 'pierde' al contar letras o hacer operaciones matemáticas simples.</p><div class='vocab-grid'><div class='vocab-item'><div class='word'>Modelo de lenguaje</div><div class='mean'>Un 'estudiante' que leyó millones de textos y aprendió qué palabra suele seguir a cuál</div></div><div class='vocab-item'><div class='word'>Token</div><div class='mean'>El bloque de Lego con el que arma cada respuesta — a veces una palabra, a veces una sílaba</div></div><div class='vocab-item'><div class='word'>Entrenamiento</div><div class='mean'>El 'estudio' que ya hizo el modelo antes de que tú lo uses; no aprende de tu conversación en tiempo real (salvo excepciones)</div></div></div><div class='tip-box'><span class='icon'>💡</span><span><strong>Tip clave:</strong> cuando la IA 'no sabe' algo reciente, es porque su entrenamiento tiene una fecha de corte. Algunas herramientas se conectan a internet para compensarlo, pero no todas por defecto.</span></div><details class='mini-check'><summary>¿La IA 'entiende' el significado como lo haría una persona?</summary><div class='answer'>No exactamente — predice la continuación más probable de un texto basada en patrones aprendidos.</div></details><details class='mini-check'><summary>¿Qué es un token?</summary><div class='answer'>El fragmento de texto con el que el modelo arma sus respuestas.</div></details>"
  },
  "reading2": {
    "tag": "Lectura 2 de 2",
    "title": "Las alucinaciones: cuando la IA se equivoca con total seguridad",
    "html": "<p class='lead-in'>Se llama 'alucinación' al fenómeno en el que un modelo genera información que suena completamente creíble pero es falsa — una cita que no existe, un año incorrecto, una fuente inventada con formato perfecto.</p><h2>¿Por qué pasa esto?</h2><p>Si le preguntas por un dato muy específico que no aparece claramente en lo que 'aprendió', el modelo no responde 'no sé' por defecto — genera la respuesta más probable según el patrón, aunque no corresponda a un hecho real.</p><h2>Un ejemplo real de aula</h2><div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Un profesor de literatura le pidió a una IA una cita textual de una novela colombiana. La IA entregó una cita perfectamente formateada, con número de página incluido. El profesor la usó sin verificar. Un estudiante, buscándola en el libro físico, no la encontró — porque nunca existió.</p></div><table class='grammar-table'><tr><th>Situación de alto riesgo</th><th>Por qué</th></tr><tr><td>Citas textuales exactas o números de página</td><td>El modelo no tiene memoria fotográfica del texto original</td></tr><tr><td>Fechas y datos históricos muy específicos</td><td>Si el dato es poco frecuente, lo 'rellena' con la opción más probable</td></tr><tr><td>Fuentes y referencias bibliográficas</td><td>Puede generar formatos de cita perfectos con contenido inventado</td></tr><tr><td>Datos numéricos o estadísticas</td><td>Puede combinar cifras reales de contextos distintos sin avisar</td></tr></table><div class='tip-box'><span class='icon'>⚠️</span><span><strong>Advertencia:</strong> cuanto más formal y 'seguro' suena un dato, más tentador es confiar sin revisar — y es justo ahí donde más conviene verificar.</span></div><details class='mini-check'><summary>¿Por qué la IA a veces 'inventa' una cita con total seguridad?</summary><div class='answer'>Porque genera la continuación más probable de un texto aunque no corresponda a un hecho real.</div></details><details class='mini-check'><summary>Menciona dos tipos de datos con alto riesgo de alucinación.</summary><div class='answer'>Citas textuales/números de página, y fechas o cifras muy específicas.</div></details>"
  },
  "interactive": {
    "title": "Reconoce el riesgo",
    "intro": "¿Riesgo alto o bajo de alucinación? Toca cada tarjeta para revisar.",
    "slides": [
      {
        "id": "s1",
        "icon": "📚",
        "title": "'Dame la cita exacta de la página 45'",
        "bubble": "¿Riesgo alto o bajo?",
        "detail": "Riesgo alto: la IA no tiene memoria exacta del texto; puede inventar o desplazar la cita."
      },
      {
        "id": "s2",
        "icon": "🧮",
        "title": "'Explícame la fotosíntesis en términos simples'",
        "bubble": "¿Riesgo alto o bajo?",
        "detail": "Riesgo bajo: es un concepto ampliamente documentado y estable."
      },
      {
        "id": "s3",
        "icon": "📅",
        "title": "'¿Qué pasó el 14 de marzo de 1997 en mi ciudad?'",
        "bubble": "¿Riesgo alto o bajo?",
        "detail": "Riesgo alto: eventos muy específicos y locales son terreno fértil para alucinaciones."
      },
      {
        "id": "s4",
        "icon": "✍️",
        "title": "'Ayúdame a redactar una actividad creativa'",
        "bubble": "¿Riesgo alto o bajo?",
        "detail": "Riesgo bajo: es una tarea generativa, no factual."
      },
      {
        "id": "s5",
        "icon": "📊",
        "title": "'Dame la cifra exacta de deserción escolar en 2019'",
        "bubble": "¿Riesgo alto o bajo?",
        "detail": "Riesgo alto: cifras oficiales específicas deben verificarse en la fuente original."
      },
      {
        "id": "s6",
        "icon": "🗣️",
        "title": "'Genera preguntas sobre este texto que te pegué'",
        "bubble": "¿Riesgo alto o bajo?",
        "detail": "Riesgo bajo: la IA trabaja sobre el texto que le diste, no sobre memoria externa."
      }
    ]
  },
  "practice": {
    "title": "El profesor Julián y la estadística que no cuadraba",
    "html": "<div class='reading-passage'><div class='passage-tag'>Caso real</div><p>Julián enseña economía en Barranquilla. Para su clase sobre desempleo juvenil, le pide a una IA 'la tasa de desempleo juvenil en Colombia en el último trimestre'. La IA responde con una cifra específica y un tono muy seguro.</p><p>Antes de anotarla, Julián se pregunta: ¿es un dato de riesgo? Sí, es una cifra estadística oficial reciente. Entra al sitio del DANE y busca el dato real — la cifra de la IA está desactualizada por casi un año.</p><p>Julián no descarta la herramienta: la sigue usando para redactar preguntas de análisis, donde no hay dato exacto que pueda alucinar. Pero adopta una regla personal: todo número específico se verifica en la fuente oficial antes de usarlo en clase.</p></div><div class='tip-box'><span class='icon'>✅</span><span>La lección de Julián: la IA es excelente redactando y estructurando; verificar datos duros sigue siendo tarea del docente.</span></div>"
  },
  "closing_form": {
    "title": "Sella lo aprendido en este módulo",
    "intro": "Responde en tus propias palabras.",
    "fields": [
      {
        "id": "alucinacion",
        "label": "En tus palabras: ¿qué es una alucinación de la IA y por qué ocurre?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "riesgo",
        "label": "Menciona un tipo de pregunta de riesgo alto y uno de riesgo bajo.",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "regla_oro",
        "label": "¿Qué regla aplicarías antes de llevar un dato de IA a tus estudiantes?",
        "type": "textarea",
        "placeholder": "..."
      },
      {
        "id": "dificultad",
        "label": "¿Qué fue lo que más te costó entender de este módulo?",
        "type": "textarea",
        "placeholder": "..."
      }
    ]
  }
}$JSON$::jsonb
where course_id = (select id from public.courses where slug = 'ia-educadores')
and title = 'Fundamentos de la IA generativa';

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Lecturas: cómo piensa un modelo de lenguaje (stage = 'readings')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Lecturas: cómo piensa un modelo de lenguaje', 75, false, null, 0, 'readings'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Fundamentos de la IA generativa'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Qué hace realmente un modelo de lenguaje cuando responde a una pregunta?'),
  (1, '¿Qué es un ''token''?'),
  (2, '¿Por qué a veces la IA ''no sabe'' sobre eventos muy recientes?'),
  (3, '¿Qué es una ''alucinación'' de la IA?'),
  (4, '¿Cuál situación tiene MAYOR riesgo de alucinación?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Fundamentos de la IA generativa'
  and qz.stage = 'readings'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Busca la respuesta exacta en una base de datos verificada',false,'No tiene una base de datos de ''verdades'' consultables.'),
  (1,'Predice la continuación más probable de un texto según patrones aprendidos',true,'Correcto.'),
  (2,'Consulta en tiempo real con un equipo de expertos humanos',false,'No es el mecanismo del modelo.'),
  (3,'Copia literalmente fragmentos de internet',false,'No copia literalmente; genera texto nuevo.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Fundamentos de la IA generativa' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Una moneda virtual para pagar el servicio',false,'No es el significado técnico.'),
  (1,'El fragmento de texto con el que el modelo arma sus respuestas',true,'Correcto.'),
  (2,'Un error de programación',false,'No es un error.'),
  (3,'El nombre del modelo de IA',false,'No es el nombre del modelo.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Fundamentos de la IA generativa' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Porque está prohibido hablar de noticias',false,'No es una prohibición.'),
  (1,'Porque su entrenamiento tiene una fecha de corte',true,'Correcto.'),
  (2,'Porque los eventos recientes no existen',false,'Sí existen, la IA simplemente no los ''conoce'' por defecto.'),
  (3,'Porque el usuario no pagó la versión completa',false,'No es la razón.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Fundamentos de la IA generativa' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Un error de conexión a internet',false,'No tiene relación con la conexión.'),
  (1,'Información que suena creíble pero es falsa',true,'Correcto.'),
  (2,'Una función que permite generar imágenes',false,'No es eso.'),
  (3,'Un mensaje de advertencia que muestra la IA',false,'La IA no siempre avisa.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Fundamentos de la IA generativa' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Pedir una explicación general de la fotosíntesis',false,'Riesgo bajo.'),
  (1,'Pedir ayuda para redactar una actividad creativa',false,'Riesgo bajo.'),
  (2,'Pedir una cita textual exacta con número de página',true,'Correcto.'),
  (3,'Pedir preguntas sobre un texto que tú mismo pegaste',false,'Riesgo bajo.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Fundamentos de la IA generativa' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='readings')
on conflict (question_id, order_index) do nothing;

-- ------------------------------------------------------------
-- Cuestionario — Quiz — Repaso interactivo (stage = 'interactive')
-- ------------------------------------------------------------
insert into public.quizzes (module_id, title, passing_score, is_final, max_attempts, cooldown_hours, stage)
select m.id, 'Quiz — Repaso interactivo', 75, false, null, 0, 'interactive'
from public.modules m join public.courses c on c.id = m.course_id
where c.slug = 'ia-educadores' and m.title = 'Fundamentos de la IA generativa'
on conflict (module_id, stage) do nothing;

insert into public.quiz_questions (quiz_id, order_index, prompt)
select qz.id, v.order_index, v.prompt
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
cross join (values
  (0, '¿Por qué pedir ''la cita exacta de la página 45'' es de alto riesgo?'),
  (1, '¿Por qué pedir cifras oficiales de desempleo juvenil requiere verificación externa?'),
  (2, '¿Qué tienen en común las tarjetas de riesgo BAJO?'),
  (3, 'En el caso de Julián, ¿qué decidió hacer tras encontrar la cifra desactualizada?'),
  (4, '¿Cuál es la ''regla de oro'' antes de llevar un dato de IA al aula?')
) as v(order_index, prompt)
where c.slug = 'ia-educadores' and m.title = 'Fundamentos de la IA generativa'
  and qz.stage = 'interactive'
on conflict (quiz_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Porque el libro no existe',false,'No es la razón.'),
  (1,'Porque la IA no tiene memoria exacta del texto original',true,'Correcto.'),
  (2,'Porque está prohibido citar libros',false,'No hay tal prohibición.'),
  (3,'Porque las citas son siempre erróneas',false,'No siempre; el riesgo es mayor, no una certeza.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Fundamentos de la IA generativa' and qq.order_index=0
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Porque la IA nunca menciona cifras',false,'Sí las menciona, ese es el riesgo.'),
  (1,'Porque las cifras oficiales específicas deben verificarse siempre en la fuente original',true,'Correcto.'),
  (2,'Porque el DANE prohíbe usar IA',false,'No existe tal prohibición.'),
  (3,'Porque las cifras cambian cada segundo',false,'No es la razón dada.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Fundamentos de la IA generativa' and qq.order_index=1
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Son todas sobre matemáticas',false,'No, son de temas distintos.'),
  (1,'No dependen de un dato factual inventable, o trabajan sobre texto ya dado',true,'Correcto.'),
  (2,'Son preguntas que nunca debes hacerle a una IA',false,'Al contrario, son ejemplos de uso seguro.'),
  (3,'Requieren siempre verificación externa',false,'Es lo opuesto.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Fundamentos de la IA generativa' and qq.order_index=2
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Dejar de usar la IA por completo',false,'No la abandonó.'),
  (1,'Seguir usando la cifra de la IA sin cambios',false,'Al contrario, la corrigió.'),
  (2,'Seguir usando la IA para redactar, pero verificar todo número específico en la fuente oficial',true,'Correcto.'),
  (3,'Pedirle a sus estudiantes que verificaran por él',false,'La verificación la hizo él mismo.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Fundamentos de la IA generativa' and qq.order_index=3
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

insert into public.quiz_choices (question_id, order_index, choice_text, is_correct, feedback)
select qq.id, v.order_index, v.choice_text, v.is_correct, v.feedback
from public.quiz_questions qq join public.quizzes qz on qz.id=qq.quiz_id join public.modules m on m.id=qz.module_id join public.courses c on c.id=m.course_id
cross join (values
  (0,'Usar siempre el primer dato que dé la IA sin revisar',false,'Es lo contrario a la regla.'),
  (1,'Preguntarse si el dato es de riesgo, si se puede verificar, y si se puede reformular la actividad',true,'Correcto.'),
  (2,'Preguntarle a otro estudiante si el dato es correcto',false,'No es la estrategia propuesta.'),
  (3,'Nunca usar datos numéricos en clase',false,'No se prohíbe usarlos, se exige verificarlos.')
) as v(order_index,choice_text,is_correct,feedback)
where c.slug='ia-educadores' and m.title='Fundamentos de la IA generativa' and qq.order_index=4
  and exists (select 1 from public.quizzes qz2 where qz2.id = qq.quiz_id and qz2.stage='interactive')
on conflict (question_id, order_index) do nothing;

