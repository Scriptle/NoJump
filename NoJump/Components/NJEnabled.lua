local seat = script.Parent
seat.Changed:connect(function(property)
    if property ~= 'Occupant' then return end
 
    occupant = seat.Occupant
    if occupant then
		local character = occupant.Parent
		player = game.Players:GetPlayerFromCharacter(character)
		
		------------------
		if script.DisableJump.Value.Value == true then
			occupant.JumpPower = 0
			occupant.Jump = false
		else
			occupant.JumpPower = 50
		end
		------------------
		event = game.ReplicatedStorage:WaitForChild("NoResetRE")
		
		if script.DisableReset.Value.Value == true then
			event:FireClient(player, false)
		else
			event:FireClient(player, true)
		end
    else
		event:FireClient(player, true) -- Allows the player to be able to reset when left seat
    end
end)

script.DisableReset.Value.Changed:Connect(function(value)
	if occupant then
		if value then
			event:FireClient(player, false)
		else
			event:FireClient(player, true)
		end
	end
end)

script.DisableJump.Value.Changed:Connect(function(value)
	if occupant then
		if value then
			occupant.JumpPower = 0
			occupant.Jump = false
		else
			occupant.JumpPower = 50
		end
	end
end)