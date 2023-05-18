-- Load the configuration file
Config = {}
local configFile = LoadResourceFile(GetCurrentResourceName(), "config/config.lua")
if configFile then
    assert(load(configFile))()
end

RegisterCommand('repair', function(source, args)
    local playerId = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerId, false)

    if not IsPedSittingInAnyVehicle(playerId) then
        return
    end

    local playerCoords = GetEntityCoords(playerId)
    local isAdmin = IsPlayerAceAllowed(source, Config.AdminPermission)

    if isAdmin or IsPlayerAtRepairLocation(playerCoords) then
        if GetPedInVehicleSeat(vehicle, -1) == playerId then
            BringVehicleToHalt(vehicle, 2.0, 2.0, true)
            SetVehicleFixed(vehicle)
            SetVehicleEngineHealth(vehicle, 1000)
            SetVehicleEngineOn(vehicle, true, true, false)
            TriggerEvent('chatMessage', "BB_AutoRepair", {200, 0, 0}, "Your car is a lot better!")
        end
    else
        -- Prompt the player to go to the repair location
        TriggerEvent('chatMessage', "BB_AutoRepair", {200, 0, 0}, "Please go to the repair location.")
    end
end)

function IsPlayerAtRepairLocation(playerCoords)
    local distance = #(playerCoords - Config.RepairLocation)
    return distance < Config.RepairDistanceThreshold
end
