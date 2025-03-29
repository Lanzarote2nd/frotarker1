-- Create the ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the Main Frame (Movable)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Lunar Dark Color
Frame.Active = true
Frame.Draggable = true -- Makes it movable!
Frame.Parent = ScreenGui

-- Create Hide/Show Button
local HideButton = Instance.new("TextButton")
HideButton.Size = UDim2.new(0, 50, 0, 25)
HideButton.Position = UDim2.new(1, -55, 0, 5) -- Top Right of the GUI
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
AutoChestButton.Position = UDim2.new(0.5, -100, 0.5, 0)
AutoChestButton.Text = "Auto Chest: OFF"
AutoChestButton.Parent = Frame

-- Variables for Functionality
local autoFarmEnabled = false
local autoChestEnabled = false
local frameVisible = true

-- Auto Farm Function (Moves player to NPCs for XP Farming)
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

-- Auto Chest Collect Function
local function autoChest()
    while autoChestEnabled do
        wait(2) -- Delay for collecting chests
        for _, chest in pairs(game.Workspace:GetChildren()) do
            if chest:IsA("Model") and chest:FindFirstChild("TouchInterest") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = chest.TouchInterest.Parent.CFrame
                wait(1)
            end
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

