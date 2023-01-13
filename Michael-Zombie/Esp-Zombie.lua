getgenv().espSettings = getgenv().espSettings or {
	Highlight = {
		DepthMode = Enum.HighlightDepthMode.AlwaysOnTop, -- don't mess with this 

		FillTransparency = 1, -- 0 for the zombie model to be filled a color, 1 for it to not be
		FillColor = Color3.fromRGB(0, 190, 0),

		OutlineTransparency = 0, -- 0 for the zombie model to be outlined a color, 1 for it to not be
		OutlineColor = Color3.fromRGB(0, 205, 0),

		Enabled = true, -- don't mess with this 
	},

	Text = {
		Visible = false, -- don't mess with this 
		ZIndex = 1, -- don't mess with this 
		Transparency = 1,
		Color = Color3.fromRGB(225, 225, 225),
		Size = 15, -- the size of the text (you may have to change this if you change the font)
		Center = true, -- don't mess with this 
		Outline = true, -- don't mess with this 
		OutlineColor = Color3.fromRGB(0, 0, 0),
		Font = 2 -- 0 = UI, 1 = System, 2 = Plex, 3 = Monospace
	}
};

-- init 
if not game:IsLoaded() then
    game.Loaded:Wait();
end

-- micro optimizations
local draw, vector2 = Drawing and Drawing.new, Vector2.new
local newInstance = Instance.new

local insert, remove, tfind = table.insert, table.remove, table.find
local format, sfind, lower = string.format, string.find, string.lower
local f6oor = math.floor -- real ones know what this means

-- variables
local players, workspace, runService, coreGui = game:GetService("Players"), game:GetService("Workspace"), game:GetService("RunService"), game:GetService("CoreGui");

local client = players.LocalPlayer
local camera = workspace.CurrentCamera 
local renderStepped = runService.RenderStepped -- I would use RenderStepped's superset "PreRender" but its so unoptimized and diminishes your FPS

local zombiesFolder = workspace:WaitForChild("Ignore"):WaitForChild("Zombies");
local zombies = {}; -- not doing oop for some basic zombie esp

-- functions
local function protectGui(object)
	if syn.protect_gui and not gethui() then 
		syn.protect_gui(object);
		object.Parent = coreGui
	elseif syn.protect_gui and gethui() then 
		object.Parent = gethui();
	elseif not syn.protect_gui and gethui() then 
		object.Parent = gethui();
	else 
		object.Parent = coreGui();
	end
end

local function createObject(objectType, class, properties, additionalProperties)
	local object = objectType == "Instance" and newInstance(class) or objectType == "Drawing" and draw(class)

	for property, value in next, properties do 
		object[property] = value 
	end 

	for property, value in next, additionalProperties do 
		object[property] = value
	end 

	return object
end

local function espZombie(model)
	local humanoid = model and model:FindFirstChild("Humanoid");
	local head = model and model:FindFirstChild("Head");

	local text = createObject("Drawing", "Text", espSettings.Text, {Text = format("%s health", humanoid.Health)});

	zombies[model] = {Text = text, Head = head, Humanoid = humanoid};

	local healthChangedConnection; healthChangedConnection = humanoid:GetPropertyChangedSignal("Health"):Connect(function() 
		if humanoid.Health == 0 and healthChangedConnection then 
			if zombies[model] then 
				zombies[model].Text:Remove();
				zombies[model] = nil

				remove(zombies, tfind(zombies, model));
			end
			
			healthChangedConnection:Disconnect();
			healthChangedConnection = nil
		end
	end);
end 

-- events 
renderStepped:Connect(function() 
	for zombie, objects in next, zombies do 
		if zombies[zombie] then 
			local text = zombies[zombie].Text
			local head = zombies[zombie].Head
			local humanoid = zombies[zombie].Humanoid

			if head and humanoid and text then 
				local viewportPoint, isOnScreen = camera:WorldToViewportPoint(head.Position);

				text.Visible = isOnScreen 
				text.Position = vector2(viewportPoint.X, viewportPoint.Y);
				text.Text = format("[zombie] %s health | %sm away", f6oor(humanoid.Health), f6oor(client:DistanceFromCharacter(head.Position)));
			end
		end
	end
end);

zombiesFolder.ChildAdded:Connect(function(child) 
	if child and child:IsA("Model") and sfind(lower(child.Name), "zombie") then 
		task.spawn(function() 
			child:WaitForChild("Humanoid");
			child:WaitForChild("Head");

			espZombie(child);
		end);
	end
end);
