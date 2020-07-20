local finder = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local nameofgui = Instance.new("TextLabel")
local random = Instance.new("TextLabel")
local cl = Instance.new("TextLabel")
local border = Instance.new("TextLabel")
local copy = Instance.new("TextButton")

finder.Name = "finder"
finder.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
finder.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
finder.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = finder
Main.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Main.Position = UDim2.new(0.460674137, 0, 0.360557795, 0)
Main.Size = UDim2.new(0, 254, 0, 192)

nameofgui.Name = "nameofgui"
nameofgui.Parent = Main
nameofgui.BackgroundColor3 = Color3.new(1, 1, 1)
nameofgui.BackgroundTransparency = 1
nameofgui.Size = UDim2.new(0, 254, 0, 26)
nameofgui.Font = Enum.Font.SourceSans
nameofgui.Text = "Location Finder"
nameofgui.TextColor3 = Color3.new(1, 1, 1)
nameofgui.TextSize = 20

random.Name = "random"
random.Parent = Main
random.BackgroundColor3 = Color3.new(1, 1, 1)
random.BackgroundTransparency = 1
random.Position = UDim2.new(0.106299214, 0, 0.197916672, 0)
random.Size = UDim2.new(0, 200, 0, 37)
random.Font = Enum.Font.SourceSans
random.Text = "Your current location is "
random.TextColor3 = Color3.new(1, 1, 1)
random.TextSize = 18

cl.Name = "cl"
cl.Parent = Main
cl.BackgroundColor3 = Color3.new(1, 1, 1)
cl.BackgroundTransparency = 1
cl.Position = UDim2.new(0.106299214, 0, 0.39062503, 0)
cl.Size = UDim2.new(0, 200, 0, 36)
cl.Font = Enum.Font.SourceSans
cl.TextColor3 = Color3.new(1, 1, 1)
cl.TextSize = 18



border.Name = "border"
border.Parent = Main
border.BackgroundColor3 = Color3.new(1, 1, 1)
border.Position = UDim2.new(0, 0, 0.114583336, 0)
border.Size = UDim2.new(0, 254, 0, 4)
border.Font = Enum.Font.SourceSans
border.Text = ""
border.TextColor3 = Color3.new(0, 0, 0)
border.TextSize = 14

copy.Name = "copy"
copy.Parent = Main
copy.BackgroundColor3 = Color3.new(1, 1, 1)
copy.Position = UDim2.new(0.106299214, 0, 0.666666687, 0)
copy.Size = UDim2.new(0, 200, 0, 31)
copy.Font = Enum.Font.SourceSans
copy.Text = "Copy to clipboard"
copy.TextColor3 = Color3.new(0, 0, 0)
copy.TextSize = 20
copy.MouseButton1Click:connect(function()
setclipboard(cl.Text)
end)

local isHidden = false
local mause = game.Players.LocalPlayer:GetMouse()

do
local mouse = game:GetService("Players").LocalPlayer:GetMouse();
local inputService = game:GetService('UserInputService');
local heartbeat = game:GetService("RunService").Heartbeat;
function Draggable(frame)
local s, event = pcall(function()
return frame.MouseEnter
end)
if s then
frame.Active = true;
event:connect(function()
local input = frame.InputBegan:connect(function(key)
if key.UserInputType == Enum.UserInputType.MouseButton1 then
local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Quad', 0.1, true);
end
end
end)
local leave;
leave = frame.MouseLeave:connect(function()
input:disconnect();
leave:disconnect();
end)
end)
end
end
end

Draggable(Main)

mause.KeyDown:connect(function(key)
if key == ";" then
if isHidden == false then
Main:TweenPosition(Main.Position - UDim2.new(0,0,1,0),"Out","Quad",0.4,false)
isHidden = true
else
Main:TweenPosition(Main.Position + UDim2.new(0,0,1,0),"Out","Quad",0.4,false)
isHidden = false
end
end
end)


while true do
wait()
cl.Text = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
end