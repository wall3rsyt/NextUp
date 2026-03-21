Config.Cameras = {}

--@param Enabled: boolean - enable/disable cameras
Config.Cameras.Enabled = true

-- REMEMBER TO CREATE CAMERA FIRST TO WATCH THEM [/camera_creator]
Config.Cameras.WatchPoints = {
    ['MissionRow'] = {
        jobs = {['police'] = 0},
        coords = vector3(432.64, -976.26, 30.12),
        requiredDuty = true
    }
}

Config.Cameras.Models = {
    ['prop_cctv_cam_06a'] = 'CCTV Camera 1',
    ['ch_prop_ch_cctv_cam_02a'] = 'CCTV Camera 2',
    ['tr_prop_tr_camhedz_cctv_01a'] = 'CCTV Camera 3',
    ['prop_cctv_cam_02a'] = 'CCTV Camera 4',
    ['prop_cctv_pole_04'] = 'CCTV Camera Pole'
}

Config.Cameras.AllowedGroups = { -- which groups can create cameras
    ['owner'] = true,
    ['admin'] = true
}

Config.Cameras.AllowedJobs = { -- which jobs can create cameras
    ['police'] = 0,
    ['sheriff'] = 0
}

Config.Cameras.ShowHelpNotify = function()
    if GetResourceState('p_helper') == 'started' then
        exports['p_helper']:showHelper({
            {
                keys = {'X'},
                label = locale('cancel')
            },
            {
                keys = {'<', '>'},
                label = locale('rotate_x')
            },
            {
                keys = {'N', 'M'},
                label = locale('rotate_y')
            },
            {
                keys = {'↑', '↓'},
                label = locale('rotate_z')
            },
            {
                keys = {'E'},
                label = locale('confirm')
            },
        })
    else
        lib.showTextUI('[X] - '..locale('cancel')..' | [< >] - '..locale('rotate_x')..' | [N/M] -'..locale('rotate_y')..' | [↑ ↓] - '..locale('rotate_z')..' | [E] - '..locale('confirm'))
    end
end

Config.Cameras.HideHelpNotify = function()
    if GetResourceState('p_helper') == 'started' then
        exports['p_helper']:hideHelper()
    else
        lib.hideTextUI()
    end
end

Config.Cameras.OnStartWatching = function() -- CLIENT SIDE FUNCTION
    lib.showTextUI('[X] - '..locale('stop_watching')..' | [⇆] - '..locale('rotate_left_right')..' | [↓↑] - '..locale('move_up_down'), {
        position = 'bottom-center'
    })
    SetTimecycleModifier('Island_CCTV_ChannelFuzz')
    SetTimecycleModifierStrength(0.25)
end

Config.Cameras.OnStopWatching = function() -- CLIENT SIDE FUNCTION
    lib.hideTextUI()
    SetTimecycleModifier('default')
    SetTimecycleModifierStrength(1.0)
end

Config.Cameras.OnStartWatching_Server = function() -- SERVER SIDE FUNCTION
end

Config.Cameras.OnStopWatching_Server = function() -- SERVER SIDE FUNCTION
end