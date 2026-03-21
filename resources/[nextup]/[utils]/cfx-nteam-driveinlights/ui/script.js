let isOpen = false;
let currentConfig = null;
let resourceName = 'uifinal';

// ─── Central fetch helper ────────────────────────────────────────────────────
function postToLua(endpoint, data = {}) {
    return fetch(`https://${resourceName}/${endpoint}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify(data)
    });
}

// ─── Config field maps (single source of truth) ──────────────────────────────
const TEXT_FIELDS = [
    { id: 'configTitle',            key: 'title',            target: 'titleText',       fallback: 'Drive-In Light Controller' },
    { id: 'configSwitchLabel',      key: 'switchLabel',      target: 'switchLabelText', fallback: 'Lights Status' },
    { id: 'configSwitchOff',        key: 'switchOff',        target: 'switchOffText',   fallback: 'OFF' },
    { id: 'configSwitchOn',         key: 'switchOn',         target: 'switchOnText',    fallback: 'ON' },
    { id: 'configTotalLightsLabel', key: 'totalLightsLabel', target: 'totalLightsText', fallback: 'Total Lights:' },
    { id: 'configStatusLabel',      key: 'statusLabel',      target: 'statusLabelText', fallback: 'Status:' },
    { id: 'configStatusActive',     key: 'statusActive',     target: null,              fallback: 'Active' },
    { id: 'configStatusInactive',   key: 'statusInactive',   target: null,              fallback: 'Inactive' },
];

const COLOR_FIELDS = [
    { id: 'configTitleColor',    key: 'titleColor',            fallback: '#f8fafc' },
    { id: 'configSwitchOffColor',key: 'switchOffColor',        fallback: '#ef4444' },
    { id: 'configSwitchOnColor', key: 'switchOnColor',         fallback: '#10b981' },
    { id: 'configHighlightColor',key: 'highlightColor',        fallback: '#60a5fa' },
    { id: 'configPanelBgStart',  key: 'panelBackgroundStart',  fallback: '#1e293b' },
    { id: 'configPanelBgEnd',    key: 'panelBackgroundEnd',    fallback: '#334155' },
    { id: 'configHeaderBgStart', key: 'headerBackgroundStart', fallback: '#0f172a' },
    { id: 'configHeaderBgEnd',   key: 'headerBackgroundEnd',   fallback: '#1e293b' },
    { id: 'configInfoPanelBg',   key: 'infoPanelBackground',   fallback: '#0f172a' },
];

// ─── Message listener ────────────────────────────────────────────────────────
window.addEventListener('message', ({ data }) => {
    switch (data.type) {
        case 'openUI':       openUI(data.propsActive, data.config); break;
        case 'closeUI':      closeUI(); break;
        case 'openConfigUI': openConfigUI(data.config); break;
        case 'updateUI':     updateUIState(data.propsActive, data.statusText, data.statusColor); break;
        case 'setResourceName': resourceName = data.name; break;
    }
});

// ─── Open / Close ─────────────────────────────────────────────────────────────
function openUI(propsActive, config) {
    if (config) { currentConfig = config; applyConfig(config); }

    document.getElementById('container').classList.remove('hidden');
    setToggleState(propsActive, config);
    isOpen = true;
}

function openConfigUI(config) {
    if (config) { currentConfig = config; populateConfigForm(config); }
    document.getElementById('configContainer').classList.remove('hidden');
    isOpen = true;
}

function closeUI() {
    document.getElementById('container').classList.add('hidden');
    document.getElementById('configContainer').classList.add('hidden');
    isOpen = false;
    postToLua('closeUI');
}

// ─── State helpers ────────────────────────────────────────────────────────────
function setToggleState(propsActive, config = currentConfig) {
    const toggle = document.getElementById('propsToggle');
    const statusEl = document.getElementById('statusText');
    if (!toggle || !statusEl) return;

    toggle.checked = propsActive;
    statusEl.textContent = propsActive
        ? (config?.Text?.statusActive   || 'Active')
        : (config?.Text?.statusInactive || 'Inactive');
    statusEl.style.color = propsActive
        ? (config?.Colors?.switchOnColor  || '#10b981')
        : (config?.Colors?.switchOffColor || '#ef4444');
}

function updateUIState(propsActive, statusText, statusColor) {
    const toggle   = document.getElementById('propsToggle');
    const statusEl = document.getElementById('statusText');
    if (toggle)   toggle.checked         = propsActive;
    if (statusEl) { statusEl.textContent = statusText; statusEl.style.color = statusColor; }
}

// ─── Apply config to live UI ──────────────────────────────────────────────────
function applyConfig(config) {
    if (!config) return;

    // Text
    if (config.Text) {
        TEXT_FIELDS.forEach(({ key, target, fallback }) => {
            if (!target) return;
            const el = document.getElementById(target);
            if (el) el.textContent = config.Text[key] || fallback;
        });
    }

    // Colors
    if (config.Colors) {
        const c   = config.Colors;
        const root = document.documentElement;

        root.style.setProperty('--title-color',      c.titleColor       || '#f8fafc');
        root.style.setProperty('--switch-off-color',  c.switchOffColor   || '#ef4444');
        root.style.setProperty('--switch-on-color',   c.switchOnColor    || '#10b981');
        root.style.setProperty('--highlight-color',   c.highlightColor   || '#60a5fa');

        if (c.panelBackgroundStart && c.panelBackgroundEnd) {
            const panelBg = `linear-gradient(135deg, ${c.panelBackgroundStart} 0%, ${c.panelBackgroundEnd} 100%)`;
            document.querySelectorAll('.panel, .config-panel').forEach(el => el.style.background = panelBg);
        }

        if (c.headerBackgroundStart && c.headerBackgroundEnd) {
            const headerBg = `linear-gradient(135deg, ${c.headerBackgroundStart} 0%, ${c.headerBackgroundEnd} 100%)`;
            document.querySelectorAll('.header').forEach(el => el.style.background = headerBg);
        }

        if (c.infoPanelBackground) {
            document.querySelectorAll('.info').forEach(el => el.style.background = c.infoPanelBackground);
        }

        // Direct element colors (CSS vars as fallback already set above)
        const titleEl = document.getElementById('titleText');
        if (titleEl) titleEl.style.color = c.titleColor || '#f8fafc';
        document.querySelector('.switch-text.off').style.color = c.switchOffColor || '#ef4444';
        document.querySelector('.switch-text.on').style.color  = c.switchOnColor  || '#10b981';
        document.querySelectorAll('.highlight').forEach(el => el.style.color = c.highlightColor || '#60a5fa');
    }
}

// ─── Config form helpers ──────────────────────────────────────────────────────
function populateConfigForm(config) {
    if (!config) return;

    if (config.Text) {
        TEXT_FIELDS.forEach(({ id, key, fallback }) => {
            const el = document.getElementById(id);
            if (el) el.value = config.Text[key] || fallback;
        });
    }

    if (config.Colors) {
        COLOR_FIELDS.forEach(({ id, key, fallback }) => {
            const el = document.getElementById(id);
            if (el) el.value = config.Colors[key] || fallback;
        });
    }
}

function readConfigForm() {
    const text   = {};
    const colors = {};
    TEXT_FIELDS.forEach(({ id, key }) => {
        const el = document.getElementById(id);
        if (el) text[key] = el.value;
    });
    COLOR_FIELDS.forEach(({ id, key }) => {
        const el = document.getElementById(id);
        if (el) colors[key] = el.value;
    });
    return { text, colors };
}

// ─── DOM event listeners ──────────────────────────────────────────────────────
document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('closeBtn').addEventListener('click', closeUI);
    document.getElementById('configCloseBtn').addEventListener('click', closeUI);

    document.getElementById('propsToggle').addEventListener('change', function () {
        setToggleState(this.checked);
        postToLua('toggleProps', { state: this.checked });
    });

    document.getElementById('saveConfigBtn').addEventListener('click', () => {
        postToLua('saveConfig', readConfigForm());
        closeUI();
    });

    document.getElementById('resetConfigBtn').addEventListener('click', () => {
        postToLua('resetConfig');
        closeUI();
    });

    document.addEventListener('keydown', e => {
        if (e.key === 'Escape' && isOpen) closeUI();
    });

    // Click-outside-to-close
    ['container', 'configContainer'].forEach(id => {
        document.getElementById(id).addEventListener('click', e => {
            if (e.target === e.currentTarget) closeUI();
        });
    });
});

// Prevent panel click from bubbling to container overlay
document.querySelector('.panel').addEventListener('click', e => e.stopPropagation());
document.querySelector('.config-panel').addEventListener('click', e => e.stopPropagation());