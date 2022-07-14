ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function GetTotalStaff(players)
    local totalStaff = 0
    for _, playerId in ipairs(players) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer then
            local group = xPlayer.getGroup()
            if Config.Permissions[group] then
                totalStaff = totalStaff + 1
            end
        end
    end
    return totalStaff
end

local function updatePlayers()
    local getPlayers = GetPlayers()
    local totalStaff = GetTotalStaff(getPlayers)
    local totalPlayer = #getPlayers
    Wait(2000) -- Provide error
    TriggerClientEvent('BCall:updatePlayersData', -1, totalStaff, totalPlayer)
end

CreateThread(function()
    updatePlayers()
    TriggerClientEvent('BCall:openUI', -1)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(id, xPlayer)
    updatePlayers()
    TriggerClientEvent('BCall:openUI', id)
end)
