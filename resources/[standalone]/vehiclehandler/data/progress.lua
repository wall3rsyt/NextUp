local defaults <const> = {
    position     = 'bottom',
    useWhileDead = false,
    canCancel    = true,
    disable      = { car = true, move = true, combat = true, mouse = false },
}

local repair_anim <const> = { dict = 'mini@repair', clip = 'fixing_a_player' }

local function entry(key, duration, anim)
    return {
        label        = locale('progress.' .. key),
        duration     = duration,
        position     = defaults.position,
        useWhileDead = defaults.useWhileDead,
        canCancel    = defaults.canCancel,
        disable      = defaults.disable,
        anim         = anim,
    }
end

return {
    cleankit = entry('cleankit', 15000),
    tirekit  = entry('tirekit',  15000, { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer', flag = 10 }),
    smallkit = entry('smallkit', 20000, repair_anim),
    bigkit   = entry('bigkit',   30000, repair_anim),
}