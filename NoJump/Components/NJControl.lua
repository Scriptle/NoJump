local seat = script.Parent
seat.Changed:connect(function(property)
	if property ~= "Occupant" then return end
	
	local occupant = seat.Occupant
	if occupant then
		cln = script.DisableJumpGui:Clone()
		cln.Parent = game.Players:GetPlayerFromCharacter(script.Parent.Occupant.Parent).PlayerGui
	else
		cln:Destroy()
	end
end)