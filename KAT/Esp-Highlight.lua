--// Made By: AdvanceFalling Team \\--
-- Credits To MMSVon For Making The Loop
--Credis To YellowGreg For Making the Highlight

game:GetService("StarterGui"):SetCore("SendNotification",{ 	
Title = "Made By:",  	
Text = "AdvancedFalling Team",
	Icon = "rbxthumb://type=Asset&id=9863339777&w=150&h=150",
	Duration = 8,
})

local Players = game:GetService("Players"):GetChildren()
local highlight = Instance.new("Highlight")
highlight.Name = "ESP"
for i, v in pairs(Players) do
	repeat wait() until v.Character
	local highlightClone = highlight:Clone()
	highlightClone.Adornee = v.Character
	highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
end
game.Players.PlayerAdded:Connect(function(player)
		repeat wait() until player.Character
		local highlightClone = highlight:Clone()
		highlightClone.Adornee = player.Character
		highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
end)
