local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

-- Monster Vision
player:GetAttributeChangedSignal("Role"):Connect(function()
	if player:GetAttribute("Role") == "Monster" then
		local cc = Instance.new("ColorCorrectionEffect", Lighting)
		cc.TintColor = Color3.fromRGB(50, 150, 50)
		cc.Saturation = -0.5
	end
end)

-- Prisoner Detection UI (Only if Monster)
game:GetService("RunService").RenderStepped:Connect(function()
	if player:GetAttribute("Role") ~= "Monster" then return end

	for _, p in pairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			-- Check if p's flashlight is on (using an Attribute)
			if p:GetAttribute("FlashlightOn") then
				-- Render a billboard/UI dot above p.Character.Head
			end
		end
	end
end)

local Lighting = game:GetService("Lighting")
local player = game.Players.LocalPlayer

-- Dark Green Tint Setup
local colorCorrection = Instance.new("ColorCorrectionEffect")
colorCorrection.Name = "MonsterVisionEffect"
colorCorrection.TintColor = Color3.fromRGB(50, 120, 60)
colorCorrection.Brightness = -0.2
colorCorrection.Contrast = 0.4
colorCorrection.Enabled = false
colorCorrection.Parent = Lighting

-- Apply vision when role updates
player:GetAttributeChangedSignal("Role"):Connect(function()
	local role = player:GetAttribute("Role")
	if role == "Monster" then
		colorCorrection.Enabled = true
	else
		colorCorrection.Enabled = false
	end
end)
