-- EAR HUB - Premium GUI Menu
-- Roblox Volleyball Legend Script
-- Dark theme with purple neon glow

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EAR_HUB"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Main Frame (640x470)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 640, 0, 470)
mainFrame.Position = UDim2.new(0.5, -320, 0.5, -235)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Rounded corners via UICorner
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

-- Outer glow border (shadow)
local glowBorder = Instance.new("Frame")
glowBorder.Name = "GlowBorder"
glowBorder.Size = UDim2.new(1, 8, 1, 8)
glowBorder.Position = UDim2.new(0, -4, 0, -4)
glowBorder.BackgroundColor3 = Color3.fromRGB(120, 40, 200)
glowBorder.BackgroundTransparency = 0.6
glowBorder.BorderSizePixel = 0
glowBorder.ClipsDescendants = true
glowBorder.Parent = mainFrame

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 14)
glowCorner.Parent = glowBorder

-- Inner subtle glow
local innerGlow = Instance.new("Frame")
innerGlow.Name = "InnerGlow"
innerGlow.Size = UDim2.new(1, -2, 1, -2)
innerGlow.Position = UDim2.new(0, 1, 0, 1)
innerGlow.BackgroundColor3 = Color3.fromRGB(30, 28, 40)
innerGlow.BackgroundTransparency = 0.7
innerGlow.BorderSizePixel = 0
innerGlow.Parent = mainFrame

local innerGlowCorner = Instance.new("UICorner")
innerGlowCorner.CornerRadius = UDim.new(0, 11)
innerGlowCorner.Parent = innerGlow

-- Thin glowing outline
local outline = Instance.new("Frame")
outline.Name = "Outline"
outline.Size = UDim2.new(1, 0, 1, 0)
outline.Position = UDim2.new(0, 0, 0, 0)
outline.BackgroundColor3 = Color3.fromRGB(150, 60, 220)
outline.BackgroundTransparency = 0.4
outline.BorderSizePixel = 1
outline.ZIndex = 2
outline.Parent = mainFrame

local outlineCorner = Instance.new("UICorner")
outlineCorner.CornerRadius = UDim.new(0, 12)
outlineCorner.Parent = outline

-- Top Header Bar
local headerBar = Instance.new("Frame")
headerBar.Name = "HeaderBar"
headerBar.Size = UDim2.new(1, 0, 0, 50)
headerBar.Position = UDim2.new(0, 0, 0, 0)
headerBar.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
headerBar.BackgroundTransparency = 0
headerBar.BorderSizePixel = 0
headerBar.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = headerBar

-- Header bottom separator line
local headerSep = Instance.new("Frame")
headerSep.Name = "HeaderSeparator"
headerSep.Size = UDim2.new(1, -40, 0, 1)
headerSep.Position = UDim2.new(0, 20, 1, -1)
headerSep.BackgroundColor3 = Color3.fromRGB(120, 40, 200)
headerSep.BackgroundTransparency = 0.15
headerSep.BorderSizePixel = 0
headerSep.Parent = headerBar

-- Title "EAR HUB"
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(0, 200, 1, 0)
titleLabel.Position = UDim2.new(0, 20, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "EAR HUB"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 22
titleLabel.TextFont = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.Parent = headerBar

-- Player Info Area (Level 100)
local playerInfo = Instance.new("Frame")
playerInfo.Name = "PlayerInfo"
playerInfo.Size = UDim2.new(0, 160, 0, 28)
playerInfo.Position = UDim2.new(1, -180, 0.5, -14)
playerInfo.BackgroundColor3 = Color3.fromRGB(40, 35, 55)
playerInfo.BackgroundTransparency = 0.4
playerInfo.BorderSizePixel = 0
playerInfo.Parent = headerBar

local playerInfoCorner = Instance.new("UICorner")
playerInfoCorner.CornerRadius = UDim.new(0, 6)
playerInfoCorner.Parent = playerInfo

local playerLevelLabel = Instance.new("TextLabel")
playerLevelLabel.Name = "LevelText"
playerLevelLabel.Size = UDim2.new(1, 0, 1, 0)
playerLevelLabel.Position = UDim2.new(0, 0, 0, 0)
playerLevelLabel.BackgroundTransparency = 1
playerLevelLabel.Text = "Player Level 100"
playerLevelLabel.TextColor3 = Color3.fromRGB(200, 190, 220)
playerLevelLabel.TextSize = 13
playerLevelLabel.TextFont = Enum.Font.GothamMedium
playerLevelLabel.TextXAlignment = Enum.TextXAlignment.Center
playerLevelLabel.TextYAlignment = Enum.TextYAlignment.Center
playerLevelLabel.Parent = playerInfo

-- Navigation Tabs Container
local tabsContainer = Instance.new("Frame")
tabsContainer.Name = "TabsContainer"
tabsContainer.Size = UDim2.new(1, 0, 0, 40)
tabsContainer.Position = UDim2.new(0, 0, 0, 50)
tabsContainer.BackgroundTransparency = 1
tabsContainer.Parent = mainFrame

-- Tab definitions (empty placeholders)
local tabs = {
    {name = "HOME", id = "Home"},
    {name = "STATS", id = "Stats"},
    {name = "SHOP", id = "Shop"},
    {name = "SETTINGS", id = "Settings"},
    {name = "PROFILE", id = "Profile"},
}

local tabButtons = {}
local selectedTab = "Home"

-- Create tabs
for i, tabData in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = tabData.id .. "Tab"
    tabBtn.Size = UDim2.new(0, 100, 1, 0)
    tabBtn.Position = UDim2.new(0, (i - 1) * 100, 0, 0)
    tabBtn.BackgroundTransparency = 1
    tabBtn.Text = tabData.name
    tabBtn.TextColor3 = Color3.fromRGB(180, 175, 195)
    tabBtn.TextSize = 13
    tabBtn.TextFont = Enum.Font.GothamMedium
    tabBtn.TextXAlignment = Enum.TextXAlignment.Center
    tabBtn.TextYAlignment = Enum.TextYAlignment.Center
    tabBtn.BorderSizePixel = 0
    tabBtn.AutoButtonColor = false
    tabBtn.Parent = tabsContainer
    
    -- Tab indicator line (hidden by default)
    local indicator = Instance.new("Frame")
    indicator.Name = "Indicator"
    indicator.Size = UDim2.new(0, 40, 0, 2)
    indicator.Position = UDim2.new(0.5, -20, 1, -2)
    indicator.BackgroundColor3 = Color3.fromRGB(150, 60, 220)
    indicator.BackgroundTransparency = 1
    indicator.BorderSizePixel = 0
    indicator.Parent = tabBtn
    
    tabButtons[tabData.id] = {button = tabBtn, indicator = indicator}
end

-- Set Home tab as selected
tabButtons["Home"].indicator.BackgroundTransparency = 0.1
tabButtons["Home"].button.TextColor3 = Color3.fromRGB(230, 220, 255)

-- Separator line under tabs
local tabSeparator = Instance.new("Frame")
tabSeparator.Name = "TabSeparator"
tabSeparator.Size = UDim2.new(1, -40, 0, 1)
tabSeparator.Position = UDim2.new(0, 20, 0, 40)
tabSeparator.BackgroundColor3 = Color3.fromRGB(120, 40, 200)
tabSeparator.BackgroundTransparency = 0.08
tabSeparator.BorderSizePixel = 0
tabSeparator.Parent = mainFrame

-- Content Area (empty placeholder)
local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -40, 1, -95)
contentArea.Position = UDim2.new(0, 20, 0, 50)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- Tab click handling
local function selectTab(tabId)
    for id, data in pairs(tabButtons) do
        if id == tabId then
            data.indicator.BackgroundTransparency = 0.1
            data.button.TextColor3 = Color3.fromRGB(230, 220, 255)
        else
            data.indicator.BackgroundTransparency = 1
            data.button.TextColor3 = Color3.fromRGB(180, 175, 195)
        end
    end
    selectedTab = tabId
