# AimShield FiveM Script

**AimShield** is an advanced silent aimbot detection solution for FiveM servers. The latest version is fully managed via a web dashboard, with automatic updates, API integration, and extensive logging.

## Table of Contents
- [Overview](#overview)
- [Installation](#installation)
- [Configuration & Dashboard](#configuration--dashboard)
- [Usage](#usage)
- [Migration & Database](#migration--database)
- [Support](#support)

## Overview
- Detects silent aimbot.
- Fully automatic updates.
- Only authorized servers can run the script.
- All settings are managed through the web dashboard: [aimshield.xyz/signin](https://aimshield.xyz/signin) (log in first, you will be redirected to the dashboard)
- Full logging to Discord webhooks (bans, connections, disconnects, detections).
- Automatic support for both ESX & QBCore frameworks.

## Installation
1. **Download:** After purchase via Tebex, download the AimShield folder.
2. **Place in resources:** Put the folder in your server's `resources` directory.
3. **Start in server.cfg:**
   ```plaintext
   ensure AimShield
   ```

## Configuration & Dashboard
- **All settings via web:**
  - Go to [aimshield.xyz/signin](https://aimshield.xyz/signin) and log in. You will be redirected to the dashboard to configure database, detection, logging, languages, admins, and more.
- **No local config files:** Everything is fetched automatically from the API.
- **Admin management:** Add admins via the **Admins page** in the dashboard using Discord ID, username, or email for admin privileges (e.g., in-game popups).

## Usage
- **Detection & logging:**
  - Silent aimbot detections are automatically logged and (optionally) banned according to your dashboard settings.
  - All logs, bans, connections, and disconnects are sent to your configured Discord webhooks.
- **In-game popups:** Admins (set via the Admins page) receive in-game popups for important events. All other management and features are handled via the website/dashboard.
- **Automatic updates:** The script updates itself; just restart after an update.

## Support
- **Email:** aimshield2025@gmail.com
- **Discord:** [Join our Discord](https://discord.gg/aimshield)
- **Website & Dashboard:** [aimshield.xyz/signin](https://aimshield.xyz/signin)

For the latest updates, documentation, and dashboard access: [aimshield.xyz/signin](https://aimshield.xyz/signin)
