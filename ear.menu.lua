-- EAR HUB - Premium GUI Menu (CLEAN VERSION)
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
-- ОСНОВНОЕ МЕНЮ (ЧЕРНОЕ)
-- ============================================

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 640, 0, 200)
mainFrame.Position = UDim2.new(0.5, -320, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- СКРУГЛЕНИЕ УГЛОВ
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

-- НАЗВАНИЕ "EAR HUB"
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 1, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "EAR HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 32
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = header

-- ============================================
-- РАЗДЕЛИТЕЛЬ ПОД ЗАГОЛОВКОМ (ФИОЛЕТОВЫЙ, ПОЛНЫЙ)
-- ============================================

local separator = Instance.new("Frame")
separator.Name = "Separator"
separator.Size = UDim2.new(1, 0, 0, 2)
separator.Position = UDim2.new(0, 0, 1, -2)
separator.BackgroundColor3 = Color3.fromRGB(140, 50, 210)
separator.BackgroundTransparency = 0.3
separator.BorderSizePixel = 0
separator.Parent = header

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
