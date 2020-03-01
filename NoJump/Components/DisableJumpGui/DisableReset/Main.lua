gui = script.Parent.Parent.Parent.Parent.Parent.Parent
v = gui:WaitForChild("DisableReset")

slider = script.Parent.Parent.Slider

off = true

script.Parent.MouseButton1Down:connect(function()
	if off then
		slider:TweenPosition(UDim2.new(0.5, 0, 0, 0), "Out", "Quad", 1)
		------
		v.Value.NoResetRE:FireServer(true)
		------
		off = false
	else
		slider:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 1)
		------
		v.Value.NoResetRE:FireServer(false)
		------
		off = true
	end
end)