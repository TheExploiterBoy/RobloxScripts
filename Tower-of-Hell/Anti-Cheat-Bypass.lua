    local reg = getreg()
 
    for i, Function in next, reg do
        if type(Function) == 'function' then
            local info = getinfo(Function)
 
            if info.name == 'kick' then
                if (hookfunction(info.func, function(...)end)) then
                    print'succesfully hooked kick'
                else
                    print'failed to hook kick'
                end
            end
        end
    end
    local playerscripts = game:GetService'Players'.LocalPlayer.PlayerScripts
 
    local script1 = playerscripts.LocalScript
    local script2 = playerscripts.LocalScript2
 
    local script1signal = script1.Changed
    local script2signal = script2.Changed
 
    for i, connection in next, getconnections(script1signal) do
        connection:Disable()
    end
    for i, connection in next, getconnections(script2signal) do
        connection:Disable()
    end
 
    script1:Destroy()
    script2:Destroy()
