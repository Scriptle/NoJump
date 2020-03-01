local event = Instance.new("RemoteEvent")
event.Name = "NoJumpRE"
event.Parent = script.Parent
event.OnServerEvent:connect(function(player, value)
	script.Parent.Value = value 
end)

local NoJump = script.Parent.Components.Value
local GuiGiver = NoJump.NJControl
local Script = NoJump.NJEnabled

local seat = script.Parent.Parent

script.Parent.Changed:connect(function(value)
	for i,v in pairs(seat:GetChildren()) do
		if v.Name == "NJControl" or v.Name == "NJEnabled" then
			v:Destroy()
		end
	end
	if value == "Control" then
		local cln = GuiGiver:Clone()
		cln.Disabled = false
		cln.Parent = seat
	elseif value == "Enabled" then
		local cln = Script:Clone()
		cln.Disabled = false
		cln.Parent = seat
	elseif value == "Disabled" then
		----
	end
end)