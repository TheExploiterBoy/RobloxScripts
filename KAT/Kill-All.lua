local key = game:GetService("UserInputService") --- this is meant for KAT but works for any game
key.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.E then
for i,v in pairs(game.Players:GetChildren()) do
    if v ~= game.Players.LocalPlayer then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.Head.CFrame * CFrame.new(0,0,.4)
         wait(1)
    end
end
end
end)
