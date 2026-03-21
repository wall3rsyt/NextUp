Config = Config or {}

-- ██╗    ██╗███████╗ █████╗ ████████╗██╗  ██╗███████╗██████╗ 
-- ██║    ██║██╔════╝██╔══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
-- ██║ █╗ ██║█████╗  ███████║   ██║   ███████║█████╗  ██████╔╝
-- ██║███╗██║██╔══╝  ██╔══██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
-- ╚███╔███╔╝███████╗██║  ██║   ██║   ██║  ██║███████╗██║  ██║
--  ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
local function DetectActiveWeather()
    local weathers = {
        'cd_easytime',
        'vSync',
        'qb-weathersync',
        'qbx_weathersync',
        'av_weather',
    }

    for i=1, #weathers, 1 do
        if GetResourceState(weathers[i]) == 'started' then
            return weathers[i]
        end
    end
    return nil
end

Config.Weather = DetectActiveWeather()



--  ██████╗██╗      ██████╗ ████████╗██╗  ██╗██╗███╗   ██╗ ██████╗ 
-- ██╔════╝██║     ██╔═══██╗╚══██╔══╝██║  ██║██║████╗  ██║██╔════╝ 
-- ██║     ██║     ██║   ██║   ██║   ███████║██║██╔██╗ ██║██║  ███╗
-- ██║     ██║     ██║   ██║   ██║   ██╔══██║██║██║╚██╗██║██║   ██║
-- ╚██████╗███████╗╚██████╔╝   ██║   ██║  ██║██║██║ ╚████║╚██████╔╝
--  ╚═════╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
local function DetectActiveClothing()
    local resources = {
        'vms_clothestore',
        'qb-clothing',
        'ak47_clothing',
        'rcore_clothing',
        'raid_clothes',
        'bl_appearance',
        'fivem-appearance',
        'illenium-appearance',
        'codem-appearance',
        'qs-appearance',
        '17mov_CharacterSystem',
        'tgiann-clothing',
    }

    for i=1, #resources, 1 do
        if GetResourceState(resources[i]) == 'started' then
            return resources[i]
        end
    end
    return nil
end

Config.Clothing = DetectActiveClothing()



-- ██████╗  ██████╗ ███████╗███████╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
-- ██╔══██╗██╔═══██╗██╔════╝██╔════╝    ████╗ ████║██╔════╝████╗  ██║██║   ██║
-- ██████╔╝██║   ██║███████╗███████╗    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
-- ██╔══██╗██║   ██║╚════██║╚════██║    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
-- ██████╔╝╚██████╔╝███████║███████║    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
-- ╚═════╝  ╚═════╝ ╚══════╝╚══════╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ 
local function DetectActiveBossmenu()
    local resources = {
        'vms_bossmenu',
        'esx_society',
    }

    for i=1, #resources, 1 do
        if GetResourceState(resources[i]) == 'started' then
            return resources[i]
        end
    end
    return nil
end

Config.BossMenu = DetectActiveBossmenu()



--  ██████╗  █████╗ ██████╗  █████╗  ██████╗ ███████╗███████╗
-- ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗██╔════╝ ██╔════╝██╔════╝
-- ██║  ███╗███████║██████╔╝███████║██║  ███╗█████╗  ███████╗
-- ██║   ██║██╔══██║██╔══██╗██╔══██║██║   ██║██╔══╝  ╚════██║
-- ╚██████╔╝██║  ██║██║  ██║██║  ██║╚██████╔╝███████╗███████║
--  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
local function DetectActiveGarage()
    local resources = {
        'vms_garagesv2',
        'rcore_garages',
        'cd_garage',
        'loaf_garage',
        'jg-advancedgarages',
        'okokGarage',
        'RxGarages',
        'ZSX_Garages',
        'ak47_garage',
        'ak47_qb_garage',
        'esx_garage',
        'qb-garages',
        'qbx_garages',
    }

    for i=1, #resources, 1 do
        if GetResourceState(resources[i]) == 'started' then
            return resources[i]
        end
    end
    return nil
end

Config.Garages = DetectActiveGarage()



-- ██████╗  █████╗ ███╗   ██╗██╗  ██╗██╗███╗   ██╗ ██████╗ 
-- ██╔══██╗██╔══██╗████╗  ██║██║ ██╔╝██║████╗  ██║██╔════╝ 
-- ██████╔╝███████║██╔██╗ ██║█████╔╝ ██║██╔██╗ ██║██║  ███╗
-- ██╔══██╗██╔══██║██║╚██╗██║██╔═██╗ ██║██║╚██╗██║██║   ██║
-- ██████╔╝██║  ██║██║ ╚████║██║  ██╗██║██║ ╚████║╚██████╔╝
-- ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
local function DetectActiveBanking()
    local resources = {
        'vms_bossmenu',
        'okokBanking',
        'Renewed-Banking',
        'tgg-banking',
        'wasabi_banking',
        'qb-banking',
        'esx_society',
    }

    for i=1, #resources, 1 do
        if GetResourceState(resources[i]) == 'started' then
            return resources[i]
        end
    end
    return nil
