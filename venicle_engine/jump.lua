function isCarOnGround(vehicle, player)
    if isElement(vehicle) and getElementType(vehicle) == "vehicle" then
        local isOnGround = isVehicleOnGround(vehicle)
        return isOnGround
    end
    return false
end

function handleLShiftKeyPress (player)
    local vehicle = getPedOccupiedVehicle (player)
    if isElement (vehicle) and isCarOnGround (vehicle) then
        local x, y, z = getElementPosition (vehicle)
        setElementPosition (vehicle, x, y, z + 1)
    end
end

addEventHandler ("onVehicleEnter", root,
    function (player, seat)
        if (seat == 0) then
            bindKey (player, "lshift", "down", handleLShiftKeyPress)
        end
    end
)

addEventHandler ("onVehicleExit", root,
    function (player, seat)
        if (seat == 0) then
            unbindKey (player, "lshift", "down", handleLShiftKeyPress)
        end
    end
)
