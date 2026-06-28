

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local Networking = nil
for _, child in ipairs(ReplicatedStorage:GetDescendants()) do
    if child.Name == "Networking" and child:IsA("ModuleScript") then
        local ok, result = pcall(require, child)
        if ok then
            Networking = result
            break
        end
    end
end


local MailboxItemCatalog = nil
for _, child in ipairs(ReplicatedStorage:GetDescendants()) do
    if child.Name == "MailboxItemCatalog" and child:IsA("ModuleScript") then
        local ok, result = pcall(require, child)
        if ok then
            MailboxItemCatalog = result
            break
        end
    end
end


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RobloxTopOne_InfiniteMail"
ScreenGui.Parent = PlayerGui


local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 440, 0, 560)
MainFrame.Position = UDim2.new(0.5, -220, 0.5, -280)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(80, 60, 160)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame


local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.Size = UDim2.new(1, 0, 0, 46)
TitleBar.BackgroundColor3 = Color3.fromRGB(28, 22, 50)
TitleBar.BorderSizePixel = 0

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 14)
TitleBarCorner.Parent = TitleBar

local TitleBarFix = Instance.new("Frame")
TitleBarFix.Parent = TitleBar
TitleBarFix.Size = UDim2.new(1, 0, 0, 14)
TitleBarFix.Position = UDim2.new(0, 0, 1, -14)
TitleBarFix.BackgroundColor3 = Color3.fromRGB(28, 22, 50)
TitleBarFix.BorderSizePixel = 0

local AccentLine = Instance.new("Frame")
AccentLine.Parent = MainFrame
AccentLine.Size = UDim2.new(0, 60, 0, 3)
AccentLine.Position = UDim2.new(0, 18, 0, 46)
AccentLine.BackgroundColor3 = Color3.fromRGB(130, 90, 255)
AccentLine.BorderSizePixel = 0

local AccentCorner = Instance.new("UICorner")
AccentCorner.CornerRadius = UDim.new(0, 4)
AccentCorner.Parent = AccentLine


local TitleIcon = Instance.new("TextLabel")
TitleIcon.Parent = TitleBar
TitleIcon.Size = UDim2.new(0, 30, 0, 30)
TitleIcon.Position = UDim2.new(0, 14, 0, 8)
TitleIcon.Text = "✉"
TitleIcon.TextColor3 = Color3.fromRGB(160, 120, 255)
TitleIcon.BackgroundTransparency = 1
TitleIcon.Font = Enum.Font.GothamBold
TitleIcon.TextSize = 18

