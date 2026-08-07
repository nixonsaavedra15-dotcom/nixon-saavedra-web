-- ============================================================
-- Campus Saavedra — cuestionarios, desbloqueo y retroalimentación
-- ============================================================
-- Cómo usar: SQL Editor → New query → pega esto completo → Run.
-- Requiere que supabase/schema.sql y supabase/admin-schema.sql ya
-- se hayan ejecutado antes.
--
-- Qué agrega:
--   1. progress.unlocked — el módulo 1 se desbloquea solo al
--      matricularse; los demás se desbloquean al aprobar el
--      anterior con la nota mínima (75/100 por defecto).
--   2. quizzes / quiz_questions / quiz_choices — el cuestionario
--      de cada módulo. Las respuestas correctas y la retroalimentación
--      NUNCA se exponen directamente al navegador del estudiante
--      (por eso existe la vista quiz_choices_public) — solo la
--      Edge Function submit-quiz, que corre en el servidor, puede
--      calificar y revelar la retroalimentación.
--   3. quiz_attempts — historial de intentos por estudiante.
--   4. Se retira el permiso que dejaba a cualquier estudiante
--      marcar sus propias actividades como "completadas" a mano
--      (ahora eso solo lo hace la Edge Function, al calificar).
-- ============================================================

-- ------------------------------------------------------------
-- 1. progress.unlocked
-- ------------------------------------------------------------
alter table public.progress add column if not exists unlocked boolean not null default false;

-- El módulo con el order_index más bajo de cada matrícula nueva
-- se desbloquea automáticamente; los demás quedan bloqueados
-- hasta que se apruebe el anterior.
create or replace function public.handle_new_enrollment()
returns trigger as $$
begin
  insert into public.progress (enrollment_id, module_id, unlocked)
  select
    new.id,
    m.id,
    (m.order_index = (select min(order_index) from public.modules where course_id = new.course_id))
  from public.modules m
  where m.course_id = new.course_id;
  return new;
end;
$$ language plpgsql security definer;

-- Ya existían matrículas antes de este cambio: desbloqueamos su primer
-- módulo para que no queden todos bloqueados.
update public.progress p
set unlocked = true
from public.modules m
where p.module_id = m.id
  and m.order_index = (select min(order_index) from public.modules where course_id = m.course_id)
  and p.unlocked = false;

-- IMPORTANTE: ya no dejamos que el estudiante marque su propio progreso
-- como completado directamente — ahora eso solo lo hace la Edge Function
-- submit-quiz (con la llave de servicio), al calificar el cuestionario.
drop policy if exists "El estudiante marca sus propias actividades como completadas" on public.progress;

drop policy if exists "Admin actualiza el progreso" on public.progress;
create policy "Admin actualiza el progreso"
  on public.progress for update
  using (is_admin());

-- ------------------------------------------------------------
-- 2. quizzes — un cuestionario por módulo
-- ------------------------------------------------------------
create table if not exists public.quizzes (
  id uuid primary key default gen_random_uuid(),
  module_id uuid not null references public.modules(id) on delete cascade unique,
  title text not null default 'Cuestionario',
  passing_score integer not null default 75,
  is_final boolean not null default false,
  max_attempts integer,              -- null = intentos ilimitados
  cooldown_hours integer not null default 0, -- espera antes del último intento permitido
  created_at timestamptz not null default now()
);

alter table public.quizzes enable row level security;

drop policy if exists "Estudiante ve el quiz de módulos desbloqueados" on public.quizzes;
create policy "Estudiante ve el quiz de módulos desbloqueados"
  on public.quizzes for select
  using (
    exists (
      select 1 from public.modules m
      join public.progress p on p.module_id = m.id
      join public.enrollments e on e.id = p.enrollment_id
      where m.id = quizzes.module_id and e.user_id = auth.uid() and p.unlocked = true
    )
  );

drop policy if exists "Admin ve todos los quizzes" on public.quizzes;
create policy "Admin ve todos los quizzes" on public.quizzes for select using (is_admin());
drop policy if exists "Admin gestiona quizzes" on public.quizzes;
create policy "Admin gestiona quizzes" on public.quizzes for all using (is_admin()) with check (is_admin());

-- ------------------------------------------------------------
-- 3. quiz_questions — preguntas de cada cuestionario
-- ------------------------------------------------------------
create table if not exists public.quiz_questions (
  id uuid primary key default gen_random_uuid(),
  quiz_id uuid not null references public.quizzes(id) on delete cascade,
  order_index integer not null default 0,
  prompt text not null,
  icon text, -- tema de la ilustración: reading | grammar | listening | speaking | writing | exam | intro | general
  created_at timestamptz not null default now(),
  unique (quiz_id, order_index)
);

