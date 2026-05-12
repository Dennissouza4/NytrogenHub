--
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local plr = Players.LocalPlayer
local PlayerGui = plr:WaitForChild("PlayerGui")

local Loader = Instance.new("ScreenGui")
Loader.Name = "DS_TERMINAL"
Loader.IgnoreGuiInset = true
Loader.ResetOnSpawn = false
Loader.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Parent = Loader
Frame.AnchorPoint = Vector2.new(0.5,0.5)
Frame.Position = UDim2.fromScale(0.5,0.5)
Frame.Size = UDim2.new(0,900,0,360)
Frame.ClipsDescendants = true

Frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
Frame.BackgroundTransparency = 0.15

Frame.BorderSizePixel = 0

local Stroke = Instance.new("UIStroke")
Stroke.Parent = Frame
Stroke.Color = Color3.fromRGB(170,0,0)
Stroke.Thickness = 1.2

local Gradient = Instance.new("UIGradient")
Gradient.Parent = Frame
Gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0,0,0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(18,0,0))
}

local TopBar = Instance.new("Frame")
TopBar.Parent = Frame
TopBar.Size = UDim2.new(1,0,0,28)
TopBar.BackgroundColor3 = Color3.fromRGB(15,0,0)
TopBar.BorderSizePixel = 0

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0,12,0,0)
Title.Size = UDim2.new(1,-24,1,0)

Title.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.Bold
)

Title.Text = "dssoftware.exe"
Title.TextColor3 = Color3.fromRGB(255,40,40)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

--// ASCII LABEL
local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = Frame
TextLabel.BackgroundTransparency = 1

TextLabel.Position = UDim2.new(0,18,0,40)
TextLabel.Size = UDim2.new(1,-36,1,-90)

TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextYAlignment = Enum.TextYAlignment.Top

TextLabel.TextColor3 = Color3.fromRGB(220,30,30)

TextLabel.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.ExtraLight
)

TextLabel.TextSize = 16
TextLabel.RichText = false
TextLabel.TextWrapped = false

--// LOADING TEXT
local LoadingText = Instance.new("TextLabel")
LoadingText.Parent = Frame

LoadingText.BackgroundTransparency = 1
LoadingText.Position = UDim2.new(0,18,1,-38)
LoadingText.Size = UDim2.new(1,-36,0,20)

LoadingText.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.Bold
)

LoadingText.Text = "LOADING. PLEASE WAIT."
LoadingText.TextColor3 = Color3.fromRGB(255,40,40)
LoadingText.TextSize = 15
LoadingText.TextXAlignment = Enum.TextXAlignment.Left

--// ASCII
local ascii = [[
██╗  ██████╗ ███████╗    ███████╗ ██████╗ ███████╗████████╗██╗    ██╗ █████╗ ██████╗ ███████╗        
╚██╗ ██╔══██╗██╔════╝    ██╔════╝██╔═████╗██╔════╝╚══██╔══╝██║    ██║██╔══██╗██╔══██╗██╔════╝        
 ╚██╗██║  ██║███████╗    ███████╗██║██╔██║█████╗     ██║   ██║ █╗ ██║███████║██████╔╝█████╗          
 ██╔╝██║  ██║╚════██║    ╚════██║████╔╝██║██╔══╝     ██║   ██║███╗██║██╔══██║██╔══██╗██╔══╝          
██╔╝ ██████╔╝███████║    ███████║╚██████╔╝██║        ██║   ╚███╔███╔╝██║  ██║██║  ██║███████╗███████╗
╚═╝  ╚═════╝ ╚══════╝    ╚══════╝ ╚═════╝ ╚═╝        ╚═╝    ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝
]]

TextLabel.Text = ascii

--// SCANLINES
for i = 1, 90 do
	local line = Instance.new("Frame")
	line.Parent = Frame

	line.BackgroundColor3 = Color3.fromRGB(255,0,0)
	line.BackgroundTransparency = 0.97

	line.BorderSizePixel = 0

	line.Size = UDim2.new(1,0,0,1)
	line.Position = UDim2.new(0,0,0,i*3)

	task.spawn(function()
		while true do
			line.BackgroundTransparency = math.random(95,99)/100
			task.wait(math.random()/4)
		end
	end)
end

--// SOFT PULSE
task.spawn(function()

	while true do

		TweenService:Create(
			Stroke,
			TweenInfo.new(
				2,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut
			),
			{
				Transparency = 0.35
			}
		):Play()

		TweenService:Create(
			TextLabel,
			TweenInfo.new(
				2,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut
			),
			{
				TextTransparency = 0.15
			}
		):Play()

		task.wait(2)

		TweenService:Create(
			Stroke,
			TweenInfo.new(
				2,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut
			),
			{
				Transparency = 0
			}
		):Play()

		TweenService:Create(
			TextLabel,
			TweenInfo.new(
				2,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut
			),
			{
				TextTransparency = 0
			}
		):Play()

		task.wait(2)
	end
end)

--// OPEN ANIMATION
Frame.Size = UDim2.new(0,0,0,360)

TweenService:Create(
	Frame,
	TweenInfo.new(
		0.45,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),
	{
		Size = UDim2.new(0,900,0,360)
	}
):Play()

--// LOADING DOTS
task.spawn(function()

	local dots = {
		"LOADING. PLEASE WAIT.",
		"LOADING.. PLEASE WAIT.",
		"LOADING... PLEASE WAIT.",
		"PIRCE13ENZO13 == GAY."
	}

	local i = 1

	while Loader.Parent do
		LoadingText.Text = dots[i]

		i += 1
		if i > #dots then
			i = 1
		end

		task.wait(0.5)
	end
end)

task.delay(5,function()

	local closeTween = TweenService:Create(
		Frame,
		TweenInfo.new(
			0.55,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.In
		),
		{
			Size = UDim2.new(0,0,0,360),
			BackgroundTransparency = 1
		}
	)

	closeTween:Play()
	closeTween.Completed:Wait()
	Loader:Destroy()

	--// example:
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Dennissouza4/NytrogenHub/refs/heads/main/Encrypted_GameIdentificator.lua"))()

end)
