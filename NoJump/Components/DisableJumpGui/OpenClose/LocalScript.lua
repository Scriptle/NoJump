frame = script.Parent.Parent

open = true

script.Parent.MouseButton1Down:connect(function()
	if open then
		frame:TweenPosition(UDim2.new(1, 250, 1, -50), "Out", "Quad", 1)
		wait(1)
		script.Parent.Text = "<"
		------
		open = false
	else
		frame:TweenPosition(UDim2.new(1, 0, 1, -50), "In", "Quad", 1)
		wait(1)
		script.Parent.Text = ">"
		------
		open = true
	end
end)