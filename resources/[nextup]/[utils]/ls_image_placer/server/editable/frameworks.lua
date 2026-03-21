if Config.framework == 'esx' or Config.framework == 'ESX' then
    ESX = nil
    Citizen.CreateThread(function()
        if Config.useNewESXExport then
            ESX = exports["es_extended"]:getSharedObject()
        else
            while ESX == nil do
                TriggerEvent('esx:getSharedObject', function(obj)
                    ESX = obj
                end)
                Citizen.Wait(0)
            end
        end

        function CheckJobAndRank(source)
            local xPlayer = ESX.GetPlayerFromId(source)

            if not xPlayer then
                return false
            end

            local job = xPlayer.getJob()

            for k, jobData in pairs(Config.devModePermissions.jobs) do
                if jobData.name == job.name and jobData.minimumRank <= job.grade then
                    return true
                end
            end

            return false
        end
    end)
end

if Config.framework == 'qb' or Config.framework == 'qbcore' or Config.framework == 'QB' then
    QBCore = exports['qb-core']:GetCoreObject()

    function CheckJobAndRank(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)

        if not xPlayer then
            return false
        end

        local job = xPlayer.PlayerData.job

        for k, jobData in pairs(Config.devModePermissions.jobs) do
            if jobData.name == job.name and jobData.minimumRank <= job.grade.level then
                return true
            end
        end

        return false
    end
end

-- qbox framework support
if Config.framework == 'qbox' then
    QBoxCore = exports['qbox-core']:GetCoreObject()

    function CheckJobAndRank(source)
        local xPlayer = QBoxCore.GetPlayer(source)

        if not xPlayer then
            return false
        end

        local job = xPlayer.GetPlayerData().job

        for k, jobData in pairs(Config.devModePermissions.jobs) do
            if jobData.name == job.name and jobData.minimumRank <= job.grade then
                return true
            end
        end

        return false
    end
end
