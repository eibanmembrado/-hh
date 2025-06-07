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
toggleBtn.Image = "rbxassetid://6031075938"
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleBtn.AutoButtonColor = true
toggleBtn.Active = true
toggleBtn.Draggable = true
roundify(toggleBtn, 15)
local function createMenu()
	toggleBtn.Visible = false
	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0, 430, 0, 300)
	frame.Position = UDim2.new(0.5, -215, 0.5, -150)
	frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	frame.Active = true
	frame.Draggable = true
	roundify(frame, 10)
	local title = Instance.new("TextLabel", frame)
	title.Size = UDim2.new(1, 0, 0, 25)
	title.Position = UDim2.new(0, 0, 0, 0)
	title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	title.Text = "JJSploit Server Menu"
	title.TextColor3 = Color3.new(1, 1, 1)
	title.Font = Enum.Font.GothamBold
	title.TextScaled = true
	roundify(title, 10)
	local subtitle = Instance.new("TextLabel", frame)
	subtitle.Size = UDim2.new(1, 0, 0, 20)
	subtitle.Position = UDim2.new(0, 0, 0, 25)
	subtitle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	subtitle.Text = "https://discord.gg/HxSxfVFu7w"
	subtitle.TextColor3 = Color3.fromRGB(150, 200, 255)
	subtitle.Font = Enum.Font.Gotham
	subtitle.TextScaled = true
	subtitle.TextWrapped = true
	roundify(subtitle, 10)
	local minimizeBtn = Instance.new("TextButton", frame)
	minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
	minimizeBtn.Position = UDim2.new(1, -65, 0, 3)
	minimizeBtn.Text = "-"
	minimizeBtn.TextColor3 = Color3.new(1,1,1)
	minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	minimizeBtn.Font = Enum.Font.GothamBold
	minimizeBtn.TextScaled = true
	roundify(minimizeBtn, 6)
	local closeBtn = Instance.new("TextButton", frame)
	closeBtn.Size = UDim2.new(0, 30, 0, 30)
	closeBtn.Position = UDim2.new(1, -35, 0, 3)
	closeBtn.Text = "X"
	closeBtn.TextColor3 = Color3.new(1,1,1)
	closeBtn.BackgroundColor3 = Color3.fromRGB(120, 50, 50)
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextScaled = true
	roundify(closeBtn, 6)
	local sidebar = Instance.new("Frame", frame)
	sidebar.Size = UDim2.new(0, 100, 1, -45)
	sidebar.Position = UDim2.new(0, 0, 0, 45)
	sidebar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	roundify(sidebar, 10)
	local scriptsBtn = Instance.new("TextButton", sidebar)
	scriptsBtn.Size = UDim2.new(1, -20, 0, 40)
	scriptsBtn.Position = UDim2.new(0, 10, 0, 10)
	scriptsBtn.Text = "Scripts"
	scriptsBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	scriptsBtn.TextColor3 = Color3.new(1,1,1)
	scriptsBtn.Font = Enum.Font.GothamBold
	scriptsBtn.TextScaled = true
	roundify(scriptsBtn, 6)
	local executorBtn = Instance.new("TextButton", sidebar)
	executorBtn.Size = UDim2.new(1, -20, 0, 40)
	executorBtn.Position = UDim2.new(0, 10, 0, 60)
	executorBtn.Text = "Lua Executor"
	executorBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	executorBtn.TextColor3 = Color3.new(1,1,1)
	executorBtn.Font = Enum.Font.GothamBold
	executorBtn.TextScaled = true
	roundify(executorBtn, 6)
	local contentFrame = Instance.new("Frame", frame)
	contentFrame.Size = UDim2.new(1, -110, 1, -45)
	contentFrame.Position = UDim2.new(0, 105, 0, 45)
	contentFrame.BackgroundTransparency = 1
	local page = Instance.new("Frame", contentFrame)
	page.Size = UDim2.new(1, -10, 1, -75)
	page.Position = UDim2.new(0, 5, 0, 5)
	page.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	page.BackgroundTransparency = 0.1
	roundify(page, 10)
	local scripts = {
		{"Sirius Menu", "https://sirius.menu/script"},
		{"BloxFruits", "https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"},
		{"MVS", "https://raw.githubusercontent.com/BeanBotWare/FreakBob/refs/heads/main/FreakBob"},
		{"Brookhaven", "https://raw.githubusercontent.com/kigredns/SanderXV4.2.2/refs/heads/main/NormalSS.lua"},
		{"Rainbow Friends", "https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"},
		{"Tower Of Hell", "https://raw.githubusercontent.com/centerepic/sasware_TowerOfHell/main/TowerOfHell_sw.lua"},
		{"Natural Disaster", "https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"},
		{"MM2 Nexus", "https://raw.githubusercontent.com/s-o-a-b/nexus/main/loadstring"},
		{"MM2 XHUB", "https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"},
		{"Doors Hacks", "https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"},
		{"Bloxfruits Auto", "https://raw.githubusercontent.com/CheemsNhuChiAl/Sotringhuhu/main/StrawberryHubBeta1.35"},
		{"Doors Item", "https://raw.githubusercontent.com/CatEnddroid/Kitty-Cats-Doors-Beta/refs/heads/main/hub.lua"},
		{"Blade Ball", "https://raw.githubusercontent.com/Fsploit/Frostware/refs/heads/main/F-R-O-S-T-W-A-R-E%20BY%20FSPLOIT-BLADE%20BALL.lua"},
		{"Los Campos", "https://raw.githubusercontent.com/Mautiku/ehh/main/strong%20guest.lua.txt"},
		{"Rivals", "https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubRivals"},
		{"Rivals Auto Kill", "https://raw.githubusercontent.com/eibanmembrado/-hh/refs/heads/main/rivals-knife-auto-kill"},
		{"Infinite Yield", "https://cdn.wearedevs.net/scripts/Infinite%20Yield.txt"},
		{"Dex Explorer", "https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"}
	}
	local buttons = {}
	local currentPage = 1
	local perPage = 6
	local pageLabel
	local function makeButton(index, name, link)
		local perRow = 2
		local spacing = 10
		local totalSpacing = spacing * (perRow + 1)
		local buttonWidth = math.floor((page.AbsoluteSize.X - totalSpacing) / perRow)
		local buttonHeight = 40
		local row = math.floor((index - 1) / perRow)
		local col = (index - 1) % perRow
		local btn = Instance.new("TextButton", page)
		btn.Size = UDim2.new(0, buttonWidth, 0, buttonHeight)
		btn.Position = UDim2.new(0, spacing + (col * (buttonWidth + spacing)), 0, spacing + (row * (buttonHeight + spacing)))
		btn.Text = name
		btn.TextColor3 = Color3.fromRGB(230, 230, 230)
		btn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
		btn.BackgroundTransparency = 0.3
		btn.Font = Enum.Font.Gotham
		btn.TextScaled = true
		roundify(btn, 6)
		btn.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(link))()
		end)
		table.insert(buttons, btn)
	end
	local function showPage()
		for _, btn in ipairs(buttons) do btn:Destroy() end
		buttons = {}
		local totalPages = math.ceil(#scripts / perPage)
		if currentPage < 1 then currentPage = totalPages end
		if currentPage > totalPages then currentPage = 1 end
		local start = (currentPage - 1) * perPage + 1
		local stop = math.min(start + perPage - 1, #scripts)
		local index = 1
		for i = start, stop do
			makeButton(index, scripts[i][1], scripts[i][2])
			index += 1
		end
		pageLabel.Text = "Página " .. currentPage .. " / " .. totalPages
	end

	local prevBtn = Instance.new("TextButton", contentFrame)
	prevBtn.Size = UDim2.new(0, 50, 0, 25)
	prevBtn.Position = UDim2.new(0.25, -25, 1, -30)
	prevBtn.Text = "←"
	prevBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	prevBtn.TextColor3 = Color3.new(1, 1, 1)
	prevBtn.Font = Enum.Font.GothamBold
	prevBtn.TextScaled = true
	roundify(prevBtn, 6)
	local nextBtn = Instance.new("TextButton", contentFrame)
	nextBtn.Size = UDim2.new(0, 50, 0, 25)
	nextBtn.Position = UDim2.new(0.75, -25, 1, -30)
	nextBtn.Text = "→"
	nextBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	nextBtn.TextColor3 = Color3.new(1, 1, 1)
	nextBtn.Font = Enum.Font.GothamBold
	nextBtn.TextScaled = true
	roundify(nextBtn, 6)
	pageLabel = Instance.new("TextLabel", contentFrame)
	pageLabel.Size = UDim2.new(0, 150, 0, 25)
	pageLabel.Position = UDim2.new(0.5, -75, 1, -30)
	pageLabel.BackgroundTransparency = 1
	pageLabel.TextColor3 = Color3.new(1, 1, 1)
	pageLabel.Font = Enum.Font.GothamBold
	pageLabel.TextScaled = true
	pageLabel.Text = ""
	prevBtn.MouseButton1Click:Connect(function()
		currentPage -= 1
		showPage()
	end)
	nextBtn.MouseButton1Click:Connect(function()
		currentPage += 1
		showPage()
	end)
	local executorFrame = Instance.new("Frame", contentFrame)
	executorFrame.Size = UDim2.new(1, -10, 1, -75)
	executorFrame.Position = UDim2.new(0, 5, 0, 5)
	executorFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	executorFrame.BackgroundTransparency = 0.1
	roundify(executorFrame, 10)
	executorFrame.Visible = false
	local codeBox = Instance.new("TextBox", executorFrame)
	codeBox.Size = UDim2.new(1, -20, 0, 150)
	codeBox.Position = UDim2.new(0, 10, 0, 10)
	codeBox.PlaceholderText = "-- Escribe tu código Lua aquí"
	codeBox.Text = ""
	codeBox.TextColor3 = Color3.new(1,1,1)
	codeBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
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
	runBtn.Size = UDim2.new(0, 100, 0, 40)
	runBtn.Position = UDim2.new(0, 10, 0, 170)
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
	showPage()
	scriptsBtn.MouseButton1Click:Connect(function()
		page.Visible = true
		prevBtn.Visible = true
		nextBtn.Visible = true
		pageLabel.Visible = true
		executorFrame.Visible = false
		scriptsBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		executorBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	end)
	executorBtn.MouseButton1Click:Connect(function()
		page.Visible = false
		prevBtn.Visible = false
		nextBtn.Visible = false
		pageLabel.Visible = false

		executorFrame.Visible = true
		scriptsBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
		executorBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
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
