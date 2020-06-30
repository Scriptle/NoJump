local settings = nil
local module = game.ServerStorage:WaitForChild("Settings", 5)
if not module then
	warn("Please update the NoJump Loader. Simply re-insert the model.")
	settings = require(script.Settings)
else
	settings = require(game.ServerStorage:WaitForChild("Settings"))
	if settings.ControllerSeatName == nil then
		warn("Please update the NoJump Loader. Simply re-insert the model.")
		settings = require(script.Settings)
	end
end

if settings.Seatbelts then
	script.NoJump.Seatbelts.Value = true
end

script.NoJump.ControllerSeatName.Value = settings.ControllerSeatName
script.NoJump.ExceptionSeatName.Value = settings.ExceptionSeatName

function findParentModel(object)
	--if object.Parent == workspace or object.Parent.Parent == game.InsertService.Folder then
	if object.Parent == workspace then
		if not object:FindFirstChild("NoJump") then
			local clone = script.NoJump:Clone()
			clone.Parent = object
			---
			clone.Components.SeatType.Components.Value = clone.Components
			---
			clone.Disabled = false
		end
	else
		findParentModel(object.Parent)
	end
end

function setup(object)
	if object:IsA("Seat") or object:IsA("VehicleSeat") then
		findParentModel(object)
	elseif object:IsA("Model") then
		for i,v in pairs(object:GetChildren()) do
			setup(v)
		end
	end
end

if settings.LocalModels then
	setup(workspace)
end

if settings.InsertedModels then
	-- Temporary Fix
	workspace.ChildAdded:connect(function(model)
		setup(model)
	end)
	
	--[[
	game.InsertService.Folder.ChildAdded:connect(function(model)
		setup(model)
	end)
	]]--
end

if settings.AllowAdmins then
	game.Players.PlayerAdded:connect(function(player)
		player.CharacterAdded:connect(function()
			wait()
			for _,admin in pairs(settings.Admins) do
				if player.Name == admin or player.UserId == game.CreatorId then
					script.NoJumpControlPanel:Clone().Parent = player:WaitForChild("PlayerGui")
				end
			end
		end)
	end)
end

----------------------------
local event = Instance.new("RemoteEvent")
event.Name = "NoResetRE"
event.Parent = game.ReplicatedStorage
----------------------------