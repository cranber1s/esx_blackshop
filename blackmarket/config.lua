Config = {}

-- Define the framework, "esx" or if you're using the latest esx use "newesx"
Config.Framework = "esx"

-- Weapons available in the black market
Config.Weapons = {
    {
        name = 'Combat Pistol',    -- Display name for the weapon
        model = 'WEAPON_COMBATPISTOL',  -- Weapon model hash
        price = 2500,   -- Purchase price
    },
    {
        name = 'Heavy Pistol',
        model = 'WEAPON_HEAVYPISTOL',
        price = 5500,
    },
    -- Add more weapons as needed
    -- {
    --     name = 'Another Weapon',
    --     model = 'WEAPON_ANOTHER',
    --     price = 2500,
    -- },
}

-- Settings for the black market
Config.Settings = {
    name = 'Nelegali ginklu prekyba',  -- Display name for the black market in the context menu
    ped = 'a_m_m_bevhills_02',  -- Model hash for the black market vendor ped

    locales = {
        target = 'Perziureti pasiulimus',  -- Label for viewing weapon options with the ox_target
        hovertosee = 'Užeikite kad pamatyti daugiau',  -- Hover text to see more details
        progressbar = 'Kalbates su prekeiviu...',  -- Progress bar label
        gunprice = 'Ginklo kaina',  -- Label for displaying weapon price
        purshased = 'Jūs nusipirkote ginklą už $',  -- Message for successful purchase
        notenough = 'Jūs neturite pakankamai pinigų kad nusipirktumėte šį ginklą'  -- Message for insufficient funds
    },

    pedCoordinates = { -- 56.9475, 6307.1626, 31.2264, 29.6221
        x = 56.9475,  -- Initial X coordinate for the black market ped
        y = 6307.1626,  -- Initial Y coordinate
        z = 30.4876,    -- Initial Z coordinate
        h = 29.6221,      -- Initial heading (rotation) for the ped
    },

    activeHours = {
        start = 1,  -- Active hours start at 01:00 AM (24-hour format)
        finish = 5, -- Active hours end at 05:00 AM
    },
}

-- Function for displaying notifications
Notification = function(msg)
    ESX.ShowNotification(msg)
end
