local disableJump = script.DisableJump
local disableReset = script.DisableReset
local components = script.Components
local seatbelts = script.Seatbelts

function setup(object)
	if object:IsA("Seat") or object:IsA("VehicleSeat") then
		components.NJControl.DisableJumpGui.DisableJump.Value = disableJump
		components.NJControl.DisableJumpGui.DisableReset.Value = disableJump.Parent:WaitForChild("DisableReset")
		components.NJEnabled.DisableJump.Value = disableJump
		components.NJEnabled.DisableReset.Value = disableReset
		components.Seatbelt.DisableJump.Value = disableJump
		
		if object.Name == "MainSeat" then			
			local cln = components.NJControl:Clone()
			cln.Disabled = false
			cln.Parent = object
			-------
			local value = components.SeatType:Clone()
			value.Value = "Control"
			value.Handler.Disabled = false
			-----
			value.Parent = object
		elseif object.Name == "ExceptionSeat" then
			local value = components.SeatType:Clone()
			value.Value = "Disabled"
			value.Handler.Disabled = false
			-----
			value.Parent = object
		else
			local cln2 = components.NJEnabled:Clone()
			cln2.Disabled = false
			cln2.Parent = object
			-----
			if seatbelts.Value then
				local cln3 = components.Seatbelt:Clone()
				cln3.Disabled = false
				cln3.Parent = object
			end
			-----
			local value = components.SeatType:Clone()
			value.Value = "Enabled"
			value.Handler.Disabled = false
			-----
			value.Parent = object
		end
	elseif object:IsA("Model") then
		for i,v in pairs(object:GetChildren()) do
			setup(v)
		end
	end
end

setup(script.Parent)

local event = Instance.new("RemoteEvent")
event.Name = "NoJumpRE"
event.Parent = disableJump
event.OnServerEvent:connect(function(player, bool)
	disableJump.Value = bool 
end)

local event2 = Instance.new("RemoteEvent")
event2.Name = "NoResetRE"
event2.Parent = disableReset
event2.OnServerEvent:connect(function(player, bool)
	disableReset.Value = bool 
end)