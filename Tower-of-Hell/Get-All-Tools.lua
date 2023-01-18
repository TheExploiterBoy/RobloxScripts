 --// Made by YellowGreg \\--
for _,Tool in pairs(game.ReplicatedStorage.Gear:GetChildren()) do
  if Tool:FindFirstChild("price") then
    local Tools = Tool:Clone()
    Tools.Parent = Player.Backpack
  end
end
