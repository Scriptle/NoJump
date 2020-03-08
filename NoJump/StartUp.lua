function getData()
	jsonLog = game.HttpService:GetAsync("https://api.trello.com/1/lists/5944519433d9017c155bd95c/cards?fields=name,desc&key=9c925ff9c0e228e39bdfd4a2fd60f015", true)
	jsonShoutouts = game.HttpService:GetAsync("https://api.trello.com/1/lists/5956f9bc00f99fee850a8424/cards?fields=name&key=9c925ff9c0e228e39bdfd4a2fd60f015", true)
end

local success, message = pcall(getData)
if success then
	log = game.HttpService:JSONDecode(jsonLog)
	shoutouts = game.HttpService:JSONDecode(jsonShoutouts)
else
    log = nil
	shoutouts = nil
end
 
local event = Instance.new("RemoteEvent")
event.Parent = game.ReplicatedStorage
event.Name = "ChangelogConfig"

local event2 = Instance.new("RemoteEvent")
event2.Parent = game.ReplicatedStorage
event2.Name = "ShoutoutsConfig"
 
game.Players.PlayerAdded:Connect(function(player)
	script.NoJumpIntro:Clone().Parent = player.PlayerGui
	player.CharacterAdded:Connect(function()
		wait()
		event:FireClient(player,log)
		event2:FireClient(player,shoutouts)
	end)
end)
