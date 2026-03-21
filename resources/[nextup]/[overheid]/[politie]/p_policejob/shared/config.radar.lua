Config.Radar = {}

Config.Radar.KeyMapper = 'G' -- Press "G" to toggle Police Radar (SET to "" if you dont want key mapper)

-- SPEED UNIT
Config.Radar.Unit = 'KMH' -- MPH / KMH

--@param [side: string]: [key: string]
Config.Radar.LockKeys = {
    ['front'] = 'J',
    ['rear'] = 'M'
}

--@param [jobName: string]
Config.Radar.RestrictedJobs = {
    ['police'] = true,
    ['sheriff'] = true
}

--@param [vehicleModel: string]
-- REMEMBER TO USE SYNTAX ` INSTEAD OF '
Config.Radar.RestrictedVehicles = {
    [`police`] = true,
    [`policebabatunde`] = true,
    [`kanzlerSRTlineEU2`] = true,
    [`polevasiontdb`] = true,
    [`everonpol`] = true,
    [`Polsr6`] = true,
    [`polubermacht`] = true,
    [`unmrebla`] = true,
    [`politiemotor2`] = true,
    [`politiemotor3`] = true,
    [`polrebla`] = true,
    [`Unmsr6`] = true,
    [`unmsr7`] = true
}

Config.Radar.RestrictedDuty = true -- must be on duty to use

-- POLICE SPEED GUN
Config.HandRadar = {}

--@param [jobName: string]: grade [number]
Config.HandRadar.RestrictedJobs = { -- which jobs can use
    ['police'] = 0,
    ['sheriff'] = 0
}

--@param bool: true/false
Config.HandRadar.RestrictedDuty = true -- must be on duty to use