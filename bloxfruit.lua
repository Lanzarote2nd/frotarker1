-- Create the Screen GUI (Full Screen)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Main Frame (Full Screen)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(1, 0, 1, 0) -- Full screen
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.BackgroundTransparency = 0.3
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Lunar Dark Color
Frame.Parent = ScreenGui

-- Create Hide/Show Button (Top Right)
local HideButton = Instance.new("TextButton")
HideButton.Size = UDim2.new(0, 50, 0, 25)
HideButton.Position = UDim2.new(1, -55, 0, 5)
HideButton.Text = "-"
HideButton.Parent = Frame

-- Create Auto Farm Button
local AutoFarmButton = Instance.new("TextButton")
AutoFarmButton.Size = UDim2.new(0, 200, 0, 50)
AutoFarmButton.Position = UDim2.new(0.5, -100, 0.2, 0)
AutoFarmButton.Text = "Auto Farm: OFF"
AutoFarmButton.Parent = Frame

-- Create Auto Chest Button
local AutoChestButton = Instance.new("TextButton")
AutoChestButton.Size = UDim2.new(0, 200, 0, 50)
AutoChestButton.Position = UDim2.new(0.5, -100, 0.35, 0)
AutoChestButton.Text = "Auto Chest: OFF"
AutoChestButton.Parent = Frame

-- Create Auto Click (Auto Attack) Button
local AutoClickButton = Instance.new("TextButton")
AutoClickButton.Size = UDim2.new(0, 200, 0, 50)
AutoClickButton.Position = UDim2.new(0.5, -100, 0.5, 0)
AutoClickButton.Text = "Auto Attack: OFF"
AutoClickButton.Parent = Frame

-- Variables for Functionality
local autoFarmEnabled = false
local autoChestEnabled = false
local autoClickEnabled = false
local frameVisible = true

-- Auto Farm Function (Teleports player to NPCs for XP Farming)
local function autoFarm()
    while autoFarmEnabled do
        wait(1) -- Delay between farming
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                wait(0.5)
            end
        end
    end
end

-- Auto Chest Collect Function (Fixed)
local function autoChest()
    while autoChestEnabled do
        wait(2) -- Delay for collecting chests
        for _, chest in pairs(game.Workspace:GetChildren()) do
            if chest:IsA("Model") and chest:FindFirstChild("TouchInterest") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = chest.TouchInterest.Parent.CFrame
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, chest.TouchInterest.Parent, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, chest.TouchInterest.Parent, 1)
                wait(1)
            end
        end
    end
end

-- Auto Click (Auto Attack) Function
local function autoClick()
    while autoClickEnabled do
        wait(1) -- Click every 1 second
        local tool = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:IsA("Tool") then
            tool:Activate()
        end
    end
end

-- Toggle Auto Farm
AutoFarmButton.MouseButton1Click:Connect(function()
    autoFarmEnabled = not autoFarmEnabled
    AutoFarmButton.Text = "Auto Farm: " .. (autoFarmEnabled and "ON" or "OFF")
    if autoFarmEnabled then
        spawn(autoFarm)
    end
end)

-- Toggle Auto Chest
AutoChestButton.MouseButton1Click:Connect(function()
    autoChestEnabled = not autoChestEnabled
    AutoChestButton.Text = "Auto Chest: " .. (autoChestEnabled and "ON" or "OFF")
    if autoChestEnabled then
        spawn(autoChest)
    end
end)

-- Toggle Auto Click (Auto Attack)
AutoClickButton.MouseButton1Click:Connect(function()
    autoClickEnabled = not autoClickEnabled
    AutoClickButton.Text = "Auto Attack: " .. (autoClickEnabled and "ON" or "OFF")
    if autoClickEnabled then
        spawn(autoClick)
    end
end)

-- Hide/Show GUI Button Function
HideButton.MouseButton1Click:Connect(function()
    frameVisible = not frameVisible
    for _, child in pairs(Frame:GetChildren()) do
        if child ~= HideButton then
            child.Visible = frameVisible
        end
    end
    HideButton.Text = frameVisible and "-" or "+"
end)


