local KeyLink = "https://work.ink"

local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

local function VerifyKey(key)
    if key == "" then return false end
    local ok, res = pcall(function()
        return game:HttpGet("https://work.ink" .. key)
    end)
    if ok and res then
        local decoded = HttpService:JSONDecode(res)
        return decoded.valid == true
    end
    return false
end

local KeyPassed = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DuelKeySystem"
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 340, 0, 180)
Frame.Position = UDim2.new(0.5, -170, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "⚔️ DUEL SCRIPT | Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.85, 0, 0, 38)
TextBox.Position = UDim2.new(0.075, 0, 0.28, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderText = "Paste your key here..."
TextBox.Text = ""
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14
TextBox.Parent = Frame
Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 6)

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.4, 0, 0, 36)
GetKeyBtn.Position = UDim2.new(0.075, 0, 0.65, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
GetKeyBtn.Text = "🔑 Get Key"
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 14
GetKeyBtn.Parent = Frame
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 6)

local CheckKeyBtn = Instance.new("TextButton")
CheckKeyBtn.Size = UDim2.new(0.4, 0, 0, 36)
CheckKeyBtn.Position = UDim2.new(0.525, 0, 0.65, 0)
CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
CheckKeyBtn.Text = "✅ Check Key"
CheckKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyBtn.Font = Enum.Font.GothamBold
CheckKeyBtn.TextSize = 14
CheckKeyBtn.Parent = Frame
Instance.new("UICorner", CheckKeyBtn).CornerRadius = UDim.new(0, 6)

GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(KeyLink) end
    GetKeyBtn.Text = "Copied!"
    task.wait(2)
    GetKeyBtn.Text = "🔑 Get Key"
end)

CheckKeyBtn.MouseButton1Click:Connect(function()
    CheckKeyBtn.Text = "Checking..."
    if VerifyKey(TextBox.Text) then
        CheckKeyBtn.Text = "Valid!"
        task.wait(0.5)
        ScreenGui:Destroy()
        KeyPassed = true
    else
        CheckKeyBtn.Text = "Invalid Key!"
        task.wait(1.5)
        CheckKeyBtn.Text = "✅ Check Key"
    end
end)

repeat task.wait(0.2) until KeyPassed

loadstring(game:HttpGet("https://githubusercontent.com"))()
