-- ============================================================
-- Contenido real de lección — Pre-ICFES (reemplaza el texto genérico)
-- ============================================================
-- Por qué existe este archivo: los módulos originales (ver
-- seed-pre-icfes-modules.sql) traían una descripción de 2-3 frases,
-- pero el cuestionario de cada módulo pregunta por avisos, vocabulario,
-- diálogos y textos específicos que nunca aparecían en esa lección —
-- el estudiante no tenía cómo prepararse antes de ser evaluado.
--
-- Este script reemplaza el campo "description" de cada módulo por
-- contenido real (vocabulario, tablas, ejemplos, lecturas, mini-checks
-- interactivos) que enseña exactamente lo que después pregunta el
-- cuestionario. leccion.html ya fue actualizado para mostrar este HTML
-- tal cual (con estilos nuevos en assets/style.css).
--
-- CÓMO USARLO: Supabase → SQL Editor → New query, pega esto completo,
-- Run. Es seguro correrlo varias veces (solo actualiza, no duplica).
-- ============================================================

-- Módulo 0: Introducción
update public.modules set description = $LESSON$
<p class="lead-in">Antes de empezar a estudiar inglés, conozcamos las reglas del juego: así sabrás exactamente qué esperar el día del examen y cómo aprovechar cada minuto de este curso.</p>

<h2>¿Cómo está organizada la prueba?</h2>
<p>La prueba de inglés del ICFES (Saber 11) tiene <strong>55 preguntas</strong> repartidas en <strong>7 partes</strong>. Cada parte evalúa una habilidad distinta, y en este curso dedicamos un módulo completo a cada una:</p>

<table class="grammar-table">
<tr><th>Parte</th><th>Qué evalúa</th></tr>
<tr><td>1. Avisos y vocabulario</td><td>Entender el propósito de avisos y letreros cotidianos</td></tr>
<tr><td>2. Relación de enunciados</td><td>Conectar una definición con la palabra correcta</td></tr>
<tr><td>3. Diálogos y conversación</td><td>Completar conversaciones cortas con el modal adecuado</td></tr>
<tr><td>4. Use of Language</td><td>Completar espacios en un texto (gramática)</td></tr>
<tr><td>5. Lectura literal</td><td>Encontrar información explícita en un texto</td></tr>
<tr><td>6. Lectura inferencial</td><td>Deducir lo que el texto no dice directamente</td></tr>
<tr><td>7. Texto con opción múltiple</td><td>Elegir la palabra que mejor completa un texto</td></tr>
</table>

<h2>¿Cómo se mide tu nivel?</h2>
<p>El resultado no es una nota de 0 a 100 como en el colegio: el ICFES te ubica en un <strong>nivel de dominio del inglés</strong>, en una escala que va desde <strong>-A1</strong> (el más bajo) hasta <strong>B1</strong> (el más alto que reporta la prueba). Entre más preguntas respondas bien, más alto es tu nivel.</p>

<div class="tip-box"><span class="icon">⏱️</span><span>Cada parte tiene tiempo límite. Si te atascas en una pregunta, <strong>no te quedes ahí</strong>: responde con tu mejor opción, sigue avanzando, y si te queda tiempo al final, vuelve a revisarla. Una pregunta en blanco nunca suma puntos.</span></div>

<h2>Antes de seguir, ponte a prueba</h2>
<details class="mini-check"><summary>¿Cuántas preguntas tiene la prueba en total?</summary><div class="answer">55 preguntas, divididas en 7 partes.</div></details>
<details class="mini-check"><summary>¿Qué debes hacer si no sabes una respuesta?</summary><div class="answer">Nunca la dejes en blanco: descarta las opciones que no tienen sentido y elige la más probable entre las que quedan.</div></details>
$LESSON$
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Introducción';

-- Módulo 1: Parte 1 — Avisos y vocabulario
update public.modules set description = $LESSON$
<p class="lead-in">En la vida real, los avisos en inglés están en todas partes: aeropuertos, calles, oficinas. Aprende a leerlos de un vistazo — no necesitas traducir palabra por palabra, solo reconocer la idea general.</p>

