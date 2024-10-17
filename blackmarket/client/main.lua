E = nil
local a, b = nil, false

if Config.Framework == "esx" then
    Citizen.CreateThread(function()
        while E == nil do
            TriggerEvent('esx:getSharedObject', function(c) E = c end)
            Citizen.Wait(0)
        end
    end)
else
    E = exports["es_extended"]:getSharedObject()
end

RegisterNetEvent('x9o_bm:o')
AddEventHandler('x9o_bm:o', function()
    x93()
end)

local function x93()
    lib.showContext('bm_m')
end

local function p(t)
    local u = {}
    for _, v in ipairs(Config.Weapons) do
        table.insert(u, {
            title = v.name,
            description = Config.Settings.locales.hovertosee,
            icon = 'gun',
            onSelect = function()
                if lib.progressBar({
                    duration = 3000,
                    label = Config.Settings.locales.progressbar,
                    useWhileDead = false,
                    canCancel = false,
                    disable = { car = true },
                    anim = { dict = 'amb@code_human_cross_road@male@idle_a', clip = 'idle_b' },
                }) then end
                TriggerServerEvent('x9o_bm:b', v.model, v.price)
            end,
            metadata = { { label = Config.Settings.locales.gunprice, value = v.price } }
        })
    end
    return u
end

lib.registerContext({
    id = 'bm_m',
    title = Config.Settings.name,
    options = p()
})

Citizen.CreateThread(function()
    while true do
        local w = GetClockHours()
        local x

        if Config.Settings.activeHours.start < Config.Settings.activeHours.finish then
            x = w >= Config.Settings.activeHours.start and w < Config.Settings.activeHours.finish
        else
            x = (w >= Config.Settings.activeHours.start or w < Config.Settings.activeHours.finish)
        end

        if x and not a and b then
            RequestModel(Config.Settings.ped)
            while not HasModelLoaded(Config.Settings.ped) do
                Wait(500)
            end
            a = CreatePed(1, Config.Settings.ped, Config.Settings.pedCoordinates.x, Config.Settings.pedCoordinates.y, Config.Settings.pedCoordinates.z, Config.Settings.pedCoordinates.h, false, false)
            FreezeEntityPosition(a, true)
            TaskStartScenarioInPlace(a, "WORLD_HUMAN_COP_IDLES", 0, true)
            SetBlockingOfNonTemporaryEvents(a, true)
            SetEntityInvincible(a, true)
            SetModelAsNoLongerNeeded(Config.Settings.ped)
        elseif not x or not b and a then
            DeleteEntity(a)
            a = nil
        end

        Citizen.Wait(10000)
    end
end)

function q()
    b = not b
end

exports.ox_target:addModel(Config.Settings.ped, {
    {
        event = 'x9o_bm:o',
        icon = 'fa-solid fa-gun',
        label = Config.Settings.locales.target,
        distance = 2,
    }
})

RegisterNetEvent('x9o_bm:n')
AddEventHandler('x9o_bm:n', function(d)
    z(d)
end)

function z(d)
    E.ShowNotification(d)
end
