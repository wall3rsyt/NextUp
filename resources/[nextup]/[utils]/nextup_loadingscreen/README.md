# NextUp RP — Loading Screen
## Premium FiveM Loading Screen Script

---

## 📁 Mapstructuur
```
nextup_loadingscreen/
├── fxmanifest.lua
├── client.lua
└── html/
    ├── index.html
    ├── style.css
    └── script.js
```

---

## 🚀 Installatie

1. **Kopieer** de map `nextup_loadingscreen` naar je FiveM server resources map:
   ```
   server/resources/[custom]/nextup_loadingscreen/
   ```

2. **Voeg toe** aan je `server.cfg`:
   ```
   ensure nextup_loadingscreen
   ```

3. **Klaar!** De loading screen wordt automatisch getoond bij het joinen.

---

## ⚙️ Aanpassen

### Servernaam & links → `html/script.js` (bovenaan)
```js
const CONFIG = {
  serverName:   'JOUW SERVER',
  maxPlayers:   128,
  discordUrl:   'https://discord.gg/jouwlink',
  websiteUrl:   'https://jouwwebsite.nl',
  forumUrl:     'https://forum.jouwwebsite.nl',
  simulatedPlayers: 94,
};
```

### Kleuren → `html/style.css` (bovenaan)
```css
:root {
  --accent:  #00f5c4;   /* Hoofdkleur (cyaan) */
  --accent2: #ff3c6e;   /* Accentkleur (rood) */
  --accent3: #7b5cfa;   /* Accentkleur (paars) */
}
```

### Serverregels → `html/index.html`
Zoek op `rule-item` en pas de teksten aan.

### Live feed berichten → `html/script.js`
Zoek op `feedEvents` en vul eigen berichten in.

---

## 🔌 Loading screen sluiten vanuit je script

```lua
-- In jouw spawn/framework resource:
exports['nextup_loadingscreen']:shutdownLoadingScreen()
```

Of stuur een NUI event vanuit server:
```lua
TriggerClientEvent('nextup_loadingscreen:shutdown', source)
```

---

## 🎨 Achtergrondafbeelding toevoegen

1. Voeg je afbeelding toe aan `html/img/background.jpg`
2. Voeg toe in `style.css` bij de `body`:
   ```css
   body {
     background-image: url('img/background.jpg');
     background-size: cover;
     background-position: center;
   }
   ```

---

## 📋 Compatibiliteit
- ✅ FiveM (CFX)
- ✅ ESX Framework
- ✅ QBCore Framework
- ✅ Standalone

---

*NEXTUP Loading Screen — Premium FiveM Resource*
