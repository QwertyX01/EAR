-- EAR HUB - Premium GUI Menu (FULLY FIXED)
-- Roblox Volleyball Legend Script

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
    "CoreGui", "MessageGui", "DialogGui", "BanPopupGui"
}

local function getSafeSystemName()
    local existing = {}
    for _, child in ipairs(CoreGui:GetChildren()) do
        if child:IsA("ScreenGui") then
            table.insert(existing, child.Name)
        end
    end
    
    for _, name in ipairs(SYSTEM_GUI_NAMES) do
        local used = false
        for _, exist in ipairs(existing) do
            if exist == name then used = true break end
        end
        if not used then return name end
    end
    return "SystemGui_" .. math.random(1000, 9999)
end

local MASKED_NAME = getSafeSystemName()

-- ============================================
-- СОЗДАНИЕ GUI
-- ============================================

local screenGui = Instance.new("ScreenGui")
screenGui.Name = MASKED_NAME
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

print("[EAR HUB] Loaded as: " .. MASKED_NAME)

-- ============================================
-- ОСНОВНОЕ МЕНЮ (ЧЕРНОЕ, БЕЗ ПРОСВЕТОВ)
-- ============================================

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 640, 0, 470)
mainFrame.Position = UDim2.new(0.5, -320, 0.5, -235)
mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 12) -- МАКСИМАЛЬНО ТЕМНЫЙ
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- СКРУГЛЕНИЕ УГЛОВ (ровное)
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- ============================================
-- ЗАГОЛОВОК "EAR HUB"
-- ============================================

local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 60)
header.Position = UDim2.new(0, 0, 0, 0)
header.BackgroundTransparency = 1
header.Parent = mainFrame

-- НАЗВАНИЕ "EAR HUB" (БОЛЬШОЕ, БЕЛОЕ)
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 1, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "EAR HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 32
title.Font = Enum.Font.GothamBold  -- ПРАВИЛЬНОЕ СВОЙСТВО
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = header

-- Разделитель под заголовком (белый)
local sep1 = Instance.new("Frame")
sep1.Name = "Separator1"
sep1.Size = UDim2.new(0.85, 0, 0, 1)
sep1.Position = UDim2.new(0.075, 0, 1, -2)
sep1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sep1.BackgroundTransparency = 0.15
sep1.BorderSizePixel = 0
sep1.Parent = header

-- ============================================
-- ИНФОРМАЦИЯ О ИГРОКЕ
-- ============================================

local playerFrame = Instance.new("Frame")
playerFrame.Name = "PlayerFrame"
playerFrame.Size = UDim2.new(0, 200, 0, 34)
playerFrame.Position = UDim2.new(0.5, -100, 0, 68)
playerFrame.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
playerFrame.BackgroundTransparency = 0.3
playerFrame.BorderSizePixel = 0
playerFrame.Parent = mainFrame

local playerCorner = Instance.new("UICorner")
playerCorner.CornerRadius = UDim.new(0, 8)
playerCorner.Parent = playerFrame

local playerText = Instance.new("TextLabel")
playerText.Name = "PlayerText"
playerText.Size = UDim2.new(1, 0, 1, 0)
playerText.BackgroundTransparency = 1
playerText.Text = "⚡ Player Level 100"
playerText.TextColor3 = Color3.fromRGB(210, 200, 230)
playerText.TextSize = 15
playerText.Font = Enum.Font.GothamMedium
playerText.TextXAlignment = Enum.TextXAlignment.Center
playerText.TextYAlignment = Enum.TextYAlignment.Center
playerText.Parent = playerFrame

-- ============================================
-- ВКЛАДКИ
-- ============================================

local tabsFrame = Instance.new("Frame")
tabsFrame.Name = "TabsFrame"
tabsFrame.Size = UDim2.new(1, 0, 0, 46)
tabsFrame.Position = UDim2.new(0, 0, 0, 110)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = mainFrame

local tabs = {"HOME", "STATS", "SHOP", "SETTINGS", "PROFILE"}
local tabButtons = {}
local tabWidth = 128

