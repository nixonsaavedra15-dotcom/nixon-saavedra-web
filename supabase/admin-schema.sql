-- ============================================================
-- Campus Saavedra — panel de administrador (Fase 3)
-- ============================================================
-- Cómo usar: en Supabase → "SQL Editor" → "New query", pega este
-- archivo completo y dale "Run". Requiere que supabase/schema.sql
-- ya se haya ejecutado antes.
--
-- Qué agrega:
--   1. Un rol (student / admin) en cada perfil.
--   2. Permisos para que el administrador vea y gestione todo
--      (estudiantes, matrículas, cursos, soporte) sin romper la
--      privacidad de cada estudiante sobre su propia información.
--   3. Una bandeja de preguntas/soporte de estudiantes.
--   4. Convierte tu cuenta en administrador (ver el paso 5 al final).
-- ============================================================

-- ------------------------------------------------------------
-- 1. Rol de cada perfil
-- ------------------------------------------------------------
alter table public.profiles
  add column if not exists role text not null default 'student';

alter table public.profiles drop constraint if exists profiles_role_check;
alter table public.profiles
  add constraint profiles_role_check check (role in ('student','admin'));

-- ------------------------------------------------------------
-- 2. Función auxiliar: ¿el usuario que hace la consulta es admin?
-- (security definer para poder leer profiles sin caer en
-- recursión de RLS al usarla dentro de políticas de profiles)
-- ------------------------------------------------------------
create or replace function public.is_admin()
returns boolean as $$
  select exists (
    select 1 from public.profiles where id = auth.uid() and role = 'admin'
  );
$$ language sql security definer stable;

-- ------------------------------------------------------------
-- 3. El administrador puede ver y gestionar todo
-- ------------------------------------------------------------
drop policy if exists "Admin ve todos los perfiles" on public.profiles;
create policy "Admin ve todos los perfiles"
  on public.profiles for select
  using (is_admin());

drop policy if exists "Admin ve todos los cursos (incluye inactivos)" on public.courses;
create policy "Admin ve todos los cursos (incluye inactivos)"
  on public.courses for select
  using (is_admin());

drop policy if exists "Admin actualiza cursos" on public.courses;
create policy "Admin actualiza cursos"
  on public.courses for update
  using (is_admin());

drop policy if exists "Admin ve todos los módulos" on public.modules;
create policy "Admin ve todos los módulos"
  on public.modules for select
  using (is_admin());

drop policy if exists "Admin ve todas las matrículas" on public.enrollments;
create policy "Admin ve todas las matrículas"
  on public.enrollments for select
  using (is_admin());

drop policy if exists "Admin crea matrículas (asignación gratuita)" on public.enrollments;
create policy "Admin crea matrículas (asignación gratuita)"
  on public.enrollments for insert
  with check (is_admin());

drop policy if exists "Admin actualiza matrículas (activar/desactivar)" on public.enrollments;
create policy "Admin actualiza matrículas (activar/desactivar)"
  on public.enrollments for update
  using (is_admin());

drop policy if exists "Admin ve todo el progreso" on public.progress;
create policy "Admin ve todo el progreso"
  on public.progress for select
  using (is_admin());

drop policy if exists "Admin ve todos los certificados" on public.certificates;
create policy "Admin ve todos los certificados"
  on public.certificates for select
  using (is_admin());

drop policy if exists "Admin ve todas las notificaciones" on public.notifications;
create policy "Admin ve todas las notificaciones"
  on public.notifications for select
  using (is_admin());

drop policy if exists "Admin crea notificaciones" on public.notifications;
create policy "Admin crea notificaciones"
  on public.notifications for insert
  with check (is_admin());

drop policy if exists "Admin ve los pedidos pendientes" on public.pending_orders;
create policy "Admin ve los pedidos pendientes"
  on public.pending_orders for select
  using (is_admin());

-- ------------------------------------------------------------
-- 4. Bandeja de soporte — preguntas de estudiantes
-- ------------------------------------------------------------
create table if not exists public.support_messages (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  subject text,
  message text not null,
  status text not null default 'open', -- open | answered | closed
  admin_reply text,
  created_at timestamptz not null default now(),
  replied_at timestamptz
);

alter table public.support_messages enable row level security;

drop policy if exists "El estudiante crea sus preguntas" on public.support_messages;
create policy "El estudiante crea sus preguntas"
  on public.support_messages for insert
  with check (auth.uid() = user_id);

drop policy if exists "El estudiante ve sus propias preguntas" on public.support_messages;
create policy "El estudiante ve sus propias preguntas"
  on public.support_messages for select
  using (auth.uid() = user_id);

drop policy if exists "Admin ve todas las preguntas" on public.support_messages;
create policy "Admin ve todas las preguntas"
  on public.support_messages for select
  using (is_admin());

drop policy if exists "Admin responde preguntas" on public.support_messages;
create policy "Admin responde preguntas"
  on public.support_messages for update
  using (is_admin());

-- ------------------------------------------------------------
-- 5. Convierte tu cuenta en administrador
-- ------------------------------------------------------------
-- IMPORTANTE: esto solo funciona si ya existe una cuenta (usuario)
-- con este correo. Si todavía no tienes una cuenta tuya en el
-- Campus, créala primero en Supabase → Authentication → Users →
-- "Add user" (con tu correo y una contraseña), y LUEGO corre este
-- archivo (o solo esta última línea) para volverte administrador.
update public.profiles set role = 'admin'
where email = 'nixonsaavedra15@gmail.com';
