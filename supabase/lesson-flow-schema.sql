-- ============================================================
-- Campus Saavedra — esquema para lecciones multi-paso
-- ============================================================
-- Cómo usar: SQL Editor → New query → pega esto completo → Run.
-- Requiere que schema.sql, admin-schema.sql y quiz-schema.sql ya
-- se hayan ejecutado antes.
--
-- Qué agrega (100% retrocompatible: los módulos que NO tengan
-- lesson_json siguen funcionando exactamente igual que hoy, con
-- su única lectura + un solo cuestionario):
--
--   1. modules.lesson_json — el contenido completo de la lección
--      nueva (bienvenida, lectura 1, lectura 2, interactivo,
--      práctica) en un solo campo JSON. Si es null, leccion.html
--      usa el "description" de siempre (formato viejo).
--
--   2. quizzes.stage — permite que un módulo tenga DOS cuestionarios
--      en vez de uno: 'main' (el de siempre, formato viejo),
--      'readings' (evalúa las 2 lecturas) e 'interactive' (evalúa
--      la lección interactiva). unique(module_id) se reemplaza por
--      unique(module_id, stage).
--
--   3. progress.current_step — en qué parte de la lección va el
--      estudiante (welcome, reading1, reading2, quiz_readings,
--      interactive, quiz_interactive, practice, closing, done).
--      Así si cierra el navegador, retoma donde se quedó.
--
--   4. progress.closing_submitted — si ya llenó el formulario de
--      cierre de la lección.
--
--   5. closing_reflections — las respuestas del formulario de
--      cierre de cada lección (lo que el estudiante escribió para
--      "sellar" lo aprendido).
-- ============================================================

-- ------------------------------------------------------------
-- 1. modules.lesson_json
-- ------------------------------------------------------------
alter table public.modules add column if not exists lesson_json jsonb;

comment on column public.modules.lesson_json is
  'Contenido de lección multi-paso (bienvenida, 2 lecturas, interactivo, práctica). Si es null, se usa el campo description (formato antiguo, una sola página).';

-- ------------------------------------------------------------
-- 2. quizzes.stage — dos cuestionarios por módulo
-- ------------------------------------------------------------
alter table public.quizzes add column if not exists stage text not null default 'main';

alter table public.quizzes drop constraint if exists quizzes_module_id_key;
drop index if exists quizzes_module_id_key;

alter table public.quizzes add constraint quizzes_module_id_stage_key unique (module_id, stage);

comment on column public.quizzes.stage is
  '''main'' = cuestionario único (formato antiguo). ''readings'' = evalúa las 2 lecturas. ''interactive'' = evalúa la lección interactiva.';

-- ------------------------------------------------------------
-- 3 y 4. progress.current_step / progress.closing_submitted
-- ------------------------------------------------------------
alter table public.progress add column if not exists current_step text not null default 'welcome';
alter table public.progress add column if not exists closing_submitted boolean not null default false;

comment on column public.progress.current_step is
  'welcome | reading1 | reading2 | quiz_readings | interactive | quiz_interactive | practice | closing | done';

-- ------------------------------------------------------------
-- 5. closing_reflections — formulario de cierre de cada lección
-- ------------------------------------------------------------
create table if not exists public.closing_reflections (
  id uuid primary key default gen_random_uuid(),
  enrollment_id uuid not null references public.enrollments(id) on delete cascade,
  module_id uuid not null references public.modules(id) on delete cascade,
  answers jsonb not null,
  created_at timestamptz not null default now(),
  unique (enrollment_id, module_id)
);

alter table public.closing_reflections enable row level security;

drop policy if exists "Estudiante ve sus propias reflexiones" on public.closing_reflections;
create policy "Estudiante ve sus propias reflexiones"
  on public.closing_reflections for select
  using (
    exists (
      select 1 from public.enrollments e
      where e.id = closing_reflections.enrollment_id and e.user_id = auth.uid()
    )
  );

drop policy if exists "Admin ve todas las reflexiones" on public.closing_reflections;
create policy "Admin ve todas las reflexiones" on public.closing_reflections for select using (is_admin());

-- (a propósito, no hay policy de insert para estudiantes: solo la Edge
-- Function submit-closing-form, con la llave de servicio, puede guardar)
