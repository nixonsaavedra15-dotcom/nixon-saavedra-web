// ============================================================
// Ilustraciones SVG por tema — Campus Saavedra
// ============================================================
// Ilustraciones decorativas, livianas (sin archivos externos) y en
// la misma paleta del sitio, para que cada módulo/pregunta se sienta
// menos plano. Se insertan como HTML inline (no <img>), así que los
// colores usan las variables CSS del sitio y heredan el tema.
// ============================================================

const ILUSTRACIONES = {
  intro: `
    <svg viewBox="0 0 240 180" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="120" cy="90" r="72" fill="var(--gold)" opacity=".14"/>
      <path d="M60 120 L60 55 Q60 45 70 45 L120 45 L120 130 L70 130 Q60 130 60 120Z" fill="var(--bg)" stroke="var(--gold)" stroke-width="3"/>
      <path d="M180 120 L180 55 Q180 45 170 45 L120 45 L120 130 L170 130 Q180 130 180 120Z" fill="var(--bg-alt)" stroke="var(--gold)" stroke-width="3"/>
      <line x1="80" y1="65" x2="105" y2="65" stroke="var(--gold)" stroke-width="3" stroke-linecap="round"/>
      <line x1="80" y1="80" x2="105" y2="80" stroke="var(--gold)" stroke-width="3" stroke-linecap="round" opacity=".6"/>
      <line x1="135" y1="65" x2="160" y2="65" stroke="var(--gold)" stroke-width="3" stroke-linecap="round"/>
      <line x1="135" y1="80" x2="160" y2="80" stroke="var(--gold)" stroke-width="3" stroke-linecap="round" opacity=".6"/>
      <circle cx="120" cy="45" r="6" fill="var(--wine)"/>
    </svg>`,

  grammar: `
    <svg viewBox="0 0 240 180" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="120" cy="90" r="72" fill="var(--steel)" opacity=".13"/>
      <rect x="66" y="50" width="108" height="80" rx="10" fill="var(--bg)" stroke="var(--steel)" stroke-width="3"/>
      <text x="90" y="100" font-family="Fraunces, serif" font-size="34" fill="var(--steel)">A</text>
      <path d="M132 78 Q150 70 168 82" stroke="var(--wine)" stroke-width="3" stroke-linecap="round" fill="none"/>
      <path d="M160 76 L168 82 L160 90" stroke="var(--wine)" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
      <text x="132" y="112" font-family="Fraunces, serif" font-size="20" fill="var(--gold)">B</text>
    </svg>`,

  reading: `
    <svg viewBox="0 0 240 180" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="120" cy="90" r="72" fill="var(--wine)" opacity=".12"/>
      <path d="M120 55 C104 45 76 45 62 52 L62 122 C76 115 104 115 120 125 Z" fill="var(--bg)" stroke="var(--wine)" stroke-width="3"/>
      <path d="M120 55 C136 45 164 45 178 52 L178 122 C164 115 136 115 120 125 Z" fill="var(--bg-alt)" stroke="var(--wine)" stroke-width="3"/>
      <line x1="120" y1="55" x2="120" y2="125" stroke="var(--wine)" stroke-width="3"/>
      <line x1="70" y1="68" x2="105" y2="63" stroke="var(--wine)" stroke-width="2.5" opacity=".7"/>
      <line x1="70" y1="82" x2="105" y2="77" stroke="var(--wine)" stroke-width="2.5" opacity=".7"/>
      <line x1="135" y1="63" x2="170" y2="68" stroke="var(--wine)" stroke-width="2.5" opacity=".7"/>
      <line x1="135" y1="77" x2="170" y2="82" stroke="var(--wine)" stroke-width="2.5" opacity=".7"/>
    </svg>`,

  listening: `
    <svg viewBox="0 0 240 180" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="120" cy="90" r="72" fill="var(--gold)" opacity=".14"/>
      <path d="M75 95 L75 80 Q75 45 120 45 Q165 45 165 80 L165 95" stroke="var(--gold)" stroke-width="6" fill="none" stroke-linecap="round"/>
      <rect x="62" y="90" width="24" height="38" rx="10" fill="var(--bg)" stroke="var(--gold)" stroke-width="3"/>
      <rect x="154" y="90" width="24" height="38" rx="10" fill="var(--bg)" stroke="var(--gold)" stroke-width="3"/>
      <path d="M95 115 Q120 140 145 115" stroke="var(--wine)" stroke-width="3" fill="none" stroke-linecap="round" opacity=".7"/>
      <circle cx="95" cy="115" r="3" fill="var(--wine)"/>
      <circle cx="145" cy="115" r="3" fill="var(--wine)"/>
    </svg>`,

  speaking: `
    <svg viewBox="0 0 240 180" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="120" cy="90" r="72" fill="var(--steel)" opacity=".13"/>
      <path d="M60 60 Q60 48 72 48 L148 48 Q160 48 160 60 L160 96 Q160 108 148 108 L96 108 L72 128 L78 108 L72 108 Q60 108 60 96 Z" fill="var(--bg)" stroke="var(--steel)" stroke-width="3"/>
      <circle cx="90" cy="78" r="5" fill="var(--steel)"/>
      <circle cx="115" cy="78" r="5" fill="var(--steel)"/>
      <circle cx="140" cy="78" r="5" fill="var(--steel)"/>
      <path d="M150 60 Q178 65 176 90 Q174 108 155 112" stroke="var(--gold)" stroke-width="3" fill="none" stroke-linecap="round" opacity=".8"/>
    </svg>`,

  writing: `
    <svg viewBox="0 0 240 180" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="120" cy="90" r="72" fill="var(--wine)" opacity=".12"/>
      <rect x="68" y="48" width="90" height="112" rx="6" fill="var(--bg)" stroke="var(--wine)" stroke-width="3"/>
      <line x1="82" y1="72" x2="144" y2="72" stroke="var(--wine)" stroke-width="2.5" opacity=".6"/>
      <line x1="82" y1="86" x2="144" y2="86" stroke="var(--wine)" stroke-width="2.5" opacity=".6"/>
      <line x1="82" y1="100" x2="120" y2="100" stroke="var(--wine)" stroke-width="2.5" opacity=".6"/>
      <path d="M138 118 L172 84 L184 96 L150 130 L134 134 Z" fill="var(--gold)" stroke="var(--ink)" stroke-width="2"/>
      <line x1="168" y1="88" x2="180" y2="100" stroke="var(--bg)" stroke-width="2"/>
    </svg>`,

  exam: `
    <svg viewBox="0 0 240 180" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="120" cy="90" r="72" fill="var(--gold)" opacity=".16"/>
      <rect x="72" y="42" width="96" height="120" rx="8" fill="var(--bg)" stroke="var(--gold)" stroke-width="3"/>
      <circle cx="95" cy="70" r="8" fill="none" stroke="var(--steel)" stroke-width="3"/>
      <path d="M91 70 L94 73 L100 66" stroke="var(--steel)" stroke-width="2.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <line x1="112" y1="70" x2="150" y2="70" stroke="var(--ink)" stroke-width="2.5" opacity=".6"/>
      <circle cx="95" cy="96" r="8" fill="none" stroke="var(--wine)" stroke-width="3"/>
      <line x1="91" y1="92" x2="99" y2="100" stroke="var(--wine)" stroke-width="2.5" stroke-linecap="round"/>
      <line x1="99" y1="92" x2="91" y2="100" stroke="var(--wine)" stroke-width="2.5" stroke-linecap="round"/>
      <line x1="112" y1="96" x2="150" y2="96" stroke="var(--ink)" stroke-width="2.5" opacity=".6"/>
      <circle cx="95" cy="122" r="8" fill="none" stroke="var(--steel)" stroke-width="3"/>
      <path d="M91 122 L94 125 L100 118" stroke="var(--steel)" stroke-width="2.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <line x1="112" y1="122" x2="150" y2="122" stroke="var(--ink)" stroke-width="2.5" opacity=".6"/>
    </svg>`,

  general: `
    <svg viewBox="0 0 240 180" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="90" cy="80" r="54" fill="var(--steel)" opacity=".14"/>
      <circle cx="150" cy="110" r="38" fill="var(--wine)" opacity=".14"/>
      <circle cx="150" cy="60" r="22" fill="var(--gold)" opacity=".22"/>
      <path d="M75 100 L110 70 L145 95 L175 65" stroke="var(--ink)" stroke-width="3" fill="none" stroke-linecap="round" stroke-linejoin="round" opacity=".5"/>
    </svg>`,
};

function obtenerIlustracion(tema) {
  return ILUSTRACIONES[tema] || ILUSTRACIONES.general;
}
