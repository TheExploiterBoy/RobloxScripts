--[[
Tired of people stealing your vehicles? Accidentally left your friends out because you locked your car? this is for you!
]]--

local vehicle = require(game.ReplicatedStorage.Game.Vehicle)
local getmodel = vehicle.GetLocalVehicleModel
local getseats = vehicle.getSeats
local togglelock = vehicle.toggleLocalLocked
local onexit = vehicle.OnVehicleJumpExited._handlerListHead
local exitfn = onexit._fn
local onenter = vehicle.OnVehicleEntered._handlerListHead
local enterfn = onenter._fn

local unlockOnEnter = true -- whether or not you actually want your car to auto-unlock on enter
local lplr = game.Players.LocalPlayer

local function isdriver()
    local model = getmodel()
    local driving = false
    if model then
        for i,v in pairs(getseats(model)) do
            if v.Part.Name == "Seat" and v.Player == lplr then
                driving = true 
                break
            end
        end
        return driving
    else
        return false
    end
end

local function iscarlocked()
    local idk, icon = pcall(function()
        return lplr.PlayerGui.AppUI.Speedometer.Top.Lock.Icon.Image -- the speedometer thing is destroyed when you exit a vehicle, hence the pcall
    end)
    if idk then
        return icon ~= "rbxassetid://5928936296"
    end
end

onexit._fn = function(...)
    if isdriver() and not iscarlocked() then
        togglelock()
    end
    return exitfn(...)
end

onenter._fn = function(...)
    coroutine.resume(coroutine.create(function()
        repeat task.wait() until getmodel()
        task.wait(0.1) -- sometimes it doesn't always work immediately, so this is just to be safe
        if isdriver() and iscarlocked() and unlockOnEnter then
            togglelock()
        end
    end))
    return enterfn(...)
end

print("car auto-lock/unlock enabled!")
