-- ============================================================
-- Reestructuración del curso "Inglés A2" a formato A2 Key (KET)
-- ============================================================
-- Reemplaza los 8 módulos genéricos (gramática, writing, reading,
-- listening, speaking) por una estructura basada en las partes
-- reales del examen A2 Key de Cambridge (formato vigente, revisado
-- en 2020): Reading and Writing (7 partes), Listening (5 partes) y
-- Speaking (2 partes).
--
-- CONFIRMADO con el usuario: no hay estudiantes matriculados en este
-- curso todavía, así que es seguro reemplazar los módulos (borrar un
-- módulo borra en cascada el progreso/quizzes asociados).
--
-- CÓMO USARLO: SQL Editor → New query → pega esto completo → Run.
-- Requiere haber corrido antes schema.sql, admin-schema.sql,
-- quiz-schema.sql, lesson-flow-schema.sql y seed-ingles-a2.sql
-- (este último ya creó el curso 'ingles-a2', solo actualizamos su
-- descripción y reemplazamos sus módulos).
-- ============================================================

update public.courses set
  title = 'Inglés A2 (KET)',
  description = 'Preparación completa para el examen Cambridge A2 Key (KET): Reading and Writing, Listening y Speaking, organizado por partes reales del examen. Incluye dos simulacros completos y certificado.'
where slug = 'ingles-a2';

-- Borra los 8 módulos genéricos anteriores (y su progreso/quizzes en
-- cascada — seguro porque no hay estudiantes matriculados aún).
delete from public.modules
where course_id = (select id from public.courses where slug = 'ingles-a2');

insert into public.modules (course_id, title, order_index, description)
select c.id, m.title, m.order_index, m.description
from public.courses c
cross join (values
  (0, 'Introducción',
   'Bienvenida al curso y al examen Cambridge A2 Key (KET): sus tres partes (Reading and Writing, Listening, Speaking), cómo se califica, y estrategia general para prepararte.'),
  (1, 'Reading — Parte 1: Avisos y señales',
   'Relacionar avisos y letreros cortos (mensajes de texto, notas, señales) con su significado — igual que en la vida real, sin traducir palabra por palabra.'),
  (2, 'Reading — Parte 2: Vocabulario en contexto',
   'Relacionar descripciones con la palabra o el texto correcto entre varias opciones — pone a prueba tu vocabulario general en contexto.'),
  (3, 'Reading — Parte 3: Comprensión de lectura',
   'Leer un texto de longitud media y responder preguntas de opción múltiple sobre información explícita e implícita.'),
  (4, 'Reading — Parte 4: Texto con espacios (opción múltiple)',
   'Completar los espacios de un texto eligiendo la palabra correcta entre tres opciones — gramática y vocabulario en contexto.'),
  (5, 'Reading — Parte 5: Texto con espacios (respuesta abierta)',
   'Completar los espacios de un correo o nota escribiendo tú mismo la palabra que falta — sin opciones para elegir.'),
  (6, 'Writing — Mensaje corto y mini-historia',
   'Escribir un mensaje corto (email o nota, mínimo 25 palabras) cumpliendo 3 puntos obligatorios, y una mini-historia (mínimo 35 palabras) a partir de tres imágenes.'),
  (7, 'Listening — Partes 1 y 2: Diálogos cortos e imágenes',
   'Escuchar (leer la transcripción) diálogos breves y elegir la imagen o respuesta correcta; luego un audio más largo con preguntas de opción múltiple.'),
  (8, 'Listening — Partes 3, 4 y 5: Conversaciones y monólogos',
   'Conversaciones más largas, un monólogo con espacios para completar, y una conversación final para relacionar información.'),
  (9, 'Speaking — Entrevista y tarea colaborativa',
   'Practica las dos partes del examen oral: responder preguntas personales y describir/comparar imágenes — adaptado para practicar grabándote.'),
  (10, 'Simulacro final',
   'Dos simulacros completos del examen A2 Key, con la misma estructura, número de preguntas y tiempo que el examen real. Al aprobar, se emite tu certificado.')
) as m(order_index, title, description)
where c.slug = 'ingles-a2'
on conflict do nothing;
