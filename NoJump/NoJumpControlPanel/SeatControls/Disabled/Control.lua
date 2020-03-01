local toggle = script.Parent.Toggle

local gui = script.Parent.Parent.Parent.Parent.Parent
local seat = gui.Adornee
local seatType = seat.SeatType

toggle.Changed:connect(function(value)
	if value then
		script.Parent.BackgroundColor3 = Color3.new(0,255,0)
	else
		script.Parent.BackgroundColor3 = Color3.new(255,0,0)
	end
end)

script.Parent.MouseButton1Down:connect(function()
	--seatType.Value = "Disabled"
	seatType.NoJumpRE:FireServer("Disabled")
end)