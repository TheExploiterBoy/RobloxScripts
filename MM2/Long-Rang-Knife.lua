--// Made By YellowGreg \\--

pcall(function()
    local Knife = Client.Backpack:FindFirstChild("Knife") or Client.Character:FindFirstChild("Knife");
    if Knife.Parent.Name == "Backpack" then
      Humanoid:EquipTool(Knife);
    end;
    if Knife then
      if Knife:IsA("Tool") then
        for i, v in ipairs(Players:GetPlayers()) do
          if v ~= Client and v.Character ~= nil and not table.find(getgenv().Whitelisted,v.Name) then
            local EnemyRoot = v.Character.HumanoidRootPart;
                            local EnemyPosition = EnemyRoot.Position;
                            VirtualUser:ClickButton1(Vector2.new());
                            firetouchinterest(EnemyRoot, Knife.Handle, 1);
                            firetouchinterest(EnemyRoot, Knife.Handle, 0);
                            lastAttack = tick();
          end;
        end;
      end;
    end;
  end);
end
