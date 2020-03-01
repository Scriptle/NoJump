script.Parent.MouseButton1Down:connect(function()
	for i,v in pairs(script.Parent.Parent.Parent.Main:GetChildren()) do
		if v.Name == script.Parent.Name then
			v.Visible = true
		else
			v.Visible = false
		end
	end
end)