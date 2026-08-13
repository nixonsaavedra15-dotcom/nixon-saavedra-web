// ============================================================
// Botones de "Compartir" por curso — Campus Saavedra
// ============================================================
// Qué hace: pinta 2 botones dentro de cada <div class="share-row">
// que tenga los data-atributos (data-title, data-desc, data-price,
// data-img) — uno para WhatsApp y otro para "Compartir en redes".
//
// A propósito, NO comparten la URL de la página: usan la Web Share
// API nativa del navegador (navigator.share) para enviar la IMAGEN
// del curso + el texto (nombre, descripción y precio) directamente
// a la app que el usuario elija (WhatsApp, Instagram, Facebook,
// Mensajes, etc.) — así es como funciona "compartir" de forma
// nativa en el celular, sin pasar por ningún link.
//
// Limitación real (no hay forma de evitarla sin conectar cada red
// social por separado): la Web Share API con archivos (imagen) solo
// funciona en navegadores compatibles, sobre todo en celular. En
// computador, o si el navegador no la soporta, el botón de WhatsApp
// abre wa.me con el texto ya escrito (sin imagen, porque WhatsApp
// Web no acepta adjuntar una imagen por enlace), y el botón
// "Compartir en redes" copia el texto Y la imagen al portapapeles
// (sin descargar nada) para que los pegues donde quieras.
//
// Por qué en computador NO aparecen Facebook/Instagram en el panel de
// compartir: ese panel lo arma el propio macOS/Windows, no el sitio —
// solo lista apps instaladas en el computador que se hayan registrado
// como "extensión para compartir" (AirDrop, Mensajes, Notas...). Meta
// no tiene una app de Mac/Windows para Facebook o Instagram, así que
// nunca van a poder aparecer ahí, sin importar qué haga el código.
// En el celular sí aparecen (si el estudiante tiene la app instalada),
// porque iOS/Android sí las registra como destino para compartir. Por
// eso en computador usamos directamente "copiar al portapapeles":
// deja el texto Y la imagen del curso copiados (sin descargar nada),
// listos para pegar con Cmd+V donde quiera compartirlos.
// ============================================================

function isMobileDevice() {
  return /Android|iPhone|iPad|iPod/i.test(navigator.userAgent);
}

function buildShareText(row) {
  const title = row.dataset.title || '';
  const desc = row.dataset.desc || '';
  const price = row.dataset.price || '';
  return `${title}\n\n${desc}\n\nPrecio: ${price}`;
}

async function tryNativeShare(imgUrl, title, text) {
  if (!navigator.share) return false;
  try {
    if (navigator.canShare && imgUrl) {
      try {
        const resp = await fetch(imgUrl);
        if (resp.ok) {
          const blob = await resp.blob();
          const safeName = (title || 'curso').toLowerCase()
            .normalize('NFD').replace(/[̀-ͯ]/g, '')
            .replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '') || 'curso';
          const file = new File([blob], `${safeName}.jpg`, { type: blob.type || 'image/jpeg' });
          if (navigator.canShare({ files: [file] })) {
            await navigator.share({ files: [file], title, text });
            return true;
          }
        }
      } catch (imgErr) {
        // Si la imagen no carga (por ejemplo, todavía no la has subido),
        // seguimos con el share de solo texto en vez de fallar del todo.
      }
    }
    await navigator.share({ title, text });
    return true;
  } catch (err) {
    // El usuario canceló el share nativo — no forzamos ningún fallback.
    return true;
  }
}

// Convierte cualquier imagen a PNG en memoria — el portapapeles del
// navegador solo acepta copiar imágenes de forma confiable como PNG.
async function toPngBlob(blob) {
  const bitmap = await createImageBitmap(blob);
  const canvas = document.createElement('canvas');
  canvas.width = bitmap.width;
  canvas.height = bitmap.height;
  canvas.getContext('2d').drawImage(bitmap, 0, 0);
  return await new Promise((resolve) => canvas.toBlob(resolve, 'image/png'));
}

// Copia el texto Y la imagen del curso al portapapeles en un solo paso
// (sin descargar ningún archivo) — así quien comparte solo tiene que
// pegar (Cmd+V / Ctrl+V) donde quiera: Instagram, Facebook, un correo, etc.
async function fallbackCopyToClipboard(imgUrl, text) {
  const items = { 'text/plain': new Blob([text], { type: 'text/plain' }) };
  let imageIncluded = false;

  if (imgUrl && window.ClipboardItem) {
    try {
      const resp = await fetch(imgUrl);
      if (resp.ok) {
        const rawBlob = await resp.blob();
        items['image/png'] = rawBlob.type === 'image/png' ? rawBlob : await toPngBlob(rawBlob);
        imageIncluded = true;
      }
    } catch (e) {
      // Si la imagen no se puede leer/convertir, seguimos solo con el texto.
    }
  }

  try {
    await navigator.clipboard.write([new ClipboardItem(items)]);
    alert(
      imageIncluded
        ? 'Copiamos el texto y la imagen del curso a tu portapapeles — pégalos (Cmd+V) donde quieras compartir.'
        : 'Copiamos la descripción del curso a tu portapapeles.'
    );
    return;
  } catch (e) {
    // Algunos navegadores no dejan copiar imagen+texto juntos — al menos
    // dejamos el texto copiado en vez de fallar del todo.
  }

  try {
    await navigator.clipboard.writeText(text);
    alert('Copiamos la descripción del curso a tu portapapeles.');
  } catch (e) {
    alert('No pudimos copiar automáticamente — selecciona el texto y la imagen de la página para compartirlos tú mismo.');
  }
}

async function shareCourseWhatsapp(btn) {
  const row = btn.closest('.share-row');
  const text = buildShareText(row);
  const imgUrl = row.dataset.img;

  // El panel nativo con archivo solo vale la pena en celular (ver nota
  // arriba) — en computador vamos directo a wa.me con el texto listo.
  if (isMobileDevice()) {
    const shared = await tryNativeShare(imgUrl, row.dataset.title, text);
    if (shared) return;
  }

  window.open('https://wa.me/?text=' + encodeURIComponent(text), '_blank', 'noopener');
}

async function shareCourseGeneric(btn) {
  const row = btn.closest('.share-row');
  const text = buildShareText(row);
  const imgUrl = row.dataset.img;

  // Igual aquí: en computador el panel nativo no tiene redes sociales
  // (es una limitación del sistema operativo, no del sitio — ver nota
  // arriba), así que copiar texto+imagen al portapapeles es lo que de
  // verdad sirve.
  if (isMobileDevice()) {
    const shared = await tryNativeShare(imgUrl, row.dataset.title, text);
    if (shared) return;
  }

  await fallbackCopyToClipboard(imgUrl, text);
}

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.share-row').forEach((row) => {
    row.innerHTML = `
      <button type="button" class="share-btn share-whatsapp" onclick="shareCourseWhatsapp(this)">
        Compartir por WhatsApp
      </button>
      <button type="button" class="share-btn share-generic" onclick="shareCourseGeneric(this)">
        Compartir en redes
      </button>
    `;
  });
});
