-- ============================================================
-- Curso "Inglés Personalizado — de cero a B2"
-- ============================================================
-- Este es el único de los dos programas nuevos que necesita fila en
-- `courses`: es el que sí tiene botón de pago (iniciarCompra), así que
-- necesita existir en la tabla para que el webhook de ePayco pueda
-- matricular al comprador después del pago.
--
-- El segundo programa ("Inglés para Profesionales") NO necesita esto:
-- su botón es un enlace directo a WhatsApp, no pasa por el Campus.
-- ============================================================

insert into public.courses (slug, title, description, price, category)
values (
  'ingles-personalizado-0-b2',
  'Inglés Personalizado — de cero a B2',
  'Programa privado de inglés, presencial o virtual, de cero a nivel B2 en seis meses. Clases 100% personalizadas a partir de un diagnóstico inicial, con cupo para hasta 3 personas por el mismo valor.',
  5400000,
  'ingles'
)
on conflict (slug) do nothing;
