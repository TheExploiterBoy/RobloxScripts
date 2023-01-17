--// Made by Wspboy12 \\--
game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
while true do
  game:GetService("RunService").Stepped:wait()
  game.Players.LocalPlayer.Character.Head.CanCollide = false
  game.Players.LocalPlayer.Character.Torso.CanCollide = false
end
