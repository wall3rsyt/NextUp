Config = {}

Config.Framework = 'QBOX'
Config.Language = 'nl'
Config.SSN = 'id'

Config.Debug = false

Config.RadioChannels = {
    ["1"] = 'EMS'
}

Config.Jobs = {
    ['ambulance'] = {
        image = 'img/lspd.png',
        mainColor = '#dc4848',
        mainColorHover = '#ea4e4e',
        bgColor = '#181111'
    }
}

Config.Units = {
    'ADAM', 'MERRY', 'EAGLE', 'SEU'
}

Config.Vehicles = {
    ['elegy'] = { label = 'Elegy Retro', price = 5000, type = 'car'}
}

Config.SecondOwner = 'co_owner'

Config.Documents = {
    ['drive'] = {label = 'Rijbewijs B', access = {['ambulance'] = 0}},
    ['drive_truck'] = {label = 'Rijbewijs C', access = {['ambulance'] = 0}},
    ['drive_bike'] = {label = 'Rijbewijs A', access = {['ambulance'] = 0}},
    ['weapon'] = {label = 'Wapenverlof', access = {['ambulance'] = 0}},
}

Config.WorkersLicenses = {
    ['eagle'] = {label = 'Licentie EAGLE', access = {['ambulance'] = 0}},
}

-- ================================================
--   QBOX VEHICLEKEYS
-- ================================================

Config.AddKeys = function(plate, vehicle, model)
    TriggerServerEvent('qb-vehiclekeys:server:SetOwner', plate)
end

Config.RemoveKeys = function(plate, vehicle, model)
    TriggerServerEvent('qb-vehiclekeys:server:RemoveKeys', plate)
end

Config.Spawners = {
    ['Pillbox'] = {
        coords = vector4(337.9300, -586.5479, 74.1617, 252.6965),
        radius = 0.75,
        drawSprite = true,
        debug = false,
        ped = {
            model = 's_m_m_paramedic_01',
            anim = {},
        },
        options = {
            {
                type = 'spawn',
                name = 'Pillbox_Spawn_Helicopters',
                label = 'Helicopter ophalen',
                icon = 'fa-solid fa-helicopter',
                distance = 2,
                jobs = {['ambulance'] = 0},
                license = 'eagle',
                coords = vector4(351.6269, -588.0816, 74.1617, 241.1684),
                needDuty = false,
                vehicle = {
                    model = 'maverick',
                    tune = true,
                    livery = 2,
                    plate = 'EMS%s',
                }
            },
            {
                type = 'hide',
                name = 'Pillbox_Hide_Helicopters',
                label = 'Helicopter wegzetten',
                icon = 'fa-solid fa-helicopter',
                distance = 2,
                jobs = {['ambulance'] = 0},
                license = 'eagle',
                coords = vector4(351.6269, -588.0816, 74.1617, 241.1684),
                needDuty = false,
            },
        }
    }
}

-- ================================================
--   TOEGANGSRECHTEN PER RANG (0 = laagste)
--   Pas de rangen aan naar jouw systeem
-- ================================================

local defaultAccess = {
    ['home'] = {
        ['last_procedures'] = true, ['last_assigned_wheelchairs'] = true, ['most_active_employees'] = true,
        ['change_code'] = true, ['duty_time'] = true, ['last_active'] = true
    },
    ['patrols'] = {
        ['create'] = true, ['join'] = true
    },
    ['citizens'] = {
        ['add_note'] = true, ['add_allergy'] = true, ['delete_allergy'] = true,
        ['add_procedure'] = true, ['delete_note'] = true, ['delete_procedure'] = true,
        ['set_photo'] = true
    },
    ['documents'] = {
        ['add_document'] = true, ['delete_document'] = true
    },
    ['announcements'] = {
        ['create'] = true, ['delete'] = true
    },
    ['wheelchairs'] = {
        ['add_wheelchair'] = true, ['delete_wheelchair'] = true
    },
    ['notepad'] = true,
    ['employees'] = {
        ['add'] = true, ['reset_time_all'] = true, ['update'] = true, ['fire'] = true,
        ['add_note'] = true, ['delete_note'] = true, ['break'] = true,
        ['add_license'] = true, ['delete_license'] = true, ['change_badge'] = true,
        ['reset_time_employee'] = true, ['set_photo'] = true
    },
    ['garage'] = {
        ['buy'] = true, ['impound'] = true, ['manage'] = true
    },
    ['judgements'] = true
}

Config.Access = {
    ['ambulance'] = (function()
        local access = {}
        for i = 0, 10 do
            access[tostring(i)] = defaultAccess
        end
        return access
    end)()
}