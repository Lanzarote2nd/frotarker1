-- Load GUI Library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local window = library.CreateLib("🔥 Blox Fruits Script 🔥", "DarkTheme")

-- Tabs
local mainTab = window:NewTab("Main")
local autoTab = mainTab:NewSection("Auto Features")

-- Get Player
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Variables
local autoFarmEnabled = false
local autoClickEnabled = false
local autoFruitEnabled = false

-- Auto Farm Function
local function autoFarm()
    while autoFarmEnabled do
        wait(0.5)
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                wait(0.2)
            end
        end
    end
end

-- Auto Click Function
local function autoClick()
    while autoClickEnabled do
        wait(0.1)
        local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
        if tool and tool:IsA("Tool") then
            tool:Activate()
        end
    end
end

-- Auto Collect Fruits Function
local function autoCollectFruits()
    while autoFruitEnabled do
        wait(1)
        for _, fruit in pairs(game.Workspace:GetChildren()) do
            if fruit:IsA("Tool") then
                character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
                wait(1)
                firetouchinterest(character.HumanoidRootPart, fruit.Handle, 0)
                firetouchinterest(character.HumanoidRootPart, fruit.Handle, 1)
            end
        end
    end
end

-- Buttons in GUI
autoTab:NewToggle("Auto Farm", "Farms enemies automatically", function(state)
    autoFarmEnabled = state
    if state then spawn(autoFarm) end
end)

autoTab:NewToggle("Auto Click", "Auto attacks enemies", function(state)
    autoClickEnabled = state
    if state then spawn(autoClick) end
end)

autoTab:NewToggle("Auto Fruit Collect", "Collects fruits automatically", function(state)
    autoFruitEnabled = state
    if state then spawn(autoCollectFruits) end
end)