<h2>Avisos comunes que debes reconocer</h2>

<div class="sign-box"><div class="sign-text">NO PARKING — TOW-AWAY ZONE</div><div class="sign-meaning">Se ve en calles y zonas de estacionamiento: prohíbe parquear y advierte que los carros mal estacionados serán remolcados.</div></div>

<div class="sign-box"><div class="sign-text">PLEASE KEEP OFF THE GRASS</div><div class="sign-meaning"><em>Keep off</em> significa "mantente alejado de". Este aviso pide no caminar ni sentarse sobre el césped — se ve en parques y jardines.</div></div>

<div class="sign-box"><div class="sign-text">BAGGAGE CLAIM →</div><div class="sign-meaning">Se ve en aeropuertos: es la zona donde recoges tus maletas después de un vuelo.</div></div>

<div class="sign-box"><div class="sign-text">WARNING</div><div class="sign-meaning">Significa "advertencia" — indica que hay un peligro o riesgo cerca. No es un saludo ni una invitación.</div></div>

<div class="sign-box"><div class="sign-text">STAFF ONLY — DO NOT ENTER</div><div class="sign-meaning">Se ve en oficinas y tiendas: solo el personal autorizado puede pasar por esa puerta.</div></div>

<h2>Vocabulario: abierto o cerrado</h2>
<div class="vocab-grid">
<div class="vocab-item"><div class="word">open</div><div class="mean">abierto</div></div>
<div class="vocab-item"><div class="word">closed</div><div class="mean">cerrado</div></div>
</div>
<p>Fíjate en la estructura: <em>"The library is <strong>closed</strong> on Sundays"</em> — usamos el adjetivo <strong>closed</strong> después del verbo "to be" (is/are), no el verbo "close" sin conjugar.</p>

<div class="tip-box"><span class="icon">💡</span><span>Estrategia clave: no necesitas entender cada palabra del aviso. Busca la <strong>palabra clave</strong> (parking, grass, baggage, warning, staff) y pregúntate: ¿en qué lugar tendría sentido este aviso?</span></div>

<details class="mini-check"><summary>¿Qué significa "keep off the grass"?</summary><div class="answer">Que no camines ni te sientes sobre el pasto — "keep off" = mantente alejado de.</div></details>
<details class="mini-check"><summary>¿Dónde verías el aviso "baggage claim"?</summary><div class="answer">En un aeropuerto, señalando dónde recoger tu equipaje.</div></details>
$LESSON$
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 1 — Avisos y vocabulario';

-- Módulo 2: Parte 2 — Relación de enunciados
update public.modules set description = $LESSON$
<p class="lead-in">Esta parte no evalúa gramática — evalúa cuánto vocabulario tienes y qué tan rápido conectas una definición con la palabra correcta. La clave está en aprender por grupos temáticos, no en listas sueltas.</p>

<h2>Lugares</h2>
<div class="vocab-grid">
<div class="vocab-item"><div class="word">pharmacy</div><div class="mean">farmacia — donde compras medicinas</div></div>
<div class="vocab-item"><div class="word">bakery</div><div class="mean">panadería</div></div>
<div class="vocab-item"><div class="word">library</div><div class="mean">biblioteca</div></div>
<div class="vocab-item"><div class="word">bank</div><div class="mean">banco</div></div>
</div>

<h2>Profesiones</h2>
<div class="vocab-grid">
<div class="vocab-item"><div class="word">teacher</div><div class="mean">profesor(a) — enseña a estudiantes</div></div>
<div class="vocab-item"><div class="word">doctor</div><div class="mean">médico(a)</div></div>
<div class="vocab-item"><div class="word">waiter</div><div class="mean">mesero</div></div>
<div class="vocab-item"><div class="word">driver</div><div class="mean">conductor</div></div>
</div>

