while Coins do
        wait(.1)
        game:GetService("ReplicatedStorage").Events.CoinEvent:FireServer()

        if CharacterAlive and game.Players.LocalPlayer:FindFirstChild("otherstats").Coin.Value >= 500 then
            game:GetService("ReplicatedStorage").Events.unlockEvent:FireServer()
        end
    end
