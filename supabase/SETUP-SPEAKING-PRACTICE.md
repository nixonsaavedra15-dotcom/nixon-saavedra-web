# Cómo montar la práctica de Speaking (grabadora en vivo, $0 de costo)

Cómo quedó, en corto: el estudiante habla en voz alta, el propio navegador (Chrome/Edge) transcribe en vivo con la Web Speech API — gratis, sin llave de API, sin subir audio a ningún lado —, y la nota (0-100) la calcula el servidor por reglas: cuántas palabras dijo, cuánto tiempo habló, y cuántas de las palabras/frases clave esperadas mencionó. Es una práctica **formativa**: da retroalimentación inmediata pero no bloquea el avance de la lección (a propósito, como pediste que fuera gratis e inmediato).

## 1. Correr el SQL — en Supabase → SQL Editor, en este orden

1. `speaking-practice-schema.sql` — crea la tabla `speaking_attempts`.
2. `speaking-practice-content.sql` — agrega las 2 tareas de práctica (entrevista Parte 1 + tarea colaborativa Parte 2) al módulo de Speaking.

## 2. Desplegar la función nueva

```bash
supabase functions deploy submit-speaking-attempt
```

## 3. Subir los cambios de `leccion.html`

Ya quedó editado: el paso "Práctica" del módulo de Speaking ahora muestra, debajo del contenido normal, una grabadora por cada tarea (botón "Empezar a grabar" → habla → "Detener grabación" → nota y retroalimentación al instante).

```bash
git add .
git commit -m "Práctica de Speaking con grabadora + transcripción en vivo"
git push
```

## Cómo probarlo

1. Entra como estudiante al módulo de Speaking → avanza hasta el paso "Práctica".
2. Debe aparecer, debajo del caso real de siempre, una tarjeta "🎙️ Practica hablando en voz alta" con las 2 tareas.
3. Usa **Chrome o Edge** (Safari y Firefox no tienen la Web Speech API — el sitio les avisa con un mensaje si no es compatible, pero el resto del curso funciona igual en cualquier navegador).
4. Dale "Empezar a grabar", habla en inglés, dale "Detener grabación" → deberías ver tu nota, cuánto hablaste, cuántas palabras dijiste y cuáles de las palabras clave detectó.

## Limitaciones que debes conocer (para explicarles a tus estudiantes si preguntan)

- **No evalúa gramática ni pronunciación real** — solo mide si hablaste lo suficiente y si tocaste los temas/palabras clave esperadas. Es un empujón para que practiquen en voz alta, no un examinador de Cambridge.
- **Requiere Chrome o Edge** y permiso de micrófono del navegador.
- La Web Speech API de Chrome, aunque no tiene costo ni pide llave de API, sí envía el audio a los servidores de Google para transcribirlo (así funciona internamente) — no es 100% "todo en tu dispositivo", pero no te cuesta nada a ti ni al estudiante.

## Si más adelante quieres subir el nivel

Cuando quieras (no es necesario ahora), se puede mejorar por fases sin rehacer nada de esto:
1. Guardar el audio grabado (además de la transcripción) para que tú puedas escucharlo desde el panel admin.
2. Mandar la transcripción a un modelo de IA barato (Claude Haiku) para que dé una nota real de gramática/fluidez — cuesta una fracción de centavo por intento, y solo necesitarías darme una llave de API.
3. Reemplazar la transcripción del navegador por un servicio más preciso (Whisper) si el reconocimiento de acentos te empieza a quedar corto.

Todo esto son capas que se agregan encima de lo que ya está montado — no hay que romper nada para subir de nivel después.
