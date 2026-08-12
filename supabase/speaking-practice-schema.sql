-- ============================================================
-- Campus Saavedra — práctica de Speaking (grabadora + transcripción
-- del navegador, calificación por reglas, $0 de costo)
-- ============================================================
-- Cómo usar: SQL Editor → New query → pega esto completo → Run.
-- Requiere schema.sql, admin-schema.sql, quiz-schema.sql y
-- lesson-flow-schema.sql ya corridos. Seguro de correr varias veces.
--
-- Cómo funciona (decisión: 100% gratis, sin IA):
--   El navegador transcribe en vivo lo que dice el estudiante
--   (Web Speech API — nativa de Chrome/Edge, sin costo, sin llave de
--   API). No se graba ni se sube audio a ningún lado — solo se mide,
--   sobre el texto transcrito: cantidad de palabras, duración
--   hablada, y cuántas palabras clave esperadas mencionó. Con eso se
--   calcula una nota 0-100 igual que un quiz, pero la calificación
--   real (server-side) la hace la Edge Function
--   submit-speaking-attempt, nunca el navegador — así nadie se
--   pone 100 editando el JavaScript.
--
--   Es una práctica FORMATIVA: no bloquea el avance de la lección
--   (a propósito — el propio contenido del curso dice "no hay
--   respuesta incorrecta en la Parte 1"). El estudiante ve su nota
--   y retroalimentación inmediata, y puede intentarlo las veces que
--   quiera; el admin puede ver el historial de intentos si lo
--   necesita.
-- ============================================================

create table if not exists public.speaking_attempts (
  id uuid primary key default gen_random_uuid(),
  enrollment_id uuid not null references public.enrollments(id) on delete cascade,
  module_id uuid not null references public.modules(id) on delete cascade,
  task_id text not null,
  transcript text not null default '',
  words integer not null default 0,
  duration_seconds numeric not null default 0,
  matched_keywords text[] not null default '{}',
  total_keywords integer not null default 0,
  score numeric not null default 0,
  passed boolean not null default false,
  created_at timestamptz not null default now()
);

alter table public.speaking_attempts enable row level security;

drop policy if exists "Estudiante ve sus propios intentos de speaking" on public.speaking_attempts;
create policy "Estudiante ve sus propios intentos de speaking"
  on public.speaking_attempts for select
  using (
    exists (
      select 1 from public.enrollments e
      where e.id = speaking_attempts.enrollment_id and e.user_id = auth.uid()
    )
  );

drop policy if exists "Admin ve todos los intentos de speaking" on public.speaking_attempts;
create policy "Admin ve todos los intentos de speaking" on public.speaking_attempts for select using (is_admin());

-- (a propósito, sin policy de insert para estudiantes: solo la Edge
-- Function submit-speaking-attempt, con la llave de servicio, guarda
-- intentos — así la nota siempre se calcula en el servidor)
