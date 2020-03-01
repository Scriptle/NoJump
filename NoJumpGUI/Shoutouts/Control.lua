local event = game.ReplicatedStorage:WaitForChild("ShoutoutsConfig")
 
event.OnClientEvent:Connect(function(airlines)
	if airlines then
		local frameLeft = script.Parent.ShoutoutLeft
		local groupLogoLeft = frameLeft.GroupLogo
		local groupNameLeft = frameLeft.GroupName
		local frameRight = script.Parent.ShoutoutRight
		local groupLogoRight = frameRight.GroupLogo
		local groupNameRight = frameRight.GroupName
		while true do
			for i=1, #airlines, 2 do
				local groupInfoLeft = game:GetService("GroupService"):GetGroupInfoAsync(airlines[i]["name"])
				groupLogoLeft.Image = groupInfoLeft["EmblemUrl"]
				groupNameLeft.Text = groupInfoLeft["Name"]
				if airlines[i+1] ~= nil then
					local groupInfoRight = game:GetService("GroupService"):GetGroupInfoAsync(airlines[i+1]["name"])
					groupLogoRight.Image = groupInfoRight["EmblemUrl"]
					groupNameRight.Text = groupInfoRight["Name"]
				else
					groupLogoRight.Image = ""
					groupNameRight.Text = ""
				end
				for i=1, 0, -0.2 do
					groupLogoLeft.ImageTransparency = i
					groupNameLeft.TextTransparency = i
					groupLogoRight.ImageTransparency = i
					groupNameRight.TextTransparency = i
					wait(0.1)
				end
				wait(3)
				for i=0, 1, 0.2 do
					groupLogoLeft.ImageTransparency = i
					groupNameLeft.TextTransparency = i
					groupLogoRight.ImageTransparency = i
					groupNameRight.TextTransparency = i
					wait(0.1)
				end
			end
		end
	else
		script.Parent:WaitForChild("Error").Visible = true
	end
end)