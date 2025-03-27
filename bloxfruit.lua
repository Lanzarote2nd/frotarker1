-- Load GUI Library (Orion Library)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local window = OrionLib:MakeWindow({Name = "🔥 Blox Fruits Script 🔥", HidePremium = false, SaveConfig = true, ConfigFolder = "BloxFruits"})

-- Get Player
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Variables
local autoFarmEnabled = false
local autoClickEnabled = false
local autoFruitEnabled = false
local clickDelay = 1 -- Default auto-click delay (1 second)

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

-- Auto Click Function (Now with Custom Delay)
local function autoClick()
    while autoClickEnabled do
        wait(clickDelay) -- Uses the custom delay from the slider
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

-- Create Tabs
local mainTab = window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- Toggle Auto Farm
mainTab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(state)
        autoFarmEnabled = state
        if state then spawn(autoFarm) end
    end
})

-- Toggle Auto Click
mainTab:AddToggle({
    Name = "Auto Click",
    Default = false,
    Callback = function(state)
        autoClickEnabled = state
        if state then spawn(autoClick) end
    end
})

-- Toggle Auto Fruit Collect
mainTab:AddToggle({
    Name = "Auto Collect Fruits",
    Default = false,
    Callback = function(state)
        autoFruitEnabled = state
        if state then spawn(autoCollectFruits) end
    end
})

-- Slider to Set Auto Click Delay
mainTab:AddSlider({
    Name = "Auto Click Delay",
    Min = 0.1,
    Max = 5,
    Default = 1,
    Increment = 0.1,
    Callback = function(value)
        clickDelay = value
        print("Auto Click Delay set to:", value, "seconds")
    end
})

-- Button to Close GUI
mainTab:AddButton({
    Name = "Close GUI",
    Callback = function()
        OrionLib:Destroy()
    end
})

-- Initialize GUI
OrionLib:Init()

