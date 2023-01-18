--// Anti-Cheat Bypass (Can barely call it an anticheat)

for _,v in pairs(getgc()) do
    if type(v) == "function" and getfenv(v).script == Player.PlayerScripts.LocalScript then
        if debug.getinfo(v).name == "kick" then
            hookfunction(v,function()end)
        end
    end
end

if Player.PlayerScripts:FindFirstChild("LocalPartScript") then
    Player.PlayerScripts.LocalPartScript:Destroy()
end