end

Config.Banking = DetectActiveBanking()



-- ██╗███╗   ██╗██╗   ██╗███████╗███╗   ██╗████████╗ ██████╗ ██████╗ ██╗   ██╗
-- ██║████╗  ██║██║   ██║██╔════╝████╗  ██║╚══██╔══╝██╔═══██╗██╔══██╗╚██╗ ██╔╝
-- ██║██╔██╗ ██║██║   ██║█████╗  ██╔██╗ ██║   ██║   ██║   ██║██████╔╝ ╚████╔╝ 
-- ██║██║╚██╗██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║   ██║   ██║██╔══██╗  ╚██╔╝  
-- ██║██║ ╚████║ ╚████╔╝ ███████╗██║ ╚████║   ██║   ╚██████╔╝██║  ██║   ██║   
-- ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
local function DetectActiveInventory()
    local resources = {
        'codem-inventory',
        'tgiann-inventory',
        'origen_inventory',
        'jaksam_inventory',
        'ak47_inventory',
        'core_inventory',
        'qs-inventory',
        'ox_inventory',
        'qb-inventory',
        'ps-inventory',
        'inventory', -- Chezza Inventory
    }

    for i=1, #resources, 1 do
        if GetResourceState(resources[i]) == 'started' then
            return resources[i]
        end
    end
    return nil
end

Config.Inventory = DetectActiveInventory()



-- ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
-- ██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
-- ██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
-- ██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
-- ██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
-- ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
CreateThread(function()
    Wait(500)
    
    local function DetectActivePhone()
        local resources = {
            'lb-phone',
            'okokPhone',
            'yseries',
            'gksphone',
            '17mov_Phone',
        }
    
        for i=1, #resources, 1 do
            if GetResourceState(resources[i]):find('start') then
                return resources[i]
            end
        end
        return nil
    end

    Config.Phone = DetectActivePhone()
end)



-- ██████╗ ██╗███████╗██████╗  █████╗ ████████╗ ██████╗██╗  ██╗
-- ██╔══██╗██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║  ██║
-- ██║  ██║██║███████╗██████╔╝███████║   ██║   ██║     ███████║
-- ██║  ██║██║╚════██║██╔═══╝ ██╔══██║   ██║   ██║     ██╔══██║
-- ██████╔╝██║███████║██║     ██║  ██║   ██║   ╚██████╗██║  ██║
-- ╚═════╝ ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝
local function DetectActiveDispatch()
    local resources = {
        'lb-tablet',
        'ps-dispatch',
        'cd_dispatch',
        'qs-dispatch',
        'rcore_dispatch',
        'tk_dispatch',
        'core_dispatch',
    }

    for i=1, #resources, 1 do
        if GetResourceState(resources[i]) == 'started' then
            return resources[i]
        end
    end
    return nil
end

Config.Dispatch = DetectActiveDispatch()



-- ████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗
-- ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝
--    ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   
--    ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   
--    ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   
--    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   
local function DetectActiveTarget()
    local resources = {
        'ox_target',
        'qb-target',
    }

    for i=1, #resources, 1 do
        if GetResourceState(resources[i]) == 'started' then
            return resources[i]
        end
    end
    return nil
end

Config.TargetResource = DetectActiveTarget()



-- ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
-- ████╗ ████║██╔════╝████╗  ██║██║   ██║
-- ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
-- ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
-- ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
-- ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ 
local function DetectActiveMenu()
    local resources = {
        'lation_ui',
        'wasabi_uikit',
        'esx_context',
        'esx_menu_default',
        'qb-menu',
        'ox_lib',
    }

    for i=1, #resources, 1 do
        if GetResourceState(resources[i]) == 'started' then
            return resources[i]
        end
    end
    return nil
end

Config.MenuResource = DetectActiveMenu()



-- ████████╗███████╗██╗  ██╗████████╗██╗   ██╗██╗
-- ╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝██║   ██║██║
--    ██║   █████╗   ╚███╔╝    ██║   ██║   ██║██║
--    ██║   ██╔══╝   ██╔██╗    ██║   ██║   ██║██║
--    ██║   ███████╗██╔╝ ██╗   ██║   ╚██████╔╝██║
--    ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝
CreateThread(function()
    Wait(500)

    local function DetectActiveTextUI()
        local resources = {
            'vms_notifyv2',
            'lation_ui',
            'wasabi_uikit',
            'ox_lib',
        }
    
        for i=1, #resources, 1 do
            if GetResourceState(resources[i]):find('start') then
                return resources[i]
            end
        end
        return nil
    end

    Config.TextUI = DetectActiveTextUI()
end)



