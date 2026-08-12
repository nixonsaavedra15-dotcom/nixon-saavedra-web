-- Permite que el admin elimine matrículas por completo (para limpiar
-- matrículas de prueba). Antes solo podía activar/desactivar, no borrar.
-- El borrado en cascada ya se limpia solo: progress, quiz_attempts,
-- closing_reflections y certificates tienen "on delete cascade" hacia
-- enrollments, así que al borrar la matrícula se borra todo lo asociado.

drop policy if exists "Admin elimina matrículas" on public.enrollments;
create policy "Admin elimina matrículas"
  on public.enrollments for delete
  using (is_admin());