<h2>Medios de transporte</h2>
<div class="vocab-grid">
<div class="vocab-item"><div class="word">airplane</div><div class="mean">avión — vuela</div></div>
<div class="vocab-item"><div class="word">bicycle</div><div class="mean">bicicleta</div></div>
<div class="vocab-item"><div class="word">ship</div><div class="mean">barco</div></div>
<div class="vocab-item"><div class="word">train</div><div class="mean">tren</div></div>
</div>

<h2>Comidas del día</h2>
<div class="vocab-grid">
<div class="vocab-item"><div class="word">breakfast</div><div class="mean">desayuno — la primera comida del día</div></div>
<div class="vocab-item"><div class="word">lunch</div><div class="mean">almuerzo</div></div>
<div class="vocab-item"><div class="word">dinner</div><div class="mean">cena</div></div>
<div class="vocab-item"><div class="word">snack</div><div class="mean">merienda</div></div>
</div>

<h2>Documentos de viaje</h2>
<div class="vocab-grid">
<div class="vocab-item"><div class="word">passport</div><div class="mean">pasaporte — documento para viajar a otro país</div></div>
<div class="vocab-item"><div class="word">ticket</div><div class="mean">tiquete</div></div>
</div>

<div class="tip-box"><span class="icon">🧠</span><span><strong>Cómo memorizar de verdad:</strong> no repitas listas sueltas. Agrupa las palabras por tema (como hicimos arriba) y úsalas en una oración propia — eso multiplica tu retención comparado con solo leerlas una vez.</span></div>

<details class="mini-check"><summary>¿Qué palabra se relaciona con "a person who teaches students"?</summary><div class="answer">Teacher.</div></details>
<details class="mini-check"><summary>¿Cuál es la mejor forma de memorizar vocabulario nuevo?</summary><div class="answer">Agruparlo por tema y usarlo en oraciones propias, no memorizar listas sueltas sin contexto.</div></details>
$LESSON$
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 2 — Relación de enunciados';

-- Módulo 3: Parte 3 — Diálogos y conversación
update public.modules set description = $LESSON$
<p class="lead-in">En esta parte vas a leer un mini-diálogo y elegir el modal (verbo auxiliar) que mejor encaja según la intención: ¿es un permiso, una obligación, un consejo o una invitación?</p>

<h2>Los modales y su intención</h2>
<table class="grammar-table">
<tr><th>Modal</th><th>Para qué se usa</th><th>Ejemplo</th></tr>
<tr><td>could</td><td>Petición cortés</td><td>"Could you help me with this bag?"</td></tr>
<tr><td>may</td><td>Pedir permiso</td><td>"May I open the window?"</td></tr>
<tr><td>must</td><td>Obligación / norma</td><td>"You must wear a seatbelt."</td></tr>
<tr><td>must not</td><td>Prohibición</td><td>"You must not smoke inside."</td></tr>
<tr><td>should / would</td><td>Consejo</td><td>"If I were you, I would study more."</td></tr>
<tr><td>shall</td><td>Proponer un plan juntos</td><td>"Shall we go to the movies?"</td></tr>
</table>

<h2>Diálogos de ejemplo</h2>
<div class="example-box">
<div class="line"><span class="speaker">A:</span> Could you help me with this bag, please?</div>
<div class="line"><span class="speaker">B:</span> Of course!</div>
</div>
<div class="example-box">
<div class="line"><span class="speaker">A:</span> May I open the window?</div>
<div class="line"><span class="speaker">B:</span> Yes, go ahead.</div>
</div>
<div class="example-box">
<div class="line"><span class="speaker">A:</span> Shall we go to the movies tonight?</div>
<div class="line"><span class="speaker">B:</span> Sounds good!</div>
</div>

<div class="tip-box"><span class="icon">🔑</span><span>Truco rápido: si la pregunta pide "cortesía" piensa en <strong>could</strong>; si pide "permiso" piensa en <strong>may</strong>; si pide "obligación" piensa en <strong>must</strong>; si pide "consejo" piensa en <strong>should/would</strong>; si pide "plan juntos" piensa en <strong>shall</strong>.</span></div>

