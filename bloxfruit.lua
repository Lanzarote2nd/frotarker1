-- Load Orion UI Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "🔥 Blox Fruits Script 🔥", HidePremium = false, SaveConfig = true, ConfigFolder = "BloxFruits"})

-- Tabs & Sections
local AutoTab = Window:MakeTab({Name = "Auto Features", Icon = "rbxassetid://4483345998", PremiumOnly = false})

local AutoFarmSection = AutoTab:AddSection({Name = "Auto Farming"})
local AutoFruitSection = AutoTab:AddSection({Name = "Auto Fruit"})

-- Variables
local autoFarmEnabled = false
local autoClickEnabled = false
local autoFruitEnabled = false

-- Auto Farm Function
local function autoFarm()
    while autoFarmEnabled do
        wait(0.5)
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                wait(0.2)
            end
        end
    end
end

-- Auto Click Function
local function autoClick()
    while autoClickEnabled do
        wait(1) -- Clicks every 1 second
        local tool = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
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
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
                wait(1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, fruit.Handle, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, fruit.Handle, 1)
            end
        end
    end
end

-- GUI Toggles
AutoFarmSection:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(state)
        autoFarmEnabled = state
        if state then spawn(autoFarm) end
    end
})

AutoFarmSection:AddToggle({
    Name = "Auto Click",
    Default = false,
    Callback = function(state)
        autoClickEnabled = state
        if state then spawn(autoClick) end
    end
})

AutoFruitSection:AddToggle({
    Name = "Auto Collect Fruits",
    Default = false,
    Callback = function(state)
        autoFruitEnabled = state
        if state then spawn(autoCollectFruits) end
    end
})

OrionLib:Init()
