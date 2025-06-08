local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "JJExploit"
gui.ResetOnSpawn = false

local function roundify(obj, radius)
	local uicorner = Instance.new("UICorner")
	uicorner.CornerRadius = UDim.new(0, radius)
	uicorner.Parent = obj
end

local toggleBtn = Instance.new("ImageButton", gui)
toggleBtn.Size = UDim2.new(0, 50, 0, 50)
toggleBtn.Position = UDim2.new(0.5, -25, 0.5, -25)
toggleBtn.Image = "https://upload.wikimedia.org/wikipedia/commons/c/cf/Lua-Logo.svg"
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleBtn.AutoButtonColor = true
toggleBtn.Active = true
toggleBtn.Draggable = true
roundify(toggleBtn, 15)

local function createMenu()
	toggleBtn.Visible = false
	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0, 600, 0, 400)
	frame.Position = UDim2.new(0.5, -300, 0.5, -200)
	frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	frame.Active = true
	frame.Draggable = true
	roundify(frame, 10)

	local title = Instance.new("TextLabel", frame)
	title.Size = UDim2.new(1, 0, 0, 30)
	title.Position = UDim2.new(0, 0, 0, 0)
	title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	title.Text = "Lua Script Executor"
	title.TextColor3 = Color3.new(1, 1, 1)
	title.Font = Enum.Font.GothamBold
	title.TextScaled = true
	roundify(title, 10)

	local minimizeBtn = Instance.new("TextButton", frame)
	minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
	minimizeBtn.Position = UDim2.new(1, -65, 0, 3)
	minimizeBtn.Text = "-"
	minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
	minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	minimizeBtn.Font = Enum.Font.GothamBold
	minimizeBtn.TextScaled = true
	roundify(minimizeBtn, 6)

	local closeBtn = Instance.new("TextButton", frame)
	closeBtn.Size = UDim2.new(0, 30, 0, 30)
	closeBtn.Position = UDim2.new(1, -35, 0, 3)
	closeBtn.Text = "X"
	closeBtn.TextColor3 = Color3.new(1, 1, 1)
	closeBtn.BackgroundColor3 = Color3.fromRGB(120, 50, 50)
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextScaled = true
	roundify(closeBtn, 6)

	local contentFrame = Instance.new("Frame", frame)
	contentFrame.Size = UDim2.new(1, -10, 1, -45)
	contentFrame.Position = UDim2.new(0, 5, 0, 45)
	contentFrame.BackgroundTransparency = 1

	local executorFrame = Instance.new("Frame", contentFrame)
	executorFrame.Size = UDim2.new(1, 0, 1, 0)
	executorFrame.Position = UDim2.new(0, 0, 0, 0)
	executorFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	executorFrame.BackgroundTransparency = 0.1
	roundify(executorFrame, 10)

	local codeBox = Instance.new("TextBox", executorFrame)
	codeBox.Size = UDim2.new(1, -20, 0, 250)
	codeBox.Position = UDim2.new(0, 10, 0, 10)
	codeBox.PlaceholderText = "-- Escribe tu código Lua aquí"
	codeBox.Text = ""
	codeBox.TextColor3 = Color3.new(1, 1, 1)
	codeBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	codeBox.ClearTextOnFocus = false
	codeBox.Font = Enum.Font.Code
	codeBox.TextScaled = false
	codeBox.TextXAlignment = Enum.TextXAlignment.Left
	codeBox.TextYAlignment = Enum.TextYAlignment.Top
	codeBox.MultiLine = true
	codeBox.TextWrapped = false
	codeBox.ClipsDescendants = true
	roundify(codeBox, 6)

	local runBtn = Instance.new("TextButton", executorFrame)
	runBtn.Size = UDim2.new(0, 120, 0, 50)
	runBtn.Position = UDim2.new(0, 10, 0, 270)
	runBtn.Text = "Run"
	runBtn.BackgroundColor3 = Color3.fromRGB(70, 120, 70)
	runBtn.TextColor3 = Color3.new(1, 1, 1)
	runBtn.Font = Enum.Font.GothamBold
	runBtn.TextScaled = true
	roundify(runBtn, 6)

	runBtn.MouseButton1Click:Connect(function()
		local success, err = pcall(function()
			loadstring(codeBox.Text)()
		end)
		if not success then
			warn("Error en ejecución: " .. tostring(err))
		end
	end)

	minimizeBtn.MouseButton1Click:Connect(function()
		frame.Visible = false
		toggleBtn.Visible = true
	end)

	closeBtn.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)
end

toggleBtn.MouseButton1Click:Connect(createMenu)
