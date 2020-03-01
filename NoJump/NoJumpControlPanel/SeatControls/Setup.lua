local gui = script.Parent.Parent.Parent.Parent
local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui
local toggleSeats = playerGui.ToggleSeats

toggleSeats.Changed:connect(function(value)
	if value and gui.Adornee ~= nil then
		local seat = gui.Adornee
		local seatType = seat.SeatType
		
		if seatType.Value == "Control" then
			script.Parent.Control.Toggle.Value = true
		elseif seatType.Value == "Enabled" then
			script.Parent.Enabled.Toggle.Value = true
		elseif seatType.Value == "Disabled" then
			script.Parent.Disabled.Toggle.Value = true
		end
		
		seatType.Changed:connect(function(value2)
			if value2 == "Control" then
				script.Parent.Enabled.Toggle.Value = false
				script.Parent.Disabled.Toggle.Value = false
				------
				script.Parent.Control.Toggle.Value = true
			elseif value2 == "Enabled" then
				script.Parent.Control.Toggle.Value = false
				script.Parent.Disabled.Toggle.Value = false
				------
				script.Parent.Enabled.Toggle.Value = true
			elseif value2 == "Disabled" then
				script.Parent.Control.Toggle.Value = false
				script.Parent.Enabled.Toggle.Value = false
				------
				script.Parent.Disabled.Toggle.Value = true
			end
		end)
	end
end)