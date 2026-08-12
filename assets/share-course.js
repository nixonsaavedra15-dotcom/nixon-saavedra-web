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
// "Compartir en redes" copia el texto al portapapeles y descarga la
// imagen para que la pegues/adjuntes tú mismo donde quieras.
// ============================================================

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
          const file = new File([blob], 'curso.jpg', { type: blob.type || 'image/jpeg' });
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

async function fallbackCopyAndDownload(imgUrl, text) {
  try {
    await navigator.clipboard.writeText(text);
  } catch (e) {
    /* portapapeles no disponible, seguimos igual */
  }
  if (imgUrl) {
    const a = document.createElement('a');
    a.href = imgUrl;
    a.download = '';
    document.body.appendChild(a);
    a.click();
    a.remove();
  }
  alert('Copiamos la descripción del curso a tu portapapeles y descargamos la imagen — pégalas donde quieras compartir.');
}

async function shareCourseWhatsapp(btn) {
  const row = btn.closest('.share-row');
  const text = buildShareText(row);
  const imgUrl = row.dataset.img;

  const shared = await tryNativeShare(imgUrl, row.dataset.title, text);
  if (shared) return;

  window.open('https://wa.me/?text=' + encodeURIComponent(text), '_blank', 'noopener');
}

async function shareCourseGeneric(btn) {
  const row = btn.closest('.share-row');
  const text = buildShareText(row);
  const imgUrl = row.dataset.img;

  const shared = await tryNativeShare(imgUrl, row.dataset.title, text);
  if (shared) return;

  await fallbackCopyAndDownload(imgUrl, text);
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
