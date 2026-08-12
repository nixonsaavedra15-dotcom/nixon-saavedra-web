-- ============================================================
-- Ajuste de tono + contenido completo de "Introducción" (Pre-ICFES)
-- ============================================================
-- Dos cosas, a partir de tu feedback:
--
-- 1) La guía rápida de bienvenida (welcome.guide_html) de los
--    módulos 1 a 7 sonaba a lista técnica ("vas a tener un quiz
--    corto"). La reemplazo por un párrafo corto en tono de tutor,
--    explicando el POR QUÉ de cada parte, no solo el qué. La lista
--    de pasos numerada (1-5) ahora vive en leccion.html con el mismo
--    tono — ya no hace falta que este texto la repita.
--
-- 2) El módulo "Introducción" seguía mostrando el texto corto
--    original (con "55 preguntas") porque el archivo
--    pre-icfes-lesson-content.sql nunca se corrió. Este script deja
--    el contenido completo y correcto (45 preguntas) directamente,
--    con todo lo que su cuestionario pregunta, en el mismo tono de
--    tutor.
--
-- CÓMO USARLO: SQL Editor → New query → pega esto completo → Run.
-- Requiere que lesson-flow-schema.sql, module1-prototype.sql y
-- modules2-7-content.sql ya se hayan corrido antes (para que exista
-- lesson_json en los módulos 1-7). Seguro de correr varias veces.
-- ============================================================

-- ---- Módulo 1 ----
update public.modules
set lesson_json = jsonb_set(lesson_json, '{welcome,guide_html}',
  to_jsonb($HTML$<p>Antes de entrar en materia: no vas a memorizar avisos de memoria, vas a aprender a leerlos como ya lees los que ves todos los días en español, casi sin darte cuenta. Tómate tu tiempo con las dos lecturas — no hay examen sorpresa, todo lo que te pregunte el quiz ya lo vamos a haber visto juntos ahí.</p>$HTML$::text))
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 1 — Avisos y vocabulario' and lesson_json is not null;

-- ---- Módulo 2 ----
update public.modules
set lesson_json = jsonb_set(lesson_json, '{welcome,guide_html}',
  to_jsonb($HTML$<p>El vocabulario que vas a ver aquí no es una lista para memorizar de un tirón — es el tipo de palabras que ya usas todos los días, solo que en otro idioma. Ve con calma por las dos lecturas; todo lo que te pregunte el quiz después ya lo habrás visto ahí, agrupado por temas para que se te quede más fácil.</p>$HTML$::text))
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 2 — Relación de enunciados' and lesson_json is not null;

-- ---- Módulo 3 ----
update public.modules
set lesson_json = jsonb_set(lesson_json, '{welcome,guide_html}',
  to_jsonb($HTML$<p>Los modales en inglés (could, may, must...) parecen complicados al principio, pero cada uno tiene una intención muy clara detrás: cortesía, permiso, obligación, consejo. En las dos lecturas te las voy a explicar una por una, con diálogos reales, para que al llegar al quiz ya las reconozcas de forma natural — no de memoria forzada.</p>$HTML$::text))
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 3 — Diálogos y conversación' and lesson_json is not null;

-- ---- Módulo 4 ----
update public.modules
set lesson_json = jsonb_set(lesson_json, '{welcome,guide_html}',
  to_jsonb($HTML$<p>Esta es la parte con más preguntas del examen, y también la más noble: se basa en reglas fijas, no en intuición. En las dos lecturas te explico cada regla con ejemplos concretos — domínalas bien aquí y esta parte del examen se te va a volver casi automática.</p>$HTML$::text))
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 4 — Use of Language' and lesson_json is not null;

-- ---- Módulo 5 ----
update public.modules
set lesson_json = jsonb_set(lesson_json, '{welcome,guide_html}',
  to_jsonb($HTML$<p>Aquí no hay trampa escondida ni doble sentido: la respuesta siempre está escrita en el texto, tal cual. Te voy a enseñar a encontrarla rápido, con dos textos de práctica, para que el quiz no te tome por sorpresa — solo hay que saber buscar bien.</p>$HTML$::text))
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 5 — Lectura literal' and lesson_json is not null;

-- ---- Módulo 6 ----
update public.modules
set lesson_json = jsonb_set(lesson_json, '{welcome,guide_html}',
  to_jsonb($HTML$<p>Esta parte pide un paso más que la anterior: no basta con encontrar la respuesta, hay que deducirla a partir de las pistas que el texto sí te da. Con dos textos de práctica y los conectores clave (however, because, therefore), vas a aprender a inferir con seguridad, sin adivinar.</p>$HTML$::text))
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 6 — Lectura inferencial' and lesson_json is not null;

