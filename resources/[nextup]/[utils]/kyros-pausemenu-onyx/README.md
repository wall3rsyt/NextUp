
██╗  ██╗██╗   ██╗██████╗  █████╗  ██████╗  ██████╗ ███╗   ███╗   █████╗ ███╗  ██╗██╗   ██╗██╗  ██╗
██║ ██╔╝╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗████╗ ████║  ██╔══██╗████╗ ██║╚██╗ ██╔╝╚██╗██╔╝
█████═╝  ╚████╔╝ ██████╔╝██║  ██║╚█████╗   ██████╔╝██╔████╔██║  ██║  ██║██╔██╗██║ ╚████╔╝  ╚███╔╝ 
██╔═██╗   ╚██╔╝  ██╔══██╗██║  ██║ ╚═══██╗  ██╔═══╝ ██║╚██╔╝██║  ██║  ██║██║╚████║  ╚██╔╝   ██╔██╗ 
██║ ╚██╗   ██║   ██║  ██║╚█████╔╝██████╔╝  ██║     ██║ ╚═╝ ██║  ╚█████╔╝██║ ╚███║   ██║   ██╔╝╚██╗
╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝ ╚═════╝   ╚═╝     ╚═╝     ╚═╝   ╚════╝ ╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝


## Installation

1. Place `kyros-pausemenu-onyx` in your resources folder
2. Add to your `server.cfg`:
   ```
   ensure kyros-pausemenu-onyx
   ```
3. Configure `config.lua` to your liking
4. Restart your server


```
## Exports

```lua
-- Check if menu is open
local isOpen = exports['kyros-pausemenu-onyx']:IsMenuOpen()

-- Manually open the menu
exports['kyros-pausemenu-onyx']:OpenMenu()

-- Manually close the menu
exports['kyros-pausemenu-onyx']:CloseMenu()
```


## Troubleshooting

**Cash/Bank not showing?**
- Make sure framework is detected (check F8 console for message)
- For ESX: Ensure player data is loaded
- For QBCore: Ensure player is spawned

**Menu not opening?**
- Check if resource is started
- Check F8 console for errors
- Verify keybind isn't conflicting

**Map image not showing?**
- Make sure `img/map.png` exists
- Check `fxmanifest.lua` includes the img folder