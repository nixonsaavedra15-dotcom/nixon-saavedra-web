# Lección multi-paso — Pre-ICFES, módulos 1 a 7

Ya que aprobaste el prototipo, repliqué la misma estructura en los 6
módulos restantes de "Partes" del examen (Parte 2 a Parte 7). Ahora
los módulos 1 a 7 del curso Pre-ICFES tienen el formato completo:
bienvenida/guía → lectura 1 → lectura 2 → quiz → interactivo (tipo
Genially) → quiz → lectura de práctica (caso real) → formulario de
cierre → desbloqueo del siguiente módulo.

El módulo "Introducción" (módulo 0) sigue en formato antiguo (una
sola página) porque es solo una bienvenida informativa, no una
lección con contenido evaluable — no necesita el flujo completo. El
módulo "Simulacro final" (módulo 8) tampoco se tocó: ese lo vamos a
reemplazar más adelante por los dos simulacros completos que pediste
(fase en pausa, ver más abajo).

## 1. Corre estos 2 archivos SQL, en este orden

En Supabase → **SQL Editor** → New query → pega y **Run**:

1. `supabase/lesson-flow-schema.sql` — agrega las columnas y tablas
   nuevas (no borra ni rompe nada existente).
2. `supabase/module1-prototype.sql` — llena el contenido del módulo 1
   y crea sus dos cuestionarios.
3. `supabase/fix-icfes-question-count.sql` — corrige un dato que
   estaba mal en el módulo "Introducción": la prueba de inglés del
   ICFES tiene **45 preguntas**, no 55 (verificado contra la guía
   oficial del ICFES). Corrige tanto el texto como la respuesta del
   quiz.
4. `supabase/modules2-7-content.sql` — la misma lección multi-paso
   completa (2 lecturas, interactivo, práctica, cierre, 2 quizzes)
   para los módulos "Parte 2" a "Parte 7".
5. `supabase/fix-tone-and-intro.sql` — corrige el tono de la guía de
   bienvenida (menos "lista de pasos", más explicación de un tutor) y
   reescribe el contenido de "Introducción" completo y con el dato
   correcto (45 preguntas).

Los cinco son seguros de correr más de una vez.

## 2. Despliega 2 funciones nuevas (Via Editor, igual que las de correo)

En **Edge Functions** → "Deploy a new function" → **Via Editor**:

| Función | Código | Verify JWT |
|---|---|---|
| `submit-closing-form` | `supabase/functions/submit-closing-form/index.ts` | ON (default) |
| `update-lesson-step` | `supabase/functions/update-lesson-step/index.ts` | ON (default) |

No necesitan secrets nuevos — usan los mismos `SUPABASE_URL` y
`SUPABASE_SERVICE_ROLE_KEY` que ya están configurados.

## 3. Reemplaza el código de `submit-quiz`

`submit-quiz` ya existía, pero le agregué soporte para que un módulo
tenga dos cuestionarios (uno por cada etapa) en vez de uno solo. Entra
a la función `submit-quiz` en el dashboard → pega el contenido nuevo de
`supabase/functions/submit-quiz/index.ts` → Deploy. Dejar el "Verify
JWT" como ya estaba configurado (no cambia).

## 4. Sube los archivos a GitHub

Desde tu Mac (Terminal, en la carpeta del sitio):

```bash
cd ~/Documents/"Web Nixon"/sitio
git add -A
git commit -m "Prototipo: lección multi-paso para módulo 1 (Pre-ICFES)"
git push
```

## 5. Cómo probarlo

1. Entra al Campus con una cuenta matriculada en Pre-ICFES (o
   asígnate el curso gratis desde el panel admin).
2. Abre el módulo **"Parte 1 — Avisos y vocabulario"**.
3. Deberías ver la pantalla de bienvenida con la guía rápida y los
   5 pasos. Recorre todo el flujo: 2 lecturas → quiz → interactivo
   (toca las burbujas) → quiz → lectura de práctica → formulario de
   cierre.
4. Al enviar el formulario de cierre, si aprobaste los dos quizzes,
   debe desbloquear el módulo 2 y mostrar tu nota (promedio de los
   dos quizzes). Repite el mismo recorrido en los módulos 2 a 7 para
   confirmar que todos quedaron bien (misma mecánica, contenido
   distinto).
5. Si cierras el navegador a la mitad, al volver a entrar deberías
   retomar en el mismo paso donde ibas.

Las 3 funciones (`submit-quiz`, `submit-closing-form`,
`update-lesson-step`) son compartidas por todos los módulos — no hay
que volver a desplegar nada por cada módulo nuevo, solo correr el SQL.

## Qué revisar y decirme

- Si el tono, extensión y dificultad de las lecturas/quiz te parece
  el correcto en los 7 módulos.
- Si quieres que alguna lección interactiva tenga más/menos
  diapositivas.
- Si el formulario de cierre debería pedir otro tipo de información.
- Cuando apruebes esto, seguimos con los dos simulacros completos.

## Nota sobre los simulacros (pendiente, en pausa)

Ya extraje la especificación oficial del examen de inglés del ICFES
de tu "Guía de orientación Saber 11": son **45 preguntas** (no 55 como
tenía el texto viejo — hay que corregir eso en el módulo de
Introducción) repartidas en 7 partes con estos porcentajes:

| Parte | % | Preguntas aprox. |
|---|---|---|
| 1 — Avisos | 11% | 5 |
| 2 — Relación de enunciados | 11% | 5 |
| 3 — Diálogos | 11% | 5 |
| 4 — Use of language | 18% | 8 |
| 5 — Lectura literal | 16% | 7 |
| 6 — Lectura inferencial | 11% | 5 |
| 7 — Texto opción múltiple | 22% | 10 |

Esto lo uso como base para construir los dos simulacros completos, en
cuanto apruebes este prototipo.