-- ---- Módulo 7 ----
update public.modules
set lesson_json = jsonb_set(lesson_json, '{welcome,guide_html}',
  to_jsonb($HTML$<p>Aquí se juntan varias reglas gramaticales dentro de un solo texto: comparativos, posesivos, preposiciones. En las dos lecturas las repasamos una por una con ejemplos reales, para que al llegar al quiz ya las reconozcas sin tener que pensarlas dos veces.</p>$HTML$::text))
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 7 — Texto con opción múltiple' and lesson_json is not null;

-- ---- Introducción: contenido completo y correcto (45 preguntas) ----
update public.modules set description = $LESSON$
<p class="lead-in">Bienvenido — antes de estudiar la primera palabra de inglés, quiero explicarte cómo funciona esta prueba, para que el día del examen no te tome nada por sorpresa. Léelo con calma: el cuestionario de esta lección solo te pregunta lo que vas a leer aquí.</p>

<h2>¿Cómo está organizada la prueba?</h2>
<p>La prueba de inglés del ICFES (Saber 11) tiene <strong>45 preguntas</strong> de selección múltiple, repartidas en <strong>7 partes</strong>. Cada parte evalúa una habilidad distinta, y en este curso dedicamos un módulo completo a cada una — cuando termines los siete, vas a haber practicado exactamente lo mismo que te van a preguntar:</p>

<table class="grammar-table">
<tr><th>Parte</th><th>Qué evalúa</th></tr>
<tr><td>1. Avisos y vocabulario</td><td>Entender el propósito de avisos y letreros cotidianos</td></tr>
<tr><td>2. Relación de enunciados</td><td>Conectar una definición con la palabra correcta</td></tr>
<tr><td>3. Diálogos y conversación</td><td>Completar conversaciones cortas con el modal adecuado</td></tr>
<tr><td>4. Use of Language</td><td>Completar espacios en un texto (gramática) — la parte con más preguntas</td></tr>
<tr><td>5. Lectura literal</td><td>Encontrar información explícita en un texto</td></tr>
<tr><td>6. Lectura inferencial</td><td>Deducir lo que el texto no dice directamente</td></tr>
<tr><td>7. Texto con opción múltiple</td><td>Elegir la palabra que mejor completa un texto</td></tr>
</table>

<h2>¿Cómo se mide tu nivel?</h2>
<p>El resultado no es una nota de 0 a 100 como en el colegio: el ICFES te ubica en un <strong>nivel de dominio del inglés</strong>, en una escala que va desde <strong>A-</strong> (el más bajo, para quien todavía no supera las preguntas más sencillas) hasta <strong>B1</strong> (el más alto que reporta la prueba, para quien ya se desenvuelve bien en situaciones cotidianas en inglés). Entre más preguntas respondas bien, más alto es tu nivel — no hay una nota "de aprobar o reprobar", solo un lugar en esa escala.</p>

<h2>Cómo manejar tu tiempo y tu energía</h2>
<p>Cada parte tiene un tiempo límite dentro del examen completo. Si te atascas en una pregunta, <strong>no te quedes ahí dándole vueltas</strong>: responde con tu mejor opción, sigue avanzando, y si te queda tiempo al final, vuelve a revisarla. Una pregunta en blanco nunca suma puntos — así que, si de verdad no sabes, siempre es mejor descartar las opciones que claramente no tienen sentido y quedarte con la más probable entre las que quedan, que dejarla vacía.</p>

<div class="tip-box"><span class="icon">⏱️</span><span>Ese va a ser tu mejor amigo en las siete partes que vienen: <strong>descartar por lógica</strong> cuando dudes, en vez de adivinar al azar o dejar en blanco.</span></div>

<h2>Antes de seguir, ponte a prueba</h2>
<details class="mini-check"><summary>¿Cuántas preguntas tiene la prueba en total?</summary><div class="answer">45 preguntas, divididas en 7 partes.</div></details>
<details class="mini-check"><summary>¿Qué debes hacer si no sabes una respuesta?</summary><div class="answer">Nunca la dejes en blanco: descarta las opciones que no tienen sentido y elige la más probable entre las que quedan.</div></details>
<details class="mini-check"><summary>¿Entre qué niveles ubica el ICFES tu resultado?</summary><div class="answer">Desde A- (el más bajo) hasta B1 (el más alto que reporta la prueba).</div></details>
$LESSON$
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Introducción';
