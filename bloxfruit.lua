-- Load Orion UI Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local window = OrionLib:MakeWindow({
    Name = "🔥 Blox Fruits Script 🔥",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "BloxFruits"
})

-- Variables
local autoFarmEnabled = false
local autoClickEnabled = false
local autoFruitEnabled = false
local clickDelay = 1

-- Auto Farm Function
local function autoFarm()
    while autoFarmEnabled do
        task.wait(0.5)
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                task.wait(0.2)
            end
        end
    end
end

-- Auto Click Function
local function autoClick()
    while autoClickEnabled do
        task.wait(clickDelay)
        local tool = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:IsA("Tool") then
            tool:Activate()
        end
    end
end

-- Auto Collect Fruits Function
local function autoCollectFruits()
    while autoFruitEnabled do
        task.wait(1)
        for _, fruit in pairs(game.Workspace:GetChildren()) do
            if fruit:IsA("Tool") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
                task.wait(1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, fruit.Handle, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, fruit.Handle, 1)
            end
        end
    end
end

-- Create GUI Tabs & Elements
local mainTab = window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

mainTab:AddLabel("🌟 Blox Fruits Script Loaded 🌟")

-- Toggle Auto Farm
mainTab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(state)
        autoFarmEnabled = state
        if state then task.spawn(autoFarm) end
    end
})

-- Toggle Auto Click
mainTab:AddToggle({
    Name = "Auto Click",
    Default = false,
    Callback = function(state)
        autoClickEnabled = state
        if state then task.spawn(autoClick) end
    end
})

-- Toggle Auto Collect Fruits
mainTab:AddToggle({
    Name = "Auto Collect Fruits",
    Default = false,
    Callback = function(state)
        autoFruitEnabled = state
        if state then task.spawn(autoCollectFruits) end
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


