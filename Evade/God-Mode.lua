local Character = Player.Character or Player.CharacterAdded:Wait()
    local Hum = Character:WaitForChild("Humanoid")
    Hum.Parent = nil;
    Hum.Parent = Character;
