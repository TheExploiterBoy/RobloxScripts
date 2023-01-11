if not isfile("skellyKey.rbxm") then
            writefile("skellyKey.rbxm", game:HttpGet"https://raw.githubusercontent.com/sponguss/Doors-Entity-Replicator/main/skellyKey.rbxm")
        end
        local keyTool: Tool=game:GetObjects((getcustomasset or getsynasset)("skellyKey.rbxm"))[1]
        keyTool:SetAttribute("uses", math.huge) --uses u want to put to the key

        local function setupRoom(room)
            local thing=loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/Doors-Entity-Replicator/main/skellyKeyRoomRep.lua")()
            local newdoor=thing.CreateDoor({CustomKeyNames={"SkellyKey"}, Sign=true, Light=true, Locked=true})
            newdoor.Model.Parent=workspace
            newdoor.Model:PivotTo(room.Door.Door.CFrame)
            newdoor.Model.Parent=room
            room.Door:Destroy()
            thing.ReplicateDoor({Model=newdoor.Model, Config={CustomKeyNames={"SkellyKey"}}, Debug={OnDoorPreOpened=function() end}})
        end
        keyTool.Equipped:Connect(function()
            for _, room in pairs(workspace.CurrentRooms:GetChildren()) do
                if room.Door:FindFirstChild"Lock" and not room:GetAttribute("Replaced") then
                    room:SetAttribute("Replaced", true)
                    setupRoom(room)
                end
            end
            con=workspace.CurrentRooms.ChildAdded:Connect(function(room)
                if room.Door:FindFirstChild"Lock" and not room:GetAttribute("Replaced") then
                    room:SetAttribute("Replaced", true)
                    setupRoom(room)
                end
            end)
        end)
        keyTool.Unequipped:Connect(function() con:Disconnect() end)

        if game.Players.LocalPlayer.PlayerGui.MainUI.ItemShop.Visible then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))().CreateItem(keyTool, {
                Title = "Skeleton Key",
                Desc = "holds secrets",
                Image = "https://static.wikia.nocookie.net/doors-game/images/8/88/Icon_crucifix2.png/revision/latest/scale-to-width-down/350?cb=20220728033038",
                Price = 100,
                Stack = 1,
            })
        else keyTool.Parent=game.Players.LocalPlayer.Backpack end
