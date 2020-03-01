local event = game.ReplicatedStorage:WaitForChild("ChangelogConfig")
 
event.OnClientEvent:Connect(function(log)
	if log then -- If log is not blank then...
		local num = #log
	
		local pos = 0
		local height = 0
		
		for i=num, 1, -1 do
			local cln = script.Parent.Version:Clone()
			
			cln.Parent = script.Parent
			
			cln.Position = UDim2.new(0,0,0,pos)
			
			cln.Date.Text = log[i]["name"]
			cln.Text.Text = log[i]["desc"]
			
			while not cln.Text.TextFits do
				height = height + 20
				cln.Size = UDim2.new(1,0,0,height)
				wait()
			end
					
			pos = pos + height + 10
			height = 0
		end
		
		script.Parent.CanvasSize = UDim2.new(0,0,0,pos)
	else
		script.Parent:WaitForChild("Error").Visible = true
	end
end)