-- ███████╗██╗  ██╗███████╗██╗     ██╗     ███████╗
-- ██╔════╝██║  ██║██╔════╝██║     ██║     ██╔════╝
-- ███████╗███████║█████╗  ██║     ██║     ███████╗
-- ╚════██║██╔══██║██╔══╝  ██║     ██║     ╚════██║
-- ███████║██║  ██║███████╗███████╗███████╗███████║
-- ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝
CreateThread(function()
    Config.Shells = {}

    Wait(500)
    
    local ShellsList = {
        -- INTEGRATION_NAME = 'RESOURCE_NAME',
        
        -- Old versions of K4MB1 Shells
        K4MB1 = 'k4mb1shellstarter',                                     -- K4MB1 (DO NOT USE qb-interior)  (https://k4mb1maps.com/product/5015840)
        K4MB1_AllShellsSubPack = 'K4MB1-AllShellsSubPack',               -- K4MB1 All Shells Sub Pack       (https://k4mb1maps.com/product/5107241)

        -- On 16/12/2025, all Shells from K4MB1 received an update changing model names.
        -- Therefore, if you are using the new shells packages, you should use the following options.
        K4MB1_StarterShells = 'K4MB1-StarterShells',                     -- K4MB1-StarterShells             (https://k4mb1maps.com/product/5015840)
        K4MB1_ExclusiveHousingPack = 'K4MB1-ExclusiveHousingPack',       -- K4MB1-ExclusiveHousingPack      (https://k4mb1maps.com/product/7166895)
        K4MB1_FurnishedHousingPack = 'K4MB1-FurnishedHousingPack',       -- K4MB1-FurnishedHousingPack      (https://k4mb1maps.com/product/7166890)
        K4MB1_GaragesPack = 'K4MB1-GaragesPack',                         -- K4MB1-GaragesPack               (https://k4mb1maps.com/product/7166893)
        K4MB1_IllegalOperationsPack = 'K4MB1-IllegalOperationsPack',     -- K4MB1-IllegalOperationsPack     (https://k4mb1maps.com/product/7166896)
        K4MB1_MainHousingPack = 'K4MB1-MainHousingPack',                 -- K4MB1-MainHousingPack           (https://k4mb1maps.com/product/4673316)
        K4MB1_MiscPack = 'K4MB1-MiscPack',                               -- K4MB1-MiscPack                  (https://k4mb1maps.com/product/7166894)
        K4MB1_PremiumHousingPack = 'K4MB1-PremiumHousingPack',           -- K4MB1-PremiumHousingPack        (https://k4mb1maps.com/product/7166889)

        ENVI = 'envi-shells-starter',                                    -- ENVI                            (https://github.com/Envi-Scripts/envi-shells)
        DCCustomz = 'dc_housingshells',                                  -- DCCustomz                       (https://www.dccustomz.com/category/2714613)
        DCCustomzV2 = 'dc_housingshellsv2',                              -- DC Housing Shells V2            (https://www.dccustomz.com/product/7203246)
        JamaringMapsShellsV1 = 'JamaringMaps_Shells',                    -- Jamaring Maps Shells V1         (https://jamaring-maps.tebex.io/package/6095279)
        JamaringMapsShellsV2 = 'JamaringMaps_ShellsV2',                  -- Jamaring Maps Shells V2         (https://jamaring-maps.tebex.io/package/6274927)
        JamaringMapsShellsV3 = 'JamaringMaps_ShellsV3',                  -- Jamaring Maps Shells V3         (https://jamaring-maps.tebex.io/package/6377855)
        JamaringMapsShellsV4 = 'JamaringMaps_ShellsV4',                  -- Jamaring Maps Shells V4         (https://jamaring-maps.tebex.io/package/6559637)
        JamaringMapsShellsV5 = 'JamaringMaps_ShellsV5',                  -- Jamaring Maps Shells V5         (https://jamaring-maps.tebex.io/package/6715104)
        Atenea = false,                                                  -- Atenea Shells                   (https://atenea.tebex.io/category/shell-1)

        Max_Creations_25 = 'max_25shellspack',                           -- Max Creations 25 Pack           (https://maxcreationsstore.tebex.io/package/6177840)
        Max_Creations_Classic = 'max_classicshells',                     -- Max Creations Classic           (https://maxcreationsstore.tebex.io/package/6801554)
    }

    local function DetectActiveShells()
        for name, resourceName in pairs(ShellsList) do
            if type(resourceName) == 'string' then
                Config.Shells[name] = GetResourceState(resourceName):find('start')
            end
        end
    end

    DetectActiveShells()
end)