-- ============================================================
-- Campus Saavedra — audio de Listening (práctica + evaluativo)
-- ============================================================
-- Cómo usar: SQL Editor → New query → pega esto completo → Run.
-- Requiere que schema.sql, admin-schema.sql, quiz-schema.sql y
-- lesson-flow-schema.sql ya se hayan corrido antes. Seguro de
-- correr varias veces.
--
-- Qué agrega:
--   1. quiz_questions.audio_url — el audio evaluativo de una
--      pregunta de Listening (si no es null, leccion.html muestra
--      un reproductor con límite de 2 reproducciones en vez del
--      texto del diálogo).
--   2. quiz_question_audio_plays — cuántas veces reprodujo CADA
--      estudiante el audio de CADA pregunta. Solo la Edge Function
--      register-audio-play (con la llave de servicio) puede
--      escribir aquí — así el límite de 2 reproducciones no se
--      puede saltar borrando el localStorage del navegador.
--   3. Los audios de PRÁCTICA (con guion visible) van dentro de
--      lesson_json.reading1.audio_url / reading2.audio_url — no
--      necesitan tabla nueva, ya que lesson_json es JSON libre.
-- ============================================================

-- ------------------------------------------------------------
-- 1. quiz_questions.audio_url
-- ------------------------------------------------------------
alter table public.quiz_questions add column if not exists audio_url text;

comment on column public.quiz_questions.audio_url is
  'Si no es null, esta pregunta es de Listening evaluativo: se muestra un reproductor con máximo 2 reproducciones en vez del texto del diálogo.';

-- ------------------------------------------------------------
-- 2. quiz_question_audio_plays — conteo de reproducciones
-- ------------------------------------------------------------
create table if not exists public.quiz_question_audio_plays (
  id uuid primary key default gen_random_uuid(),
  enrollment_id uuid not null references public.enrollments(id) on delete cascade,
  question_id uuid not null references public.quiz_questions(id) on delete cascade,
  plays_used integer not null default 0,
  updated_at timestamptz not null default now(),
  unique (enrollment_id, question_id)
);

alter table public.quiz_question_audio_plays enable row level security;

drop policy if exists "Estudiante ve sus propias reproducciones" on public.quiz_question_audio_plays;
create policy "Estudiante ve sus propias reproducciones"
  on public.quiz_question_audio_plays for select
  using (
    exists (
      select 1 from public.enrollments e
      where e.id = quiz_question_audio_plays.enrollment_id and e.user_id = auth.uid()
    )
  );

drop policy if exists "Admin ve todas las reproducciones" on public.quiz_question_audio_plays;
create policy "Admin ve todas las reproducciones" on public.quiz_question_audio_plays for select using (is_admin());
drop policy if exists "Admin gestiona reproducciones" on public.quiz_question_audio_plays;
create policy "Admin gestiona reproducciones" on public.quiz_question_audio_plays for all using (is_admin()) with check (is_admin());

-- (a propósito, no hay policy de insert/update para estudiantes: solo
-- la Edge Function register-audio-play, con la llave de servicio,
-- puede escribir aquí — así nadie se da 2 reproducciones extra
-- llamando la tabla directamente desde el navegador)
