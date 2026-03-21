// Kyros Pause Menu - Optimized Version

const PauseMenu = {
    config: null,
    isOpen: false,
    
    // Cached DOM elements for faster updates
    elements: {},
    
    init() {
        this.cacheElements();
        this.bindEvents();
        this.listenForNUI();
    },
    
    // Cache all DOM elements at startup for instant access
    cacheElements() {
        this.elements = {
            pauseMenu: document.getElementById('pause-menu'),
            rulesModal: document.getElementById('rules-modal'),
            disconnectModal: document.getElementById('disconnect-modal'),
            serverName: document.getElementById('server-name'),
            serverLogo: document.getElementById('server-logo'),
            logoFallback: document.querySelector('.logo-fallback'),
            tagline: document.querySelector('.brand-tagline span'),
            playerCount: document.getElementById('player-count'),
            serverTime: document.getElementById('server-time'),
            playerName: document.getElementById('player-name'),
            playerId: document.getElementById('player-id'),
            playerCash: document.getElementById('player-cash'),
            playerBank: document.getElementById('player-bank'),
            playerJob: document.getElementById('player-job'),
            streetName: document.getElementById('street-name'),
            zoneName: document.getElementById('zone-name'),
            heading: document.getElementById('heading'),
            mapImage: document.getElementById('map-image'),
            playerPing: document.getElementById('player-ping'),
            sessionTime: document.getElementById('session-time')
        };
    },

    bindEvents() {
        document.querySelectorAll('[data-action]').forEach(el => {
            el.addEventListener('click', () => {
                const action = el.dataset.action;
                if (action) this.handleAction(action);
            });
        });

        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && this.isOpen) {
                if (!this.elements.rulesModal.classList.contains('hidden')) {
                    this.closeRulesModal();
                } else if (!this.elements.disconnectModal.classList.contains('hidden')) {
                    this.closeDisconnectModal();
                } else {
                    this.close();
                }
            }
        });

        document.querySelectorAll('.modal-backdrop').forEach(backdrop => {
            backdrop.addEventListener('click', () => {
                document.querySelectorAll('.modal').forEach(modal => {
                    modal.classList.add('hidden');
                });
            });
        });
    },

    listenForNUI() {
        window.addEventListener('message', (event) => {
            const data = event.data;
            
            switch (data.action) {
                case 'open':
                    this.config = data.config;
                    this.open();
                    break;
                case 'close':
                    this.hideUI();
                    break;
                case 'updateServerData':
                    this.updateServerData(data.data);
                    break;
                case 'updatePlayerData':
                    this.updatePlayerData(data.data);
                    break;
                case 'updateLocation':
                    this.updateLocation(data.data);
                    break;
                case 'openURL':
                    if (data.url) this.openInBrowser(data.url);
                    break;
            }
        });
    },

    open() {
        this.isOpen = true;
        this.elements.pauseMenu.classList.remove('hidden');
        this.updateUI();
    },

    hideUI() {
        this.isOpen = false;
        this.elements.pauseMenu.classList.add('hidden');
        this.elements.rulesModal.classList.add('hidden');
        this.elements.disconnectModal.classList.add('hidden');
    },

    close() {
        if (!this.isOpen) return;
        this.hideUI();
        this.postNUI('close', {});
    },

    updateUI() {
        if (!this.config) return;
        
        const el = this.elements;
        
        // Update server name in header
        if (el.serverName && this.config.serverName) {
            el.serverName.textContent = this.config.serverName;
        }
        
        // Update server logo
        if (el.serverLogo) {
            if (this.config.serverLogo && this.config.serverLogo !== '') {
                el.serverLogo.src = this.config.serverLogo;
                el.serverLogo.classList.remove('hidden');
                el.serverLogo.onerror = () => {
                    el.serverLogo.classList.add('hidden');
                    if (el.logoFallback) el.logoFallback.style.zIndex = '1';
                };
            } else {
                el.serverLogo.classList.add('hidden');
                if (el.logoFallback) el.logoFallback.style.zIndex = '1';
            }
        }
        
        // Update server tagline
        if (el.tagline && this.config.serverTagline) {
            el.tagline.textContent = this.config.serverTagline;
        }
        
        // Apply map style
        if (el.mapImage && this.config.mapStyle) {
            this.applyMapStyle(this.config.mapStyle);
        }
    },
    
    applyMapStyle(style) {
        const mapImage = this.elements.mapImage;
        if (!mapImage) return;
        
        switch (style) {
            case 'color':
                mapImage.style.filter = 'brightness(0.6) contrast(1.1)';
                break;
            case 'dark':
                mapImage.style.filter = 'brightness(0.3) contrast(1.2) saturate(0)';
                break;
            case 'greyscale':
            default:
                mapImage.style.filter = 'brightness(0.5) contrast(1.1) saturate(0) grayscale(1)';
                break;
        }
    },

    updateServerData(data) {
        const el = this.elements;
        if (data.playerCount !== undefined && el.playerCount) {
            el.playerCount.textContent = data.playerCount;
        }
        if (data.serverTime && el.serverTime) {
            el.serverTime.textContent = data.serverTime;
        }
        if (data.ping !== undefined && el.playerPing) {
            el.playerPing.textContent = data.ping;
        }
    },

    updatePlayerData(data) {
        const el = this.elements;
        if (data.name && el.playerName) {
            el.playerName.textContent = data.name;
        }
        if (data.id !== undefined && el.playerId) {
            el.playerId.textContent = data.id;
        }
        if (data.cash !== undefined && el.playerCash) {
            el.playerCash.textContent = '$' + this.formatNumber(data.cash);
        }
        if (data.bank !== undefined && el.playerBank) {
            el.playerBank.textContent = '$' + this.formatNumber(data.bank);
        }
        if (data.job && el.playerJob) {
            el.playerJob.textContent = data.job;
        }
        if (data.sessionTime && el.sessionTime) {
            el.sessionTime.textContent = data.sessionTime;
        }
    },

    updateLocation(data) {
        const el = this.elements;
        if (data.street && el.streetName) {
            el.streetName.textContent = data.street;
        }
        if (data.zone && el.zoneName) {
            el.zoneName.textContent = data.zone;
        }
        if (data.heading && el.heading) {
            el.heading.textContent = data.heading;
        }
        
        // Update map position based on coordinates
        if (data.x !== undefined && data.y !== undefined) {
            this.updateMapPosition(data.x, data.y);
        }
    },

    updateMapPosition(x, y) {
        const mapImage = this.elements.mapImage;
        if (!mapImage) return;
        
        // GTA5 map bounds for 5734x5734 square satellite image
        // Adjust these values if your map image has different bounds
        const mapBounds = {
            minX: -4000,
            maxX: 5000,
            minY: -4000,
            maxY: 8180
        };
        
        // Calculate the range for both axes
        const rangeX = mapBounds.maxX - mapBounds.minX; // 8500
        const rangeY = mapBounds.maxY - mapBounds.minY; // 12000
        
        // For a square image, use the larger range and center the smaller one
        const maxRange = Math.max(rangeX, rangeY);
        
        // Calculate offsets to center the smaller dimension
        const offsetCenterX = (maxRange - rangeX) / 2;
        const offsetCenterY = (maxRange - rangeY) / 2;
        
        // Convert game coordinates to percentage (0-100) of the square image
        const percX = ((x - mapBounds.minX + offsetCenterX) / maxRange) * 100;
        const percY = ((mapBounds.maxY - y + offsetCenterY) / maxRange) * 100; // Y inverted
        
        // Clamp values to keep the view within bounds
        const clampedX = Math.max(8, Math.min(92, percX));
        const clampedY = Math.max(8, Math.min(92, percY));
        
        // Position map so player marker (at center) shows player location
        const translateX = 50 - clampedX;
        const translateY = 50 - clampedY;
        
        mapImage.style.transform = `translate(calc(-50% + ${translateX}%), calc(-50% + ${translateY}%))`;
    },

    handleAction(action) {
        switch (action) {
            case 'openMap':
                this.postNUI('openMap', {});
                break;
            case 'openSettings':
                this.postNUI('openSettings', {});
                break;
            case 'openRules':
                // If rulesURL is set, open link instead of modal
                if (this.config && this.config.rulesURL && this.config.rulesURL !== '') {
                    this.postNUI('openLink', { link: this.config.rulesURL });
                } else {
                    this.openRulesModal();
                }
                break;
            case 'closeRules':
                this.closeRulesModal();
                break;
            case 'openDiscord':
                if (this.config && this.config.discord) {
                    this.postNUI('openLink', { link: this.config.discord });
                }
                break;
            case 'openWebsite':
                if (this.config && this.config.website) {
                    this.postNUI('openLink', { link: this.config.website });
                }
                break;
            case 'disconnect':
                this.openDisconnectModal();
                break;
            case 'cancelDisconnect':
                this.closeDisconnectModal();
                break;
            case 'confirmDisconnect':
                this.postNUI('disconnect', {});
                break;
            case 'close':
                this.close();
                break;
        }
    },

    openRulesModal() {
        // Populate rules from config
        const modalBody = this.elements.rulesModal.querySelector('.modal-body');
        if (modalBody && this.config && this.config.rules && this.config.rules.length > 0) {
            modalBody.innerHTML = this.config.rules.map((rule, index) => 
                `<div class="rule">
                    <span class="num">${index + 1}</span>
                    <span class="rule-text">${rule}</span>
                </div>`
            ).join('');
        } else if (modalBody) {
            modalBody.innerHTML = '<div class="no-rules"><i class="fas fa-info-circle"></i><span>No rules have been configured.</span></div>';
        }
        this.elements.rulesModal.classList.remove('hidden');
    },

    closeRulesModal() {
        this.elements.rulesModal.classList.add('hidden');
    },

    openDisconnectModal() {
        this.elements.disconnectModal.classList.remove('hidden');
    },

    closeDisconnectModal() {
        this.elements.disconnectModal.classList.add('hidden');
    },

    formatNumber(num) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    },

    openInBrowser(url) {
        if (typeof invokeNative !== 'undefined') {
            invokeNative('openUrl', url);
        } else {
            window.open(url, '_blank');
        }
    },

    postNUI(action, data) {
        const resourceName = typeof GetParentResourceName !== 'undefined' ? GetParentResourceName() : 'kyros-pausemenu-onyx';
        fetch(`https://${resourceName}/${action}`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        }).catch(() => {});
    }
};

