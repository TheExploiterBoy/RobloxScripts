task.spawn(function()
        while task.wait() do
                local args = {[1] = 14,[2] = Vector3.new(1, 1, 1)}
                game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(unpack(args))
            end
        end
    end)
end)
