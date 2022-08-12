RegisterCommand('repair' function()
local playerId = PlayerPedId()
local vehicle  = GetVehiclePedisIn(playerId)
if IsPedSittingInAnyVehicle(playerId) == false then
    return
   end
   if IsPedSittingInAnyVehicle(playerId) == true then
   if GetPedInVehicleSeat(vehicle, -1) == playerId then 
    BringVehicleToHalt(vehicle, 2, 2, true)
    SetVehicleFixed(vehicle)
    SetVehicleEngineHealth(vehicle, 1000)
    SetVehicleEngineOn(veh, true, true, false)
    TriggerEvent('chatMessage', "BB_AutoRepair", {200,0,0}, "Your Car Is A lot Better!")
       end
    end
end)

RegisterCommand('fix' function()
    if IsPedSittingInAnyVehicle(playerId) == false then
        return
       end
       if IsPedSittingInAnyVehicle(playerId) == true then 
    if GetPedInVehicleSeat(vehicle, -1) == playerId then
        BringVehicleToHalt(vehicle, 2, 2, true)
        SetVehicleFixed(vehicle)
        SetVehicleEngineHealth(vehicle, 1000)
        SetVehicleEngineOn(veh, true, true, false)
        TriggerEvent('chatMessage', "BB_AutoRepair", {200,0,0}, "Your Car Is A lot Better!")
       end
    end
end)
        