document.addEventListener('DOMContentLoaded', () => {
    PauseMenu.init();
    
    // Browser Preview Mode - Auto-open with mock data when not in FiveM
    if (typeof GetParentResourceName === 'undefined') {
        console.log('[Preview Mode] Running in browser - loading mock data');
        
        // Simulate opening the menu with config
        window.postMessage({
            action: 'open',
            config: {
                serverName: 'YOUR SERVER NAME',
                serverTagline: 'ROLEPLAY',
                serverLogo: '',
                discord: 'https://discord.gg/example',
                website: 'https://example.com',
                rulesURL: '',
                mapStyle: 'greyscale',
                rules: [
                    'Respect all players and staff members at all times.',
                    'No cheating, hacking, or exploiting game mechanics.',
                    'No RDM (Random Deathmatch) or VDM (Vehicle Deathmatch).',
                    'Stay in character while roleplaying in the server.',
                    'No metagaming or powergaming under any circumstances.',
                    'Use /report for any issues with other players.'
                ]
            }
        }, '*');
        
        // Simulate player data
        setTimeout(() => {
            window.postMessage({
                action: 'updatePlayerData',
                data: {
                    name: 'John Doe',
                    id: 1,
                    cash: 15420,
                    bank: 250000,
                    job: 'Police Officer',
                    sessionTime: '2h 35m'
                }
            }, '*');
        }, 100);
        
        // Simulate server data
        setTimeout(() => {
            window.postMessage({
                action: 'updateServerData',
                data: {
                    playerCount: 64,
                    maxPlayers: 128,
                    serverTime: '14:32',
                    ping: 45
                }
            }, '*');
        }, 150);
        
        // Simulate location data
        setTimeout(() => {
            window.postMessage({
                action: 'updateLocation',
                data: {
                    street: 'Vinewood Blvd',
                    zone: 'Vinewood',
                    heading: 'NW',
                    x: -282.42,
                    y: 175.83
                }
            }, '*');
        }, 200);
    }
});
