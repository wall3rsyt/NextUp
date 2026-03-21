-- Triggered when player passed the theoretical / practical exam
function AddLicense(source, license, exam)
    if Config.Framework.FrameworkName == 'esx' then
        if exam == "practical" then
            TriggerEvent('esx_license:addLicense', source, license, function() end)
        end
    elseif Config.Framework.FrameworkName == 'qb' then
        local QBCore = exports[Config.Framework.FileName]:GetCoreObject()
        local qbPlayer = QBCore.Functions.GetPlayer(source)
        if exam == "practical" then
            if qbPlayer ~= nil then
                local licenseTable = qbPlayer.PlayerData.metadata['licences']
                licenseTable[license] = true
                qbPlayer.Functions.SetMetaData('licences', licenseTable)
                qbPlayer.Functions.Save()
            end
        end
    end
end

-- Notification Bridge
function Notification(source, text)
    if Config.Framework.FrameworkName == 'esx' then
        TriggerClientEvent('esx:showNotification', source, text)
    elseif Config.Framework.FrameworkName == 'qb' then
        TriggerClientEvent('QBCore:Notify', source, text)
    end
end