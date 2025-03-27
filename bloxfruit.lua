print("🔹 Blox Fruits Script Loaded 🔹")

-- Get Player and Character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function: Auto Farm
local function autoFarm()
    while true do
        wait(0.5) -- Prevent freezing
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0) -- Adjust height
                wait(0.2) -- Prevent teleport lag
            end
        end
    end
end

-- Function: Auto Click (Now Fixed)
local function autoClick()
    while true do
        wait(0.1)
        local tool = player.Character and player.Character:FindFirstChildOfClass("Tool") -- Finds your weapon
        if tool and tool:IsA("Tool") then
            tool:Activate() -- Simulates clicking to attack
        end
    end
end

-- Function: ESP (Highlights Enemy Players)
local function enableESP(player)
    if player ~= game.Players.LocalPlayer then
        local highlight = Instance.new("Highlight")
        highlight.Parent = player.Character or player.CharacterAdded:Wait()
        highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red
    end
end

-- Start Auto Farm in a separate thread
spawn(autoFarm)
-- Start Auto Click in a separate thread
spawn(autoClick)

-- Enable ESP for all current players
for _, p in pairs(game.Players:GetPlayers()) do
    enableESP(p)
end

-- Enable ESP for new players
game.Players.PlayerAdded:Connect(enableESP)

