# Alinear el Pre-ICFES con el formato real del examen (Partes 2, 3, 4, 7 + Simulacro de 45 preguntas)

Tras tu auditoría con las imágenes de la guía oficial ICFES, esto es lo que se corrigió:

- **Parte 2** ya no es opción múltiple de 4 — es el formato real: **1 banco de 8 palabras** compartido por **5 enunciados**, con 3 palabras "trampa" que no se usan.
- **Parte 3** ahora evalúa **coherencia conversacional con 3 opciones** (A/B/C), no gramática aislada.
- **Parte 4** es un **texto con espacios en blanco, nivel básico, 4 opciones por espacio** (preposiciones, pronombres posesivos, artículos, concordancia simple).
- **Parte 7** es el mismo formato que la Parte 4 pero **nivel avanzado**: conectores lógicos (although, however, despite, therefore) y concordancia verbal en oraciones largas — tal como en el "Big Mac attack" de tu guía.
- El **Simulacro final** (Módulo 8) pasó de 8 preguntas sueltas a las **45 preguntas reales**, repartidas exactamente como la Tabla 17: Parte 1 = 5, Parte 2 = 5, Parte 3 = 5, Parte 4 = 8, Parte 5 = 7, Parte 6 = 5, Parte 7 = 10. Cada parte usa su formato auténtico (avisos, banco de palabras, diálogos, cloze, lectura literal 3 opciones, lectura inferencial 4 opciones, cloze avanzado).
- **Parte 1, 5 y 6** no se tocaron — ya estaban alineadas, tal como confirmaste.

Las lecciones de las Partes 2, 3, 4 y 7 también se reescribieron: cada una ahora enseña la **estrategia real** para resolver ese formato (leer el banco completo antes de responder, identificar la función comunicativa antes de mirar las opciones, leer todo el texto antes del primer espacio, distinguir contraste vs. consecuencia en los conectores), no solo teoría genérica de gramática.

## 1. Correr el SQL — en Supabase → SQL Editor, en este orden

1. **`icfes-formato-real-partes-2-3-4-7.sql`** — reescribe el contenido de lección (lectura, interactivo, práctica, cierre) de los módulos "Parte 2", "Parte 3", "Parte 4" y "Parte 7", y reemplaza sus 2 quizzes (lecturas + interactivo) por preguntas en el formato real. Borra las preguntas viejas de esas partes antes de crear las nuevas — es seguro correrlo varias veces.
2. **`icfes-simulacro-final-45-preguntas.sql`** — reemplaza el quiz del Módulo 8 "Simulacro final" (el examen de certificación) por las 45 preguntas reales. Mantiene las mismas reglas de siempre: 75/100 para pasar, 3 intentos, 24 horas de espera entre intentos.

No necesitas desplegar ninguna función nueva ni tocar `leccion.html` — todo esto usa las tablas y el motor de quizzes que ya existen. Los estilos nuevos (el resaltado del espacio en blanco activo en los textos cloze) ya están agregados a `assets/style.css` en este mismo commit.

## 2. Subir los cambios

```bash
cd "/Users/macbookpro/Documents/Web Nixon/sitio"
git add assets/style.css supabase/icfes-formato-real-partes-2-3-4-7.sql supabase/icfes-simulacro-final-45-preguntas.sql supabase/SETUP-ICFES-FORMATO-REAL.md
git commit -m "Alinear Pre-ICFES con formato real ICFES: Partes 2/3/4/7 + Simulacro de 45 preguntas"
git push
```

## Cómo verificarlo (usa tu vista de admin)

1. Entra a `admin.html`, expande el curso Pre-ICFES, abre **"👁 Vista completa"** en cada uno de los módulos Parte 2, 3, 4, 7 y Simulacro final. Vas a ver el contenido de lección completo y, debajo, cada pregunta con la respuesta correcta marcada — sin tener que resolver nada.
2. En Parte 2, confirma que las 5 preguntas de cada quiz comparten exactamente las mismas 8 opciones (eso es lo correcto: es un solo banco).
3. En Parte 4 y 7, y en las secciones de cloze del Simulacro, vas a ver el mismo párrafo repetido en cada pregunta con el espacio que le corresponde resaltado — así el estudiante siempre tiene el texto completo a la vista, igual que en el examen real.
4. En el Simulacro final, cuenta que hay 45 preguntas en total y que van en el orden: 5 avisos, 5 de banco de palabras, 5 diálogos, 8 de texto básico, 7 de lectura literal, 5 de lectura inferencial, 10 de texto avanzado.

## Nota sobre la Parte 4: "tres opciones" vs. 4 opciones

En tu mensaje describiste la Parte 4 con "tres opciones posibles", pero la imagen de referencia que enviaste (el texto "Big Mac attack") muestra claramente 4 opciones (A–D) por espacio, y tu propia descripción de la Parte 7 ("otra parte como la 4... con 4 opciones") confirma que ambas comparten formato. Construí las Partes 4 y 7 con 4 opciones, apoyado en la imagen y en tu descripción de la Parte 7 — avísame si en realidad querías 3 y lo ajusto.
