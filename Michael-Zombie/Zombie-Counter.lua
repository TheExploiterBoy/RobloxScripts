-- init 
if not game:IsLoaded() then
    game.Loaded:Wait();
end

getgenv().settings = getgenv().settings or {
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 25,
    TextFont = 2
};

-- micro optimizations
local draw, vector2 = Drawing.new, Vector2.new
local format, fromRGB = string.format, Color3.fromRGB

-- variables
local workspace, runService = game:GetService("Workspace"), game:GetService("RunService");
local camera, postSimulation = workspace.CurrentCamera, runService.PostSimulation

local zombiesFolder = workspace:WaitForChild("Ignore"):WaitForChild("Zombies");

-- drawing stuff
local text = draw("Text"); do
    text.Text = "Zombies left: ?"
    text.Transparency = 1
    text.Size = settings.TextSize 
    text.Center = true 
    text.Color = settings.TextColor
    text.Outline = true 
    text.OutlineColor = fromRGB(0, 0, 0);
    text.Position = camera.ViewportSize / 2 - vector2(0, -300);
    text.Font = settings.TextFont
    text.Visible = true
end

postSimulation:Connect(function(deltaTimeSim)
    text.Text = format("Zombies left: %s", #zombiesFolder:GetChildren());
end);
