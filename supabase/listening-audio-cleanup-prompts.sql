-- ============================================================
-- Limpieza de texto: quita el diálogo escrito de las preguntas
-- evaluativas de Listening (ya que ahora van a tener audio real) y
-- deja solo la pregunta. Corre esto DESPUÉS de listening-audio-schema.sql.
-- Es seguro correrlo antes de subir los audios (el reproductor
-- simplemente no aparece hasta que audio_url tenga un valor).
-- ============================================================

-- ---- Listening Partes 1 y 2 — Cuestionario "Lecturas" ----
-- L12-readings-q1.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: What are they going to buy?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
  and qz.stage = 'readings' and qq.order_index = 0;

-- L12-readings-q2.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: How is the person going to school?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
  and qz.stage = 'readings' and qq.order_index = 1;

-- L12-readings-q3.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: What is the weather like now?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
  and qz.stage = 'readings' and qq.order_index = 2;

-- L12-readings-q4.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: What time is the class now?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
  and qz.stage = 'readings' and qq.order_index = 3;

-- L12-readings-q5.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: How did the person travel?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
  and qz.stage = 'readings' and qq.order_index = 4;

-- ---- Listening Partes 1 y 2 — Cuestionario "Repaso interactivo" ----
-- (la pregunta 5 de este cuestionario NO tiene audio -- es sobre
-- estrategia, se deja intacta a propósito)
-- L12-interactive-q1.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: What time does the film start?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
  and qz.stage = 'interactive' and qq.order_index = 0;

-- L12-interactive-q2.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: What is the weather like tomorrow?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
  and qz.stage = 'interactive' and qq.order_index = 1;

-- L12-interactive-q3.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: Which room is the meeting in?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
  and qz.stage = 'interactive' and qq.order_index = 2;

-- L12-interactive-q4.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: What time will they meet?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 1 y 2: Diálogos cortos e imágenes'
  and qz.stage = 'interactive' and qq.order_index = 3;

-- ---- Listening Partes 3, 4 y 5 — Cuestionario "Lecturas" ----
-- L345-readings-q1.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: What is Leo going to do tonight?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and qz.stage = 'readings' and qq.order_index = 0;

-- L345-readings-q2.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: When can Jo play football?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and qz.stage = 'readings' and qq.order_index = 1;

-- L345-readings-q3.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: How is Dan going to the concert?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and qz.stage = 'readings' and qq.order_index = 2;

-- L345-readings-q4.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: How will Lucy probably get her new bag?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and qz.stage = 'readings' and qq.order_index = 3;

-- L345-readings-q5.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: Where will Ben and Ella meet?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and qz.stage = 'readings' and qq.order_index = 4;

-- ---- Listening Partes 3, 4 y 5 — Cuestionario "Repaso interactivo" ----
-- L345-interactive-q1.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: What is the name of the museum?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and qz.stage = 'interactive' and qq.order_index = 0;

-- L345-interactive-q2.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: What time does the museum open?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and qz.stage = 'interactive' and qq.order_index = 1;

-- L345-interactive-q3.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: What time should students arrive?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and qz.stage = 'interactive' and qq.order_index = 2;

-- L345-interactive-q4.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: How much does the bus ticket cost?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and qz.stage = 'interactive' and qq.order_index = 3;

-- L345-interactive-q5.mp3
update public.quiz_questions qq
set prompt = 'Escucha el audio y responde: What does the speaker say instead of the number ''0'' on the phone?'
from public.quizzes qz join public.modules m on m.id = qz.module_id join public.courses c on c.id = m.course_id
where qq.quiz_id = qz.id and c.slug = 'ingles-a2' and m.title = 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos'
  and qz.stage = 'interactive' and qq.order_index = 4;
