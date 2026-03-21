return {
    updateInterval = 5, -- Hoe vaak spelerdata wordt bijgewerkt (in minuten)

    money = {
        ---@alias MoneyType 'cash' | 'bank' | 'crypto'
        ---@alias Money {cash: number, bank: number, crypto: number}
        ---@type Money
        moneyTypes = { cash = 500, bank = 5000,}, -- type = startbedrag. Voeg geldtypes toe of verwijder ze (bijv. blackmoney = 0). Let op: eenmaal toegevoegd wordt het niet meer verwijderd uit de database!
        dontAllowMinus = { 'cash', 'crypto' }, -- Geldtypes die niet negatief mogen worden
        paycheckTimeout = 10, -- Tijd in minuten tussen uitbetalingen
        paycheckSociety = false -- Als true wordt het salaris uitbetaald vanuit het bedrijfssaldo
    },

    player = {
        hungerRate = 4.0,  
        thirstRate = 4.5,  

        ---@enum BloodType
        bloodTypes = {
            'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-',
        },

        ---@alias UniqueIdType 'citizenid' | 'AccountNumber' | 'PhoneNumber' | 'FingerId' | 'WalletId' | 'SerialNumber'
        ---@type table<UniqueIdType, {valueFunction: function}>
        identifierTypes = {
            citizenid = {
                valueFunction = function()
                    return lib.string.random('A.......')
                end,
            },
            AccountNumber = {
                valueFunction = function()
                    -- NL-stijl IBAN-achtig rekeningnummer
                    return 'NL0' .. math.random(1, 9) .. 'QBX' .. math.random(1111, 9999) .. math.random(1111, 9999) .. math.random(11, 99)
                end,
            },
            PhoneNumber = {
                valueFunction = function()
                    -- Nederlands 06-nummer formaat
                    return '06' .. math.random(10000000, 99999999)
                end,
            },
            FingerId = {
                valueFunction = function()
                    return lib.string.random('...............')
                end,
            },
            WalletId = {
                valueFunction = function()
                    return 'QB-' .. math.random(11111111, 99999999)
                end,
            },
            SerialNumber = {
                valueFunction = function()
                    return math.random(11111111, 99999999)
                end,
            },
        }
    },

    ---@alias TableName string
    ---@alias ColumnName string
    ---@type [TableName, ColumnName][]
    characterDataTables = {
        {'bank_accounts_new', 'id'},
        {'playerskins', 'citizenid'},
        {'player_mails', 'citizenid'},
        {'player_outfits', 'citizenid'},
        {'player_vehicles', 'citizenid'},
        {'player_groups', 'citizenid'},
        {'players', 'citizenid'},
    }, -- Rijen die worden verwijderd wanneer een karakter wordt gewist

    server = {
        pvp = true, -- PvP in- of uitschakelen (kunnen spelers elkaar beschieten)
        closed = false, -- Server sluiten (niemand kan joinen behalve spelers met ace-permissie 'qbadmin.join')
        closedReason = 'Server Gesloten', -- Melding die wordt weergegeven wanneer de server gesloten is
        whitelist = false, -- Whitelist in- of uitschakelen
        whitelistPermission = 'admin', -- Permissie die toegang geeft als de whitelist aan staat
        discord = 'discord.gg/NextUp', -- Discord uitnodigingslink
        checkDuplicateLicense = true, -- Controleer op dubbele Rockstar-licenties bij joinen
        ---@deprecated gebruik het cfg ACE-systeem
        requireOptIn = true, -- Zet op false om het /optin commando vereiste voor admincommando's uit te schakelen
        permissions = { 'god', 'admin', 'mod' }, -- Voeg groepen toe naar wens (maak ze eerst aan in server.cfg)
    },

    characters = {
        playersNumberOfCharacters = { -- Maximaal aantal karakters per Rockstar-licentie (te vinden in de database in de players-tabel)
            ['license2:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'] = 5,
        },

        defaultNumberOfCharacters = 1, -- Standaard maximaal aantal karakters per speler (max. 3 standaard)
    },

    -- Deze configuratie is alleen voor core-events. Andere webhooks hier plaatsen heeft geen effect.
    logging = {
        webhook = {
            ['default'] = nil,
            ['joinleave'] = nil,
            ['ooc'] = nil,
            ['anticheat'] = nil,
            ['playermoney'] = nil,
        },
        role = {} -- Rol om te taggen bij prioriteitslogs. Gebruik <@%roleid> voor rollen, <@userid/channelid> voor gebruikers/kanalen
    },

    persistence = {
        lockState = 'lock', -- 'lock': voertuig vergrendeld bij spawnen | 'unlock': voertuig ontgrendeld bij spawnen
    },

    giveVehicleKeys = function(src, plate, vehicle)
        return exports.qbx_vehiclekeys:GiveKeys(src, vehicle)
    end,

    setVehicleLock = function(vehicle, state)
        exports.qbx_vehiclekeys:SetLockState(vehicle, state)
    end,

    getSocietyAccount = function(accountName)
        return exports['Renewed-Banking']:getAccountMoney(accountName)
    end,

    removeSocietyMoney = function(accountName, payment)
        return exports['Renewed-Banking']:removeAccountMoney(accountName, payment)
    end,

    ---Salarisfunctie
    ---@param player Player Spelerobject
    ---@param payment number Uitbetalingsbedrag
    sendPaycheck = function(player, payment)
        player.Functions.AddMoney('bank', payment)
        Notify(player.PlayerData.source, locale('info.received_paycheck', payment))
    end,
}