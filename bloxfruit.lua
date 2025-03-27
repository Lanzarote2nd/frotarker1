local ScreenGui = script.Parent.Parent  -- Gets the GUI
local AutoFarmButton = script.Parent:FindFirstChild("AutoFarmButton") -- Button inside Frame
local AutoClickButton = script.Parent:FindFirstChild("AutoClickButton")
local ClickDelaySlider = script.Parent:FindFirstChild("ClickDelaySlider")

local autoFarming = false
local autoClicking = false
local clickDelay = 1  -- Default click delay

-- Toggle Auto Farm
AutoFarmButton.MouseButton1Click:Connect(function()
    autoFarming = not autoFarming
    if autoFarming then
        print("✅ Auto Farming Enabled")
    else
        print("❌ Auto Farming Disabled")
    end
end)

-- Toggle Auto Click
AutoClickButton.MouseButton1Click:Connect(function()
    autoClicking = not autoClicking
    while autoClicking do
        print("🖱 Auto Click Triggered!")
        wait(clickDelay) -- Uses the delay chosen by the player
    end
end)

-- Adjust Click Delay
ClickDelaySlider.Changed:Connect(function(value)
    clickDelay = value
    print("⏳ Click Delay Set To: " .. clickDelay .. " seconds")
end)


