// ============================================================
// Agency Elevator v3 – NUI Controller
// ============================================================

(() => {
'use strict';

// --- DOM refs ---
const $ = id => document.getElementById(id);

const app            = $('elevator-app');
const elevatorName   = $('elevator-name');
const currentFlLabel = $('current-floor-label');
const displayFloor   = $('display-floor');
const floorList      = $('floor-list');
const closeBtn       = $('close-btn');
const travelOverlay  = $('travel-overlay');
const travelTarget   = $('travel-target');
const travelLabel    = $('travel-label');
const travelSub      = $('travel-sub');
const progressBar    = $('progress-bar');
const dirIndicator   = $('direction-indicator');
const footerText     = $('footer-text');
const particlesEl    = $('travel-particles');
const scrollUp       = $('scroll-up');
const scrollDown     = $('scroll-down');

// Configurator refs
const configApp        = $('config-app');
const configTitle      = $('config-title');
const configSubtitle   = $('config-subtitle');
const configCloseBtn   = $('config-close-btn');
const configViewList   = $('config-view-list');
const configViewForm   = $('config-view-form');
const configElevList   = $('config-elevator-list');
const configFloorList  = $('config-floor-list');
const configNewBtn     = $('config-new-btn');
const configBackBtn    = $('config-back-btn');
const configSaveBtn    = $('config-save-btn');
const configCancelBtn  = $('config-cancel-btn');
const configAddFloor   = $('config-add-floor-btn');
const configInputId    = $('config-input-id');
const configInputLabel = $('config-input-label');
const configAutoDetect = $('config-auto-detect-btn');
const configIdLock    = $('config-id-lock');
const configSettingsBtn = $('config-settings-btn');
const configViewSettings = $('config-view-settings');
const settingsElevPos   = $('settings-elevator-pos');
const settingsElevScale = $('settings-elevator-scale');
const settingsElevScaleVal = $('settings-elevator-scale-val');
const settingsConfPos   = $('settings-config-pos');
const settingsConfScale = $('settings-config-scale');
const settingsConfScaleVal = $('settings-config-scale-val');
const settingsAccentColors = $('settings-accent-colors');
const settingsSaveBtn   = $('config-settings-save-btn');
const settingsCancelBtn = $('config-settings-cancel-btn');
const settingsBackBtn   = $('config-settings-back-btn');

// --- State ---
let locale = {};
let currentFloor = 1;
let isOpen = false;
let isConfigOpen = false;
let progressInterval = null;
let configFloors = [];
let configElevators = [];
let editingElevatorId = null; // null = new, string = editing existing
let idLocked = true; // true = auto-generate ID from name
let activeFloors = []; // for keyboard navigation
let kbSelectedIdx = -1; // keyboard highlight index
let currentSettings = {
    elevator_position: 'left',
    elevator_scale: 1.0,
    config_position: 'center',
    config_scale: 1.0,
    accent_color: '#3b82f6',
};

// ============================================================
// LOCALE
// ============================================================

function t(key) { return locale[key] || key; }

function applyLocale(loc) {
    if (!loc) return;
    locale = loc;

    if (footerText) footerText.textContent = t('ui_footer');
    if (configTitle) configTitle.textContent = t('config_title');
    if (configSubtitle) configSubtitle.textContent = t('config_subtitle');

    const el = (id, key) => { const e = $(id); if (e) e.textContent = t(key); };
    el('config-existing-label', 'config_existing');
    el('config-new-label', 'config_new_elevator');
    el('config-back-label', 'config_back');
    el('config-id-label', 'config_elevator_id');
    el('config-label-label', 'config_elevator_label');
    el('config-floors-label', 'config_floors');
    el('config-add-floor-label', 'config_add_floor');
    el('config-cancel-label', 'config_cancel');
    el('config-auto-detect-label', 'config_auto_detect');
    el('config-auto-detect-badge', 'config_auto_detect_desc');
    el('settings-elevator-panel-label', 'settings_elevator_panel');
    el('settings-config-panel-label', 'settings_config_panel');
    el('settings-position-label', 'settings_position');
    el('settings-scale-label', 'settings_scale');
    el('settings-config-position-label', 'settings_position');
    el('settings-config-scale-label', 'settings_scale');
    el('settings-color-label', 'settings_accent_color');
    el('config-settings-save-label', 'settings_save');
    el('config-settings-cancel-label', 'config_cancel');
    el('config-settings-back-label', 'config_back');

    if (configInputId) configInputId.placeholder = t('config_elevator_id_placeholder');
    if (configInputLabel) configInputLabel.placeholder = t('config_elevator_label_placeholder');

    updateSaveButtonLabel();
}

function updateSaveButtonLabel() {
    const lbl = $('config-save-label');
    if (lbl) lbl.textContent = editingElevatorId ? t('config_update') : t('config_save');
}

// ============================================================
// NUI MESSAGE HANDLER
// ============================================================

window.addEventListener('message', (e) => {
    const d = e.data;
    switch (d.action) {
        case 'setLocale':         applyLocale(d.locale); break;
        case 'open':              openPanel(d); break;
        case 'close':             closePanel(); break;
        case 'travel':            showTravel(d); break;
        case 'travelComplete':    travelComplete(); break;
        case 'openConfigurator':  openConfig(d); break;
        case 'closeConfigurator': closeConfig(); break;
        case 'refreshConfigurator': refreshConfig(d); break;
        case 'autoDetectResult':  onAutoDetectResult(d); break;
        case 'applySettings':     applyUISettings(d.settings); break;
    }
});

// ============================================================
// ELEVATOR PANEL
// ============================================================

function openPanel(data) {
    if (isOpen) return;
    isOpen = true;
    if (data.locale) applyLocale(data.locale);

    elevatorName.textContent = data.elevatorLabel || t('ui_title');
    currentFloor = data.currentFloor || 1;

    const cf = data.floors.find(f => f.isCurrent);
    currentFlLabel.textContent = cf ? cf.label : '--';
    displayFloor.textContent = fmtFloor(currentFloor, data.floors.length);

    resetArrows();
    updateDots(currentFloor, data.floors.length);
    buildFloorList(data.floors);

    app.classList.remove('hidden');
    const panel = app.querySelector('.elevator-panel');
    panel.classList.remove('closing');
    panel.style.display = '';
    travelOverlay.classList.add('hidden');
}

function closePanel() {
    if (!isOpen) return;
    const panel = app.querySelector('.elevator-panel');
    panel.classList.add('closing');
    setTimeout(() => {
        app.classList.add('hidden');
        panel.classList.remove('closing');
        isOpen = false;
    }, 400);
}

// ============================================================
// BUILD FLOOR BUTTONS
// ============================================================

function updateScrollIndicators() {
    if (!floorList || !scrollUp || !scrollDown) return;
    const st = floorList.scrollTop;
    const sh = floorList.scrollHeight;
    const ch = floorList.clientHeight;
    const canScrollUp = st > 2;
    const canScrollDown = st + ch < sh - 2;
    scrollUp.classList.toggle('visible', canScrollUp);
    scrollDown.classList.toggle('visible', canScrollDown);
}

function buildFloorList(floors) {
    floorList.innerHTML = '';
    activeFloors = floors; // store for keyboard nav
    kbSelectedIdx = -1;
    const sorted = [...floors].reverse();

    sorted.forEach((floor, vi) => {
        const btn = document.createElement('button');
        btn.className = 'floor-btn' + (floor.isCurrent ? ' current' : '');
        btn.style.animationDelay = `${vi * 0.06 + 0.12}s`;

        const arrow = floor.isCurrent ? '' : `
            <svg class="floor-arrow" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <polyline points="9 18 15 12 9 6"/>
            </svg>`;

        btn.innerHTML = `
            <div class="floor-number">${floor.index}</div>
            <div class="floor-info">
                <div class="floor-label">${floor.label}</div>
                <div class="floor-status">${t('ui_current_floor')}</div>
            </div>
            ${arrow}`;

        if (!floor.isCurrent) {
            btn.addEventListener('click', () => selectFloor(floor.index));
        }

        floorList.appendChild(btn);
    });

    // Update scroll indicators after content is built
    requestAnimationFrame(updateScrollIndicators);
}

function selectFloor(idx) {
    post('selectFloor', { floorIndex: idx });
}

// ============================================================
// TRAVEL OVERLAY
// ============================================================

function showTravel(data) {
    isOpen = false;
    if (data.locale) applyLocale(data.locale);

    const panel = app.querySelector('.elevator-panel');
    panel.classList.add('closing');
    setTimeout(() => { panel.style.display = 'none'; }, 400);

    travelOverlay.classList.remove('hidden', 'closing', 'arrived', 'traveling-up', 'traveling-down');
    travelTarget.textContent = data.targetFloor || '--';
    travelLabel.textContent = t('traveling_to');
    travelSub.textContent = t('travel_please_wait');
    progressBar.style.width = '0%';

    const dir = data.direction === 'down' ? 'traveling-down' : 'traveling-up';
    travelOverlay.classList.add(dir);

    spawnParticles(data.direction);
    startProgress();
}

function startProgress() {
    let prog = 0;
    const dur = 3800, iv = 25, step = 100 / (dur / iv);
    if (progressInterval) clearInterval(progressInterval);

    progressInterval = setInterval(() => {
        prog += step;
        if (prog >= 95) { prog = 95; clearInterval(progressInterval); progressInterval = null; }
        progressBar.style.width = prog + '%';
    }, iv);
}

function travelComplete() {
    if (progressInterval) { clearInterval(progressInterval); progressInterval = null; }
    progressBar.style.width = '100%';

    travelOverlay.classList.remove('traveling-up', 'traveling-down');
    travelOverlay.classList.add('arrived');
    travelSub.textContent = t('ui_arrived');

    setTimeout(() => {
        travelOverlay.classList.add('closing');
        setTimeout(() => {
            travelOverlay.classList.add('hidden');
            travelOverlay.classList.remove('closing', 'arrived');
            app.classList.add('hidden');
            const panel = app.querySelector('.elevator-panel');
            panel.style.display = '';
            panel.classList.remove('closing');
            clearParticles();
        }, 500);
    }, 1200);
}

// ============================================================
// PARTICLES
// ============================================================

function spawnParticles() {
    clearParticles();
    for (let i = 0; i < 30; i++) {
        const p = document.createElement('div');
        p.className = 'particle';
        p.style.left = Math.random() * 100 + '%';
        p.style.height = (20 + Math.random() * 60) + 'px';
        p.style.animationDelay = (Math.random() * 1.5) + 's';
        p.style.animationDuration = (0.8 + Math.random() * 0.8) + 's';
        p.style.opacity = (0.2 + Math.random() * 0.5);
        particlesEl.appendChild(p);
    }
}

function clearParticles() { particlesEl.innerHTML = ''; }

// ============================================================
// CONFIGURATOR
// ============================================================

function openConfig(data) {
    if (isConfigOpen) return;
    isConfigOpen = true;
    if (data.locale) applyLocale(data.locale);
    if (data.settings) applyUISettings(data.settings);
    configElevators = data.elevators || [];

    editingElevatorId = null;
    showConfigView('list');
    buildElevatorList();

    configApp.classList.remove('hidden');
    configApp.querySelector('.config-panel').classList.remove('closing');
}

function closeConfig() {
    const panel = configApp.querySelector('.config-panel');
    panel.classList.add('closing');
    setTimeout(() => {
        configApp.classList.add('hidden');
        panel.classList.remove('closing');
        isConfigOpen = false;
        editingElevatorId = null;
    }, 400);
}

function refreshConfig(data) {
    if (data.locale) applyLocale(data.locale);
    configElevators = data.elevators || [];
    showConfigView('list');
    buildElevatorList();
    // notification already sent via server NotifyPlayer
}

function showConfigView(view) {
    configViewList.classList.add('hidden');
    configViewForm.classList.add('hidden');
    configViewSettings.classList.add('hidden');
    if (view === 'list') configViewList.classList.remove('hidden');
    else if (view === 'form') configViewForm.classList.remove('hidden');
    else if (view === 'settings') configViewSettings.classList.remove('hidden');
}

// ============================================================
// ELEVATOR LIST (with Edit + Delete)
// ============================================================

function buildElevatorList() {
    configElevList.innerHTML = '';

    if (configElevators.length === 0) {
        configElevList.innerHTML = `<div class="config-empty">${t('config_no_elevators')}</div>`;
        return;
    }

    configElevators.forEach((elev, i) => {
        const item = document.createElement('div');
        item.className = 'config-elevator-item';
        item.style.animationDelay = `${i * 0.05 + 0.1}s`;

        const floorCountText = t('config_floor_count').replace('%d', elev.floorCount);

        item.innerHTML = `
            <div class="config-elevator-info">
                <div class="config-elevator-name">${elev.label}</div>
                <div class="config-elevator-meta">${elev.id} &middot; ${floorCountText}</div>
            </div>
            <div class="config-elevator-actions">
                <button class="btn-tp btn-teleport" data-id="${elev.id}">TP</button>
                <button class="btn-edit btn-ed" data-id="${elev.id}">${t('config_edit')}</button>
                <button class="btn-danger btn-del" data-id="${elev.id}">${t('config_delete')}</button>
            </div>`;

        item.querySelector('.btn-teleport').addEventListener('click', (e) => {
            e.stopPropagation();
            if (elev.firstFloorCoords) {
                post('teleportToFloor', elev.firstFloorCoords);
            }
        });

        item.querySelector('.btn-ed').addEventListener('click', (e) => {
            e.stopPropagation();
            post('loadElevator', { id: elev.id });
        });

        item.querySelector('.btn-del').addEventListener('click', (e) => {
            e.stopPropagation();
            post('deleteElevator', { id: elev.id });
        });

        configElevList.appendChild(item);
    });
}

// ============================================================
// NEW / EDIT FORM
// ============================================================

function slugify(str) {
    return str.toLowerCase().replace(/[^a-z0-9]+/g, '_').replace(/^_|_$/g, '').substring(0, 40);
}

function setIdLocked(locked) {
    idLocked = locked;
    configInputId.disabled = locked;
    if (configIdLock) {
        configIdLock.classList.toggle('unlocked', !locked);
    }
    if (locked) {
        configInputId.value = slugify(configInputLabel.value);
    }
}

function openNewForm() {
    editingElevatorId = null;
    configInputLabel.value = '';
    configInputId.value = '';
    setIdLocked(true);
    configFloors = [];
    addFloorItem();
    addFloorItem();
    updateSaveButtonLabel();
    renderConfigFloors();
    showConfigView('form');
}

function openEditForm(data) {
    editingElevatorId = data.id;
    configInputLabel.value = data.label;
    configInputId.value = data.id;
    setIdLocked(true);
    configInputId.disabled = true; // always locked when editing
    configFloors = (data.floors || []).map(f => ({
        label: f.label || '',
        coords: f.coords || { x: 0, y: 0, z: 0, w: 0 },
    }));
    if (configFloors.length < 2) {
        while (configFloors.length < 2) addFloorItem();
    }
    updateSaveButtonLabel();
    renderConfigFloors();
    showConfigView('form');
}

function addFloorItem() {
    configFloors.push({ label: '', coords: { x: 0, y: 0, z: 0, w: 0 } });
}

function renderConfigFloors() {
    configFloorList.innerHTML = '';

    configFloors.forEach((floor, i) => {
        const item = document.createElement('div');
        item.className = 'config-floor-item';
        item.style.animationDelay = `${i * 0.04}s`;

        const hasCoords = floor.coords && floor.coords.x !== 0;
        const coordStr = hasCoords
            ? `${floor.coords.x}, ${floor.coords.y}, ${floor.coords.z}`
            : '---';

        const tpBtn = hasCoords
            ? `<button class="btn-tp btn-teleport" data-idx="${i}">${t('config_teleport')}</button>`
            : '';

        item.innerHTML = `
            <div class="floor-idx">${i + 1}</div>
            <div class="floor-fields">
                <input type="text" class="floor-name-input" placeholder="${t('config_floor_label_placeholder')}" value="${floor.label}" data-idx="${i}" />
                <div class="config-floor-coords">
                    <span>${coordStr}</span>
                    <button class="btn-coord btn-use-pos" data-idx="${i}">${t('config_use_current_pos')}</button>
                    ${tpBtn}
                </div>
            </div>
            <button class="btn-remove-floor" data-idx="${i}">${t('config_delete_floor')}</button>`;

        item.querySelector('.floor-name-input').addEventListener('input', (e) => {
            configFloors[parseInt(e.target.dataset.idx)].label = e.target.value;
        });

        item.querySelector('.btn-use-pos').addEventListener('click', (e) => {
            const idx = parseInt(e.target.dataset.idx);
            fetch('https://Agency-Elevator/getPlayerCoords', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({}),
            })
            .then(r => r.json())
            .then(coords => {
                configFloors[idx].coords = coords;
                // Update ONLY this floor's coords display (no full re-render)
                updateFloorCoordsDisplay(idx, coords);
            });
        });

        const teleportBtn = item.querySelector('.btn-teleport');
        if (teleportBtn) {
            teleportBtn.addEventListener('click', (e) => {
                const idx = parseInt(e.target.dataset.idx);
                const c = configFloors[idx].coords;
                post('teleportToFloor', { x: c.x, y: c.y, z: c.z, w: c.w });
                showToast(t('config_teleported'), 'info');
            });
        }

        item.querySelector('.btn-remove-floor').addEventListener('click', () => {
            if (configFloors.length <= 2) return;
            configFloors.splice(i, 1);
            renderConfigFloors();
        });

        configFloorList.appendChild(item);
    });
}

// ============================================================
// UPDATE SINGLE FLOOR COORDS (no full re-render)
// ============================================================

function updateFloorCoordsDisplay(idx, coords) {
    const items = configFloorList.querySelectorAll('.config-floor-item');
    const item = items[idx];
    if (!item) return;

    const coordStr = `${coords.x}, ${coords.y}, ${coords.z}`;
    const coordsDiv = item.querySelector('.config-floor-coords');
    const coordSpan = coordsDiv.querySelector('span');

    // Update coord text with animation
    coordSpan.textContent = coordStr;
    coordSpan.classList.remove('coord-appear');
    void coordSpan.offsetWidth; // force reflow
    coordSpan.classList.add('coord-appear');

    // Add teleport button if not already present
    if (!coordsDiv.querySelector('.btn-teleport')) {
        const tpBtn = document.createElement('button');
        tpBtn.className = 'btn-tp btn-teleport';
        tpBtn.dataset.idx = idx;
        tpBtn.textContent = t('config_teleport');
        tpBtn.addEventListener('click', () => {
            post('teleportToFloor', { x: coords.x, y: coords.y, z: coords.z, w: coords.w });
            showToast(t('config_teleported'), 'info');
        });
        coordsDiv.appendChild(tpBtn);
    }
}

// ============================================================
// SAVE ELEVATOR (stays in configurator)
// ============================================================

function saveElevator() {
    const id = configInputId.value.trim();
    const label = configInputLabel.value.trim();

    if (!id) return showToast(t('config_error_id'));
    if (!label) return showToast(t('config_error_label'));
    if (configFloors.length < 2) return showToast(t('config_error_floors'));

    for (const f of configFloors) {
        if (!f.label.trim()) return showToast(t('config_error_floor_label'));
    }

    configSaveBtn.disabled = true;
    configSaveBtn.style.opacity = '0.5';

    post('saveElevator', {
        id: id,
        label: label,
        floors: configFloors.map(f => ({
            label: f.label.trim(),
            coords: f.coords,
        })),
    });

    setTimeout(() => {
        configSaveBtn.disabled = false;
        configSaveBtn.style.opacity = '';
    }, 1000);
}

// ============================================================
// AUTO-DETECT FLOORS
// ============================================================

function autoDetectFloors() {
    const btn = configAutoDetect;
    btn.classList.add('scanning');
    post('autoDetectFloors', {});
}

function onAutoDetectResult(data) {
    const btn = configAutoDetect;
    btn.classList.remove('scanning');

    if (!data.floors || data.floors.length === 0) {
        showToast(t('config_no_floors_found'));
        return;
    }

    configFloors = data.floors.map(f => ({
        label: f.label,
        coords: f.coords,
    }));

    renderConfigFloors();

    // Trigger coord appear animation on all floor items
    setTimeout(() => {
        configFloorList.querySelectorAll('.config-floor-coords span').forEach(span => {
            span.classList.add('coord-appear');
        });
    }, 50);

    showToast(t('config_floors_found').replace('%d', data.floors.length), 'success');
}

// ============================================================
// UI SETTINGS (apply, populate, save)
// ============================================================

function applyUISettings(s) {
    if (!s) return;
    currentSettings = Object.assign(currentSettings, s);

    // Position classes
    app.className = app.className.replace(/pos-\w+/g, '').trim();
    app.classList.add('pos-' + (s.elevator_position || 'left'));

    configApp.className = configApp.className.replace(/pos-\w+/g, '').trim();
    configApp.classList.add('pos-' + (s.config_position || 'center'));

    // Scale (use zoom to avoid animation transform conflict)
    const eScale = parseFloat(s.elevator_scale) || 1.0;
    const cScale = parseFloat(s.config_scale) || 1.0;
    const elevPanel = app.querySelector('.elevator-panel');
    const confPanel = configApp.querySelector('.config-panel');
    if (elevPanel) elevPanel.style.zoom = eScale;
    if (confPanel) confPanel.style.zoom = cScale;

    // Accent color
    if (s.accent_color) {
        document.documentElement.style.setProperty('--accent', s.accent_color);
        // Generate glow from accent
        const r = parseInt(s.accent_color.slice(1,3), 16);
        const g = parseInt(s.accent_color.slice(3,5), 16);
        const b = parseInt(s.accent_color.slice(5,7), 16);
        document.documentElement.style.setProperty('--accent-glow', `rgba(${r},${g},${b},0.35)`);
    }
}

function populateSettingsUI() {
    // Position toggles
    settingsElevPos.querySelectorAll('.settings-toggle').forEach(b => {
        b.classList.toggle('active', b.dataset.val === currentSettings.elevator_position);
    });
    settingsConfPos.querySelectorAll('.settings-toggle').forEach(b => {
        b.classList.toggle('active', b.dataset.val === currentSettings.config_position);
    });

    // Scale sliders
    settingsElevScale.value = currentSettings.elevator_scale;
    settingsElevScaleVal.textContent = parseFloat(currentSettings.elevator_scale).toFixed(2);
    settingsConfScale.value = currentSettings.config_scale;
    settingsConfScaleVal.textContent = parseFloat(currentSettings.config_scale).toFixed(2);

    // Color swatches
    settingsAccentColors.querySelectorAll('.color-swatch').forEach(b => {
        b.classList.toggle('active', b.dataset.color === currentSettings.accent_color);
    });
}

function saveSettings() {
    const elevPos = settingsElevPos.querySelector('.settings-toggle.active')?.dataset.val || 'left';
    const confPos = settingsConfPos.querySelector('.settings-toggle.active')?.dataset.val || 'center';
    const elevScale = parseFloat(settingsElevScale.value).toFixed(2);
    const confScale = parseFloat(settingsConfScale.value).toFixed(2);
    const accentColor = settingsAccentColors.querySelector('.color-swatch.active')?.dataset.color || '#3b82f6';

    const settings = {
        elevator_position: elevPos,
        elevator_scale: elevScale,
        config_position: confPos,
        config_scale: confScale,
        accent_color: accentColor,
    };

    applyUISettings(settings);
    post('saveSettings', settings);
    showConfigView('list');
}

// ============================================================
// CONFIG EVENT LISTENERS
// ============================================================

configCloseBtn.addEventListener('click', () => {
    closeConfig();
    post('closeConfigurator', {});
});

configNewBtn.addEventListener('click', openNewForm);
configBackBtn.addEventListener('click', () => showConfigView('list'));
configCancelBtn.addEventListener('click', () => showConfigView('list'));

// --- Settings view ---
configSettingsBtn.addEventListener('click', () => {
    populateSettingsUI();
    showConfigView('settings');
});
settingsBackBtn.addEventListener('click', () => showConfigView('list'));
settingsCancelBtn.addEventListener('click', () => showConfigView('list'));
settingsSaveBtn.addEventListener('click', saveSettings);

// Discord & Shop links (settings view + footer)
['link-discord', 'footer-link-discord'].forEach(id => {
    document.getElementById(id)?.addEventListener('click', (e) => {
        e.preventDefault();
        if (typeof window.invokeNative === 'function') window.invokeNative('openUrl', 'https://discord.gg/5na3Aadd38');
    });
});
['link-shop', 'footer-link-shop'].forEach(id => {
    document.getElementById(id)?.addEventListener('click', (e) => {
        e.preventDefault();
        if (typeof window.invokeNative === 'function') window.invokeNative('openUrl', 'https://agency-script.tebex.io/');
    });
});

settingsElevScale.addEventListener('input', () => {
    settingsElevScaleVal.textContent = parseFloat(settingsElevScale.value).toFixed(2);
});
settingsConfScale.addEventListener('input', () => {
    settingsConfScaleVal.textContent = parseFloat(settingsConfScale.value).toFixed(2);
});

settingsElevPos.querySelectorAll('.settings-toggle').forEach(btn => {
    btn.addEventListener('click', () => {
        settingsElevPos.querySelectorAll('.settings-toggle').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
    });
});
settingsConfPos.querySelectorAll('.settings-toggle').forEach(btn => {
    btn.addEventListener('click', () => {
        settingsConfPos.querySelectorAll('.settings-toggle').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
    });
});
settingsAccentColors.querySelectorAll('.color-swatch').forEach(btn => {
    btn.addEventListener('click', () => {
        settingsAccentColors.querySelectorAll('.color-swatch').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
    });
});
configSaveBtn.addEventListener('click', saveElevator);
configAutoDetect.addEventListener('click', autoDetectFloors);

configAddFloor.addEventListener('click', () => {
    addFloorItem();
    renderConfigFloors();
});

// Auto-generate ID from name (when locked)
configInputLabel.addEventListener('input', () => {
    if (idLocked && !editingElevatorId) {
        configInputId.value = slugify(configInputLabel.value);
    }
});

// Lock/unlock toggle
if (configIdLock) {
    configIdLock.addEventListener('click', () => {
        if (editingElevatorId) return; // can't unlock when editing
        setIdLocked(!idLocked);
    });
}

// Listen for edit form data from Lua
window.addEventListener('message', (e) => {
    if (e.data.action === 'editElevator') {
        openEditForm(e.data);
    }
});

// ============================================================
// HELPERS
// ============================================================

function fmtFloor(floor, total) {
    if (floor === 1) return t('ui_floor_ground');
    if (floor === total) return t('ui_floor_roof');
    return (floor - 1).toString();
}

function resetArrows() {
    dirIndicator.querySelectorAll('.arrow').forEach(a => a.classList.remove('active'));
}

function updateDots(current, total) {
    const dots = document.querySelectorAll('#display-dots .dot');
    dots.forEach(d => d.classList.remove('active'));

    if (total <= 3) {
        dots.forEach((d, i) => {
            d.style.display = i < total ? '' : 'none';
            if (i === current - 1) d.classList.add('active');
        });
    } else {
        const pos = Math.round(((current - 1) / (total - 1)) * 2);
        dots.forEach((d, i) => {
            d.style.display = '';
            if (i === pos) d.classList.add('active');
        });
    }
}

function post(endpoint, data) {
    fetch(`https://Agency-Elevator/${endpoint}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data),
    }).catch(() => {});
}

// ============================================================
// NOTIFICATION (via agency-notify)
// ============================================================

function showToast(msg, type) {
    const nType = type === 'success' ? 'success' : type === 'error' ? 'error' : 'info';
    post('showNotify', { msg: msg, nType: nType });
}

// ============================================================
// CLOSE BUTTON + KEYBOARD NAVIGATION
// ============================================================

closeBtn.addEventListener('click', () => {
    closePanel();
    post('close', {});
});

floorList.addEventListener('scroll', updateScrollIndicators);

document.addEventListener('keydown', (e) => {
    // ESC
    if (e.key === 'Escape') {
        if (isOpen) { closePanel(); post('close', {}); }
        if (isConfigOpen) { closeConfig(); post('closeConfigurator', {}); }
        return;
    }

    // Only elevator panel keyboard nav
    if (!isOpen || activeFloors.length === 0) return;

    // Number keys 1-9 to select floor directly
    const num = parseInt(e.key);
    if (num >= 1 && num <= activeFloors.length) {
        const floor = activeFloors[num - 1];
        if (floor && !floor.isCurrent) {
            selectFloor(floor.index);
        }
        return;
    }

    // Arrow up/down to navigate
    if (e.key === 'ArrowUp' || e.key === 'ArrowDown') {
        e.preventDefault();
        const btns = floorList.querySelectorAll('.floor-btn');
        if (btns.length === 0) return;

        // Remove old highlight
        btns.forEach(b => b.classList.remove('kb-highlight'));

        if (e.key === 'ArrowUp') {
            kbSelectedIdx = Math.max(0, kbSelectedIdx - 1);
        } else {
            kbSelectedIdx = Math.min(btns.length - 1, kbSelectedIdx + 1);
        }

        btns[kbSelectedIdx].classList.add('kb-highlight');
        btns[kbSelectedIdx].scrollIntoView({ block: 'nearest', behavior: 'smooth' });
        return;
    }

    // Enter to select highlighted floor
    if (e.key === 'Enter' && kbSelectedIdx >= 0) {
        const btns = floorList.querySelectorAll('.floor-btn');
        if (btns[kbSelectedIdx]) {
            btns[kbSelectedIdx].click();
        }
    }
});

})();
