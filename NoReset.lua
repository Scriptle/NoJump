local event = game.ReplicatedStorage:WaitForChild("NoResetRE")

event.OnClientEvent:Connect(function(bool)
	game.StarterGui:SetCore("ResetButtonCallback", bool)
end)