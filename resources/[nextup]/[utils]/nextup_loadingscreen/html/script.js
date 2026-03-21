/* ============================================================
   NextUp RP — Loading Screen Script
   Luistert naar FiveM NUI events voor echte laadvoortgang
   ============================================================ */

// ── CONFIG (pas dit aan voor jouw server) ──────────────────
const CONFIG = {
  serverName:   'NextUp RP',
  maxPlayers:   128,
  discordUrl:   'https://discord.gg/jouwlink',
  websiteUrl:   'https://jouwwebsite.nl',
  forumUrl:     'https://forum.jouwwebsite.nl',
  // Simuleer spelers als er geen API is
  simulatedPlayers: 94,
};

// ── ELEMENTEN ──────────────────────────────────────────────
const fillEl    = document.getElementById('progress-fill');
const pctEl     = document.getElementById('load-pct');
const labelEl   = document.getElementById('load-label');
const feedEl    = document.getElementById('feed-container');
const playersEl = document.getElementById('stat-players');
const slotsEl   = document.getElementById('stat-slots');

// ── FIVEM LAAD-EVENTS ─────────────────────────────────────
// FiveM stuurt deze events automatisch naar de NUI
window.addEventListener('message', function(e) {
  const data = e.data;
  if (!data || !data.eventName) return;

  switch (data.eventName) {
    // Laadpercentage (0–100)
    case 'loadProgress':
      setProgress(data.loadFraction * 100, data.loadText || '');
      break;

    // Alle resources geladen
    case 'startFadeOut':
      setProgress(100, 'VERBONDEN — WERELD BETREDEN');
      setTimeout(() => {
        document.body.style.transition = 'opacity 1s ease';
        document.body.style.opacity = '0';
      }, 800);
      break;
  }
});

// Officieel FiveM loadscreen event formaat
window.addEventListener('DOMContentLoaded', function() {
  // FiveM geeft loadFraction via window.loadFraction
  if (typeof window.loadFraction !== 'undefined') {
    setProgress(window.loadFraction * 100, window.loadText || '');
  }
});

// Polyfill voor oudere FiveM builds
if (typeof window.on === 'function') {
  window.on('loadProgress', function(data) {
    setProgress(data.loadFraction * 100, data.loadText || '');
  });
}

// ── VOORTGANGSBALK ────────────────────────────────────────
const loadStages = [
  'INITIALISEREN...',
  'CORE SCRIPTS LADEN',
  'TEXTUREN STREAMEN',
  'VOERTUIGPAKKET LADEN',
  'SPELERDATA SYNCHRONISEREN',
  'WERELD OBJECTEN LADEN',
  'CUSTOM SHADERS TOEPASSEN',
  'INTEGRITEIT CONTROLEREN',
  'VERBINDING AFRONDEN',
  'KLAAR — WERELD BETREDEN',
];

let currentPct = 0;

function setProgress(pct, text) {
  pct = Math.min(100, Math.max(0, Math.round(pct)));
  currentPct = pct;
  fillEl.style.width = pct + '%';
  pctEl.textContent  = pct + '%';
  if (text && text.length > 0) {
    labelEl.textContent = text.toUpperCase();
  } else {
    // Kies automatisch een label op basis van percentage
    const idx = Math.min(
      Math.floor((pct / 100) * (loadStages.length - 1)),
      loadStages.length - 1
    );
    labelEl.textContent = loadStages[idx];
  }
}

// Simuleer voortgang als er geen FiveM events komen (preview/dev mode)
(function simulateFallback() {
  // Als na 2s nog geen enkel event is ontvangen, starten we simulatie
  let receivedEvent = false;
  window.addEventListener('message', () => { receivedEvent = true; });

  setTimeout(() => {
    if (receivedEvent) return;
    let sim = 0;
    const steps = [5, 14, 23, 36, 49, 61, 73, 84, 93, 100];
    let i = 0;
    function next() {
      if (i >= steps.length) return;
      setProgress(steps[i++], '');
      if (i < steps.length) {
        setTimeout(next, 700 + Math.random() * 900);
      }
    }
    setTimeout(next, 400);
  }, 2000);
})();

// ── SPELERSAANTAL ─────────────────────────────────────────
slotsEl.textContent = CONFIG.maxPlayers;

let playerCount = 0;
const playerTarget = CONFIG.simulatedPlayers;
const counterInterval = setInterval(() => {
  playerCount = Math.min(playerCount + Math.ceil(playerTarget / 30), playerTarget);
  playersEl.textContent = playerCount;
  if (playerCount >= playerTarget) clearInterval(counterInterval);
}, 40);

// ── LIVE FEED ─────────────────────────────────────────────
const feedEvents = [
  { dot: '',       text: 'Jaden_Brooks heeft zich aangemeld als politieagent' },
  { dot: 'red',    text: 'Alarm geactiveerd bij Fleeca Bank — Centrale Weg' },
  { dot: '',       text: 'Luna_Vasquez heeft een voertuig gekocht: Sultan RS' },
  { dot: 'purple', text: 'Event: Illegale races starten over 10 minuten' },
  { dot: '',       text: 'Marcus_Webb heeft een appartement gehuurd in Pillbox' },
  { dot: 'red',    text: 'Achtervolging actief — Eenheid 4 gevraagd' },
  { dot: '',       text: 'Nieuwe factie goedgekeurd: Eastside Collective' },
  { dot: 'purple', text: 'Heist completed — $340.000 buit gemeld' },
  { dot: '',       text: 'Sofia_Reyes gestart als ambulancemedewerker' },
  { dot: 'red',    text: 'Schietpartij gemeld nabij Grove Street — 3 gewonden' },
];

const MAX_FEED = 4;
let feedIdx = 0;

function addFeedItem() {
  if (feedIdx >= feedEvents.length) feedIdx = 0;
  const ev = feedEvents[feedIdx++];
  const now = new Date();
  const t = now.getHours().toString().padStart(2,'0') + ':' + now.getMinutes().toString().padStart(2,'0');

  while (feedEl.children.length >= MAX_FEED) {
    feedEl.removeChild(feedEl.firstChild);
  }

  const div = document.createElement('div');
  div.className = 'feed-item';
  div.style.animationDelay = '0s';
  div.innerHTML =
    `<span class="feed-time">${t}</span>` +
    `<span class="feed-dot ${ev.dot}">◆</span>` +
    `<span>${ev.text}</span>`;
  feedEl.appendChild(div);
}

// Start feed
for (let i = 0; i < 3; i++) setTimeout(addFeedItem, i * 300 + 600);
setInterval(addFeedItem, 4000);

// ── SOCIAL BUTTONS ────────────────────────────────────────
document.querySelectorAll('.social-btn').forEach((btn, i) => {
  btn.addEventListener('click', () => {
    const urls = [CONFIG.discordUrl, CONFIG.websiteUrl, CONFIG.forumUrl];
    if (urls[i]) window.open(urls[i], '_blank');
  });
});