end

for id, data in pairs(tabButtons) do
    data.button.MouseButton1Click:Connect(function()
        selectTab(id)
    end)
end

-- Bottom separator line
local bottomSep = Instance.new("Frame")
bottomSep.Name = "BottomSeparator"
bottomSep.Size = UDim2.new(1, -40, 0, 1)
bottomSep.Position = UDim2.new(0, 20, 1, -5)
bottomSep.BackgroundColor3 = Color3.fromRGB(120, 40, 200)
bottomSep.BackgroundTransparency = 0.06
bottomSep.BorderSizePixel = 0
bottomSep.Parent = mainFrame

-- Small purple accent glow at bottom corners
local bottomGlowLeft = Instance.new("Frame")
bottomGlowLeft.Name = "BottomGlowLeft"
bottomGlowLeft.Size = UDim2.new(0, 80, 0, 30)
bottomGlowLeft.Position = UDim2.new(0, 0, 1, -30)
bottomGlowLeft.BackgroundColor3 = Color3.fromRGB(120, 40, 200)
bottomGlowLeft.BackgroundTransparency = 0.08
bottomGlowLeft.BorderSizePixel = 0
bottomGlowLeft.Parent = mainFrame

local bottomGlowRight = Instance.new("Frame")
bottomGlowRight.Name = "BottomGlowRight"
bottomGlowRight.Size = UDim2.new(0, 80, 0, 30)
bottomGlowRight.Position = UDim2.new(1, -80, 1, -30)
bottomGlowRight.BackgroundColor3 = Color3.fromRGB(120, 40, 200)
bottomGlowRight.BackgroundTransparency = 0.08
bottomGlowRight.BorderSizePixel = 0
bottomGlowRight.Parent = mainFrame

-- Top left/right subtle purple accents
local topGlowLeft = Instance.new("Frame")
topGlowLeft.Name = "TopGlowLeft"
topGlowLeft.Size = UDim2.new(0, 80, 0, 30)
topGlowLeft.Position = UDim2.new(0, 0, 0, 0)
topGlowLeft.BackgroundColor3 = Color3.fromRGB(120, 40, 200)
topGlowLeft.BackgroundTransparency = 0.05
topGlowLeft.BorderSizePixel = 0
topGlowLeft.Parent = mainFrame

local topGlowRight = Instance.new("Frame")
topGlowRight.Name = "TopGlowRight"
topGlowRight.Size = UDim2.new(0, 80, 0, 30)
topGlowRight.Position = UDim2.new(1, -80, 0, 0)
topGlowRight.BackgroundColor3 = Color3.fromRGB(120, 40, 200)
topGlowRight.BackgroundTransparency = 0.05
topGlowRight.BorderSizePixel = 0
topGlowRight.Parent = mainFrame

-- Make GUI draggable
local dragging = false
local dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Keyboard shortcut to toggle GUI (Insert key)
local guiVisible = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        guiVisible = not guiVisible
        screenGui.Enabled = guiVisible
    end
end)

print("EAR HUB loaded successfully!")
print("Press INSERT to toggle visibility")
