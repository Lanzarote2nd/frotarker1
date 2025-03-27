local Frame = script.Parent  -- Main GUI
local AutoFarmButton = Frame:FindFirstChild("AutoFarmButton")  -- Auto Farm
local AutoCollectFruitButton = Frame:FindFirstChild("AutoCollectFruitButton")  -- Collect Fruits
local AutoRollFruitButton = Frame:FindFirstChild("AutoRollFruitButton")  -- Roll Fruits
local AutoCollectChestsButton = Frame:FindFirstChild("AutoCollectChestsButton")  -- Collect Chests
local AutoClickButton = Frame:FindFirstChild("AutoClickButton")  -- Auto Click
local ClickDelaySlider = Frame:FindFirstChild("ClickDelaySlider")  -- Click Delay Slider

-- Set GUI Background to Blue
Frame.BackgroundColor3 = Color3.fromRGB(0, 102, 255)

-- Toggle Variables
local autoFarming = false
local autoCollectingFruits = false
local autoRollingFruits = false
local autoCollectingChests = false
local autoClicking = false
local clickDelay = 1  -- Default 1-second delay

-- Auto Farm Toggle
AutoFarmButton.MouseButton1Click:Connect(function()
    autoFarming = not autoFarming
    if autoFarming then
        print("✅ Auto Farming Enabled")
    else
        print("❌ Auto Farming Disabled")
    end
end)

-- Auto Collect Fruits Toggle
AutoCollectFruitButton.MouseButton1Click:Connect(function()
    autoCollectingFruits = not autoCollectingFruits
    if autoCollectingFruits then
        print("✅ Auto Collect Fruits Enabled")
    else
        print("❌ Auto Collect Fruits Disabled")
    end
end)

-- Auto Roll Fruits Toggle
AutoRollFruitButton.MouseButton1Click:Connect(function()
    autoRollingFruits = not autoRollingFruits
    if autoRollingFruits then
        print("✅ Auto Roll Fruits Enabled")
    else
        print("❌ Auto Roll Fruits Disabled")
    end
end)

-- Auto Collect Chests Toggle
AutoCollectChestsButton.MouseButton1Click:Connect(function()
    autoCollectingChests = not autoCollectingChests
    if autoCollectingChests then
        print("✅ Auto Collect Chests Enabled")
    else
        print("❌ Auto Collect Chests Disabled")
    end
end)

-- Auto Click Toggle
AutoClickButton.MouseButton1Click:Connect(function()
    autoClicking = not autoClicking
    while autoClicking do
        print("🖱 Auto Click Triggered!")
        wait(clickDelay) -- Uses the chosen delay
    end
end)

-- Click Delay Adjustment
ClickDelaySlider.Changed:Connect(function(value)
    clickDelay = value
    print("⏳ Click Delay Set To: " .. clickDelay .. " seconds")
end)
