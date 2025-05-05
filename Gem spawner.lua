local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Reference to the existing Pet Sim 99 Gem Counter GUI and label
local gemCounterGui = player:WaitForChild("PlayerGui"):WaitForChild("GemCounter") -- Adjust name if necessary
local gemCounterLabel = gemCounterGui:WaitForChild("GemLabel") -- Adjust name if necessary

-- Fake gem counter (only visual)
local fakeGems = 0

-- Create the input frame (UI)
local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(0, 300, 0, 150)
inputFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
inputFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
inputFrame.BorderSizePixel = 0
inputFrame.Parent = player.PlayerGui

-- Title for the input frame
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Gem Spawner"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = inputFrame

-- Input box for entering gem amount
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0.8, 0, 0, 40)
inputBox.Position = UDim2.new(0.1, 0, 0.4, 0)
inputBox.PlaceholderText = "Enter gem amount"
inputBox.Font = Enum.Font.Gotham
inputBox.TextScaled = true
inputBox.Text = ""
inputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inputBox.Parent = inputFrame

-- Generate button to add gems
local generateButton = Instance.new("TextButton")
generateButton.Size = UDim2.new(0.8, 0, 0, 40)
generateButton.Position = UDim2.new(0.1, 0, 0.7, 0)
generateButton.Text = "Generate"
generateButton.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
generateButton.Font = Enum.Font.GothamBold
generateButton.TextScaled = true
generateButton.Parent = inputFrame

-- Success message label
local messageLabel = Instance.new("TextLabel")
messageLabel.Size = UDim2.new(1, 0, 0, 30)
messageLabel.Position = UDim2.new(0, 0, 1, -30)
messageLabel.BackgroundTransparency = 1
messageLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
messageLabel.Font = Enum.Font.Gotham
messageLabel.TextScaled = true
messageLabel.Text = ""
messageLabel.Parent = inputFrame

-- Logic for generating fake gems and updating the visual counter
generateButton.MouseButton1Click:Connect(function()
    local amount = tonumber(inputBox.Text)
    if amount and amount > 0 then
        -- Add the fake gems and update the gem counter label
        fakeGems = fakeGems + amount
        gemCounterLabel.Text = "Gems: " .. fakeGems  -- This updates the visible gem count

        -- Show success message
        messageLabel.Text = "Success! +" .. amount .. " gems"
    else
        -- Invalid input, show error
        messageLabel.Text = "Please enter a valid number."
    end
end)

-- Reset fake gems when the player leaves or re-enters the game
player.OnLeaving:Connect(function()
    fakeGems = 0
    gemCounterLabel.Text = "Gems: 0"  -- Reset the visual gem counter
end)
