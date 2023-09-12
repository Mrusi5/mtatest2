local vehicleLights = {}

function consoleVehicleLights (source)
    if isPedInVehicle (source) then
    playerVehicle = getPedOccupiedVehicle (source) 
        if (playerVehicle) then 
            if (getVehicleOverrideLights (playerVehicle) ~= 2) then 
                setVehicleOverrideLights (playerVehicle, 2) 
            else
                setVehicleOverrideLights (playerVehicle, 1)
            end
        end
    end
end

addEventHandler ("onVehicleEnter", root,
    function (player, seat)
        if seat == 0 then
            local vehicle = source
            bindKey (player, "l", "down", consoleVehicleLights)
        end
    end
)

addEventHandler ("onVehicleExit", root,
    function (player, seat)
        if seat == 0 then
            local vehicle = source
            unbindKey (player, "l", "down", consoleVehicleLights)
        end
    end
)

addEventHandler ("onElementDestroy", root,
    function ()
        if getElementType (source) == "vehicle" then
            if vehicleLights[vehicle] then
                vehicleLights[vehicle] = nil
            end
        end
    end
)