<details class="mini-check"><summary>¿Qué modal usarías para pedir permiso educadamente?</summary><div class="answer">May — "May I...?"</div></details>
<details class="mini-check"><summary>¿Qué diferencia hay entre "must" y "must not"?</summary><div class="answer">"Must" expresa una obligación ("tienes que"); "must not" expresa una prohibición ("no debes / está prohibido").</div></details>
$LESSON$
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 3 — Diálogos y conversación';

-- Módulo 4: Parte 4 — Use of Language
update public.modules set description = $LESSON$
<p class="lead-in">Esta es la parte con más preguntas y también la que mejor puedes dominar con reglas claras: preposiciones fijas, comparativos, superlativos, pronombres y adverbios.</p>

<h2>Preposiciones que van pegadas a un adjetivo</h2>
<p>Algunos adjetivos siempre usan la misma preposición — hay que memorizarlos como pareja fija: <strong>interested in</strong> (interesado en), <strong>afraid of</strong> (asustado de), <strong>good at</strong> (bueno en).</p>
<div class="example-box"><div class="line">"She is interested <strong>in</strong> learning new languages."</div></div>

<h2>Comparativos y superlativos</h2>
<table class="grammar-table">
<tr><th>Tipo de adjetivo</th><th>Comparativo</th><th>Superlativo</th></tr>
<tr><td>Corto (tall)</td><td>taller</td><td>the tallest</td></tr>
<tr><td>Largo (interesting)</td><td>more interesting</td><td>the most interesting</td></tr>
</table>
<p>Regla rápida: adjetivos <strong>cortos</strong> (1 sílaba, a veces 2) agregan <strong>-er / -est</strong>. Adjetivos <strong>largos</strong> usan <strong>more / the most</strong> delante. El superlativo siempre lleva <strong>"the"</strong> adelante.</p>

<h2>Pronombres sujeto</h2>
<div class="vocab-grid">
<div class="vocab-item"><div class="word">I, you, he, she, it</div><div class="mean">singular</div></div>
<div class="vocab-item"><div class="word">we, you, they</div><div class="mean">plural — "María y yo" = we</div></div>
</div>

<h2>Adjetivo vs. adverbio</h2>
<p><strong>good</strong> (adjetivo, describe un sustantivo) → <strong>well</strong> (adverbio, describe un verbo). Ej: "He speaks English very <strong>well</strong>" (no "very good").</p>

<details class="mini-check"><summary>¿Cómo se forma el comparativo de un adjetivo largo como "interesting"?</summary><div class="answer">Con "more" delante: more interesting.</div></details>
<details class="mini-check"><summary>¿"Good" o "well" para describir cómo habla alguien?</summary><div class="answer">Well — porque describe al verbo "speaks", y para eso se usa un adverbio.</div></details>
$LESSON$
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 4 — Use of Language';

-- Módulo 5: Parte 5 — Lectura literal
update public.modules set description = $LESSON$
<p class="lead-in">La lectura literal es la más fácil de las dos partes de comprensión de lectura: la respuesta siempre está escrita tal cual en el texto. Tu trabajo es encontrarla, no interpretarla.</p>

<div class="reading-passage"><span class="passage-tag">Texto de práctica</span>Anna works at a hospital. She starts her shift at 7 a.m. and finishes at 3 p.m. During her lunch break, she usually eats a sandwich in the hospital cafeteria. After work, she goes home and walks her dog before dinner.</div>

<h2>Estrategia: escaneo por palabras clave</h2>
<p>No leas el texto como una novela. Lee primero la <strong>pregunta</strong>, identifica la palabra clave (ej: "shift", "lunch", "after work") y busca esa misma idea en el texto — la respuesta casi siempre usa palabras muy parecidas.</p>

<table class="grammar-table">
<tr><th>Pregunta</th><th>Palabra clave a buscar</th><th>Dónde está en el texto</th></tr>
<tr><td>¿A qué hora empieza su turno?</td><td>starts / shift</td><td>"starts her shift at 7 a.m."</td></tr>
<tr><td>¿Dónde come?</td><td>lunch break</td><td>"in the hospital cafeteria"</td></tr>
<tr><td>¿Qué hace después del trabajo?</td><td>after work</td><td>"goes home and walks her dog"</td></tr>
</table>

