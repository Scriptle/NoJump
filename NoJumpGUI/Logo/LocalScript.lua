open = false

script.Parent.MouseButton1Down:connect(function()
	if open then
		script.Parent.Parent.MainFrame.Visible = false
		-------
		script.Parent.Parent.MainFrame.Shoutouts.Control.Disabled = true
		-------
		open = false
	else
		script.Parent.Parent.MainFrame.Visible = true
		-------
		script.Parent.Parent.MainFrame.Shoutouts.Control.Disabled = false
		-------
		open = true
	end
end)