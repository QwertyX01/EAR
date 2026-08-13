-- EAR HUB - Premium GUI Menu (Fully Masked)
-- Roblox Volleyball Legend Script
-- Dark theme with purple neon glow + CoreGui masking

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- ============================================
-- MASKING SYSTEM - Hide GUI as System Interface
-- ============================================

-- List of legitimate system GUI names
local SYSTEM_GUI_NAMES = {
    "RobloxGui",
    "BubbleChat",
    "Chat",
    "NotificationGui",
    "PlayerList",
    "Backpack",
    "Health",
    "StarterGui",
    "CoreGui",
    "MessageGui",
    "DialogGui",
    "BanPopupGui",
    "PurchasePrompt",
    "PurchasePromptGui",
    "RobloxPrompts",
    "ConfirmGui",
    "ErrorGui"
}

-- Function to get existing GUI names in CoreGui
local function getExistingGuiNames()
    local existing = {}
    for _, child in ipairs(CoreGui:GetChildren()) do
        if child:IsA("ScreenGui") then
            table.insert(existing, child.Name)
        end
    end
    return existing
end

-- Function to get a safe, unused system name
local function getSafeSystemName()
    local existingNames = getExistingGuiNames()
    local availableNames = {}
    
    for _, name in ipairs(SYSTEM_GUI_NAMES) do
        local isUsed = false
        for _, existing in ipairs(existingNames) do
            if existing == name then
                isUsed = true
                break
            end
        end
        if not isUsed then
            table.insert(availableNames, name)
        end
    end
    
    if #availableNames == 0 then
        return "SystemGui_" .. math.random(1000, 9999)
    end
    
    return availableNames[math.random(1, #availableNames)]
end

-- Get masked name
local MASKED_NAME = getSafeSystemName()

-- ============================================
-- CREATE MASKED SCREENGUI IN COREGUI
-- ============================================

local screenGui = Instance.new("ScreenGui")
screenGui.Name = MASKED_NAME
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

print("[EAR HUB] Masked as: " .. MASKED_NAME)

-- ============================================
-- MAIN MENU UI
-- ============================================

-- Main Frame (640x470)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 640, 0, 470)
mainFrame.Position = UDim2.new(0.5, -320, 0.5, -235)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Rounded corners
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
innerGlow.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
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

-- ============================================
-- HEADER - Transparent with white separator
-- ============================================

local headerBar = Instance.new("Frame")
headerBar.Name = "HeaderBar"
headerBar.Size = UDim2.new(1, 0, 0, 50)
headerBar.Position = UDim2.new(0, 0, 0, 0)
headerBar.BackgroundTransparency = 1
headerBar.BorderSizePixel = 0
headerBar.Parent = mainFrame

-- White separator line under header
local headerSep = Instance.new("Frame")
headerSep.Name = "HeaderSeparator"
headerSep.Size = UDim2.new(1, -40, 0, 1)
headerSep.Position = UDim2.new(0, 20, 1, 0)
headerSep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
headerSep.BackgroundTransparency = 0.15
headerSep.BorderSizePixel = 0
headerSep.Parent = headerBar

-- Title "EAR" (white) + "HUB" (purple)
local titleContainer = Instance.new("Frame")
titleContainer.Name = "TitleContainer"
titleContainer.Size = UDim2.new(0, 200, 1, 0)
titleContainer.Position = UDim2.new(0, 20, 0, 0)
titleContainer.BackgroundTransparency = 1
titleContainer.Parent = headerBar

local earLabel = Instance.new("TextLabel")
earLabel.Name = "EAR"
earLabel.Size = UDim2.new(0, 60, 1, 0)
earLabel.Position = UDim2.new(0, 0, 0, 0)
earLabel.BackgroundTransparency = 1
earLabel.Text = "EAR"
earLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
earLabel.TextSize = 20
earLabel.TextFont = Enum.Font.GothamMedium
earLabel.TextXAlignment = Enum.TextXAlignment.Left
earLabel.TextYAlignment = Enum.TextYAlignment.Center
earLabel.Parent = titleContainer

local hubLabel = Instance.new("TextLabel")
hubLabel.Name = "HUB"
hubLabel.Size = UDim2.new(0, 60, 1, 0)
hubLabel.Position = UDim2.new(0, 55, 0, 0)
hubLabel.BackgroundTransparency = 1
hubLabel.Text = "HUB"
hubLabel.TextColor3 = Color3.fromRGB(150, 60, 220)
hubLabel.TextSize = 20
hubLabel.TextFont = Enum.Font.GothamMedium
hubLabel.TextXAlignment = Enum.TextXAlignment.Left
hubLabel.TextYAlignment = Enum.TextYAlignment.Center
hubLabel.Parent = titleContainer

-- Player Info Area
local playerInfo = Instance.new("Frame")
playerInfo.Name = "PlayerInfo"
playerInfo.Size = UDim2.new(0, 160, 0, 28)
playerInfo.Position = UDim2.new(1, -180, 0.5, -14)
playerInfo.BackgroundColor3 = Color3.fromRGB(40, 35, 55)
playerInfo.BackgroundTransparency = 0.3
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

-- ============================================
-- NAVIGATION TABS
-- ============================================

local tabsContainer = Instance.new("Frame")
tabsContainer.Name = "TabsContainer"
tabsContainer.Size = UDim2.new(1, 0, 0, 40)
tabsContainer.Position = UDim2.new(0, 0, 0, 50)
tabsContainer.BackgroundTransparency = 1
tabsContainer.Parent = mainFrame

local tabs = {
    {name = "HOME", id = "Home"},
    {name = "STATS", id = "Stats"},
    {name = "SHOP", id = "Shop"},
    {name = "SETTINGS", id = "Settings"},
    {name = "PROFILE", id = "Profile"},
}

local tabButtons = {}
local selectedTab = "Home"

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

tabButtons["Home"].indicator.BackgroundTransparency = 0.1
tabButtons["Home"].button.TextColor3 = Color3.fromRGB(230, 220, 255)

-- White separator under tabs
local tabSeparator = Instance.new("Frame")
tabSeparator.Name = "TabSeparator"
tabSeparator.Size = UDim2.new(1, -40, 0, 1)
tabSeparator.Position = UDim2.new(0, 20, 0, 40)
tabSeparator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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

-- ============================================
-- TAB CLICK HANDLING
-- ============================================

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

-- ============================================
-- DECORATIVE ELEMENTS
-- ============================================

-- Bottom separator (white)
local bottomSep = Instance.new("Frame")
bottomSep.Name = "BottomSeparator"
bottomSep.Size = UDim2.new(1, -40, 0, 1)
bottomSep.Position = UDim2.new(0, 20, 1, -5)
bottomSep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bottomSep.BackgroundTransparency = 0.06
bottomSep.BorderSizePixel = 0
bottomSep.Parent = mainFrame

-- Purple accent glows
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

-- ============================================
-- DRAG SYSTEM
-- ============================================

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

-- ============================================
-- TOGGLE WITH INSERT KEY
-- ============================================

local guiVisible = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        guiVisible = not guiVisible
        screenGui.Enabled = guiVisible
    end
end)

-- ============================================
-- ANTI-BAN / MASKING VERIFICATION
-- ============================================

-- Randomize properties to look more like system GUI
task.wait(0.5)
local function randomizeSystemProperties()
    -- Randomly change ZIndexBehavior to look more organic
    local behaviors = {Enum.ZIndexBehavior.Sibling, Enum.ZIndexBehavior.Global}
    screenGui.ZIndexBehavior = behaviors[math.random(1, #behaviors)]
    
    -- Randomize ResetOnSpawn (some system GUIs have it true)
    if math.random(1, 10) > 7 then
        screenGui.ResetOnSpawn = true
    end
end

-- Run randomization occasionally to avoid detection
coroutine.wrap(function()
    while screenGui and screenGui.Parent do
        task.wait(math.random(300, 600))
        randomizeSystemProperties()
    end
end)()

-- Print success with mask info
print("[EAR HUB] Successfully loaded and masked as: " .. MASKED_NAME)
print("[EAR HUB] Press INSERT to toggle visibility")
print("[EAR HUB] Running in CoreGui - Anti-ban protection active")

-- Return for external use
return {
    ScreenGui = screenGui,
    MainFrame = mainFrame,
    MaskedName = MASKED_NAME
}
