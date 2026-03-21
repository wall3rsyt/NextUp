-- Triggered when player passed the theoretical / practical exam
-- source = player identifier
-- exam = exap type (theoretical, practical)
function AddLicense(source, exam)
    license = "boat"
    if ESX then
        if exam == "practical" then
            TriggerEvent('esx_license:addLicense', source, license, function() end)
        end
    elseif QBCore then
        local qbPlayer = QBCore.Functions.GetPlayer(source)
        if exam == "practical" then
            if qbPlayer.PlayerData.source ~= nil then
                local licenseTable = qbPlayer.PlayerData.metadata['licences']
                licenseTable[license] = true
                qbPlayer.Functions.SetMetaData('licences', licenseTable)
                qbPlayer.Functions.Save()
            end
        end
    end
end

-- Triggered when notification needs to be shown
-- source = player id
-- text = notification text
function Notification(source, text)
    
end