alter table public.quiz_questions enable row level security;

drop policy if exists "Estudiante ve preguntas de módulos desbloqueados" on public.quiz_questions;
create policy "Estudiante ve preguntas de módulos desbloqueados"
  on public.quiz_questions for select
  using (
    exists (
      select 1 from public.quizzes qz
      join public.modules m on m.id = qz.module_id
      join public.progress p on p.module_id = m.id
      join public.enrollments e on e.id = p.enrollment_id
      where qz.id = quiz_questions.quiz_id and e.user_id = auth.uid() and p.unlocked = true
    )
  );

drop policy if exists "Admin ve todas las preguntas" on public.quiz_questions;
create policy "Admin ve todas las preguntas" on public.quiz_questions for select using (is_admin());
drop policy if exists "Admin gestiona preguntas" on public.quiz_questions;
create policy "Admin gestiona preguntas" on public.quiz_questions for all using (is_admin()) with check (is_admin());

-- ------------------------------------------------------------
-- 4. quiz_choices — opciones de cada pregunta (con la respuesta
-- correcta y la retroalimentación). La tabla completa NUNCA se
-- expone al navegador del estudiante — solo a través de la vista
-- pública de abajo (sin is_correct ni feedback) o de la Edge
-- Function submit-quiz (que sí puede leerla, con la llave de
-- servicio, para calificar).
-- ------------------------------------------------------------
create table if not exists public.quiz_choices (
  id uuid primary key default gen_random_uuid(),
  question_id uuid not null references public.quiz_questions(id) on delete cascade,
  order_index integer not null default 0,
  choice_text text not null,
  is_correct boolean not null default false,
  feedback text, -- por qué esta opción es correcta o incorrecta
  unique (question_id, order_index)
);

alter table public.quiz_choices enable row level security;
-- A propósito, sin policy de select para estudiantes: la tabla completa
-- queda cerrada. Solo admin (panel) y la Edge Function (service role).

drop policy if exists "Admin ve todas las opciones" on public.quiz_choices;
create policy "Admin ve todas las opciones" on public.quiz_choices for select using (is_admin());
drop policy if exists "Admin gestiona opciones" on public.quiz_choices;
create policy "Admin gestiona opciones" on public.quiz_choices for all using (is_admin()) with check (is_admin());

-- Vista seguras para que el estudiante pueda RENDERIZAR el cuestionario
-- (ve el texto de las opciones, pero no cuál es la correcta ni la
-- retroalimentación). Como la vista la crea el dueño de las tablas,
-- puede leer quiz_choices aunque su RLS no tenga policy para
-- estudiantes — el filtro de seguridad real está en el "where" de
-- abajo (auth.uid() + módulo desbloqueado).
create or replace view public.quiz_choices_public as
select qc.id, qc.question_id, qc.order_index, qc.choice_text
from public.quiz_choices qc
join public.quiz_questions qq on qq.id = qc.question_id
join public.quizzes qz on qz.id = qq.quiz_id
join public.modules m on m.id = qz.module_id
join public.progress p on p.module_id = m.id
join public.enrollments e on e.id = p.enrollment_id
where e.user_id = auth.uid() and p.unlocked = true;

grant select on public.quiz_choices_public to authenticated;

-- ------------------------------------------------------------
-- 5. quiz_attempts — historial de intentos (solo lo escribe la
-- Edge Function submit-quiz, nunca el navegador directamente)
-- ------------------------------------------------------------
create table if not exists public.quiz_attempts (
  id uuid primary key default gen_random_uuid(),
  enrollment_id uuid not null references public.enrollments(id) on delete cascade,
  quiz_id uuid not null references public.quizzes(id) on delete cascade,
  attempt_number integer not null,
  score numeric not null,
  passed boolean not null,
  answers jsonb not null,
  created_at timestamptz not null default now()
);

alter table public.quiz_attempts enable row level security;

drop policy if exists "Estudiante ve sus propios intentos" on public.quiz_attempts;
create policy "Estudiante ve sus propios intentos"
  on public.quiz_attempts for select
  using (
    exists (
      select 1 from public.enrollments e
      where e.id = quiz_attempts.enrollment_id and e.user_id = auth.uid()
    )
  );

drop policy if exists "Admin ve todos los intentos" on public.quiz_attempts;
create policy "Admin ve todos los intentos" on public.quiz_attempts for select using (is_admin());

-- (a propósito, no hay policy de insert: solo la Edge Function,
-- con la llave de servicio, puede registrar intentos)
