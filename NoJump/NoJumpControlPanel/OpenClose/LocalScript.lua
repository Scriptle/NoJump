mainFrame = script.Parent.Parent.MainFrame

open = false

script.Parent.MouseButton1Down:connect(function()
	if open then
		mainFrame:TweenPosition(UDim2.new(0, -150, 0.5, 32), "In", "Quad", 1)
		----
		open = false
	else
		mainFrame:TweenPosition(UDim2.new(0, 0, 0.5, 32), "Out", "Quad", 1)
		----
		open = true
	end
end)