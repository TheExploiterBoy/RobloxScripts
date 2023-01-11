--[[
Made By AdvanceFalling Team
-----------------------------
Loop Made by MMSVon  
Role Made by Wspboy12
Function Made by YellowGreg 
-----------------------------
]]--


--// Declarations \\--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local roles
--// Functions(Makes New HighLight For New Player) \\--
function CreateHighlight()
	for i, v in pairs(Players:GetChildren()) do
		if v ~= LP and v.Character and not v.Character:FindFirstChild("Highlight") then
			Instance.new("Highlight", v.Character)           
		end
	end
end
--// Current Role Color \\--
function UpdateHighlights()
  for _, v in pairs(Players:GetChildren()) do
    if v ~= LP and v.Character and v.Character:FindFirstChild("Highlight") then
      Highlight = v.Character:FindFirstChild("Highlight")
      if v.Name == Sheriff and IsAlive(v) then
        Highlight.FillColor = Color3.fromRGB(0,0,255)
      elseif v.Name == Murder and IsAlive(v) then
				Highlight.FillColor = Color3.fromRGB(225,0,0)
			elseif v.Name == Hero and IsAlive(v) and not IsAlive(game.Players[Sheriff]) then
				Highlight.FillColor = Color3.fromRGB(255,255,0)
			else
				Highlight.FillColor = Color3.fromRGB(136,242,75)
			end
		end
	end
end	
--// Simple Function \\--
function IsAlive(Player)
	for i, v in pairs(roles) do
		if Player.Name == i then
			if not v.Killed and not v.Dead then
				return true
			else
				return false
			end
		end
	end
end
--// Loops \\--
RunService.RenderStepped:connect(function()
    roles = ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()
    for i, v in pairs(roles) do
      if v.Role == "Murderer" then
        Murder = i
      elseif v.Role == 'Sheriff' then
        Sheriff = i
      elseif v.Role == 'Hero' then
        Hero = i
		end
	end
	CreateHighlight()
	UpdateHighlights()
end)
