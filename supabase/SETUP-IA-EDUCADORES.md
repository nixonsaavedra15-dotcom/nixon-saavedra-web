# Montar el curso "IA para Educadores" — guía paso a paso

Este curso ya existe como fila en `courses` (slug `ia-educadores`), pero
no tenía módulos ni lecciones. Estos 10 archivos nuevos le dan el
contenido completo: 9 módulos con el mismo formato de lección
multi-paso que ya usa Pre-ICFES (bienvenida → lectura 1 → lectura 2 →
quiz → interactivo → quiz → práctica → cierre), con 2 cuestionarios de
5 preguntas por módulo (90 preguntas en total).

## 0. Requisito previo

Estos 4 scripts ya deberían estar corridos en tu Supabase (son los
mismos que usa Pre-ICFES). Si Pre-ICFES ya funciona en tu sitio, sáltate
este paso y ve directo al punto 1:

- `schema.sql`
- `admin-schema.sql`
- `quiz-schema.sql`
- `lesson-flow-schema.sql`

Si tienes dudas de si ya corriste alguno, es seguro volver a correrlo:
todos usan `create table if not exists` / `add column if not exists`.

## 1. Actualiza el precio del curso (si ya existía con precio $0)

En Supabase → **SQL Editor** → New query → pega y **Run**:

```sql
update public.courses set price = 420000 where slug = 'ia-educadores';
```

## 2. Corre estos 10 archivos, en este orden exacto

En Supabase → **SQL Editor** → New query → pega el contenido completo
de cada archivo → **Run**. Espera a que cada uno termine antes de
seguir con el siguiente.

| # | Archivo | Qué hace |
|---|---|---|
| 1 | `supabase/seed-ia-educadores-modules.sql` | Crea las 9 filas de módulos (sin esto, los 9 de abajo no van a encontrar dónde escribir) |
| 2 | `supabase/ia-educadores-module-0.sql` | Módulo 0 — Introducción |
| 3 | `supabase/ia-educadores-module-1.sql` | Módulo 1 — Fundamentos de la IA generativa |
| 4 | `supabase/ia-educadores-module-2.sql` | Módulo 2 — Ingeniería de prompts para el aula |
| 5 | `supabase/ia-educadores-module-3.sql` | Módulo 3 — Planeación de clases y material didáctico |
| 6 | `supabase/ia-educadores-module-4.sql` | Módulo 4 — Evaluación y retroalimentación con IA |
| 7 | `supabase/ia-educadores-module-5.sql` | Módulo 5 — Atención a la diversidad con IA |
| 8 | `supabase/ia-educadores-module-6.sql` | Módulo 6 — Ética, sesgos y uso responsable (incluye el apartado sobre IA en estudiantes) |
| 9 | `supabase/ia-educadores-module-7.sql` | Módulo 7 — Caja de herramientas docente |
| 10 | `supabase/ia-educadores-module-8.sql` | Módulo 8 — Proyecto final y certificación |

Los 10 son seguros de correr más de una vez (los `UPDATE` se
sobrescriben y los `INSERT` usan `on conflict do nothing`), así que si
algo falla a mitad de camino puedes volver a correr ese mismo archivo
sin miedo a duplicar nada.

**No hace falta desplegar ninguna función nueva ni tocar Edge
Functions** — este curso usa exactamente la misma infraestructura
(`submit-quiz`, `submit-closing-form`, `update-lesson-step`) que ya
está desplegada y funcionando para Pre-ICFES.

## 3. Sube los archivos a GitHub

Desde tu Mac (Terminal, en la carpeta del sitio):

```bash
cd ~/Documents/"Web Nixon"/sitio
git add -A
git commit -m "Contenido completo del curso IA para Educadores (9 módulos) + precio $420.000"
git push
```

## 4. Activa el botón de compra

Ya lo dejé activado en `tienda.html` (pasó de "Próximamente" a "Modo
prueba", igual que Pre-ICFES e Inglés A2) — es parte de este mismo
cambio, así que solo falta que hagas el `git push` del paso 3 para que
se vea en producción.

## 5. Cómo probarlo

1. Entra al Campus con una cuenta matriculada en "IA para Educadores"
   (o asígnate el curso gratis desde el panel admin).
2. Abre el módulo **"Introducción"**.
3. Deberías ver la bienvenida con la guía rápida. Recorre el flujo
   completo: 2 lecturas → quiz → interactivo (toca las tarjetas) →
   quiz → lectura de práctica → formulario de cierre.
4. Al enviar el formulario, si aprobaste los dos quizzes (75% cada
   uno), debe desbloquear el módulo 1. Repite en los módulos 1 a 8.
5. En el módulo 8 (Proyecto final), el formulario de cierre pide 5
   campos en vez de 4 — es la entrega del proyecto, no solo reflexión.
6. Si cierras el navegador a la mitad, al volver deberías retomar en
   el mismo paso.

## Qué revisar y decirme

- Si el tono, extensión y dificultad de las 9 lecciones te parece
  correcto (mismo criterio que usaste para aprobar Pre-ICFES).
- Si el apartado del Módulo 6 sobre IA en estudiantes se ve bien
  integrado dentro de la lectura de práctica.
- Si el proyecto final (Módulo 8) necesita ajustes en el formulario
  de entrega o en la rúbrica.
- Cuando confirmes que todo se ve bien, avísame para seguir con el
  siguiente curso (Cambridge Ready, o ampliar Pre-ICFES/Inglés A2).
