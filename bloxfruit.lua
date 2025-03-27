print("Blox Fruits Script Loaded")

-- Get the player
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function for Auto Farming
local function spawn(autoFarm)
    while true do
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                wait(1) -- Adjust speed
            end
        end
    end
end

-- Function for ESP (Seeing Players)
local function game.Players.PlayerAdded:Connect()
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local highlight = Instance.new("Highlight")
            highlight.Parent = otherPlayer.Character
            highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red color
        end
    end
end

-- Start Functions
spawn(autoFarm)
game.Players.PlayerAdded:Connect()
