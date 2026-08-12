-- ============================================================
-- Campus Saavedra — esquema de base de datos (Supabase / Postgres)
-- ============================================================
-- Cómo usar: en tu proyecto de Supabase, ve a "SQL Editor" → "New query",
-- pega todo este archivo y dale "Run". Crea las tablas, las relaciones
-- y las reglas de seguridad (RLS) para que cada estudiante solo pueda
-- ver y modificar su propia información.
-- ============================================================

-- Extensión para generar IDs únicos (uuid)
create extension if not exists "pgcrypto";

-- ------------------------------------------------------------
-- 1. profiles — datos públicos del estudiante (uno por usuario)
-- ------------------------------------------------------------
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  email text,
  created_at timestamptz not null default now()
);

alter table public.profiles enable row level security;

create policy "El estudiante ve su propio perfil"
  on public.profiles for select
  using (auth.uid() = id);

create policy "El estudiante actualiza su propio perfil"
  on public.profiles for update
  using (auth.uid() = id);

-- Crea automáticamente un perfil cuando se registra un usuario nuevo
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, full_name, email)
  values (new.id, new.raw_user_meta_data ->> 'full_name', new.email);
  return new;
end;
$$ language plpgsql security definer;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- ------------------------------------------------------------
-- 2. courses — catálogo de cursos (Campus Saavedra)
-- ------------------------------------------------------------
create table if not exists public.courses (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,          -- ej: 'pre-icfes', 'cambridge-ready'
  title text not null,
  description text,
  price integer not null default 0,   -- en pesos colombianos, sin decimales
  category text,                      -- 'ingles' | 'ia' | 'educacion'
  active boolean not null default true,
  created_at timestamptz not null default now()
);

alter table public.courses enable row level security;

create policy "Cualquiera puede ver los cursos activos"
  on public.courses for select
  using (active = true);

-- ------------------------------------------------------------
-- 3. modules — módulos/etapas de cada curso
-- ------------------------------------------------------------
create table if not exists public.modules (
  id uuid primary key default gen_random_uuid(),
  course_id uuid not null references public.courses(id) on delete cascade,
  title text not null,
  order_index integer not null default 0,
  content_url text,                   -- video, PDF, o link del material
  description text,
  created_at timestamptz not null default now()
);

alter table public.modules enable row level security;

create policy "Cualquiera puede ver los módulos de cursos activos"
  on public.modules for select
  using (
    exists (
      select 1 from public.courses c
      where c.id = modules.course_id and c.active = true
    )
  );

-- ------------------------------------------------------------
-- 4. enrollments — matrículas (quién compró qué curso)
-- Solo se crean desde el servidor (Edge Function), nunca desde el navegador.
-- ------------------------------------------------------------
create table if not exists public.enrollments (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  course_id uuid not null references public.courses(id) on delete cascade,
  payment_ref text,                   -- referencia de pago de ePayco
  status text not null default 'active', -- active | completed | cancelled
  purchased_at timestamptz not null default now(),
  unique (user_id, course_id)
);

alter table public.enrollments enable row level security;

create policy "El estudiante ve sus propias matrículas"
  on public.enrollments for select
  using (auth.uid() = user_id);

-- (a propósito, no hay policy de insert/update para usuarios normales:
--  solo la Edge Function, que usa la "service role key", puede crear matrículas)

-- ------------------------------------------------------------
-- 5. progress — avance del estudiante por módulo
-- ------------------------------------------------------------
create table if not exists public.progress (
  id uuid primary key default gen_random_uuid(),
  enrollment_id uuid not null references public.enrollments(id) on delete cascade,
  module_id uuid not null references public.modules(id) on delete cascade,
  completed boolean not null default false,
  completed_at timestamptz,
  grade numeric,                      -- calificación opcional (0-100)
  unique (enrollment_id, module_id)
);

alter table public.progress enable row level security;

create policy "El estudiante ve su propio progreso"
  on public.progress for select
  using (
    exists (
      select 1 from public.enrollments e
      where e.id = progress.enrollment_id and e.user_id = auth.uid()
    )
  );

create policy "El estudiante marca sus propias actividades como completadas"
  on public.progress for update
  using (
    exists (
      select 1 from public.enrollments e
      where e.id = progress.enrollment_id and e.user_id = auth.uid()
    )
  );

