local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local folder = Instance.new("Folder")
folder.Name = "SelectionBoxes"

local value = Instance.new("BoolValue")
value.Name = "ToggleSeats"
value.Value = false
value.Parent = playerGui

function enableScripts(object)
	if object:IsA("LocalScript") then
		object.Disabled = false
	elseif object:IsA("Model") then
		for i,v in pairs(object:GetChildren()) do
			enableScripts(v)
		end
	end
end

function findSeats(object)
	if object:IsA("Seat") or object:IsA("VehicleSeat") then
		if object:FindFirstChild("SeatType") then
			local selection = Instance.new("SelectionBox")
			selection.Color3 = Color3.new(1,0,0)
			selection.Parent = folder
			selection.Adornee = object
			------
			local gui = script.SeatControls:Clone()
			
			enableScripts(gui)
			
			gui.Enabled = true
			gui.Adornee = object
			gui.Parent = playerGui
		end
	elseif object:IsA("Model") then
		for i,v in pairs(object:GetChildren()) do
			findSeats(v)
		end
	end
end


slider = script.Parent.Parent.Slider

local toggled = false

script.Parent.MouseButton1Down:connect(function()
	if toggled then
		slider:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 1)
		------
		folder:ClearAllChildren()
		folder.Parent = nil
		-------
		for _,v in pairs(playerGui:GetChildren()) do
			if v:IsA("BillboardGui") then
				v:Destroy()
			end
		end
		-------
		value.Value = false
		-------
		toggled = false
	else
		slider:TweenPosition(UDim2.new(0.5, 0, 0, 0), "Out", "Quad", 1)
		-------
		findSeats(workspace)
		folder.Parent = playerGui
		-------
		value.Value = true
		-------
		toggled = true
	end
end)