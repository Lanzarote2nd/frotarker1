local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
   Name = "🔥 Blox Fruits Script 🔥",
   LoadingTitle = "Loading...",
   LoadingSubtitle = "By Developer",
   ConfigurationSaving = {
      Enabled = false
   }
})

local Tab = Window:CreateTab("Main")

Tab:CreateButton({
   Name = "Test Button",
   Callback = function()
      print("Rayfield UI Works!")
   end
})

Rayfield:Notify({
   Title = "Blox Fruits Script",
   Content = "🔥 GUI Loaded Successfully 🔥",
   Duration = 5
})


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

-- Auto Click Function (Updated for 1 sec delay)
local function autoClick()
    while autoClickEnabled do
        wait(1) -- Clicks every 1 second
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

autoTab:NewToggle("Auto Click", "Auto attacks every 1 second", function(state)
    autoClickEnabled = state
    if state then spawn(autoClick) end
end)

autoTab:NewToggle("Auto Fruit Collect", "Collects fruits automatically", function(state)
    autoFruitEnabled = state
    if state then spawn(autoCollectFruits) end
end)


