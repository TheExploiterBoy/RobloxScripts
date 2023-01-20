pcall(function()
local X = false;
local Y = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door") for 
i,v in ipairs(Y.Parent:GetDescendants()) do if 
v.Name == "KeyObtain" then X = v 
end 
end;
if X then 
game.Players.LocalPlayer.Character:PivotTo(g(X.Hitbox.Position))
wait(0.3)
fireproximityprompt(X.ModulePrompt,0)
game.Players.LocalPlayer.Character:PivotTo(g(Y.Door.Position))
wait(0.3)
fireproximityprompt(Y.Lock.UnlockPrompt,0)
end;
if h == 50 then 
Y = workspace.CurrentRooms[tostring(h+1)]:WaitForChild("Door")
end;
game.Players.LocalPlayer.Character:PivotTo(g(Y.Door.Position))
wait(0.3)
Y.ClientOpen:FireServer()
end)
