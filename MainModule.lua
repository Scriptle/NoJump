local children = script:GetChildren()
script = Instance.new("ModuleScript")
for _, child in pairs(children) do
	child.Parent = script
end

function setup()
	script.NoReset.Parent = game.StarterPlayer.StarterPlayerScripts
	------
	script.NoJumpGUI.Parent = game.StarterGui
	------
	script.NoJump.Disabled = false
	script.NoJump.StartUp.Disabled = false
	script.NoJump.Analytics.Disabled = false
	script.NoJump.Parent = game.ServerScriptService
	------
	script:Destroy()
end

return setup