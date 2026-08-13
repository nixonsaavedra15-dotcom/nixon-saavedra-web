# Guiones de audio — Listening, Inglés B1

Un guion por unidad, listo para grabar en ElevenLabs (mismo proceso que Cambridge A2 Key). Cada guion está pensado para 45-90 segundos de audio, con vocabulario y gramática de la unidad correspondiente.

Cómo se integra en el sitio: una vez grabado el audio (mp3) y subido a Supabase Storage, se agrega el campo `"audio_url": "..."` dentro del paso `reading1` o `reading2` del `lesson_json` de cada unidad (el reproductor con límite de reproducciones ya existe en `leccion.html`, solo hace falta la URL). Esto se hace en un batch de SQL de actualización aparte, después de que Nixon tenga los audios listos — no se corre nada de esto todavía.

---

## Unidad 1 — Daily Life & Routines
**Voz sugerida:** una persona relajada, ritmo normal.

> Hi, I'm Marco. Let me tell you about my typical day. I usually wake up at six thirty and go for a short run before breakfast. I always have coffee and toast, and then I head to work — I work as a graphic designer, so most days I'm sitting at my computer for hours. I rarely eat lunch out; I usually bring something from home. In the evenings, I sometimes go to the gym, but more often than not, I just relax and watch a series with my partner. On weekends, my routine changes completely — I tend to sleep in and spend more time outdoors.

## Unidad 2 — Stories From the Past
**Voz sugerida:** tono narrativo, con algo de emoción al llegar al giro de la historia.

> So, guess what happened to me last month. I was walking to the bus stop when it suddenly started to rain — really hard. I didn't have an umbrella, so I ran to the nearest shop. While I was standing there, waiting for the rain to stop, I ran into my old university roommate! We hadn't seen each other in almost five years. We ended up talking for over an hour, completely forgot about the rain, and now we meet for coffee every couple of weeks. To make a long story short, sometimes the most annoying moments turn into the best surprises.

## Unidad 3 — What's Coming Next
**Voz sugerida:** entusiasta, hablando de planes.

> I have some exciting news — I'm finally going to visit Japan next spring! I've been saving money for almost two years, and I'm planning to stay for three weeks. I'm going to visit Tokyo first, and then I'll take the train to Kyoto. If everything goes well, I'll also try to see Mount Fuji. I haven't booked the flights yet, but I will as soon as I finish planning the itinerary. Chances are I'll travel alone, but a friend might join me for part of the trip — we're still figuring that out.

## Unidad 4 — Travelling
**Voz sugerida:** informativo, tipo anuncio de aeropuerto o guía turística.

> Excuse me, could you help me? I've just arrived and I'm not sure how to get to the city centre. Oh, sure — you have two options. You can take the airport train, which takes about twenty-five minutes, or a taxi, which is faster but more expensive. If you've never used the train here before, don't worry, it's very easy to figure out — just follow the signs to the platform. By the way, have you been to this city before? No, this is my first time. I've heard the old town is beautiful, so I'm planning to explore it on my first day.

## Unidad 5 — The World of Work
**Voz sugerida:** entrevistador y candidato, tono profesional.

> So, tell me a little about yourself and why you applied for this position. Well, I have three years of experience in marketing, and I've always been interested in your company's projects. I have to say, I really admire how you handle social media campaigns. That's great to hear. Now, what would you say is your biggest strength? I'd say I'm very organised — I always meet my deadlines, and I'm good at managing several projects at once. And is there anything you should improve? Honestly, I sometimes take on too many tasks at once, but I've been working on saying no when necessary.

## Unidad 6 — Health & Lifestyle
**Voz sugerida:** doctor y paciente, tono calmado.

> So, how have you been feeling lately? Honestly, not great. I've been feeling tired all the time, even when I sleep eight hours. Have you been drinking enough water during the day? Not really, I probably don't drink enough. Okay, well, if I were you, I'd start by drinking more water and cutting down on coffee in the afternoon — it might be affecting your sleep quality. You should also try to get some exercise, even just a short walk every day. It doesn't have to be intense, but it will help your energy levels a lot.

## Unidad 7 — Technology & Communication
**Voz sugerida:** tipo podcast, tono reflexivo.

> Welcome back to the show. Today we're talking about how technology has changed the way we communicate. Smartphones are used by billions of people, and honestly, face-to-face conversations are being replaced by screens more and more. But is that necessarily bad? On one hand, we can stay connected with people who live far away — something that wasn't easy before. On the other hand, some experts say we should have phone-free hours, especially at home. What do you think? I think it's about balance — technology isn't the problem, it's how we use it.

## Unidad 8 — Environment & Society
**Voz sugerida:** debate ligero entre dos personas, tono cordial.

> I think if more people recycled properly, we'd have a lot less waste in landfills. I agree, but I also think companies need to change first — individual actions matter, but they're not enough on their own. That's true. If I were in charge of a company, I'd make sustainable packaging mandatory. That's a great idea. Honestly, the most important thing is that we all do our part, even small actions add up over time. Exactly — every little helps, as they say.

## Unidad 9 — Relationships & Feelings
**Voz sugerida:** conversación entre amigos, tono cercano y emocional.

> Hey, are you okay? You seem a bit down today. Not really. I had an argument with my sister yesterday. She told me she felt like I never had time for her anymore. Oh no, what did you say? I explained that I've been really stressed with work, but I apologised too, because she was right — I have been distant lately. That's good that you talked about it. Yeah, we ended up making up, and I told her I'd try to check in with her more often. Honest conversations are hard, but they're worth it.

## Unidad 10 — Culture & Celebrations
**Voz sugerida:** tono cálido, como contando una tradición familiar.

> Every year, my family gets together for a big celebration in December. We've done it the same way for as long as I can remember — my grandmother cooks the same recipes, and we always play the same old songs. Once in a blue moon, we try something new, but honestly, everyone prefers the traditional way. It's a piece of cake to understand why: it's not really about the food or the music, it's about being together. If we ever skipped it, the whole family would be over the moon with disappointment!

## Unidad 11 — Final Review & Certification
**Voz sugerida:** tono reflexivo y cálido, como cierre de curso.

> When I started learning English, I could barely introduce myself. Now, months later, I can talk about my past, my plans, and even hypothetical situations. I've made a lot of mistakes along the way, and I'll probably keep making them — but that's how you really learn a language. If I hadn't practised a little every day, I wouldn't have improved this much. My advice? Don't wait until you feel ready to speak — you'll never feel completely ready. Just start, and the confidence comes later.

---

### Notas para grabar
- Ritmo natural, ni muy lento ni muy rápido — el objetivo es que se entienda como una conversación o narración real, no un audio de examen artificial.
- Duración aproximada: 45-90 segundos por guion.
- Formato de archivo sugerido: mp3, mismo estándar usado en Cambridge A2 Key.
- Una vez grabados, avísame y genero el batch de SQL que agrega cada `audio_url` al `lesson_json` correspondiente.
