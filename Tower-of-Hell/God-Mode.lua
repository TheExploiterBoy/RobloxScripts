local old; old = hookmetamethod(game,"__index",function(self, idx)
    if tostring(self) == "KillScript" and idx == "Parent" and Toggles["Godmode"] then
        return wait(9e9)
    end
    return old(self,idx)
end)
