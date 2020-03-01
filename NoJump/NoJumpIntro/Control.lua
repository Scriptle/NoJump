local mainFrame = script.Parent.Parent
local gui = mainFrame.Parent
local image = script.Parent.ImageLabel
local sound = script.Parent.Sound

--[[
local rotationControl = coroutine.wrap(function()
	for i=0,360,2 do
		image.Rotation = i
		wait()
	end
end)

local sizeControl = coroutine.wrap(function()
	for i=1, 3, 1 do
		for i=0, 50, 1 do
			image.Position = UDim2.new(0, (i/2)*-1, 0, (i/2)*-1)
			image.Size = UDim2.new(0.35, i, 1, i)
			wait()
		end
		
		for i=50, 0, -1 do
			image.Position = UDim2.new(0, (i/2)*-1, 0, (i/2)*-1)
			image.Size = UDim2.new(0.35, i, 1, i)
			wait()
		end
	end
end)
]]--

---------------------------------- Main ----------------------------------
wait(2)
mainFrame:TweenPosition(UDim2.new(0.5, -125, 0.5, -50), "Out", "Quad", 1)

sound:Play()
--rotationControl()
--sizeControl()
wait(3)
for i=0.1, 0, -0.01 do
	sound.Volume = i
	wait(0.1)
end
sound:Stop()

mainFrame:TweenPosition(UDim2.new(1.5, -125, 0.5, -50), "In", "Quad", 1)
wait(1)
gui:Destroy()
-------------------------------------------------------------------------