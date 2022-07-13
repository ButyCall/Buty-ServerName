-- ##################### VARIABLES ####################
BCall = {}
inicia = nil
local display = false
local Admin

-- ##################### HILOS ####################

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

Citizen.CreateThread(function()
	BCall.comprueba()
    while true do 
        Wait(1500)
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

BCall.comprueba = function()
    Admin = nil
    TriggerServerEvent('BCall:Admin')
    while (Admin == nil) do
        Citizen.Wait(1)
    end
end

-- ##################### CALLBACKS ####################



RegisterNetEvent('BCall:comprueba')
AddEventHandler('BCall:comprueba', function(estado)
    Admin = estado
end)

RegisterNUICallback("exit", function(data)
    SetNuiFocus(false, false)
    SetDisplay(false)
end)

RegisterNUICallback("exit2", function(data)
    SetNuiFocus(false, false)
end)

RegisterNetEvent('BCall:player')
AddEventHandler('BCall:player', function (data)

    SendNUIMessage({
        type = 'player',
        data = data,
        staff = staff,
        max = Config.MaxPlayer,
        top = Config.Top

    })

end)

-- ##################### COMANDOS ####################

RegisterCommand("staff", function()
    if Admin then
        staff = 1
    else
        print('no eres admin')
    end
end)

RegisterCommand("nostaff", function(bool)
    if Admin then
        staff = 0
    else
        print('no eres admin')
    end
end)

RegisterCommand("changue", function(source, args)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'changue',
        nameserver = Config.NameServer,
        nameserver2 = Config.NameServer
    })
end)