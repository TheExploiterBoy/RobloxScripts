--// Made by YellowGreg \\--
for _, n in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do 
      if n:IsA('BasePart') and 
        n.CanCollide and 
        n.Name ~= floatName then 
        n.CanCollide = false 
      end 
    end 
