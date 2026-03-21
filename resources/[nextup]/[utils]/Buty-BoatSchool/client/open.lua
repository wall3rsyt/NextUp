-- Triggered when the practical exam vehicle was spawned
-- vehicle = the vehicle handle
function VehicleSpawned(vehicle)
end

-- Triggered before the script deletes the mission vehicle
-- vehicle = the vehicle handle
function VehicleDeleted(vehicle)

end

-- Triggered when the player died while in mission
-- If you are using the default esx_ambulancejob or qb-ambulancejob then leave it blank
function RevivePlayer()

end

function Text(text,coords)
	local dist = Vdist(coords.x,coords.y,coords.z,GetEntityCoords(PlayerPedId(-1)))
    if dist < 1.5 then
        DrawText3Ds(coords.x,coords.y,coords.z + 1.05,text, 0, 0.1, 0.1,255)
    else
        DrawText3Ds(coords.x,coords.y,coords.z + 1.05,text, 0, 0.1, 0.1,100)
    end
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end