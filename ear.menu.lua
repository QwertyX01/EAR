-- EAR HUB - Premium GUI Menu (Fixed)
-- Roblox Volleyball Legend Script
-- Dark theme with proper rounded corners

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ============================================
-- MASKING SYSTEM
-- ============================================

local SYSTEM_GUI_NAMES = {
    "RobloxGui", "BubbleChat", "Chat", "NotificationGui",
    "PlayerList", "Backpack", "Health", "StarterGui",
    "CoreGui", "MessageGui", "DialogGui", "BanPopupGui",
    "PurchasePrompt", "PurchasePromptGui", "RobloxPrompts",
    "ConfirmGui", "ErrorGui"
}

local function getExistingGuiNames()
    local existing = {}
    for _, child in ipairs(CoreGui:GetChildren()) do
        if child:IsA("ScreenGui") then
            table.insert(existing, child.Name)
        end
    end
    return existing
end

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

local MASKED_NAME = getSafeSystemName()

-- ============================================
-- CREATE SCREENGUI
-- ============================================

local screenGui = Instance.new("ScreenGui")
screenGui.Name = MASKED_NAME
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

print("[EAR HUB] Masked as: " .. MASKED_NAME)

-- ============================================
-- MAIN MENU - DARK BACKGROUND
-- ============================================

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 640, 0, 470)
mainFrame.Position = UDim2.new(0.5, -320, 0.5, -235)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15) -- ОЧЕНЬ ТЕМНЫЙ
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- ПРАВИЛЬНЫЕ СКРУГЛЕННЫЕ УГЛЫ (ровные)
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12) -- 12 пикселей - ровное скругление
mainCorner.Parent = mainFrame

-- ============================================
-- ВНЕШНЕЕ СВЕЧЕНИЕ
-- ============================================

local glowBorder = Instance.new("Frame")
glowBorder.Name = "GlowBorder"
glowBorder.Size = UDim2.new(1, 8, 1, 8)
glowBorder.Position = UDim2.new(0, -4, 0, -4)
glowBorder.BackgroundColor3 = Color3.fromRGB(120, 40, 200)
glowBorder.BackgroundTransparency = 0.5
glowBorder.BorderSizePixel = 0
glowBorder.ClipsDescendants = true
glowBorder.Parent = mainFrame

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 14)
glowCorner.Parent = glowBorder

-- ============================================
-- ЗАГОЛОВОК "EAR HUB"
-- ============================================

-- Верхняя панель (прозрачная)
local headerBar = Instance.new("Frame")
headerBar.Name = "HeaderBar"
headerBar.Size = UDim2.new(1, 0, 0, 55)
headerBar.Position = UDim2.new(0, 0, 0, 0)
headerBar.BackgroundTransparency = 1
headerBar.BorderSizePixel = 0
headerBar.Parent = mainFrame

-- НАЗВАНИЕ "EAR HUB" (крупное, по центру)
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "EAR HUB"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 28
titleLabel.TextFont = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.Parent = headerBar

-- Разделительная линия под заголовком (белая, тонкая)
local headerSep = Instance.new("Frame")
headerSep.Name = "HeaderSeparator"
headerSep.Size = UDim2.new(0.8, 0, 0, 1)
headerSep.Position = UDim2.new(0.1, 0, 1, -2)
headerSep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
headerSep.BackgroundTransparency = 0.2
headerSep.BorderSizePixel = 0
headerSep.Parent = headerBar

-- ============================================
-- ИНФОРМАЦИЯ О ИГРОКЕ
-- ============================================

local playerInfo = Instance.new("Frame")
playerInfo.Name = "PlayerInfo"
playerInfo.Size = UDim2.new(0, 180, 0, 32)
playerInfo.Position = UDim2.new(0.5, -90, 0, 62)
playerInfo.BackgroundColor3 = Color3.fromRGB(30, 28, 40)
playerInfo.BackgroundTransparency = 0.4
playerInfo.BorderSizePixel = 0
playerInfo.Parent = mainFrame

local playerInfoCorner = Instance.new("UICorner")
playerInfoCorner.CornerRadius = UDim.new(0, 8)
playerInfoCorner.Parent = playerInfo

local playerLevelLabel = Instance.new("TextLabel")
playerLevelLabel.Name = "LevelText"
playerLevelLabel.Size = UDim2.new(1, 0, 1, 0)
playerLevelLabel.Position = UDim2.new(0, 0, 0, 0)
playerLevelLabel.BackgroundTransparency = 1
playerLevelLabel.Text = "👤 Player Level 100"
playerLevelLabel.TextColor3 = Color3.fromRGB(200, 190, 220)
playerLevelLabel.TextSize = 14
playerLevelLabel.TextFont = Enum.Font.GothamMedium
playerLevelLabel.TextXAlignment = Enum.TextXAlignment.Center
playerLevelLabel.TextYAlignment = Enum.TextYAlignment.Center
playerLevelLabel.Parent = playerInfo

