-- ============================================================
-- Renombrar el curso "Inglés A2" a "Cambridge A2 Key (KET)"
-- ============================================================
-- Solo cambia el TÍTULO visible — el slug 'ingles-a2' se queda
-- igual a propósito, para no romper matrículas, progreso, ni los
-- botones de compra ya conectados (iniciarCompra('ingles-a2', ...)
-- en tienda.html sigue funcionando sin tocarlo).
--
-- Esto actualiza automáticamente el nombre en dashboard.html,
-- leccion.html, admin.html y admin-preview.html (lo leen desde la
-- base de datos). campus.html y tienda.html son páginas estáticas
-- y ya se actualizaron directamente en el HTML.
-- ============================================================

update public.courses
set title = 'Cambridge A2 Key (KET)'
where slug = 'ingles-a2';
