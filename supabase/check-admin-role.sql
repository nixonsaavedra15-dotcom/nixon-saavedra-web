-- Revisa el rol de tu cuenta (y de todas las demás) en profiles.
-- Corre esto primero para confirmar cuál es tu correo y qué rol tiene.
select id, email, role from public.profiles order by created_at;
