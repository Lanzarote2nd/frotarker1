print("Blox Fruits Script Loaded")

-- Get the player
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function for Auto Farming
local function autoFarm()
    while true do
        wait(0.5) -- Prevents freezing (adjust timing)
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                wait(1) -- Adjust speed
            end
        end
    end
end

-- Function for ESP (Seeing Players)
local function enableESP(player)
    if player ~= game.Players.LocalPlayer then
        local highlight = Instance.new("Highlight")
        highlight.Parent = player.Character or player.CharacterAdded:Wait()
        highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red color
    end
end

-- Start Auto Farm in a separate thread
spawn(autoFarm)

-- Enable ESP for all current players
for _, p in pairs(game.Players:GetPlayers()) do
    enableESP(p)
end

-- Enable ESP for new players
game.Players.PlayerAdded:Connect(enableESP)
while true do
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Attack")
    wait(0.1) -- Adjust attack speed
end
wait(math.random(0.1, 0.3))
