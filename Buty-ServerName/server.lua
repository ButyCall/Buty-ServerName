local data = {}

RegisterNetEvent('BCall:Data')
AddEventHandler('BCall:Data', function ()
    local src = source
    players = GetNumPlayerIndices()
    staff = 0
    data = {players = players, staff = staff}
    TriggerClientEvent('BCall:player', src, data)
end)

RegisterServerEvent('BCall:Admin')
AddEventHandler('BCall:Admin', function()
    local Admin = Config.Admin
    local BCallidentifica = GetPlayerIdentifiers(source)
    BCallidentifica = BCallidentifica[1]
    for a, v in pairs(Admin) do 
        if v == BCallidentifica then 
            TriggerClientEvent('BCall:comprueba', source, true)
            return true 
        end
    end 
    return false 
end)