-- ============================================================
-- Módulos reales del curso Pre-ICFES
-- ============================================================
-- Cómo usar: en Supabase → "SQL Editor" → "New query", pega esto y dale "Run".
-- Ya debes haber corrido antes supabase/schema.sql (crea las tablas y el
-- curso 'pre-icfes'). Este script solo agrega los 9 módulos reales,
-- tomados y organizados a partir de tu documento "CURSO PRE ICFES Inglés 2025".
-- ============================================================

insert into public.modules (course_id, title, order_index, description)
select c.id, m.title, m.order_index, m.description
from public.courses c
cross join (values
  (0, 'Introducción',
   'Bienvenida al curso, cómo navegar los módulos, el sistema de calificación y la certificación final. Generalidades de la prueba de inglés del ICFES: qué evalúa, sus 5 niveles de desempeño y las 55 preguntas divididas en 7 partes. Manejo del tiempo y la energía el día del examen.'),
  (1, 'Parte 1 — Avisos y vocabulario',
   'Reconocer el propósito comunicativo de un aviso y el lugar donde puede aparecer. Trabajo de vocabulario esencial (verbos, sustantivos y adjetivos más usados) y la importancia de responder según la generalidad del contexto colombiano, no el contexto personal.'),
  (2, 'Parte 2 — Relación de enunciados',
   'Relacionar enunciados con la palabra o imagen correcta, identificando palabras clave. Estrategias de memorización de vocabulario y herramientas digitales recomendadas para practicar.'),
  (3, 'Parte 3 — Diálogos y conversación',
   'Simular conversaciones cortas: identificar el tiempo verbal y los modales (will, can, may, shall, would, must, should) para anticipar la respuesta correcta según la intención de la pregunta.'),
  (4, 'Parte 4 — Use of Language',
   'Completar espacios en blanco dentro de un texto, poniendo a prueba preposiciones, pronombres, adverbios, conjugaciones verbales y comparativos/superlativos. Es la parte de mayor dificultad y la que mejor puntúa.'),
  (5, 'Parte 5 — Lectura literal',
   'Identificar información explícita en un texto: ideas principales, detalles, orden secuencial y definiciones claras, sin necesidad de interpretar o inferir.'),
  (6, 'Parte 6 — Lectura inferencial',
   'Deducir significados, intenciones del autor y relaciones que no están explícitas en el texto, apoyándose en pistas textuales, conectores lógicos (because, however, therefore) y contexto cultural.'),
  (7, 'Parte 7 — Texto con opción múltiple',
   'Completar un texto sobre temas generales (deportes, viajes, cultura) seleccionando la opción que mejor encaja gramatical y semánticamente, combinando vocabulario contextual y comprensión global.'),
  (8, 'Simulacro final',
   'Examen de práctica que reúne las 7 partes en condiciones similares a la prueba real, más el examen de vocabulario tomado de los listados del curso. Requisito para obtener el certificado.')
) as m(order_index, title, description)
where c.slug = 'pre-icfes'
on conflict do nothing;
