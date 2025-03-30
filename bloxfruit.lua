-- Load Lunar UI Library
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
local autoChestEnabled = false

-- Auto Farm Function (Fixed)
local function autoFarm()
    while autoFarmEnabled do
        wait(0.5) -- Delay to prevent lag
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("HumanoidRootPart") then
                -- Move to Enemy & Attack
                character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                wait(0.2)

                -- Simulate Attack (Click Weapon)
                local tool = character:FindFirstChildOfClass("Tool")
                if tool and tool:IsA("Tool") then
                    tool:Activate()
                end
            end
        end
    end
end

-- Auto Click (Auto Attack) Function (Fixed)
local function autoClick()
    while autoClickEnabled do
        wait(1) -- Click every 1 second
        local tool = character:FindFirstChildOfClass("Tool")
        if tool and tool:IsA("Tool") then
            tool:Activate()
        end
    end
end

-- Auto Collect Chest (Fixed)
local function autoChest()
    while autoChestEnabled do
        wait(2) -- Delay to prevent rapid teleporting
        for _, chest in pairs(game.Workspace:GetChildren()) do
            if chest:IsA("Model") and chest:FindFirstChild("TouchInterest") then
                -- Teleport to Chest
                character.HumanoidRootPart.CFrame = chest.TouchInterest.Parent.CFrame
                wait(1)

                -- Simulate Collecting Chest
                firetouchinterest(character.HumanoidRootPart, chest.TouchInterest.Parent, 0)
                firetouchinterest(character.HumanoidRootPart, chest.TouchInterest.Parent, 1)
            end
        end
    end
end

-- GUI Toggle Buttons
autoTab:NewToggle("Auto Farm", "Farms enemies automatically", function(state)
    autoFarmEnabled = state
    if state then spawn(autoFarm) end
end)

autoTab:NewToggle("Auto Click", "Auto attacks every 1 second", function(state)
    autoClickEnabled = state
    if state then spawn(autoClick) end
end)

autoTab:NewToggle("Auto Collect Chest", "Collects chests automatically", function(state)
    autoChestEnabled = state
    if state then spawn(autoChest) end
end)

-- Make GUI Movable
window:NewTab("Settings"):NewButton("Move GUI", "Click to move the GUI", function()
    library:ToggleUI()
end)

