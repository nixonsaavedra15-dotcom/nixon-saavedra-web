-- ============================================================
-- Módulos del curso "IA para Educadores"
-- ============================================================
-- Cómo usar: en Supabase → SQL Editor → New query, pega esto y dale Run.
-- Requiere que schema.sql ya se haya corrido antes (crea el curso
-- 'ia-educadores'). Este script solo agrega los 9 módulos.
-- El contenido real de cada lección vive en los 9 archivos
-- module-ia-0.sql a module-ia-8.sql — corre esos DESPUÉS de este.
-- ============================================================

insert into public.modules (course_id, title, order_index, description)
select c.id, m.title, m.order_index, m.description
from public.courses c
cross join (values
  (0, 'Introducción', 'En este curso vas a aprender a usar la inteligencia artificial generativa como una herramienta más de tu caja de herramientas docente — para planear más rápido, evaluar mejor y llegarle a cada estudiante, sin perder el criterio pedagógico que solo tú tienes.'),
  (1, 'Fundamentos de la IA generativa', 'Vas a entender, con analogías simples, qué hace que un chat de IA responda como responde — y por qué a veces se equivoca con total seguridad.'),
  (2, 'Ingeniería de prompts para el aula', 'La diferencia entre una respuesta mediocre y una que puedes usar directamente en clase casi siempre está en cómo pediste, no en qué herramienta usaste.'),
  (3, 'Planeación de clases y material didáctico', 'Vas a construir un flujo de trabajo repetible para pasar de un objetivo de aprendizaje a una guía, una rúbrica o una presentación lista para usar.'),
  (4, 'Evaluación y retroalimentación con IA', 'La IA puede ayudarte a generar exámenes, dar retroalimentación personalizada y entender mejor el uso indebido — sin que la evaluación deje de ser justa y humana.'),
  (5, 'Atención a la diversidad con IA', 'Vas a usar la IA para adaptar contenidos a necesidades educativas especiales, distintos ritmos de aprendizaje y contextos multilingües — sin bajar las expectativas de aprendizaje.'),
  (6, 'Ética, sesgos y uso responsable de la IA', 'Vas a entender los riesgos éticos más relevantes para un docente al usar IA, y cómo tomar decisiones responsables sin necesitar ser experto en tecnología.'),
  (7, 'Caja de herramientas docente', 'Vas a conocer, de forma comparativa y práctica, las herramientas de IA más relevantes para un docente hoy — sin publicidad, con criterio de uso real de aula.'),
  (8, 'Proyecto final y certificación', 'Vas a integrar todo lo aprendido en los 8 módulos anteriores en una secuencia didáctica real, lista para usar con tus estudiantes. Es el requisito final para obtener tu certificado.')
) as m(order_index, title, description)
where c.slug = 'ia-educadores'
on conflict do nothing;
