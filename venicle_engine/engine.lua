local vehicleEngine = {}

function switchEngineState (player)
	local vehicle = getPedOccupiedVehicle (player)
	if (vehicle) then
		setVehicleEngineState (vehicle, not getVehicleEngineState (vehicle))
	end
end

addEventHandler ("onVehicleEnter", root,
	function (player, seat)
		if (seat == 0) then
			setVehicleEngineState (source, vehicleEngine[source] or false)
			bindKey (player, "e", "down", switchEngineState)
		end
	end
)

addEventHandler ("onVehicleExit", root,
	function (player, seat)
		if (seat == 0) then
			vehicleEngine[source] = getVehicleEngineState (source)
			unbindKey (player, "e", "down", switchEngineState)
		end
	end
)

addEventHandler ("onElementDestroy", root,
	function ()
		if getElementType (source) == "vehicle" then
			if vehicleEngine[source] then
				vehicleEngine[source] = nil
			end
		end
	end
)