-- Cuando se crea una matrícula, se generan automáticamente las filas de
-- progreso (una por cada módulo del curso), todas marcadas como pendientes.
-- Así el estudiante nunca necesita permiso para "insertar" progreso desde
-- el navegador — solo puede actualizar (marcar como completado) lo que ya existe.
create or replace function public.handle_new_enrollment()
returns trigger as $$
begin
  insert into public.progress (enrollment_id, module_id)
  select new.id, m.id
  from public.modules m
  where m.course_id = new.course_id;
  return new;
end;
$$ language plpgsql security definer;

drop trigger if exists on_enrollment_created on public.enrollments;
create trigger on_enrollment_created
  after insert on public.enrollments
  for each row execute procedure public.handle_new_enrollment();

-- ------------------------------------------------------------
-- 6. certificates — certificados emitidos
-- ------------------------------------------------------------
create table if not exists public.certificates (
  id uuid primary key default gen_random_uuid(),
  enrollment_id uuid not null references public.enrollments(id) on delete cascade unique,
  issued_at timestamptz not null default now(),
  certificate_url text
);

alter table public.certificates enable row level security;

create policy "El estudiante ve sus propios certificados"
  on public.certificates for select
  using (
    exists (
      select 1 from public.enrollments e
      where e.id = certificates.enrollment_id and e.user_id = auth.uid()
    )
  );

-- Cuando el estudiante marca el último módulo de un curso como completado,
-- se emite el certificado automáticamente (una sola vez por matrícula).
create or replace function public.handle_course_completed()
returns trigger as $$
declare
  total_modules integer;
  completed_modules integer;
begin
  if new.completed = true then
    select count(*) into total_modules from public.progress where enrollment_id = new.enrollment_id;
    select count(*) into completed_modules from public.progress where enrollment_id = new.enrollment_id and completed = true;

    if total_modules > 0 and total_modules = completed_modules then
      insert into public.certificates (enrollment_id)
      values (new.enrollment_id)
      on conflict (enrollment_id) do nothing;

      update public.enrollments set status = 'completed' where id = new.enrollment_id;
    end if;
  end if;
  return new;
end;
$$ language plpgsql security definer;

drop trigger if exists on_progress_updated on public.progress;
create trigger on_progress_updated
  after update on public.progress
  for each row execute procedure public.handle_course_completed();

-- ------------------------------------------------------------
-- 7. notifications — avisos para el estudiante (pagos, actividades, etc.)
-- ------------------------------------------------------------
create table if not exists public.notifications (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  message text not null,
  read boolean not null default false,
  created_at timestamptz not null default now()
);

alter table public.notifications enable row level security;

create policy "El estudiante ve sus propias notificaciones"
  on public.notifications for select
  using (auth.uid() = user_id);

create policy "El estudiante marca sus notificaciones como leídas"
  on public.notifications for update
  using (auth.uid() = user_id);

-- ------------------------------------------------------------
-- 8. pending_orders — pedidos iniciados en la tienda, antes de que
-- ePayco confirme el pago. La Edge Function los usa para saber qué
-- curso/correo corresponde a cada pago aprobado.
-- ------------------------------------------------------------
create table if not exists public.pending_orders (
  id uuid primary key default gen_random_uuid(),
  order_ref text unique not null,     -- x_id_invoice que le mandamos a ePayco
  email text not null,
  full_name text,
  course_slug text not null,
  status text not null default 'pending', -- pending | confirmed | failed
  created_at timestamptz not null default now()
);

alter table public.pending_orders enable row level security;

-- El sitio (sin login todavía) necesita poder crear el pedido antes de pagar,
-- pero nunca leer los pedidos de otras personas.
create policy "Cualquiera puede crear un pedido pendiente"
  on public.pending_orders for insert
  with check (true);

-- ------------------------------------------------------------
-- Datos iniciales de ejemplo (puedes editar precios/textos luego)
-- ------------------------------------------------------------
insert into public.courses (slug, title, description, price, category)
values
  ('pre-icfes', 'Pre-ICFES', 'Preparación para el examen ICFES.', 420000, 'educacion'),
  ('cambridge-ready', 'Cambridge Ready', 'Preparación intensiva para exámenes internacionales de Cambridge.', 0, 'ingles'),
  ('ia-educadores', 'IA para Educadores', 'Herramientas de inteligencia artificial aplicadas al aula.', 420000, 'ia')
on conflict (slug) do nothing;
