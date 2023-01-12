spawn(function()
    wait()
    pcall(function()
        for i, v in pairs(Workspace.Debris:GetChildren()) do
          if v.Name == "DeadHP" then
            v.CFrame = Player.Character.HumanoidRootPart.CFrame
          end
        end
      end
    )
  end
end)
