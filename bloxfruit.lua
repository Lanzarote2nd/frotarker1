-- Create the ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the Main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Lunar Dark Color
Frame.Parent = ScreenGui

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

-- Auto Farm Function
local function autoFarm()
    while autoFarmEnabled do
        wait(1) -- Delay between farming
        print("Auto Farming...") -- Replace with actual farming logic
    end
end

-- Auto Chest Function
local function autoChest()
    while autoChestEnabled do
        wait(2) -- Delay for collecting chests
        print("Collecting Chests...") -- Replace with actual chest logic
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

