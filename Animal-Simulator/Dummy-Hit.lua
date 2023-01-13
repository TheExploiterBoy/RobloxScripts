    timeSecondsDummy = 0
    local dummytarget = nil
    local success, error = pcall(function()
        if NewLoop then
            savedpos = Character.HumanoidRootPart.CFrame
            TrackingWebhookSeconds = 0
            timeSecondsDummy = 0
            local search
            local dummyLevel
            if game.Players.LocalPlayer.leaderstats.Level.Value > 5000 then
                dummyLevel = "Dummy2"
                dummyName = "5k_dummies"
                search = game:GetService("Workspace").MAP[dummyName]
            else
                dummyLevel = "Training Dummy"
                search = game:GetService("Workspace").MAP.dummies
            end

            dummytarget = search:FindFirstChild(dummyLevel)

            Character.HumanoidRootPart.CFrame = dummytarget.HumanoidRootPart.CFrame + Vector3.new(3,0,0)
        else
            Character.HumanoidRootPart.CFrame = savedpos
        end

        local FireLoop = 0
        local Fire = 0
        while NewLoop do
            task.wait()
            Fire += 1
            if Fire >= 2 then
                Fire = 0
                FireLoop += 1
                if FireLoop > 60 then
                    FireLoop = 1
                end
                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(dummytarget.Humanoid, FireLoop)
            end

            task.spawn(function()
                if timeMinsDummy > 5 then
                    timeSecondsDummy = 0
                    if Character:FindFirstChild("Humanoid") then
                        Character.Humanoid.Health = 0
                    end
                    repeat
                        wait()
                    until CharacterAlive == true

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = dummytarget.HumanoidRootPart.CFrame
                end
            end)
        end
    end)
