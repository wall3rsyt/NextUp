if Config.framework == 'esx' then
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

        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        ESX.PlayerData = ESX.GetPlayerData()
        PLAYER_JOB = ESX.PlayerData.job.name
    end)

    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        ESX.PlayerData.job = job
        PLAYER_JOB = job.name
    end)
end

if Config.framework == 'qb' or Config.framework == 'QB' or Config.framework == 'qbcore' or Config.framework == 'QBCORE' then
    QBCore = exports['qb-core']:GetCoreObject()

    if QBCore.Functions.GetPlayerData() and QBCore.Functions.GetPlayerData().job then
        PLAYER_JOB = QBCore.Functions.GetPlayerData().job.name
    end

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        PLAYER_JOB = QBCore.Functions.GetPlayerData().job.name
    end)

    RegisterNetEvent('QBCore:Client:OnJobUpdate')
    AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
        PLAYER_JOB = JobInfo.name
    end)
end

-- qbox framework support
if Config.framework == 'qbox' then
    QBCore = exports['qbx_core']:getSharedObject()
    if QBCore.Functions.GetPlayerData() and QBCore.Functions.GetPlayerData().job then
        PLAYER_JOB = QBCore.Functions.GetPlayerData().job.name
    end
    RegisterNetEvent('qbx_core:client:onPlayerLoaded')
    AddEventHandler('qbx_core:client:onPlayerLoaded', function()
        PLAYER_JOB = QBCore.Functions.GetPlayerData().job.name
    end)
    RegisterNetEvent('qbx_core:client:onJobUpdate')
    AddEventHandler('qbx_core:client:onJobUpdate', function(JobInfo)
        PLAYER_JOB = JobInfo.name
    end)
end