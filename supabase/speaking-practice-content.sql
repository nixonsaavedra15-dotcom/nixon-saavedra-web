-- ============================================================
-- Contenido de las tareas de práctica de Speaking (grabadora en vivo)
-- ============================================================
-- Corre esto DESPUÉS de speaking-practice-schema.sql. Agrega el campo
-- 'speaking_tasks' al lesson_json del módulo de Speaking — no toca
-- nada más de su contenido actual (welcome/reading1/reading2/
-- interactive/practice/closing_form siguen intactos).
-- ============================================================

update public.modules
set lesson_json = jsonb_set(lesson_json, '{speaking_tasks}', $JSON$
[
  {
    "id": "part1-interview",
    "type": "interview",
    "label": "Parte 1 — Entrevista personal",
    "prompt": "Habla en voz alta (en inglés) respondiendo estas tres preguntas seguidas, como si fuera una entrevista real: What's your name and where are you from? What do you study or do you work? What do you usually do at the weekend? Recuerda extender tus respuestas con 'because', 'usually' o un ejemplo.",
    "keywords": ["my name", "i'm from", "i am from", "i study", "i work", "weekend", "because", "usually", "especially"],
    "min_words": 25,
    "min_seconds": 25
  },
  {
    "id": "part2-collaborative",
    "type": "collaborative",
    "label": "Parte 2 — Tarea colaborativa",
    "prompt": "Habla en voz alta dando tu opinión sobre este tema (puedes decir ambos lados de la conversación, A y B, si quieres practicar los dos papeles): Talk about different places to have lunch with a friend — a restaurant, a park, a café, or at home. Usa frases como 'I think...', 'what about you?', 'I agree' o 'in my opinion'.",
    "keywords": ["i think", "restaurant", "park", "cafe", "café", "home", "agree", "what about you", "in my opinion", "maybe"],
    "min_words": 20,
    "min_seconds": 20
  }
]
$JSON$::jsonb)
where course_id = (select id from public.courses where slug = 'ingles-a2')
and title = 'Speaking — Entrevista y tarea colaborativa' and lesson_json is not null;