-- Title
local Title = Instance.new("TextLabel")
Title.Parent = TitleBar
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 48, 0, 0)
Title.Text = "RobloxTopOne Infinite Mail"
Title.TextColor3 = Color3.fromRGB(230, 220, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Subtitle
local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = TitleBar
SubTitle.Size = UDim2.new(1, -100, 0, 14)
SubTitle.Position = UDim2.new(0, 48, 0, 27)
SubTitle.Text = "Grow a Garden 2 - GAG2"
SubTitle.TextColor3 = Color3.fromRGB(120, 100, 180)
SubTitle.BackgroundTransparency = 1
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 11
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Close button (using TextLabel "■" replaced with a clean styled button)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -38, 0, 9)
CloseBtn.Text = "—"
CloseBtn.TextColor3 = Color3.fromRGB(200, 180, 255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(80, 40, 100)
CloseBtn.BorderSizePixel = 0
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Content container
local Content = Instance.new("Frame")
Content.Parent = MainFrame
Content.Size = UDim2.new(1, -32, 1, -64)
Content.Position = UDim2.new(0, 16, 0, 58)
Content.BackgroundTransparency = 1

-- Recipient label
local RecipientLabel = Instance.new("TextLabel")
RecipientLabel.Parent = Content
RecipientLabel.Size = UDim2.new(1, 0, 0, 16)
RecipientLabel.Position = UDim2.new(0, 0, 0, 6)
RecipientLabel.Text = "👤  RECIPIENT USERNAME"
RecipientLabel.TextColor3 = Color3.fromRGB(140, 120, 200)
RecipientLabel.BackgroundTransparency = 1
RecipientLabel.Font = Enum.Font.GothamBold
RecipientLabel.TextSize = 10
RecipientLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Recipient box (no PlaceholderText)
local RecipientBox = Instance.new("TextBox")
RecipientBox.Parent = Content
RecipientBox.Size = UDim2.new(1, 0, 0, 36)
RecipientBox.Position = UDim2.new(0, 0, 0, 26)
RecipientBox.BackgroundColor3 = Color3.fromRGB(30, 26, 46)
RecipientBox.TextColor3 = Color3.fromRGB(220, 210, 255)
RecipientBox.PlaceholderText = ""
RecipientBox.PlaceholderColor3 = Color3.fromRGB(90, 75, 130)
RecipientBox.ClearTextOnFocus = false
RecipientBox.Font = Enum.Font.Gotham
RecipientBox.TextSize = 14
RecipientBox.BorderSizePixel = 0

local RecipientCorner = Instance.new("UICorner")
RecipientCorner.CornerRadius = UDim.new(0, 8)
RecipientCorner.Parent = RecipientBox

local RecipientStroke = Instance.new("UIStroke")
RecipientStroke.Color = Color3.fromRGB(70, 55, 110)
RecipientStroke.Thickness = 1
RecipientStroke.Parent = RecipientBox

-- Item label
local ItemLabel = Instance.new("TextLabel")
ItemLabel.Parent = Content
ItemLabel.Size = UDim2.new(1, 0, 0, 16)
ItemLabel.Position = UDim2.new(0, 0, 0, 74)
ItemLabel.Text = "🎒  SELECT ITEM"
ItemLabel.TextColor3 = Color3.fromRGB(140, 120, 200)
ItemLabel.BackgroundTransparency = 1
ItemLabel.Font = Enum.Font.GothamBold
ItemLabel.TextSize = 10
ItemLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Item scroll list
local ItemScroll = Instance.new("ScrollingFrame")
ItemScroll.Parent = Content
ItemScroll.Size = UDim2.new(1, 0, 0, 148)
ItemScroll.Position = UDim2.new(0, 0, 0, 94)
ItemScroll.BackgroundColor3 = Color3.fromRGB(24, 20, 38)
ItemScroll.BorderSizePixel = 0
ItemScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ItemScroll.ScrollBarThickness = 4
ItemScroll.ScrollBarImageColor3 = Color3.fromRGB(100, 70, 200)

local ScrollCorner = Instance.new("UICorner")
ScrollCorner.CornerRadius = UDim.new(0, 8)
ScrollCorner.Parent = ItemScroll

local ScrollStroke = Instance.new("UIStroke")
ScrollStroke.Color = Color3.fromRGB(60, 50, 100)
ScrollStroke.Thickness = 1
ScrollStroke.Parent = ItemScroll

local ItemListLayout = Instance.new("UIListLayout")
ItemListLayout.Parent = ItemScroll
ItemListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ItemListLayout.Padding = UDim.new(0, 3)

local ScrollPadding = Instance.new("UIPadding")
ScrollPadding.Parent = ItemScroll
ScrollPadding.PaddingLeft = UDim.new(0, 6)
ScrollPadding.PaddingRight = UDim.new(0, 6)
ScrollPadding.PaddingTop = UDim.new(0, 6)
ScrollPadding.PaddingBottom = UDim.new(0, 6)

-- Selected item badge
local SelectedBadge = Instance.new("Frame")
SelectedBadge.Parent = Content
SelectedBadge.Size = UDim2.new(1, 0, 0, 30)
SelectedBadge.Position = UDim2.new(0, 0, 0, 250)
SelectedBadge.BackgroundColor3 = Color3.fromRGB(40, 28, 70)
SelectedBadge.BorderSizePixel = 0

local SelectedBadgeCorner = Instance.new("UICorner")
SelectedBadgeCorner.CornerRadius = UDim.new(0, 8)
SelectedBadgeCorner.Parent = SelectedBadge

local SelectedItemLabel = Instance.new("TextLabel")
SelectedItemLabel.Parent = SelectedBadge
SelectedItemLabel.Size = UDim2.new(1, -12, 1, 0)
SelectedItemLabel.Position = UDim2.new(0, 12, 0, 0)
SelectedItemLabel.Text = "⬡  No item selected"
SelectedItemLabel.TextColor3 = Color3.fromRGB(160, 130, 220)
SelectedItemLabel.BackgroundTransparency = 1
SelectedItemLabel.Font = Enum.Font.Gotham
SelectedItemLabel.TextSize = 12
SelectedItemLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Amount label
local AmountLabel = Instance.new("TextLabel")
AmountLabel.Parent = Content
AmountLabel.Size = UDim2.new(1, 0, 0, 16)
AmountLabel.Position = UDim2.new(0, 0, 0, 292)
AmountLabel.Text = "🔢  AMOUNT"
AmountLabel.TextColor3 = Color3.fromRGB(140, 120, 200)
AmountLabel.BackgroundTransparency = 1
AmountLabel.Font = Enum.Font.GothamBold
AmountLabel.TextSize = 10
AmountLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Amount box (no PlaceholderText)
local AmountBox = Instance.new("TextBox")
AmountBox.Parent = Content
AmountBox.Size = UDim2.new(1, 0, 0, 36)
AmountBox.Position = UDim2.new(0, 0, 0, 312)
AmountBox.BackgroundColor3 = Color3.fromRGB(30, 26, 46)
AmountBox.TextColor3 = Color3.fromRGB(220, 210, 255)
AmountBox.PlaceholderText = ""
AmountBox.PlaceholderColor3 = Color3.fromRGB(90, 75, 130)
AmountBox.ClearTextOnFocus = false
AmountBox.Font = Enum.Font.Gotham
AmountBox.TextSize = 14
AmountBox.BorderSizePixel = 0

local AmountCorner = Instance.new("UICorner")
AmountCorner.CornerRadius = UDim.new(0, 8)
AmountCorner.Parent = AmountBox

local AmountStroke = Instance.new("UIStroke")
AmountStroke.Color = Color3.fromRGB(70, 55, 110)
AmountStroke.Thickness = 1
AmountStroke.Parent = AmountBox

-- Send button
local SendButton = Instance.new("TextButton")
SendButton.Parent = Content
SendButton.Size = UDim2.new(1, 0, 0, 42)
SendButton.Position = UDim2.new(0, 0, 0, 362)
SendButton.Text = "  ✉  SEND"
SendButton.BackgroundColor3 = Color3.fromRGB(100, 60, 220)
SendButton.TextColor3 = Color3.fromRGB(240, 235, 255)
SendButton.Font = Enum.Font.GothamBold
SendButton.TextSize = 14
SendButton.BorderSizePixel = 0

local SendCorner = Instance.new("UICorner")
SendCorner.CornerRadius = UDim.new(0, 10)
SendCorner.Parent = SendButton

-- Status bar
local StatusBar = Instance.new("Frame")
StatusBar.Parent = Content
StatusBar.Size = UDim2.new(1, 0, 0, 28)
StatusBar.Position = UDim2.new(0, 0, 0, 414)
StatusBar.BackgroundColor3 = Color3.fromRGB(22, 18, 36)
StatusBar.BorderSizePixel = 0

local StatusBarCorner = Instance.new("UICorner")
StatusBarCorner.CornerRadius = UDim.new(0, 8)
StatusBarCorner.Parent = StatusBar

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = StatusBar
StatusLabel.Size = UDim2.new(1, -12, 1, 0)
StatusLabel.Position = UDim2.new(0, 12, 0, 0)
StatusLabel.Text = "● Ready"
StatusLabel.TextColor3 = Color3.fromRGB(100, 200, 130)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 11
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- --- Read inventory ---
local selectedItem = nil
-- itemButtons table: maps item name -> {btn, item, currentCount}
local itemButtons = {}

local function refreshInventory()
    for _, child in ipairs(ItemScroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    itemButtons = {}

    local items = {}

    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local count = tool:GetAttribute("Count") or 1
            table.insert(items, {tool = tool, name = tool.Name, count = count})
        end
    end

    for _, tool in ipairs(LocalPlayer.StarterGear:GetChildren()) do
        if tool:IsA("Tool") then
            local count = tool:GetAttribute("Count") or 1
            table.insert(items, {tool = tool, name = tool.Name, count = count})
        end
    end

    if #items == 0 then
        for _, child in ipairs(LocalPlayer:GetChildren()) do
            if child:IsA("Tool") then
                local count = child:GetAttribute("Count") or 1
                table.insert(items, {tool = child, name = child.Name, count = count})
            end
        end
    end

    if #items == 0 then
        StatusLabel.Text = "⚠ No items found!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 170, 80)
        return
    end

    for _, item in ipairs(items) do
        -- Keep a mutable count per item entry
        local entry = {tool = item.tool, name = item.name, count = item.count}

        local btn = Instance.new("TextButton")
        btn.Parent = ItemScroll
        btn.Size = UDim2.new(1, 0, 0, 28)
        btn.Text = "  " .. entry.name .. "   ×" .. entry.count
        btn.BackgroundColor3 = Color3.fromRGB(36, 28, 60)
        btn.TextColor3 = Color3.fromRGB(200, 185, 240)
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 13
        btn.BorderSizePixel = 0

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = btn

        itemButtons[entry.name] = {btn = btn, entry = entry}

        btn.MouseButton1Click:Connect(function()
            selectedItem = entry
            SelectedItemLabel.Text = "✔  " .. entry.name .. "  (×" .. entry.count .. ")"
            SelectedItemLabel.TextColor3 = Color3.fromRGB(170, 130, 255)
            StatusLabel.Text = "● Selected: " .. entry.name
            StatusLabel.TextColor3 = Color3.fromRGB(100, 200, 130)
            -- Highlight selected button
            for _, v in pairs(itemButtons) do
                v.btn.BackgroundColor3 = Color3.fromRGB(36, 28, 60)
                v.btn.TextColor3 = Color3.fromRGB(200, 185, 240)
            end
            btn.BackgroundColor3 = Color3.fromRGB(80, 50, 160)
            btn.TextColor3 = Color3.fromRGB(240, 230, 255)
        end)
    end

    ItemScroll.CanvasSize = UDim2.new(0, 0, 0, #items * 31 + 12)
    StatusLabel.Text = "● " .. #items .. " items listed"
    StatusLabel.TextColor3 = Color3.fromRGB(100, 200, 130)
end

refreshInventory()

-- --- Send gift ---
local function sendGift()
    local recipientName = RecipientBox.Text:gsub("^%s*(.-)%s*$", "%1")
    local amount = tonumber(AmountBox.Text)

    if recipientName == "" then
        StatusLabel.Text = "✕ Enter recipient username!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
        return
    end
    if not selectedItem then
        StatusLabel.Text = "✕ Please select an item!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
        return
    end
    if not amount or amount <= 0 then
        StatusLabel.Text = "✕ Enter a valid amount!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
        return
    end
    if amount > selectedItem.count then
        StatusLabel.Text = "✕ Not enough items! (have " .. selectedItem.count .. ")"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
        return
    end

    local userId = nil
    if Networking and Networking.Mailbox and Networking.Mailbox.LookupPlayer then
        local ok, result = pcall(function()
            return Networking.Mailbox.LookupPlayer:Fire(recipientName)
        end)
        if ok and typeof(result) == "number" and result > 0 then
            userId = result
        else
            StatusLabel.Text = "✕ User not found: " .. recipientName
            StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
            return
        end
    else
        StatusLabel.Text = "✕ LookupPlayer not available!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
        return
    end

    local category = "Seeds"
    local itemKey = selectedItem.name
    local displayName = itemKey

    if MailboxItemCatalog and MailboxItemCatalog.Resolve then
        local resolvedName, _ = MailboxItemCatalog.Resolve("Seeds", itemKey, nil)
        if resolvedName and resolvedName ~= "" then
            displayName = resolvedName
        end
    end

    local payload = {
        {
            Category = category,
            ItemKey = itemKey,
            Count = amount
        }
    }

    if Networking and Networking.Mailbox and Networking.Mailbox.SendBatch then
        local ok, err = pcall(function()
            Networking.Mailbox.SendBatch:Fire(userId, payload, "")
        end)
        if ok then
            -- Deduct sent amount from local count
            selectedItem.count = selectedItem.count - amount

            -- Update button text
            local btnEntry = itemButtons[selectedItem.name]
            if btnEntry then
                btnEntry.btn.Text = "  " .. selectedItem.name .. "   ×" .. selectedItem.count
            end

            -- Update selected badge
            SelectedItemLabel.Text = "✔  " .. selectedItem.name .. "  (×" .. selectedItem.count .. ")"

            StatusLabel.Text = string.format("✔ Sent %d × %s → %s!", amount, displayName, recipientName)
            StatusLabel.TextColor3 = Color3.fromRGB(100, 200, 130)
            print(string.format("Send successful: %d x %s -> %s", amount, displayName, recipientName))
        else
            StatusLabel.Text = "✕ Error: " .. tostring(err)
            StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
            warn("Send error: " .. tostring(err))
        end
    else
        StatusLabel.Text = "✕ SendBatch not found!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
    end
end

SendButton.MouseButton1Click:Connect(sendGift)

print("=== RobloxTopOne Infinite Mail (Backpack version) loaded successfully ===")
StatusLabel.Text = "● Ready - Select an item and enter amount"
