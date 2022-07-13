ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

RegisterNetEvent('BCall:Data')
AddEventHandler('BCall:Data', function ()
    local staff = 0
    local players = 0
    for _, playerId in ipairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "moderator" then
            staff = staff + 1
            players = players + 1
        else 
            players = players + 1
        end
    end
    TriggerClientEvent('BCall:player', source, staff, players)
end)