<div class="tip-box"><span class="icon">📖</span><span>Cuidado con las <strong>trampas</strong>: el texto menciona "3 p.m." (hora en que <em>termina</em>) y "7 a.m." (hora en que <em>empieza</em>) — lee bien qué te preguntan exactamente.</span></div>

<details class="mini-check"><summary>¿A qué hora termina el turno de Anna?</summary><div class="answer">A las 3 p.m. — pero ojo, si te preguntan cuándo EMPIEZA, la respuesta es 7 a.m.</div></details>
$LESSON$
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 5 — Lectura literal';

-- Módulo 6: Parte 6 — Lectura inferencial
update public.modules set description = $LESSON$
<p class="lead-in">La lectura inferencial es un paso más allá: la respuesta no está escrita literalmente, pero el texto te da suficientes pistas para deducirla con seguridad.</p>

<div class="reading-passage"><span class="passage-tag">Texto de práctica</span>Marco wanted to go hiking on Saturday. However, the weather forecast predicted heavy rain. Because he didn't want to get sick, he decided to stay home and watch movies instead. Therefore, he rescheduled the hike for the following weekend.</div>

<h2>Conectores que son pistas de oro</h2>
<table class="grammar-table">
<tr><th>Conector</th><th>Función</th><th>Ejemplo en el texto</th></tr>
<tr><td>however</td><td>Contraste — algo cambia lo anterior</td><td>"However, the weather forecast predicted rain"</td></tr>
<tr><td>because</td><td>Razón / causa</td><td>"Because he didn't want to get sick"</td></tr>
<tr><td>therefore</td><td>Consecuencia / conclusión</td><td>"Therefore, he rescheduled the hike"</td></tr>
</table>

<h2>Cómo inferir sin equivocarte</h2>
<p>Pregúntate: ¿qué información junta el texto para llevarte a esa conclusión, aunque no lo diga con esas palabras exactas? Por ejemplo, el texto nunca dice "Marco es precavido" — pero decidió quedarse en casa <em>para no enfermarse</em>, así que sí podemos inferir que es una persona cuidadosa con su salud.</p>

<div class="tip-box"><span class="icon">🔍</span><span>Si una opción de respuesta contradice algo que el texto SÍ dice explícitamente, descártala de inmediato — una inferencia nunca puede contradecir un hecho literal del texto.</span></div>

<details class="mini-check"><summary>¿Qué se puede inferir sobre lo que hará Marco el próximo fin de semana?</summary><div class="answer">Que irá de excursión — el texto dice "he rescheduled the hike for the following weekend".</div></details>
<details class="mini-check"><summary>¿Qué tipo de persona parece Marco según sus decisiones?</summary><div class="answer">Alguien precavido, que prioriza su salud — se infiere de que evitó salir bajo la lluvia para no enfermarse.</div></details>
$LESSON$
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 6 — Lectura inferencial';

-- Módulo 7: Parte 7 — Texto con opción múltiple
update public.modules set description = $LESSON$
<p class="lead-in">Aquí lees un texto corto sobre temas generales (viajes, cultura, deportes) y eliges la palabra que mejor completa cada espacio — combinando gramática y sentido del texto completo.</p>

<div class="reading-passage"><span class="passage-tag">Texto de práctica</span>Traveling by train is often more relaxing than flying. Before you travel, you should check your passport is still valid. Football is one of the most popular sports in the world, and many cultures celebrate the New Year with fireworks and music. If you visit Japan, you should try the local street food.</div>

<h2>Los puntos gramaticales que se repiten aquí</h2>
<table class="grammar-table">
<tr><th>Punto</th><th>Regla</th><th>Ejemplo del texto</th></tr>
<tr><td>Comparativo largo</td><td>more + adjetivo</td><td>more relaxing</td></tr>
<tr><td>Posesivos</td><td>my, your, his, her, its, our, their</td><td>your passport</td></tr>
<tr><td>Superlativo largo</td><td>the most + adjetivo</td><td>the most popular</td></tr>
<tr><td>Preposición de medio</td><td>with</td><td>celebrate with fireworks</td></tr>
<tr><td>Recomendación</td><td>should</td><td>you should try...</td></tr>
</table>