-- ============================================
-- ВКЛАДКИ НАВИГАЦИИ
-- ============================================

local tabsContainer = Instance.new("Frame")
tabsContainer.Name = "TabsContainer"
tabsContainer.Size = UDim2.new(1, 0, 0, 45)
tabsContainer.Position = UDim2.new(0, 0, 0, 105)
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

-- Ширина каждой вкладки
local tabWidth = 128

for i, tabData in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = tabData.id .. "Tab"
    tabBtn.Size = UDim2.new(0, tabWidth, 1, 0)
    tabBtn.Position = UDim2.new(0, (i - 1) * tabWidth, 0, 0)
    tabBtn.BackgroundTransparency = 1
    tabBtn.Text = tabData.name
    tabBtn.TextColor3 = Color3.fromRGB(180, 175, 195)
    tabBtn.TextSize = 14
    tabBtn.TextFont = Enum.Font.GothamMedium
    tabBtn.TextXAlignment = Enum.TextXAlignment.Center
    tabBtn.TextYAlignment = Enum.TextYAlignment.Center
    tabBtn.BorderSizePixel = 0
    tabBtn.AutoButtonColor = false
    tabBtn.Parent = tabsContainer
    
    -- Индикатор выбранной вкладки
    local indicator = Instance.new("Frame")
    indicator.Name = "Indicator"
    indicator.Size = UDim2.new(0, 60, 0, 3)
    indicator.Position = UDim2.new(0.5, -30, 1, -3)
    indicator.BackgroundColor3 = Color3.fromRGB(150, 60, 220)
    indicator.BackgroundTransparency = 1
    indicator.BorderSizePixel = 0
    indicator.Parent = tabBtn
    
    -- Скругление индикатора
    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(0, 4)
    indicatorCorner.Parent = indicator
    
    tabButtons[tabData.id] = {button = tabBtn, indicator = indicator}
end

-- Выделяем HOME по умолчанию
tabButtons["Home"].indicator.BackgroundTransparency = 0
tabButtons["Home"].button.TextColor3 = Color3.fromRGB(230, 220, 255)

-- Разделитель под вкладками
local tabSeparator = Instance.new("Frame")
tabSeparator.Name = "TabSeparator"
tabSeparator.Size = UDim2.new(0.8, 0, 0, 1)
tabSeparator.Position = UDim2.new(0.1, 0, 0, 45)
tabSeparator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tabSeparator.BackgroundTransparency = 0.1
tabSeparator.BorderSizePixel = 0
tabSeparator.Parent = mainFrame

-- ============================================
-- КОНТЕНТ (пустой)
-- ============================================

local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -40, 1, -165)
contentArea.Position = UDim2.new(0, 20, 0, 155)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- ============================================
-- ОБРАБОТКА КЛИКОВ ПО ВКЛАДКАМ
-- ============================================

local function selectTab(tabId)
    for id, data in pairs(tabButtons) do
        if id == tabId then
            data.indicator.BackgroundTransparency = 0
            data.button.TextColor3 = Color3.fromRGB(230, 220, 255)
        else
            data.indicator.BackgroundTransparency = 1
            data.button.TextColor3 = Color3.fromRGB(180, 175, 195)
        end
    end
end

for id, data in pairs(tabButtons) do
    data.button.MouseButton1Click:Connect(function()
        selectTab(id)
    end)
end

-- ============================================
-- НИЖНЯЯ ДЕКОРАТИВНАЯ ЛИНИЯ
-- ============================================

local bottomSep = Instance.new("Frame")
bottomSep.Name = "BottomSeparator"
bottomSep.Size = UDim2.new(0.8, 0, 0, 1)
bottomSep.Position = UDim2.new(0.1, 0, 1, -10)
bottomSep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bottomSep.BackgroundTransparency = 0.08
bottomSep.BorderSizePixel = 0
bottomSep.Parent = mainFrame

-- ============================================
-- ПЕРЕМЕЩЕНИЕ МЫШЬЮ
-- ============================================

local dragging = false
local dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
    if input.UserInputType == Enum.UserInputType.MouseMovement then
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
-- ВКЛ/ВЫКЛ ПО INSERT
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
-- УСПЕШНЫЙ ЗАПУСК
-- ============================================

print("[EAR HUB] Successfully loaded!")
print("[EAR HUB] Press INSERT to toggle visibility")
print("[EAR HUB] Masked as: " .. MASKED_NAME)