for i, name in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Name = name .. "Btn"
    btn.Size = UDim2.new(0, tabWidth, 1, 0)
    btn.Position = UDim2.new(0, (i - 1) * tabWidth, 0, 0)
    btn.BackgroundTransparency = 1
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(180, 175, 195)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamMedium
    btn.TextXAlignment = Enum.TextXAlignment.Center
    btn.TextYAlignment = Enum.TextYAlignment.Center
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Parent = tabsFrame
    
    local ind = Instance.new("Frame")
    ind.Name = "Indicator"
    ind.Size = UDim2.new(0, 50, 0, 3)
    ind.Position = UDim2.new(0.5, -25, 1, -3)
    ind.BackgroundColor3 = Color3.fromRGB(140, 50, 210)
    ind.BackgroundTransparency = 1
    ind.BorderSizePixel = 0
    ind.Parent = btn
    
    local indCorner = Instance.new("UICorner")
    indCorner.CornerRadius = UDim.new(0, 4)
    indCorner.Parent = ind
    
    tabButtons[name] = {button = btn, indicator = ind}
end

-- Выделяем HOME
tabButtons["HOME"].indicator.BackgroundTransparency = 0
tabButtons["HOME"].button.TextColor3 = Color3.fromRGB(235, 225, 255)

-- Разделитель под вкладками
local sep2 = Instance.new("Frame")
sep2.Name = "Separator2"
sep2.Size = UDim2.new(0.85, 0, 0, 1)
sep2.Position = UDim2.new(0.075, 0, 0, 46)
sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sep2.BackgroundTransparency = 0.08
sep2.BorderSizePixel = 0
sep2.Parent = tabsFrame

-- ============================================
-- ОБЛАСТЬ КОНТЕНТА (пустая)
-- ============================================

local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, -40, 1, -175)
content.Position = UDim2.new(0, 20, 0, 160)
content.BackgroundTransparency = 1
content.Parent = mainFrame

-- ============================================
-- НИЖНЯЯ ЛИНИЯ
-- ============================================

local sep3 = Instance.new("Frame")
sep3.Name = "Separator3"
sep3.Size = UDim2.new(0.85, 0, 0, 1)
sep3.Position = UDim2.new(0.075, 0, 1, -12)
sep3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sep3.BackgroundTransparency = 0.06
sep3.BorderSizePixel = 0
sep3.Parent = mainFrame

-- ============================================
-- ФУНКЦИЯ ПЕРЕКЛЮЧЕНИЯ ВКЛАДОК
-- ============================================

local function selectTab(tabName)
    for name, data in pairs(tabButtons) do
        if name == tabName then
            data.indicator.BackgroundTransparency = 0
            data.button.TextColor3 = Color3.fromRGB(235, 225, 255)
        else
            data.indicator.BackgroundTransparency = 1
            data.button.TextColor3 = Color3.fromRGB(180, 175, 195)
        end
    end
end

for name, data in pairs(tabButtons) do
    data.button.MouseButton1Click:Connect(function()
        selectTab(name)
    end)
end

-- ============================================
-- ПЕРЕМЕЩЕНИЕ
-- ============================================

local dragData = {dragging = false, start = nil, pos = nil}

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragData.dragging = true
        dragData.start = input.Position
        dragData.pos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragData.dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragData.dragging then
        local delta = input.Position - dragData.start
        mainFrame.Position = UDim2.new(
            dragData.pos.X.Scale,
            dragData.pos.X.Offset + delta.X,
            dragData.pos.Y.Scale,
            dragData.pos.Y.Offset + delta.Y
        )
    end
end)

-- ============================================
-- ВКЛ/ВЫКЛ ПО INSERT
-- ============================================

local visible = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        visible = not visible
        screenGui.Enabled = visible
    end
end)

-- ============================================
-- ГОТОВО
-- ============================================

print("[EAR HUB] ✅ SUCCESSFULLY LOADED")
print("[EAR HUB] 📌 Press INSERT to toggle")
print("[EAR HUB] 🎭 Masked as: " .. MASKED_NAME)