<h2>Adjetivos posesivos, uno por uno</h2>
<div class="vocab-grid">
<div class="vocab-item"><div class="word">my / your</div><div class="mean">mi / tu, su (de usted)</div></div>
<div class="vocab-item"><div class="word">his / her / its</div><div class="mean">su (de él) / su (de ella) / su (de eso: un país, un objeto)</div></div>
<div class="vocab-item"><div class="word">our / their</div><div class="mean">nuestro / su (de ellos)</div></div>
</div>
<p><strong>Its</strong> se usa para cosas, animales, países: "Colombia is famous for <strong>its</strong> beaches" (no "it's", que es la contracción de "it is").</p>

<details class="mini-check"><summary>¿"Its" o "it's" para decir que un país es famoso por SUS playas?</summary><div class="answer">Its (posesivo) — "it's" significa "it is" y no encaja aquí.</div></details>
<details class="mini-check"><summary>¿Qué modal usarías para recomendar probar la comida callejera?</summary><div class="answer">Should — "you should try the local street food."</div></details>
$LESSON$
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Parte 7 — Texto con opción múltiple';

-- Módulo 8: Simulacro final
update public.modules set description = $LESSON$
<p class="lead-in">Llegaste al simulacro final: aquí no enseñamos vocabulario nuevo, repasamos lo que ya aprendiste y lo ponemos a prueba en condiciones parecidas a la prueba real — incluyendo un texto nuevo, para practicar tu comprensión de lectura con material que nunca has visto, tal como pasará el día del examen.</p>

<h2>Repaso rápido, parte por parte</h2>
<table class="grammar-table">
<tr><th>Parte</th><th>Recuerda...</th></tr>
<tr><td>Avisos</td><td>Busca la palabra clave y pregúntate en qué lugar tendría sentido. "Staff only" = solo personal autorizado.</td></tr>
<tr><td>Vocabulario</td><td>Agrupa por tema: lugares, profesiones, transporte, comidas, documentos.</td></tr>
<tr><td>Diálogos</td><td>could = cortesía, may = permiso, must = obligación, must not = prohibición, should/would = consejo, shall = plan juntos.</td></tr>
<tr><td>Use of Language</td><td>Adjetivos cortos: -er/-est. Adjetivos largos: more/the most. Good → well.</td></tr>
<tr><td>Lectura literal</td><td>La respuesta está escrita tal cual — escanea por palabras clave.</td></tr>
<tr><td>Lectura inferencial</td><td>however = contraste, because = razón, therefore = consecuencia.</td></tr>
<tr><td>Texto cloze</td><td>Posesivos (its, your), comparativos/superlativos, preposiciones (with), should.</td></tr>
</table>

<h2>Practica con un texto nuevo</h2>
<div class="reading-passage"><span class="passage-tag">Texto de práctica — igual que en el examen real</span>Laura studied all week for her exam. However, she forgot her calculator on exam day. Therefore, she had to solve the math problems by hand.</div>
<p>Aplica la misma estrategia del módulo de lectura inferencial: ¿qué te dicen "however" y "therefore" aquí sobre lo que le pasó a Laura?</p>

<div class="tip-box"><span class="icon">🎯</span><span>Este examen tiene <strong>3 intentos en total</strong> y <strong>24 horas de espera</strong> antes del último intento — tómate tu tiempo, repasa los módulos anteriores si algo no te queda claro, y preséntalo cuando te sientas listo de verdad.</span></div>

<details class="mini-check"><summary>¿Qué tuvo que hacer Laura y por qué?</summary><div class="answer">Tuvo que resolver los problemas de matemáticas a mano, porque olvidó su calculadora — a pesar de haber estudiado toda la semana.</div></details>
$LESSON$
where course_id = (select id from public.courses where slug = 'pre-icfes')
and title = 'Simulacro final';
