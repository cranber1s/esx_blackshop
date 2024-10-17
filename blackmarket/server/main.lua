E = nil

if Config.Framework == "esx" then
    Citizen.CreateThread(function()
        while E == nil do
            TriggerEvent('esx:getSharedObject', function(e) E = e end)
            Citizen.Wait(0)
        end
    end)
else
    E = exports["es_extended"]:getSharedObject()
end

RegisterServerEvent('x9o_bm:b')
AddEventHandler('x9o_bm:b', function(f, g)
    local h = E.GetPlayerFromId(source)

    if h.getInventoryItem('money').count >= g then
        exports.ox_inventory:RemoveItem(source, 'money', g)
        exports.ox_inventory:AddItem(source, f, 1)
        TriggerClientEvent('x9o_bm:n', source, Config.Settings.locales.purshased .. g)
    else
        TriggerClientEvent('x9o_bm:n', source, Config.Settings.locales.notenough)
    end
end)
