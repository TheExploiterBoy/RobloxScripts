task.spawn(function()
    while task.wait() do
            Player.PlayerScripts:WaitForChild("CameraShake", 1234).Value = CFrame.new(0,0,0) * CFrame.Angles(0,0,0);
        end
    end
end)
