local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local TextService = game:GetService("TextService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local scriptEnabled = true
local following = false
local noclip = false
local followConn = nil
local steppedConn = nil
local cameraTracking = false
local cameraConn = nil
local highlights = {}
local closestPlayer = nil
local fixedTarget = nil
local langSelected = false
local selectedLang = "ES"

local oldGui = PlayerGui:FindFirstChild("SeguirGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SeguirGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local langFrame = Instance.new("Frame", screenGui)
langFrame.Size = UDim2.new(0, 400, 0, 200)
langFrame.AnchorPoint = Vector2.new(0.5, 0.5)
langFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
langFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
langFrame.BorderSizePixel = 0
langFrame.Visible = true

local langTitle = Instance.new("TextLabel", langFrame)
langTitle.Size = UDim2.new(1, 0, 0, 50)
langTitle.BackgroundTransparency = 1
langTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
langTitle.Font = Enum.Font.SourceSansBold
langTitle.TextSize = 30
langTitle.Text = "Seleccione Idioma / Select Language"
langTitle.Position = UDim2.new(0, 0, 0, 10)
langTitle.TextWrapped = true

local helpText = Instance.new("TextLabel", screenGui)
helpText.Size = UDim2.new(0.6, 0, 0.3, 0)
helpText.Position = UDim2.new(0.2, 0, 0.05, 0)
helpText.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
helpText.BackgroundTransparency = 0.3
helpText.TextColor3 = Color3.fromRGB(0, 255, 0)
helpText.Font = Enum.Font.SourceSansBold
helpText.TextWrapped = true
helpText.ClipsDescendants = true
helpText.TextStrokeTransparency = 0.7
helpText.TextYAlignment = Enum.TextYAlignment.Top
helpText.TextXAlignment = Enum.TextXAlignment.Left
helpText.RichText = false
helpText.Visible = false
helpText.TextTransparency = 1
helpText.BackgroundTransparency = 1

local helpMessages = {
	ES = [[Gracias Por Usar El Script.
Presiona Z para teletransportarte detrás del enemigo más cercano y matarlo con cuchillo.
Presiona X para mostrar/ocultar esta ayuda.
Presiona K para apagar el script.
Presiona E para activar/desactivar el seguimiento de cámara (aimbot).
Usa con cuidado contra compañeros.]],
	EN = [[Thank you for using the script.
Press Z to teleport behind the closest enemy and kill them with knife.
Press X to toggle this help.
Press K to disable the script.
Press E to toggle camera tracking (aimbot).
Use carefully against teammates.]]
}

local function isPlayerAlive(player)
	if not player.Character then return false end
	local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
	return humanoid and humanoid.Health > 0
end

local function updateHighlightColor(player)
	local highlight = highlights[player]
	if not highlight or not player.Character then return end
	if isPlayerAlive(player) then
		if following and player == closestPlayer then
			highlight.FillColor = Color3.fromRGB(255, 255, 0)
			highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
		elseif cameraTracking and player == closestPlayer then
			highlight.FillColor = Color3.fromRGB(255, 165, 0)
			highlight.OutlineColor = Color3.fromRGB(255, 165, 0)
		else
			highlight.FillColor = Color3.fromRGB(0, 255, 0)
			highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
		end
	else
		highlight.FillColor = Color3.new(0, 0, 0)
		highlight.OutlineColor = Color3.new(0, 0, 0)
	end
end

local function createHighlight(player)
	if highlights[player] then
		highlights[player]:Destroy()
	end
	if player.Character then
		local highlight = Instance.new("Highlight")
		highlight.Adornee = player.Character
		highlight.FillTransparency = 0.5
		highlight.OutlineTransparency = 0
		highlight.Parent = PlayerGui
		highlights[player] = highlight

		local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.Died:Connect(function()
				updateHighlightColor(player)
				if player == closestPlayer and following then
					following = false
					noclip = false
					if followConn then followConn:Disconnect() followConn = nil end
					if steppedConn then steppedConn:Disconnect() steppedConn = nil end
				end
				if fixedTarget == player then fixedTarget = nil end
			end)
		end
	end
end

local function updateHighlights()
	if not scriptEnabled then return end
	if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
	local myPos = LocalPlayer.Character.HumanoidRootPart.Position
	local sortedEnemies = {}
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and isPlayerAlive(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			table.insert(sortedEnemies, player)
		end
	end
	table.sort(sortedEnemies, function(a, b)
		return (a.Character.HumanoidRootPart.Position - myPos).Magnitude < (b.Character.HumanoidRootPart.Position - myPos).Magnitude
	end)
	local newClosest = sortedEnemies[1]

	if not following and not cameraTracking then
		if fixedTarget and isPlayerAlive(fixedTarget) then
			closestPlayer = fixedTarget
		else
			fixedTarget = newClosest
			closestPlayer = newClosest
		end
	end

	for player, highlight in pairs(highlights) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			highlight.Enabled = true
			updateHighlightColor(player)
		else
			highlight.Enabled = false
		end
	end

	if not following and not cameraTracking and newClosest and highlights[newClosest] then
		highlights[newClosest].FillColor = Color3.fromRGB(255, 0, 0)
		highlights[newClosest].OutlineColor = Color3.fromRGB(255, 0, 0)
	end
end

local function setupHighlightForPlayer(player)
	if player ~= LocalPlayer then
		player.CharacterAdded:Connect(function()
			wait(0.1)
			if scriptEnabled then createHighlight(player) end
		end)
		if player.Character and scriptEnabled then createHighlight(player) end
	end
end

local function stopFollowing()
	following = false
	noclip = false
	if followConn then followConn:Disconnect() followConn = nil end
	if steppedConn then steppedConn:Disconnect() steppedConn = nil end
end

local function followTarget(target)
	if not scriptEnabled then return end
	if not target or not target.Character or not isPlayerAlive(target) then return end
	local hrp = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	local targetHRP = target.Character:WaitForChild("HumanoidRootPart")

	noclip = true
	steppedConn = RunService.Stepped:Connect(function()
		if noclip and LocalPlayer.Character then
			for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end
		end
	end)

	hrp.CFrame = CFrame.new(targetHRP.Position - targetHRP.CFrame.LookVector * 4 + Vector3.new(0, 0.5, 0), targetHRP.Position)
	following = true

	followConn = RunService.RenderStepped:Connect(function()
		if following and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and isPlayerAlive(target) then
			local tHRP = target.Character.HumanoidRootPart
			local behindPos = tHRP.Position - tHRP.CFrame.LookVector * 4 + Vector3.new(0, 0.5, 0)
			hrp.CFrame = CFrame.new(behindPos, tHRP.Position)
		else
			stopFollowing()
		end
	end)

	local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.Died:Connect(function()
			stopFollowing()
			updateHighlightColor(target)
			if fixedTarget == target then fixedTarget = nil end
		end)
	end
end

local function activateScript()
	if not scriptEnabled then return end
	if following then
		stopFollowing()
		return
	end
	if not closestPlayer or not closestPlayer.Character or not isPlayerAlive(closestPlayer) then return end
	followTarget(closestPlayer)
end

local function disableScript()
	scriptEnabled = false
	stopFollowing()
	if cameraConn then cameraConn:Disconnect() cameraConn = nil end
	cameraTracking = false
	for _, highlight in pairs(highlights) do
		if highlight and highlight.Parent then highlight:Destroy() end
	end
	highlights = {}
	if screenGui and screenGui.Parent then screenGui:Destroy() end
	closestPlayer = nil
	fixedTarget = nil
	Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or nil
end

local function toggleCameraTracking()
	if cameraTracking then
		cameraTracking = false
		fixedTarget = nil
		if cameraConn then cameraConn:Disconnect() cameraConn = nil end
		Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or nil
	else
		cameraTracking = true
		if closestPlayer and closestPlayer.Character and isPlayerAlive(closestPlayer) then
			fixedTarget = closestPlayer
			cameraConn = RunService.RenderStepped:Connect(function()
				if cameraTracking and fixedTarget and fixedTarget.Character and isPlayerAlive(fixedTarget) and fixedTarget.Character:FindFirstChild("Head") then
					local head = fixedTarget.Character.Head
					local camPos = Camera.CFrame.Position
					local direction = (head.Position - camPos).Unit
					local newCFrame = CFrame.new(camPos, camPos + direction)
					Camera.CFrame = newCFrame
				else
					cameraTracking = false
					fixedTarget = nil
					if cameraConn then cameraConn:Disconnect() cameraConn = nil end
					Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or nil
				end
			end)
		else
			cameraTracking = false
		end
	end
end

local function adjustTextSizeToFit(label, maxTextSize, minTextSize)
	maxTextSize = maxTextSize or 35
	minTextSize = minTextSize or 15
	label.TextSize = maxTextSize
	wait()
	local function textFits(size)
		local sizeVector = TextService:GetTextSize(label.Text, size, label.Font, Vector2.new(label.AbsoluteSize.X, math.huge))
		return sizeVector.Y <= label.AbsoluteSize.Y
	end
	while label.TextSize > minTextSize and not textFits(label.TextSize) do
		label.TextSize = label.TextSize - 1
		wait()
	end
end

function showHelpGui()
	helpText.Text = helpMessages[selectedLang] or helpMessages["ES"]
	helpText.Visible = true
	helpText.BackgroundTransparency = 1
	helpText.TextTransparency = 1
	wait(0.1)
	adjustTextSizeToFit(helpText, 35, 15)
	TweenService:Create(helpText, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {TextTransparency = 0, BackgroundTransparency = 0.3}):Play()
end

local function startFunctionalities()
	for _, player in pairs(Players:GetPlayers()) do
		setupHighlightForPlayer(player)
	end
	Players.PlayerAdded:Connect(setupHighlightForPlayer)
	spawn(function()
		while scriptEnabled do
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= LocalPlayer and (not highlights[player] or not highlights[player].Parent) then
					createHighlight(player)
				end
			end
			wait(5)
		end
	end)
	RunService.RenderStepped:Connect(function()
		if scriptEnabled then updateHighlights() end
	end)
	showHelpGui()
end

local function createLangButton(text, pos, langCode)
	local btn = Instance.new("TextButton", langFrame)
	btn.Size = UDim2.new(0, 180, 0, 50)
	btn.Position = pos
	btn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
	btn.TextColor3 = Color3.fromRGB(0, 255, 0)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 25
	btn.Text = text
	btn.AutoButtonColor = true
	btn.MouseButton1Click:Connect(function()
		selectedLang = langCode
		langSelected = true
		local tween = TweenService:Create(langFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {BackgroundTransparency = 1})
		tween:Play()
		tween.Completed:Wait()
		langFrame.Visible = false
		startFunctionalities()
	end)
	return btn
end

createLangButton("Español", UDim2.new(0, 20, 0, 80), "ES")
createLangButton("English", UDim2.new(0, 200, 0, 80), "EN")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if not scriptEnabled then return end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		local key = input.KeyCode
		if key == Enum.KeyCode.Z then
			activateScript()
		elseif key == Enum.KeyCode.X then
			if helpText.Visible then
				helpText.Visible = false
			else
				showHelpGui()
			end
		elseif key == Enum.KeyCode.K then
			disableScript()
		elseif key == Enum.KeyCode.E then
			toggleCameraTracking()
		end
	end
end)
