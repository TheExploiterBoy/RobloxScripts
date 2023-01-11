--// Made By AdvanceFalling Team \\--
--// Under Development Still \\--

local place = workspace:GetChildren()	
			local currentX = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X
			local currentY = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y
			local currentZ = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z

for i,v in pairs(place) do	    
  local vChildren = v:GetChildren()
  for i,child in pairs(vChildren) do
    if child.Name == "CoinContainer" then
      if child.Coin_Server:FindFirstChild("Coin") ~= nil then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = child.Coin_Server.Coin.CFrame
      else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentX, currentY, currentZ)
      end
    end
  end	
end
end
end)
end
