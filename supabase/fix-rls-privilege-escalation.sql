-- ============================================================
-- Corrección de seguridad — escalación de privilegios vía RLS
-- ============================================================
-- Por qué: dos políticas de RLS (creadas en schema.sql) solo revisan
-- QUÉ FILA puede tocar un estudiante (using auth.uid() = ...), pero no
-- QUÉ COLUMNAS puede cambiar. Como la URL y la "anon key" de Supabase
-- son públicas a propósito (están en assets/supabase-config.js, y así
-- debe ser), cualquier persona puede abrir la consola del navegador en
-- el sitio, crear su propio cliente de Supabase con esas mismas llaves
-- públicas, iniciar sesión como estudiante normal, y llamar:
--
--   1. supabase.from('profiles').update({ role: 'admin' }).eq('id', suPropioId)
--      → se autoasigna el rol de administrador y ya puede entrar a
--        admin.html y a todas las funciones que verifican ese rol.
--
--   2. supabase.from('progress').update({ completed: true, grade: 100 })
--         .eq('enrollment_id', suPropiaMatricula)
--      → marca cualquier módulo como aprobado con 100/100 sin resolver
--        ningún cuestionario, lo que además dispara automáticamente la
--        emisión de un certificado real (por el trigger
--        handle_course_completed).
--
-- Ninguna de las dos cosas requiere ningún permiso especial: solo una
-- cuenta de estudiante normal y la consola del navegador.
--
-- El código del sitio nunca llama a estos dos "update" directamente
-- (la calificación real vive en las Edge Functions submit-quiz /
-- submit-closing-form / update-lesson-step, que usan la service_role
-- key y no dependen de estas políticas) — así que quitar/asegurar
-- estas políticas no rompe nada de lo que ya funciona.
--
-- Cómo usar: pega este archivo completo en Supabase → SQL Editor →
-- Run. Requiere que schema.sql y admin-schema.sql ya se hayan
-- ejecutado antes (usa la función public.is_admin()).
-- ============================================================

-- ------------------------------------------------------------
-- 1. profiles: el estudiante puede seguir editando su propio nombre,
-- pero NUNCA su propio rol (ni ningún admin puede ser degradado por
-- accidente vía esta misma vía) — un trigger revierte cualquier
-- intento de cambiar "role" que no venga de un administrador real.
-- ------------------------------------------------------------
create or replace function public.prevent_self_role_escalation()
returns trigger as $$
begin
  if new.role is distinct from old.role and not public.is_admin() then
    new.role := old.role;
  end if;
  return new;
end;
$$ language plpgsql security definer;

drop trigger if exists prevent_role_escalation on public.profiles;
create trigger prevent_role_escalation
  before update on public.profiles
  for each row execute procedure public.prevent_self_role_escalation();

-- ------------------------------------------------------------
-- 2. progress: esta política nunca la usa el sitio (la calificación es
-- 100% del servidor) — se elimina por completo. Los estudiantes van a
-- seguir viendo su progreso (policy de SELECT, que sigue intacta);
-- solo dejan de poder "escribir" sobre él directamente.
-- ------------------------------------------------------------
drop policy if exists "El estudiante marca sus propias actividades como completadas" on public.progress;

-- ------------------------------------------------------------
-- 3. Verificación rápida (opcional) — confirma que las políticas
-- quedaron como se espera. Puedes correr esto después para revisar:
--
--   select policyname, cmd, qual, with_check
--   from pg_policies
--   where schemaname = 'public' and tablename in ('profiles','progress');
-- ------------------------------------------------------------
