Config                              = Config or {}

-- Base
Config.PickUpDistance               = 1.8                   
Config.AutoDelete                   = 300                   
Config.PreventIfAlreadyEquipped     = true                  
Config.PreventItemPickupByGender    = true                  
Config.CompatibilityLayer           = false                 
Config.CheckForDamageDuringPickup   = true                  

-- Checks
Config.DropAccessories             = {
    ["Meleed"] = true,
    ["HitByCar"] = {
        Enabled = true,
        Measurement = 'kmh',                                
        Speed = 25,                                         
    },
    ["BonesShot"] = {
        Enabled = true,
        Bones = {31086, 24818, 24817},                      
    }
}

-- Interaction
Config.InteractionType              = 'Target'             
Config.NotificationMode             = 'toggle'             
Config.CommandTitle                 = 'Accessoire oprapen'       
Config.CommandInputMapper           = 'KEYBOARD'
Config.CommandInputParameter        = 'E'
Config.InteractionDistance          = 1.8                   
Config.InteractionAngle             = 10.0
Config.MaxInteractionAngle          = 15.0
---- Target
Config.TargetType                   = 'ox_target'
Config.TargetName                   = 'ox_target'
Config.TargetText                   = "Oppakken"           
Config.Icon                         = 'fa-solid fa-hand'

-- Misc
Config.Language                     = 'nl'
Config.Debug                        = false
Config.DebugDistance                = 12.0
Config.UpdateChecker                = false
Config.ChangeLog                    = false

------------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFICATION FUNCTION
------------------------------------------------------------------------------------------------------------------------------------------
function PickupNotification(message, entity, operation)
    if Config.NotificationMode == 'toggle' then
        if operation == 'hide' then
            lib.hideTextUI()                                
        elseif operation == 'show' and message then
            lib.showTextUI(message, {                       
                position = 'left-center',
                icon = 'hand'
            })
        end
    else
        -- Fallback: continuous DrawText3D mode
        if entity and message then
            local entityCoords = GetEntityCoords(entity)
            AdvancedDrawText3D(entityCoords, message)
        end
    end
end