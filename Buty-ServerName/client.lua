RegisterNetEvent('BCall:openUI', function()
    if Config.Static then
        SetDisplay(true)
    end
end)

-- ##################### FUNCIONES ####################


function SetDisplay(bool)
    SendNUIMessage({
        type = "ui",
        status = bool, 
        top = Config.Top,
        nameserver = Config.NameServer,
        nameserver2 = Config.NameServer
    })
end

-- ##################### CALLBACKS ####################


RegisterNUICallback("exit", function(data)
    SetNuiFocus(false, false)
    SetDisplay(false)
end)

RegisterNUICallback("exit2", function(data)
    SetNuiFocus(false, false)
end)

RegisterNetEvent('BCall:updatePlayersData')
AddEventHandler('BCall:updatePlayersData', function (staff, players)
    SendNUIMessage({
        type = 'player',
        staff = staff,
        players = players,
        max = Config.MaxPlayer,
        top = Config.Top

    })
end)

-- ##################### COMANDOS ####################

RegisterCommand("change", function(source, args)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'change',
        nameserver = Config.NameServer,
        nameserver2 = Config.NameServer
    })
end)
