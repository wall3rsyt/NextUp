# 💰 Money Laundering Script v5.0
> Professional FiveM money laundering script with fully dynamic sessions, GPS routing, knock animations and detailed Discord logging.

---

## ✨ Features

- 🎯 **Dynamic sessions** — every run is different. Random locations, random percentages
- 🌐 **Dark web drops** — random chance during a session to receive a mysterious dark web location with higher launder rates and no name on the blip
- 🚶 **Knock animation** — your character actually knocks on the door with a cancellable progress bar
- 📍 **GPS routing** — after starting, a blip and GPS route automatically appear toward the wash location
- 🔄 **Multiple stops** — after each knock you get a new random location, until all dirty money is laundered
- ❌ **Cancel button** — getting robbed? Press BACKSPACE. Animation stops, session closes
- 🌍 **19 languages** — one setting in `config.lua`, works instantly
- 🔔 **Discord logging** — fully built-out embeds for every action
- ⚡ **Ultra low ms** — ~0.00ms idle, ~0.05ms in use
- 🛡️ **Anti-cheat** — token system, server-side sessions, location verification
- 🔧 **Auto-detect** — framework, inventory and interaction system are detected automatically

---

## 📦 Requirements

### Required
| Resource | Version | Note |
|---|---|---|
| [`ox_lib`](https://github.com/overextended/ox_lib/releases) | ≥ 3.0.0 | Required for UI, notifications and progress bar |

### Framework — auto-detected, one of three
| Resource | Supported |
|---|---|
| `es_extended` (ESX) | ✅ |
| `qb-core` (QBCore) | ✅ |
| `qbx_core` (QBox) | ✅ |

### Inventory — auto-detected, one of five
| Resource | Supported |
|---|---|
| `ox_inventory` | ✅ |
| `qb-inventory` | ✅ |
| `ps-inventory` | ✅ |
| `qs-inventory` | ✅ |
| `codem-inventory` | ✅ |

### Interaction — auto-detected
| Resource | Behaviour |
|---|---|
| `ox_target` | 3D target on ped & door zones |
| `qtarget` | 3D target on ped |
| Neither | ox_lib TextUI + **[E]** key fallback |

---

## 🚀 Installation

**1.** Place the `witwas_script` folder inside your `resources/` directory.

**2.** Add the following to your `server.cfg`:
```
ensure ox_lib
ensure witwas_script
```

**3.** Open `config.lua` and configure to your liking.

**That's it.** Framework, inventory and interaction are all detected automatically on startup.

---

## 🎮 How does it work?

```
① Player walks to the start location (ped, no blip visible on map)
         ↓
② Script checks: does the player have enough dirty money?
         ↓
③ GPS blip + route appears toward a random launder location
         ↓
④ Player drives to the location
         ↓
⑤ Interact at the door → knock animation + progress bar
   [BACKSPACE] cancels at any moment
         ↓
⑥ Server launders a random % of the player's dirty money
         ↓
⑦ Short cooldown → new random location appears
   (25% chance it's a dark web location — purple blip, no name, higher rate)
         ↓
⑧ Repeat ⑤–⑦ until all dirty money has been laundered
         ↓
⑨ Session complete 💰
```

---

## ⚙️ Configuration

Everything is configured through **`config.lua`**. You never need to touch any other file.

### Language
```lua
Config.Locale = 'en'
-- Available: nl en de fr es pt pl tr sv da it ru cs ro hu ar zh ja ko
```

### Dark web locations
```lua
Config.Deepweb = {
    enabled  = true,   -- set to false to disable entirely
    kans     = 25,     -- % chance of receiving a dark web location after each knock (0–100)

    -- Higher launder % per knock at dark web locations (bonus)
    wasPerKlop = { min = 30, max = 50 },
}

Config.DeepwebLocaties = {
    { label = 'Abandoned Warehouse', coords = vector4(X, Y, Z, H), targetAfstand = 2.0 },
    -- add more locations here
}
```
Dark web locations show up with a **purple question mark blip** and no name — the player has no idea where they're going. The launder rate is higher as a reward for the risk.

### Laundered amount per knock
```lua
Config.WasPerKlop = {
    min = 10,  -- minimum 10% of remaining dirty money per knock
    max = 25,  -- maximum 25% of remaining dirty money per knock
}
```

### Launder fee
```lua
Config.WasPercentage = 30  -- 30% taken as fee, player receives 70%
```

### Cooldowns
```lua
Config.LocatieCooldown = 30   -- seconds to wait between locations
Config.SessieCooldown  = 600  -- cooldown in seconds after a full session completes
```

### Minimum start amount
```lua
Config.MinBedrag = 500  -- player needs at least $500 dirty money to start
```

### Discord logging
```lua
Config.Discord = {
    enabled  = true,
    webhook  = 'https://discord.com/api/webhooks/YOUR_URL',
    botNaam  = 'Launder Logger',
}
```

### Start location (the ped)
```lua
Config.StartLocatie = {
    label         = 'Name',
    coords        = vector4(X, Y, Z, Heading),
    model         = 'ped_model_name',
    targetAfstand = 2.0,
}
```

### Adding a launder location
```lua
{
    label         = 'Location name',
    coords        = vector4(X, Y, Z, Heading),
    targetAfstand = 2.0,
},
```

### Dirty money item name
```lua
-- Overrides auto-detection for all inventory systems:
Config.DirtyMoneyItemOverride = 'black_money'
```

---

## 🌍 Supported languages (19)

Set via `Config.Locale` in `config.lua`. No other files need to be changed.

| Code | Language | Code | Language | Code | Language |
|---|---|---|---|---|---|
| `nl` | Dutch | `en` | English | `de` | German |
| `fr` | French | `es` | Spanish | `pt` | Portuguese |
| `pl` | Polish | `tr` | Turkish | `sv` | Swedish |
| `da` | Danish | `it` | Italian | `ru` | Russian |
| `cs` | Czech | `ro` | Romanian | `hu` | Hungarian |
| `ar` | Arabic | `zh` | Chinese | `ja` | Japanese |
| `ko` | Korean | | | | |

---

## 🔔 Discord Logging

Set `Config.Discord.enabled = true` and fill in your webhook URL. The script logs automatically:

| | Event | Contents |
|---|---|---|
| 🟦 | Session started | Player, dirty money amount, first location |
| 💚 | Knock successful | Laundered, fee, received, remaining, location |
| 🟠 | Session cancelled | Player, reason (manual / disconnect) |
| 🟣 | Session completed | Total received, session duration |
| 🟤 | Dark web location sent | Player, location, roll chance |
| 🔴 | Anti-cheat alert | Player, triggered event, location |

---

## 🛡️ Security

| Layer | What it does |
|---|---|
| **Token system** | Every launder request requires a one-time server-generated token. Requests without a valid token are rejected. |
| **Server-side session** | Location, progress and amounts are stored on the server. The client cannot manipulate anything. |
| **Location verification** | On every knock the server checks whether the player is actually at the correct door. |
| **Item verification** | Dirty money is re-checked at the door, protecting against item loss during transit. |
| **Server-side cooldown** | Cooldown is stored on the server. Disconnecting and reconnecting resets nothing. |
| **Anti-spoof logging** | Suspicious event triggers are logged in the console and in Discord. |

---

## ⚡ Performance

| Situation | CPU (ms) |
|---|---|
| Idle — far from all locations | ~0.00ms |
| Nearby — marker visible | ~0.02ms |
| In zone — interaction active | ~0.03ms |
| Animation running | ~0.05ms |

The proximity loop uses a three-stage system: far away the thread sleeps 2000ms, nearby 300ms, and only inside the interaction zone does it run at 0ms for smooth marker rendering and input detection.

---

## 🗂️ File structure

```
witwas_script/
├── fxmanifest.lua
├── config.lua               ← all settings go here
├── locales/
│   └── locales.lua          ← all 19 languages in one file
├── shared/
│   └── framework.lua        ← auto-detect framework & inventory
├── client/
│   ├── ped.lua              ← start location NPC
│   ├── ui.lua               ← markers, proximity loop, interaction
│   └── main.lua             ← workflow logic
└── server/
    ├── framework.lua        ← ESX / QBCore / QBox + inventory bridge
    ├── token.lua            ← token security system
    └── main.lua             ← session management, launder logic, Discord logging
```

---

## ❓ FAQ

**The script doesn't detect my framework.**
Make sure the resource name matches exactly: `es_extended`, `qb-core` or `qbx_core`.

**My dirty money item has a different name than `black_money`.**
Set `Config.DirtyMoneyItemOverride = 'your_item_name'` in `config.lua`.

**The GPS route doesn't appear.**
Make sure `Config.WasBlip.route = true` is set in `config.lua`.

**How do I change the language?**
Change `Config.Locale = 'en'` to the desired language code in `config.lua`. No other files needed.

**Discord logs aren't coming through.**
Check that `enabled = true` and that the webhook URL is complete with no spaces before or after.

**Can I move the start location?**
Yes, update `Config.StartLocatie.coords` in `config.lua` with the new coordinates and heading.
