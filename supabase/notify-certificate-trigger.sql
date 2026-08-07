-- ============================================================
-- Trigger para el correo de certificado (alternativa a "Database
-- Webhooks" del dashboard)
-- ============================================================
-- Por qué existe este archivo: al crear el webhook desde el dashboard
-- de Supabase (Database → Webhooks), algunos proyectos dan el error
-- "schema supabase_functions does not exist" — es un bug conocido de
-- Supabase en proyectos donde esa función interna nunca se instaló.
--
-- Este script hace lo mismo pero directo por SQL, usando la extensión
-- pg_net (que ya está activa en tu proyecto) en vez de depender de esa
-- función interna rota. Resultado idéntico: cada vez que se inserta un
-- certificado, se llama a la Edge Function notify-certificate.
--
-- CÓMO USARLO:
--   1. Reemplaza <TU_CERTIFICATE_WEBHOOK_SECRET> abajo por el valor
--      real que pusiste en el secret CERTIFICATE_WEBHOOK_SECRET.
--   2. Ve a Supabase → SQL Editor → New query, pega esto completo, Run.
-- ============================================================

create or replace function public.notify_certificate_webhook()
returns trigger
language plpgsql
security definer
as $$
begin
  perform net.http_post(
    url := 'https://wyyayvipqvvjoiwlxjgl.supabase.co/functions/v1/notify-certificate',
    headers := jsonb_build_object(
      'Content-Type', 'application/json',
      'x-webhook-secret', '<TU_CERTIFICATE_WEBHOOK_SECRET>'
    ),
    body := jsonb_build_object('record', to_jsonb(NEW))
  );
  return NEW;
end;
$$;

drop trigger if exists on_certificate_created_notify on public.certificates;
create trigger on_certificate_created_notify
  after insert on public.certificates
  for each row execute function public.notify_certificate_webhook();
