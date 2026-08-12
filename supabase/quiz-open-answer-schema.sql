-- ============================================================
-- Preguntas de respuesta abierta (escribir la palabra) para quizzes
-- ============================================================
-- Hasta ahora TODAS las preguntas eran de opción múltiple
-- (quiz_choices). Esto agrega un segundo tipo de pregunta: el
-- estudiante escribe la palabra en una casilla de texto, sin ver
-- opciones — igual que la Parte 5 real del examen A2 Key ("Write
-- ONE word for each gap").
--
-- Cómo funciona, siguiendo el mismo patrón de seguridad que ya
-- usa quiz_choices: las respuestas aceptadas viven en una tabla
-- aparte (quiz_text_answers) SIN policy de select para estudiantes
-- — nunca se exponen al navegador. Solo la Edge Function
-- submit-quiz (con la llave de servicio) puede leerlas para
-- calificar, y el panel admin (is_admin()).
--
-- quiz_questions.answer_type SÍ es visible para el estudiante (le
-- dice a leccion.html si debe mostrar botones de opción o una
-- casilla de texto) — no revela la respuesta correcta.
--
-- Requiere haber corrido antes: quiz-schema.sql. Seguro de correr
-- varias veces.
-- ============================================================

alter table public.quiz_questions
  add column if not exists answer_type text not null default 'choice'
  check (answer_type in ('choice', 'text'));

create table if not exists public.quiz_text_answers (
  id uuid primary key default gen_random_uuid(),
  question_id uuid not null references public.quiz_questions(id) on delete cascade unique,
  accepted_answers text[] not null, -- todas en minúsculas; se compara sin mayúsculas/espacios extra
  feedback text
);

alter table public.quiz_text_answers enable row level security;

-- A propósito, sin policy de select para estudiantes — igual que
-- quiz_choices, la tabla completa queda cerrada para ellos.
drop policy if exists "Admin ve respuestas de texto" on public.quiz_text_answers;
create policy "Admin ve respuestas de texto"
  on public.quiz_text_answers for select using (is_admin());

drop policy if exists "Admin gestiona respuestas de texto" on public.quiz_text_answers;
create policy "Admin gestiona respuestas de texto"
  on public.quiz_text_answers for all using (is_admin()) with check (is_admin());
