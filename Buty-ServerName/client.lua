-- ##################### VARIABLES ####################

ESX = nil
BCall = {}
inicia = nil
local display = false

-- ##################### HILOS ####################

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while inicia == nil do
        Citizen.Wait(0)
        if Config.Static then
            SetDisplay(not display)
        else
            SetDisplay(display)
        end
        return
    end

end)

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        TriggerServerEvent('BCall:Data')
    end
end)

-- ##################### FUNCIONES ####################


function SetDisplay(bool)
    display = bool
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

RegisterNetEvent('BCall:player')
AddEventHandler('BCall:player', function (staff, players)

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
