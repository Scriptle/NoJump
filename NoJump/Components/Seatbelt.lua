local seat = script.Parent
local size = seat.Size

local part = Instance.new("Part")
part.Name = "Seatbelt"
part.Transparency = 1
part.CanCollide = false

part.Size = Vector3.new(size.X, 0.2, size.Z)

decal = Instance.new("Decal")
decal.Face = "Top"
decal.Parent = part

part.Parent = seat

local weld = Instance.new("ManualWeld") 
weld.Parent = seat
weld.Part0 = seat
weld.Part1 = part
weld.C0 = CFrame.new(0, 1, -0.2)

if script.DisableJump.Value.Value == true then
	decal.Texture = "rbxassetid://659841876"
else
	decal.Texture = "rbxassetid://659842079"
end

script.DisableJump.Value.Changed:Connect(function(value)
	if value then
		decal.Texture = "rbxassetid://659841876"
	else
		decal.Texture = "rbxassetid://659842079"
	end
end)