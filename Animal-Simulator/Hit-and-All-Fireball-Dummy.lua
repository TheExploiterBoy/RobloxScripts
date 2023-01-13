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


        task.spawn(function()

            local runningFireball = false
            while NewLoop do
                task.wait()

                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(dummytarget.Humanoid, 1)


                local Fireballs = 0
                if runningFireball == false then
                    runningFireball = true
                    task.spawn(function()
                        a, b = pcall(function()

                            local Balls = {"Fireball", "Lightningball"}
                            local Locations = {"Backpack", "Character"}
                            for i, player in pairs(game.Players:GetChildren()) do
                                local earlyreturn = false
                                for _,Ball in pairs(Balls) do
                                    for i,Location in pairs(Locations) do
                                        local CheckBall = player[Location]:FindFirstChild(Ball)
                                        if CheckBall then
                                            Fireballs += 1
                                            CheckBall:FindFirstChild("FireballEvent"):FireServer(dummytarget.HumanoidRootPart.Position)
                                            earlyreturn = true
                                            wait()
                                            break
                                        end
                                    end

                                    if earlyreturn then
                                        break
                                    end
                                end
                            end

                            fireballsTotal = Fireballs
                            Fireballs = 0
                            runningFireball = false
                        end)
                        if b then
                            runningFireball = false
                        end
                    end)
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
    end)

    if error then
        print(error)
    end
