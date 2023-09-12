local playerVehicles = {}

function createVehicleForPlayer(player, cmd, model)

    if isElement(playerVehicles[player]) then
        destroyElement(playerVehicles[player])
    end

    local x, y, z = getElementPosition(player)
    local vehicle = createVehicle(model, x + 5, y, z)
    if not vehicle then
        outputChatBox("Ошибка: Неверная модель транспорта", player, 255, 0, 0)
        return
    end

    setElementData(vehicle, "owner", player)

    playerVehicles[player] = vehicle
end

addCommandHandler("veh", createVehicleForPlayer)

function onPlayerQuit()
    local player = source

    if isElement(playerVehicles[player]) then
        destroyElement(playerVehicles[player])
    end

    playerVehicles[player] = nil
end
addEventHandler("onPlayerQuit", getRootElement(), onPlayerQuit)

function onVehicleStartEnter(player, seat, jacked, door, engine, col)
    local vehicle = source

    if isElement(vehicle) then
        local owner = getElementData(vehicle, "owner")
        if seat == 0 and owner ~= player then
            cancelEvent()
            outputChatBox("Вы не можете садиться в это транспортное средство.", player, 255, 0, 0)
        end
    end
end

addEventHandler("onVehicleStartEnter", getRootElement(), onVehicleStartEnter)
