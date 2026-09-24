-- SERAPH HUB 1.0 | Painel mobile + Fly 360° + Temas animados
-- Aba Shaders separada: executa o painel de shaders externo sem integrar o engine ao Hub.
-- Use este arquivo no seu próprio projeto/experiência Roblox.
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local lighting = game:GetService("Lighting")
local localPlayer = playersService.LocalPlayer
local maxAimDistance = 500
local aimSmoothness = 0.28
local targetScanInterval = 0.12
local defaultSpeed = 45
local maxSpeed = 500
local defaultHeal = 100
local maxHeal = 500
local flyJumpHeight = 55
local defaultFlySpeed = 70
local minFlySpeed = 1
local maxFlySpeed = 1000
local colorOff = Color3.fromRGB(55,55,55)
local colorMob = Color3.fromRGB(150,0,0)
local colorPlayer = Color3.fromRGB(0,90,180)
local colorMovement = Color3.fromRGB(0,130,70)
local colorFullbright = Color3.fromRGB(180,150,0)
local colorHome = Color3.fromRGB(0,120,255)
local themes = {
Original = {
Color3.fromRGB(255,70,120),
Color3.fromRGB(255,120,70),
Color3.fromRGB(255,50,180),
Color3.fromRGB(170,60,255)
},
["Black / Grey / White"] = {
Color3.fromRGB(255,255,255),
Color3.fromRGB(150,150,150),
Color3.fromRGB(70,70,70),
Color3.fromRGB(230,230,230)
},
RGB = {
Color3.fromRGB(255,0,0),
Color3.fromRGB(0,255,0),
Color3.fromRGB(0,140,255),
Color3.fromRGB(180,0,255)
},
["Ocean Theme"] = {
Color3.fromRGB(0,255,255),
Color3.fromRGB(0,150,255),
Color3.fromRGB(0,80,255),
Color3.fromRGB(0,255,180)
}
}
local currentTheme = "RGB"
local animatedColors = true
local animationSpeed = 0.8
local espMobsEnabled = false
local espPlayersEnabled = false
local aimbotMobsEnabled = false
local aimbotPlayersEnabled = false
local fullbrightEnabled = false
local speedEnabled = false
local flyJumpEnabled = false
local noclipEnabled = false
local flyEnabled = false
local fastHealEnabled = false
local speedValue = 0
local flySpeedValue = defaultFlySpeed
local speedValueApplied = defaultSpeed
local healValue = defaultHeal
local mobHighlights = {}
local playerHighlights = {}
local aimTargets = {}
local playerTargets = {}
local aimTarget = nil
local playerTarget = nil
local targetTimer = 0
local healTimer = 0
local speedConnection = nil
local flyConnection = nil
local noclipConnection = nil
local flyJumpConnection = nil
local loading_a = localPlayer:WaitForChild("PlayerGui")
local loading_b = loading_a:FindFirstChild("Seraph_PANEL")
if loading_b then
loading_b:Destroy()
end
local loading_c = loading_a:FindFirstChild("Seraph_LOADING")
if loading_c then
loading_c:Destroy()
end
local loading_d = Instance.new("ScreenGui")
loading_d.Name = "Seraph_LOADING"
loading_d.DisplayOrder = 1000
loading_d.IgnoreGuiInset = true
loading_d.ResetOnSpawn = false
loading_d.ZIndexBehavior = Enum.ZIndexBehavior.Global
loading_d.Parent = loading_a
local loading_e = Instance.new("Frame")
loading_e.Size = UDim2.new(1,0,1,0)
loading_e.Position = UDim2.new(0,0,0,0)
loading_e.BackgroundColor3 = Color3.fromRGB(5,5,8)
loading_e.BorderSizePixel = 0
loading_e.ZIndex = 1
loading_e.Parent = loading_d
local loading_f = Instance.new("Frame")
loading_f.Size = UDim2.new(0,360,0,300)
loading_f.AnchorPoint = Vector2.new(0.5,0.5)
loading_f.Position = UDim2.new(0.5,0,0.5,0)
loading_f.BackgroundColor3 = Color3.fromRGB(15,15,20)
loading_f.BackgroundTransparency = 0.05
loading_f.BorderSizePixel = 0
loading_f.ZIndex = 10
loading_f.Parent = loading_d
local loading_g = Instance.new("UICorner")
loading_g.CornerRadius = UDim.new(0,18)
loading_g.Parent = loading_f
local loading_h = Instance.new("UIStroke")
loading_h.Name = "Seraph_LoadingRGB"
loading_h.Thickness = 2.5
loading_h.Color = Color3.fromRGB(255,0,0)
loading_h.Parent = loading_f
local loading_i = Instance.new("ImageLabel")
loading_i.Size = UDim2.new(0,125,0,125)
loading_i.AnchorPoint = Vector2.new(0.5,0)
loading_i.Position = UDim2.new(0.5,0,0,30)
loading_i.BackgroundColor3 = Color3.fromRGB(25,25,30)
loading_i.BackgroundTransparency = 0
loading_i.BorderSizePixel = 0
loading_i.Image = ""
loading_i.ScaleType = Enum.ScaleType.Crop
loading_i.ZIndex = 11
loading_i.Parent = loading_f
local loading_j = Instance.new("UICorner")
loading_j.CornerRadius = UDim.new(1,0)
loading_j.Parent = loading_i
local loading_k = Instance.new("UIStroke")
loading_k.Name = "Seraph_LoadingImageRGB"
loading_k.Thickness = 2
loading_k.Color = Color3.fromRGB(255,0,0)
loading_k.Parent = loading_i
local loading_l = Instance.new("TextLabel")
loading_l.Size = UDim2.new(1,0,1,0)
loading_l.BackgroundTransparency = 1
loading_l.Text = "Seraph"
loading_l.TextColor3 = Color3.fromRGB(255,255,255)
loading_l.TextSize = 25
loading_l.Font = Enum.Font.GothamBold
loading_l.ZIndex = 12
loading_l.Parent = loading_i
local loading_m = Instance.new("TextLabel")
loading_m.Size = UDim2.new(1,-30,0,35)
loading_m.Position = UDim2.new(0,15,0,165)
loading_m.BackgroundTransparency = 1
loading_m.Text = "Seraph HUB"
loading_m.TextColor3 = Color3.fromRGB(255,255,255)
loading_m.TextSize = 23
loading_m.Font = Enum.Font.GothamBold
loading_m.TextXAlignment = Enum.TextXAlignment.Center
loading_m.ZIndex = 11
loading_m.Parent = loading_f
local loading_n = Instance.new("TextLabel")
loading_n.Size = UDim2.new(1,-30,0,25)
loading_n.Position = UDim2.new(0,15,0,200)
loading_n.BackgroundTransparency = 1
loading_n.Text = "Carregando painel..."
loading_n.TextColor3 = Color3.fromRGB(180,180,180)
loading_n.TextSize = 11
loading_n.Font = Enum.Font.Gotham
loading_n.TextXAlignment = Enum.TextXAlignment.Center
loading_n.ZIndex = 11
loading_n.Parent = loading_f
local loading_o = Instance.new("Frame")
loading_o.Size = UDim2.new(1,-50,0,8)
loading_o.Position = UDim2.new(0,25,0,238)
loading_o.BackgroundColor3 = Color3.fromRGB(35,35,40)
loading_o.BorderSizePixel = 0
loading_o.ZIndex = 11
loading_o.Parent = loading_f
local loading_p = Instance.new("UICorner")
loading_p.CornerRadius = UDim.new(1,0)
loading_p.Parent = loading_o
local loading_q = Instance.new("Frame")
loading_q.Size = UDim2.new(0,0,1,0)
loading_q.BackgroundColor3 = Color3.fromRGB(255,0,100)
loading_q.BorderSizePixel = 0
loading_q.ZIndex = 12
loading_q.Parent = loading_o
local loading_p = Instance.new("UICorner")
loading_p.CornerRadius = UDim.new(1,0)
loading_p.Parent = loading_q
local loading_r = Instance.new("TextLabel")
loading_r.Size = UDim2.new(1,-30,0,25)
loading_r.Position = UDim2.new(0,15,0,255)
loading_r.BackgroundTransparency = 1
loading_r.Text = "0%"
loading_r.TextColor3 = Color3.fromRGB(255,255,255)
loading_r.TextSize = 11
loading_r.Font = Enum.Font.GothamBold
loading_r.TextXAlignment = Enum.TextXAlignment.Center
loading_r.ZIndex = 11
loading_r.Parent = loading_f
local function loading_s(t)
local loading_t = math.sin(t)*0.5+0.5
local loading_u = math.sin(t+2.094)*0.5+0.5
local loading_v = math.sin(t+4.188)*0.5+0.5
return Color3.new(loading_t,loading_u,loading_v)
end
local loading_w
loading_w = runService.RenderStepped:Connect(function()
if not loading_d or not loading_d.Parent then
if loading_w then
loading_w:Disconnect()
end
return
end
local loading_x = loading_s(os.clock()*1.8)
loading_h.Color = loading_x
loading_k.Color = loading_x
loading_q.BackgroundColor3 = loading_x
end)
runService.RenderStepped:Wait()
local loading_y = Instance.new("ScreenGui")
loading_y.Name = "Seraph_PANEL"
loading_y.DisplayOrder = 999
loading_y.IgnoreGuiInset = true
loading_y.ResetOnSpawn = false
loading_y.ZIndexBehavior = Enum.ZIndexBehavior.Global
loading_y.Parent = loading_a
local loading_z = Instance.new("Frame")
loading_z.Name = "MainPanel"
loading_z.Size = UDim2.new(0,700,0,400)
loading_z.AnchorPoint = Vector2.new(0.5,0.5)
loading_z.Position = UDim2.new(0.5,0,0.5,0)
loading_z.BackgroundColor3 = Color3.fromRGB(20,20,20)
loading_z.BackgroundTransparency = 0.14
loading_z.BorderSizePixel = 0
loading_z.ZIndex = 100
loading_z.Parent = loading_y
local mainUi_a = Instance.new("UICorner")
mainUi_a.CornerRadius = UDim.new(0,14)
mainUi_a.Parent = loading_z
local mainUi_b = Instance.new("UIStroke")
mainUi_b.Name = "AnimatedBorder"
mainUi_b.Thickness = 2.5
mainUi_b.Transparency = 0
mainUi_b.Color = themes[currentTheme][1]
mainUi_b.Parent = loading_z
local mainUi_c = {}
local function mainUi_d(mainUi_f)
if not mainUi_f then
return
end
if not table.find(mainUi_c,mainUi_f) then
table.insert(mainUi_c,mainUi_f)
end
end
local function mainUi_e(objeto,finalUi_v,finalUi_w)
if not objeto then
return nil
end
local mainUi_f = objeto:FindFirstChild("Seraph_AnimatedBorder")
if not mainUi_f then
mainUi_f = Instance.new("UIStroke")
mainUi_f.Name = "Seraph_AnimatedBorder"
mainUi_f.Thickness = finalUi_v or 1.8
mainUi_f.Transparency = finalUi_w or 0
mainUi_f.Color = themes[currentTheme][1]
mainUi_f.Parent = objeto
end
mainUi_d(mainUi_f)
return mainUi_f
end
mainUi_d(mainUi_b)
local function mainUi_g(mainUi_m,finalUi_x)
local mainUi_h = #mainUi_m
if mainUi_h <= 1 then
return mainUi_m[1]
end
local mainUi_i = finalUi_x % mainUi_h
local mainUi_j = math.floor(mainUi_i)+1
local mainUi_k = mainUi_j+1
if mainUi_k > mainUi_h then
mainUi_k = 1
end
local mainUi_l = mainUi_i-math.floor(mainUi_i)
return mainUi_m[mainUi_j]:Lerp(
mainUi_m[mainUi_k],
mainUi_l
)
end
runService.RenderStepped:Connect(function()
local mainUi_m = themes[currentTheme]
local loading_x
if animatedColors then
loading_x = mainUi_g(
mainUi_m,
os.clock()*animationSpeed
)
else
loading_x = mainUi_m[1]
end
for i = #mainUi_c,1,-1 do
local mainUi_f = mainUi_c[i]
if mainUi_f and mainUi_f.Parent then
mainUi_f.Color = loading_x
else
table.remove(mainUi_c,i)
end
end
end)
local mainUi_n = Instance.new("Frame")
mainUi_n.Name = "Sidebar"
mainUi_n.Size = UDim2.new(0,145,1,-20)
mainUi_n.Position = UDim2.new(0,10,0,10)
mainUi_n.BackgroundColor3 = Color3.fromRGB(12,12,12)
mainUi_n.BackgroundTransparency = 0.18
mainUi_n.BorderSizePixel = 0
mainUi_n.ZIndex = 105
mainUi_n.Parent = loading_z
local mainUi_o = Instance.new("UICorner")
mainUi_o.CornerRadius = UDim.new(0,12)
mainUi_o.Parent = mainUi_n
local mainUi_p = Instance.new("TextLabel")
mainUi_p.Size = UDim2.new(1,-20,0,30)
mainUi_p.Position = UDim2.new(0,10,0,8)
mainUi_p.BackgroundTransparency = 1
mainUi_p.Text = "Seraph"
mainUi_p.TextColor3 = Color3.fromRGB(255,255,255)
mainUi_p.TextSize = 21
mainUi_p.Font = Enum.Font.GothamBold
mainUi_p.TextXAlignment = Enum.TextXAlignment.Left
mainUi_p.ZIndex = 110
mainUi_p.Parent = mainUi_n
local mainUi_q = Instance.new("TextLabel")
mainUi_q.Size = UDim2.new(1,-20,0,18)
mainUi_q.Position = UDim2.new(0,10,0,35)
mainUi_q.BackgroundTransparency = 1
mainUi_q.Text = "PLAYER HUB"
mainUi_q.TextColor3 = Color3.fromRGB(130,130,130)
mainUi_q.TextSize = 9
mainUi_q.Font = Enum.Font.GothamBold
mainUi_q.TextXAlignment = Enum.TextXAlignment.Left
mainUi_q.ZIndex = 110
mainUi_q.Parent = mainUi_n
local function mainUi_r(texto,finalUi_y)
local mainUi_s = Instance.new("TextButton")
mainUi_s.Size = UDim2.new(1,-20,0,43)
mainUi_s.Position = UDim2.new(0,10,0,finalUi_y)
mainUi_s.BackgroundColor3 = colorOff
mainUi_s.BackgroundTransparency = 0.12
mainUi_s.Text = texto
mainUi_s.TextColor3 = Color3.fromRGB(235,235,235)
mainUi_s.TextSize = 13
mainUi_s.Font = Enum.Font.GothamBold
mainUi_s.BorderSizePixel = 0
mainUi_s.AutoButtonColor = false
mainUi_s.ZIndex = 110
mainUi_s.Parent = mainUi_n
local mainUi_t = Instance.new("UICorner")
mainUi_t.CornerRadius = UDim.new(0,9)
mainUi_t.Parent = mainUi_s
mainUi_e(mainUi_s,1.8,0)
return mainUi_s
end
local mainUi_u = mainUi_r("⌂  Home",65)
local mainUi_v = mainUi_r("⚙  Player Settings",113)
local mainUi_w = mainUi_r("⚙  Configurações",161)
mainUi_u.BackgroundColor3 = colorHome
local mainUi_x = Instance.new("Frame")
mainUi_x.Name = "PlayerProfile"
mainUi_x.Size = UDim2.new(1,-20,0,61)
mainUi_x.Position = UDim2.new(0,10,1,-71)
mainUi_x.BackgroundColor3 = Color3.fromRGB(25,25,25)
mainUi_x.BackgroundTransparency = 0.12
mainUi_x.BorderSizePixel = 0
mainUi_x.ZIndex = 110
mainUi_x.Parent = mainUi_n
local mainUi_y = Instance.new("UICorner")
mainUi_y.CornerRadius = UDim.new(0,9)
mainUi_y.Parent = mainUi_x
mainUi_e(mainUi_x,1.8,0)
local mainUi_z = Instance.new("ImageLabel")
mainUi_z.Size = UDim2.new(0,42,0,42)
mainUi_z.Position = UDim2.new(0,7,0.5,-21)
mainUi_z.BackgroundColor3 = Color3.fromRGB(35,35,35)
mainUi_z.BorderSizePixel = 0
mainUi_z.ZIndex = 112
mainUi_z.Parent = mainUi_x
local content_a = Instance.new("UICorner")
content_a.CornerRadius = UDim.new(1,0)
content_a.Parent = mainUi_z
local content_b,finalUi_z = pcall(function()
return playersService:GetUserThumbnailAsync(
localPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size100x100
)
end)
if content_b and finalUi_z then
mainUi_z.Image = finalUi_z
end
local content_c = Instance.new("TextLabel")
content_c.Size = UDim2.new(1,-57,0,21)
content_c.Position = UDim2.new(0,54,0,8)
content_c.BackgroundTransparency = 1
content_c.Text = localPlayer.Name
content_c.TextColor3 = Color3.fromRGB(255,255,255)
content_c.TextSize = 12
content_c.Font = Enum.Font.GothamBold
content_c.TextXAlignment = Enum.TextXAlignment.Left
content_c.TextTruncate = Enum.TextTruncate.AtEnd
content_c.ZIndex = 112
content_c.Parent = mainUi_x
local content_d = Instance.new("TextLabel")
content_d.Size = UDim2.new(1,-57,0,18)
content_d.Position = UDim2.new(0,54,0,30)
content_d.BackgroundTransparency = 1
content_d.Text = "ID: "..tostring(localPlayer.UserId)
content_d.TextColor3 = Color3.fromRGB(125,125,125)
content_d.TextSize = 8
content_d.Font = Enum.Font.Gotham
content_d.TextXAlignment = Enum.TextXAlignment.Left
content_d.ZIndex = 112
content_d.Parent = mainUi_x
local content_e = Instance.new("TextButton")
content_e.Name = "Close"
content_e.Size = UDim2.new(0,34,0,34)
content_e.Position = UDim2.new(1,-43,0,8)
content_e.BackgroundColor3 = Color3.fromRGB(40,40,40)
content_e.BackgroundTransparency = 0.15
content_e.Text = "×"
content_e.TextColor3 = Color3.fromRGB(255,255,255)
content_e.TextSize = 21
content_e.Font = Enum.Font.GothamBold
content_e.BorderSizePixel = 0
content_e.AutoButtonColor = true
content_e.ZIndex = 130
content_e.Parent = loading_z
local content_f = Instance.new("UICorner")
content_f.CornerRadius = UDim.new(0,8)
content_f.Parent = content_e
mainUi_e(content_e,1.8,0)
local content_g = Instance.new("Frame")
content_g.Name = "Content"
content_g.Size = UDim2.new(1,-165,1,-20)
content_g.Position = UDim2.new(0,155,0,10)
content_g.BackgroundTransparency = 1
content_g.BorderSizePixel = 0
content_g.ZIndex = 101
content_g.Parent = loading_z
local content_h = Instance.new("TextLabel")
content_h.Size = UDim2.new(1,-55,0,38)
content_h.Position = UDim2.new(0,10,0,0)
content_h.BackgroundTransparency = 1
content_h.Text = "Home"
content_h.TextColor3 = Color3.fromRGB(255,255,255)
content_h.TextSize = 19
content_h.Font = Enum.Font.GothamBold
content_h.TextXAlignment = Enum.TextXAlignment.Left
content_h.ZIndex = 110
content_h.Parent = content_g
local content_i = Instance.new("Frame")
content_i.Size = UDim2.new(1,-10,1,-48)
content_i.Position = UDim2.new(0,5,0,45)
content_i.BackgroundTransparency = 1
content_i.BorderSizePixel = 0
content_i.ZIndex = 103
content_i.Parent = content_g
local content_j = Instance.new("TextLabel")
content_j.Size = UDim2.new(1,-10,0,40)
content_j.Position = UDim2.new(0,5,0,0)
content_j.BackgroundTransparency = 1
content_j.Text = "Seraph HUB"
content_j.TextColor3 = Color3.fromRGB(255,255,255)
content_j.TextSize = 23
content_j.Font = Enum.Font.GothamBold
content_j.TextXAlignment = Enum.TextXAlignment.Left
content_j.ZIndex = 110
content_j.Parent = content_i
local content_k = Instance.new("TextLabel")
content_k.Size = UDim2.new(1,-20,0,115)
content_k.Position = UDim2.new(0,10,0,48)
content_k.BackgroundTransparency = 1
content_k.Text =
"PLAYER HUB\n\n"..
"Versão: 1.0\n\n"..
"Desenvolvido por: Lkzhin\n\n"..
"Comunidade: Roblox Scripts Community"
content_k.TextColor3 = Color3.fromRGB(190,190,190)
content_k.TextSize = 12
content_k.Font = Enum.Font.Gotham
content_k.TextXAlignment = Enum.TextXAlignment.Left
content_k.TextYAlignment = Enum.TextYAlignment.Top
content_k.ZIndex = 110
content_k.Parent = content_i
local content_l = Instance.new("TextButton")
content_l.Size = UDim2.new(1,-20,0,42)
content_l.Position = UDim2.new(0,10,0,170)
content_l.BackgroundColor3 = colorHome
content_l.BackgroundTransparency = 0.08
content_l.Text = "💬  Copiar Discord"
content_l.TextColor3 = Color3.fromRGB(255,255,255)
content_l.TextSize = 13
content_l.Font = Enum.Font.GothamBold
content_l.BorderSizePixel = 0
content_l.ZIndex = 110
content_l.Parent = content_i
local content_m = Instance.new("UICorner")
content_m.CornerRadius = UDim.new(0,9)
content_m.Parent = content_l
mainUi_e(content_l,1.8,0)
local content_n = Instance.new("TextLabel")
content_n.Size = UDim2.new(1,-20,0,25)
content_n.Position = UDim2.new(0,10,0,218)
content_n.BackgroundTransparency = 1
content_n.Text = ""
content_n.TextColor3 = Color3.fromRGB(100,255,150)
content_n.TextSize = 11
content_n.Font = Enum.Font.GothamBold
content_n.ZIndex = 110
content_n.Parent = content_i
local content_o = "https://discord.gg/9ZdJQJ9W5U"
content_l.Activated:Connect(function()
if setclipboard then
setclipboard(content_o)
content_n.Text = "✓ Link copiado!"
else
content_n.Text = content_o
end
task.delay(3,function()
if content_n and content_n.Parent then
content_n.Text = ""
end
end)
end)
local content_p = Instance.new("ScrollingFrame")
content_p.Name = "Options"
content_p.Size = UDim2.new(1,-10,1,-48)
content_p.Position = UDim2.new(0,5,0,45)
content_p.BackgroundTransparency = 1
content_p.BorderSizePixel = 0
content_p.ScrollBarThickness = 4
content_p.ScrollBarImageTransparency = 0.3
content_p.CanvasSize = UDim2.new(0,0,0,795)
content_p.Active = true
content_p.ClipsDescendants = true
content_p.ZIndex = 102
content_p.Visible = false
content_p.Parent = content_g
local content_q = Instance.new("Frame")
content_q.Name = "ConfigContent"
content_q.Size = UDim2.new(1,-10,1,-48)
content_q.Position = UDim2.new(0,5,0,45)
content_q.BackgroundTransparency = 1
content_q.BorderSizePixel = 0
content_q.ZIndex = 103
content_q.Visible = false
content_q.Parent = content_g
local content_r = Instance.new("TextLabel")
content_r.Size = UDim2.new(1,-10,0,28)
content_r.Position = UDim2.new(0,8,0,0)
content_r.BackgroundTransparency = 1
content_r.Text = "APARÊNCIA"
content_r.TextColor3 = Color3.fromRGB(255,255,255)
content_r.TextSize = 13
content_r.Font = Enum.Font.GothamBold
content_r.TextXAlignment = Enum.TextXAlignment.Left
content_r.ZIndex = 110
content_r.Parent = content_q
local content_s = Instance.new("TextLabel")
content_s.Size = UDim2.new(1,-16,0,38)
content_s.Position = UDim2.new(0,8,0,27)
content_s.BackgroundTransparency = 1
content_s.Text = "Escolha o estilo da borda do Seraph."
content_s.TextColor3 = Color3.fromRGB(140,140,140)
content_s.TextSize = 10
content_s.Font = Enum.Font.Gotham
content_s.TextXAlignment = Enum.TextXAlignment.Left
content_s.TextYAlignment = Enum.TextYAlignment.Top
content_s.ZIndex = 110
content_s.Parent = content_q
local content_t = Instance.new("TextButton")
content_t.Size = UDim2.new(1,-16,0,43)
content_t.Position = UDim2.new(0,8,0,68)
content_t.BackgroundColor3 = colorMovement
content_t.BackgroundTransparency = 0.05
content_t.Text = "Animated colors: ON"
content_t.TextColor3 = Color3.fromRGB(255,255,255)
content_t.TextSize = 12
content_t.Font = Enum.Font.GothamBold
content_t.BorderSizePixel = 0
content_t.ZIndex = 110
content_t.Parent = content_q
local content_u = Instance.new("UICorner")
content_u.CornerRadius = UDim.new(0,9)
content_u.Parent = content_t
mainUi_e(content_t,1.8,0)
local content_v = Instance.new("TextLabel")
content_v.Size = UDim2.new(1,-16,0,25)
content_v.Position = UDim2.new(0,8,0,120)
content_v.BackgroundTransparency = 1
content_v.Text = "TEMAS"
content_v.TextColor3 = Color3.fromRGB(255,255,255)
content_v.TextSize = 12
content_v.Font = Enum.Font.GothamBold
content_v.TextXAlignment = Enum.TextXAlignment.Left
content_v.ZIndex = 110
content_v.Parent = content_q
local content_w = {}
local function content_x(nome,tail_a,finalUi_y)
local mainUi_s = Instance.new("TextButton")
mainUi_s.Size = UDim2.new(0.5,-7,0,53)
mainUi_s.Position = UDim2.new(tail_a,0,0,finalUi_y)
mainUi_s.BackgroundColor3 = Color3.fromRGB(28,28,28)
mainUi_s.BackgroundTransparency = 0.05
mainUi_s.Text = nome
mainUi_s.TextColor3 = Color3.fromRGB(235,235,235)
mainUi_s.TextSize = 10
mainUi_s.Font = Enum.Font.GothamBold
mainUi_s.BorderSizePixel = 0
mainUi_s.AutoButtonColor = false
mainUi_s.ZIndex = 110
mainUi_s.Parent = content_q
local mainUi_t = Instance.new("UICorner")
mainUi_t.CornerRadius = UDim.new(0,9)
mainUi_t.Parent = mainUi_s
mainUi_e(mainUi_s,1.5,0.15)
content_w[nome] = mainUi_s
return mainUi_s
end
local content_y = content_x("Original",0,150)
local content_z = content_x("Black / Grey / White",0.5,150)
local controls_a = content_x("RGB",0,211)
local controls_b = content_x("Ocean Theme",0.5,211)
local function controls_c()
for nome,mainUi_s in pairs(content_w) do
if nome == currentTheme then
mainUi_s.BackgroundColor3 = themes[nome][1]
mainUi_s.BackgroundTransparency = 0.05
mainUi_s.TextColor3 = Color3.fromRGB(255,255,255)
else
mainUi_s.BackgroundColor3 = Color3.fromRGB(28,28,28)
mainUi_s.BackgroundTransparency = 0.05
mainUi_s.TextColor3 = Color3.fromRGB(220,220,220)
end
end
end
local function controls_d(nome)
if not themes[nome] then
return
end
currentTheme = nome
controls_c()
content_s.Text =
"Borda: "..nome..
"\nAnimated colors: "..(animatedColors and "ON" or "OFF")
end
content_y.Activated:Connect(function()
controls_d("Original")
end)
content_z.Activated:Connect(function()
controls_d("Black / Grey / White")
end)
controls_a.Activated:Connect(function()
controls_d("RGB")
end)
controls_b.Activated:Connect(function()
controls_d("Ocean Theme")
end)
content_t.Activated:Connect(function()
animatedColors = not animatedColors
if animatedColors then
content_t.Text = "Animated colors: ON"
content_t.BackgroundColor3 = colorMovement
else
content_t.Text = "Animated colors: OFF"
content_t.BackgroundColor3 = colorOff
end
content_s.Text =
"Borda: "..currentTheme..
"\nAnimated colors: "..(animatedColors and "ON" or "OFF")
end)
controls_c()
local _shaderContent
local _shaderTab

local function controls_e()
content_i.Visible = true
content_p.Visible = false
content_q.Visible = false
_shaderContent.Visible = false
mainUi_u.BackgroundColor3 = colorHome
mainUi_v.BackgroundColor3 = colorOff
mainUi_w.BackgroundColor3 = colorOff
_shaderTab.BackgroundColor3 = colorOff
content_h.Text = "Home"
end
local function controls_f()
content_i.Visible = false
content_p.Visible = true
content_q.Visible = false
_shaderContent.Visible = false
mainUi_u.BackgroundColor3 = colorOff
mainUi_v.BackgroundColor3 = colorHome
mainUi_w.BackgroundColor3 = colorOff
_shaderTab.BackgroundColor3 = colorOff
content_h.Text = "Player Settings"
end
local function controls_g()
content_i.Visible = false
content_p.Visible = false
content_q.Visible = true
_shaderContent.Visible = false
mainUi_u.BackgroundColor3 = colorOff
mainUi_v.BackgroundColor3 = colorOff
mainUi_w.BackgroundColor3 = colorHome
_shaderTab.BackgroundColor3 = colorOff
content_h.Text = "Configurações"
end
mainUi_u.Activated:Connect(controls_e)
mainUi_v.Activated:Connect(controls_f)
mainUi_w.Activated:Connect(controls_g)

--==================================================
-- SERAPH SHADERS | ABA EXECUTOR
--==================================================

_shaderContent = Instance.new("Frame")
_shaderContent.Name = "ShadersContent"
_shaderContent.Size = UDim2.new(1,-10,1,-48)
_shaderContent.Position = UDim2.new(0,5,0,45)
_shaderContent.BackgroundTransparency = 1
_shaderContent.BorderSizePixel = 0
_shaderContent.ZIndex = 103
_shaderContent.Visible = false
_shaderContent.Parent = content_g

local _shaderSection = Instance.new("TextLabel")
_shaderSection.Size = UDim2.new(1,-10,0,22)
_shaderSection.Position = UDim2.new(0,10,0,0)
_shaderSection.BackgroundTransparency = 1
_shaderSection.Text = "VISUALS"
_shaderSection.TextColor3 = Color3.fromRGB(180,70,255)
_shaderSection.TextSize = 11
_shaderSection.Font = Enum.Font.GothamBold
_shaderSection.TextXAlignment = Enum.TextXAlignment.Left
_shaderSection.ZIndex = 110
_shaderSection.Parent = _shaderContent

local _shaderTitle = Instance.new("TextLabel")
_shaderTitle.Size = UDim2.new(1,-10,0,38)
_shaderTitle.Position = UDim2.new(0,10,0,23)
_shaderTitle.BackgroundTransparency = 1
_shaderTitle.Text = "Shaders"
_shaderTitle.TextColor3 = Color3.fromRGB(255,255,255)
_shaderTitle.TextSize = 22
_shaderTitle.Font = Enum.Font.GothamBold
_shaderTitle.TextXAlignment = Enum.TextXAlignment.Left
_shaderTitle.ZIndex = 110
_shaderTitle.Parent = _shaderContent

local _shaderCard = Instance.new("Frame")
_shaderCard.Name = "SeraphShadersCard"
_shaderCard.Size = UDim2.new(1,-20,0,105)
_shaderCard.Position = UDim2.new(0,10,0,72)
_shaderCard.BackgroundColor3 = Color3.fromRGB(22,22,25)
_shaderCard.BackgroundTransparency = 0.05
_shaderCard.BorderSizePixel = 0
_shaderCard.ZIndex = 108
_shaderCard.Parent = _shaderContent
local _shaderCardCorner = Instance.new("UICorner")
_shaderCardCorner.CornerRadius = UDim.new(0,12)
_shaderCardCorner.Parent = _shaderCard
mainUi_e(_shaderCard,1.8,0.1)

local _shaderCardTitle = Instance.new("TextLabel")
_shaderCardTitle.Size = UDim2.new(1,-160,0,28)
_shaderCardTitle.Position = UDim2.new(0,18,0,20)
_shaderCardTitle.BackgroundTransparency = 1
_shaderCardTitle.Text = "SERAPH SHADERS"
_shaderCardTitle.TextColor3 = Color3.fromRGB(255,255,255)
_shaderCardTitle.TextSize = 16
_shaderCardTitle.Font = Enum.Font.GothamBold
_shaderCardTitle.TextXAlignment = Enum.TextXAlignment.Left
_shaderCardTitle.ZIndex = 112
_shaderCardTitle.Parent = _shaderCard

local _shaderCardInfo = Instance.new("TextLabel")
_shaderCardInfo.Size = UDim2.new(1,-180,0,24)
_shaderCardInfo.Position = UDim2.new(0,18,0,52)
_shaderCardInfo.BackgroundTransparency = 1
_shaderCardInfo.Text = "Tap to execute"
_shaderCardInfo.TextColor3 = Color3.fromRGB(145,145,145)
_shaderCardInfo.TextSize = 11
_shaderCardInfo.Font = Enum.Font.Gotham
_shaderCardInfo.TextXAlignment = Enum.TextXAlignment.Left
_shaderCardInfo.ZIndex = 112
_shaderCardInfo.Parent = _shaderCard

local _shaderExecute = Instance.new("TextButton")
_shaderExecute.Name = "ExecuteShaders"
_shaderExecute.Size = UDim2.new(0,135,0,48)
_shaderExecute.Position = UDim2.new(1,-150,0.5,-24)
_shaderExecute.BackgroundColor3 = Color3.fromRGB(90,20,35)
_shaderExecute.BackgroundTransparency = 0.05
_shaderExecute.Text = "EXECUTE  >"
_shaderExecute.TextColor3 = Color3.fromRGB(255,255,255)
_shaderExecute.TextSize = 12
_shaderExecute.Font = Enum.Font.GothamBold
_shaderExecute.BorderSizePixel = 0
_shaderExecute.AutoButtonColor = false
_shaderExecute.ZIndex = 113
_shaderExecute.Parent = _shaderCard
local _shaderExecuteCorner = Instance.new("UICorner")
_shaderExecuteCorner.CornerRadius = UDim.new(0,9)
_shaderExecuteCorner.Parent = _shaderExecute
mainUi_e(_shaderExecute,1.8,0)

_shaderTab = Instance.new("TextButton")
_shaderTab.Name = "ShadersTab"
_shaderTab.Size = UDim2.new(1,-20,0,43)
_shaderTab.Position = UDim2.new(0,10,0,209)
_shaderTab.BackgroundColor3 = colorOff
_shaderTab.BackgroundTransparency = 0.12
_shaderTab.Text = "✦  Shaders"
_shaderTab.TextColor3 = Color3.fromRGB(235,235,235)
_shaderTab.TextSize = 13
_shaderTab.Font = Enum.Font.GothamBold
_shaderTab.BorderSizePixel = 0
_shaderTab.AutoButtonColor = false
_shaderTab.ZIndex = 110
_shaderTab.Parent = mainUi_n
local _shaderTabCorner = Instance.new("UICorner")
_shaderTabCorner.CornerRadius = UDim.new(0,9)
_shaderTabCorner.Parent = _shaderTab
mainUi_e(_shaderTab,1.8,0)

_shaderTab.Activated:Connect(function()
content_i.Visible = false
content_p.Visible = false
content_q.Visible = false
_shaderContent.Visible = true
mainUi_u.BackgroundColor3 = colorOff
mainUi_v.BackgroundColor3 = colorOff
mainUi_w.BackgroundColor3 = colorOff
_shaderTab.BackgroundColor3 = colorHome
content_h.Text = "Shaders"
end)

--==================================================
-- SHADERS EXTERNOS
--==================================================

local SHADER_URL = "https://raw.githubusercontent.com/lkzhin/Seraph-hub/refs/heads/main/Seraph%20hub"

_shaderExecute.Activated:Connect(function()
	local ok, err = pcall(function()
		loadstring(game:HttpGet(SHADER_URL))()
	end)

	if ok then
		_shaderCardInfo.Text = "Shaders abertos em painel separado."
		_shaderCardInfo.TextColor3 = Color3.fromRGB(100,255,150)
	else
		_shaderCardInfo.Text = "Erro ao executar os shaders."
		_shaderCardInfo.TextColor3 = Color3.fromRGB(255,100,100)
		warn("Seraph Shaders:",err)
	end

	task.delay(3,function()
		if _shaderCardInfo and _shaderCardInfo.Parent then
			_shaderCardInfo.Text = "Tap to execute"
			_shaderCardInfo.TextColor3 = Color3.fromRGB(145,145,145)
		end
	end)
end)

local function controls_h(texto,finalUi_y)
local mainUi_s = Instance.new("TextButton")
mainUi_s.Size = UDim2.new(1,-8,0,45)
mainUi_s.Position = UDim2.new(0,2,0,finalUi_y)
mainUi_s.BackgroundColor3 = colorOff
mainUi_s.BackgroundTransparency = 0.22
mainUi_s.Text = texto
mainUi_s.TextColor3 = Color3.fromRGB(235,235,235)
mainUi_s.TextSize = 13
mainUi_s.Font = Enum.Font.GothamBold
mainUi_s.BorderSizePixel = 0
mainUi_s.AutoButtonColor = true
mainUi_s.ZIndex = 105
mainUi_s.Parent = content_p
local mainUi_t = Instance.new("UICorner")
mainUi_t.CornerRadius = UDim.new(0,8)
mainUi_t.Parent = mainUi_s
mainUi_e(mainUi_s,1.8,0)
return mainUi_s
end
local controls_i = controls_h("ESP Mobs: OFF",5)
local controls_j = controls_h("ESP Players: OFF",60)
local controls_k = controls_h("Aimbot Mobs: OFF",115)
local controls_l = controls_h("Aimbot Players: OFF",170)
local controls_m = controls_h("FullBright: OFF",225)
local controls_n = controls_h("Speed: 45",280)
local controls_o = Instance.new("TextBox")
controls_o.Size = UDim2.new(1,-8,0,45)
controls_o.Position = UDim2.new(0,2,0,335)
controls_o.BackgroundColor3 = colorOff
controls_o.BackgroundTransparency = 0.22
controls_o.Text = "45"
controls_o.PlaceholderText = "Velocidade (1-500)"
controls_o.TextColor3 = Color3.fromRGB(255,255,255)
controls_o.PlaceholderColor3 = Color3.fromRGB(180,180,180)
controls_o.TextSize = 13
controls_o.Font = Enum.Font.GothamBold
controls_o.ClearTextOnFocus = false
controls_o.TextXAlignment = Enum.TextXAlignment.Center
controls_o.BorderSizePixel = 0
controls_o.ZIndex = 105
controls_o.Parent = content_p
local controls_p = Instance.new("UICorner")
controls_p.CornerRadius = UDim.new(0,8)
controls_p.Parent = controls_o
mainUi_e(controls_o,1.8,0)
local controls_q = controls_h("FlyJump: OFF",400)
local controls_r = controls_h("Fly: OFF",455)
local controls_s = Instance.new("TextBox")
controls_s.Size = UDim2.new(1,-8,0,45)
controls_s.Position = UDim2.new(0,2,0,510)
controls_s.BackgroundColor3 = colorOff
controls_s.BackgroundTransparency = 0.22
controls_s.Text = tostring(defaultFlySpeed)
controls_s.PlaceholderText = "Velocidade Fly (1-1000)"
controls_s.TextColor3 = Color3.fromRGB(255,255,255)
controls_s.PlaceholderColor3 = Color3.fromRGB(180,180,180)
controls_s.TextSize = 13
controls_s.Font = Enum.Font.GothamBold
controls_s.ClearTextOnFocus = false
controls_s.TextXAlignment = Enum.TextXAlignment.Center
controls_s.BorderSizePixel = 0
controls_s.ZIndex = 105
controls_s.Parent = content_p
local controls_t = Instance.new("UICorner")
controls_t.CornerRadius = UDim.new(0,8)
controls_t.Parent = controls_s
mainUi_e(controls_s,1.8,0)
local controls_u = Instance.new("TextButton")
controls_u.Size = UDim2.new(0.5,-5,0,45)
controls_u.Position = UDim2.new(0,2,0,565)
controls_u.BackgroundColor3 = colorOff
controls_u.BackgroundTransparency = 0.22
controls_u.Text = "▲  SUBIR"
controls_u.TextColor3 = Color3.fromRGB(235,235,235)
controls_u.TextSize = 12
controls_u.Font = Enum.Font.GothamBold
controls_u.BorderSizePixel = 0
controls_u.ZIndex = 105
controls_u.Parent = content_p
local controls_v = Instance.new("UICorner")
controls_v.CornerRadius = UDim.new(0,8)
controls_v.Parent = controls_u
mainUi_e(controls_u,1.8,0)
local controls_w = Instance.new("TextButton")
controls_w.Size = UDim2.new(0.5,-5,0,45)
controls_w.Position = UDim2.new(0.5,3,0,565)
controls_w.BackgroundColor3 = colorOff
controls_w.BackgroundTransparency = 0.22
controls_w.Text = "▼  DESCER"
controls_w.TextColor3 = Color3.fromRGB(235,235,235)
controls_w.TextSize = 12
controls_w.Font = Enum.Font.GothamBold
controls_w.BorderSizePixel = 0
controls_w.ZIndex = 105
controls_w.Parent = content_p
local controls_x = Instance.new("UICorner")
controls_x.CornerRadius = UDim.new(0,8)
controls_x.Parent = controls_w
mainUi_e(controls_w,1.8,0)
local controls_y = controls_h("Noclip: OFF",625)
local controls_z = controls_h("Fast Heal: OFF",680)
local systems_a = Instance.new("TextBox")
systems_a.Size = UDim2.new(1,-8,0,45)
systems_a.Position = UDim2.new(0,2,0,735)
systems_a.BackgroundColor3 = colorOff
systems_a.BackgroundTransparency = 0.22
systems_a.Text = "500"
systems_a.PlaceholderText = "Cura por segundo (1-500)"
systems_a.TextColor3 = Color3.fromRGB(255,255,255)
systems_a.PlaceholderColor3 = Color3.fromRGB(180,180,180)
systems_a.TextSize = 13
systems_a.Font = Enum.Font.GothamBold
systems_a.ClearTextOnFocus = false
systems_a.TextXAlignment = Enum.TextXAlignment.Center
systems_a.BorderSizePixel = 0
systems_a.ZIndex = 105
systems_a.Parent = content_p
local systems_b = Instance.new("UICorner")
systems_b.CornerRadius = UDim.new(0,8)
systems_b.Parent = systems_a
mainUi_e(systems_a,1.8,0)
local function systems_c(model)
if not model then return nil end
local systems_d = model:FindFirstChild("HumanoidRootPart")
if systems_d and systems_d:IsA("BasePart") then
return systems_d
end
if model.PrimaryPart then
return model.PrimaryPart
end
return model:FindFirstChildWhichIsA("BasePart",true)
end
local function systems_e(obj)
if not obj or not obj:IsA("Model") then return false end
if playersService:GetPlayerFromCharacter(obj) then return false end
local systems_f = obj:FindFirstChildOfClass("Humanoid")
if not systems_f or systems_f.Health <= 0 then
return false
end
return systems_c(obj) ~= nil
end
local function systems_g(mob)
if not espMobsEnabled or mobHighlights[mob] or not systems_e(mob) then
return
end
local systems_h = Instance.new("Highlight")
systems_h.Name = "Seraph_MobESP"
systems_h.Adornee = mob
systems_h.FillColor = Color3.fromRGB(255,0,0)
systems_h.OutlineColor = Color3.fromRGB(255,0,0)
systems_h.FillTransparency = 1
systems_h.OutlineTransparency = 0
systems_h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
systems_h.Parent = workspace
mobHighlights[mob] = systems_h
end
local function systems_i()
for mob,systems_h in pairs(mobHighlights) do
if systems_h then
systems_h:Destroy()
end
mobHighlights[mob] = nil
end
end
local function systems_j()
systems_i()
table.clear(aimTargets)
if not espMobsEnabled then return end
for _,obj in ipairs(workspace:GetDescendants()) do
if systems_e(obj) then
aimTargets[obj] = true
systems_g(obj)
end
end
end
workspace.DescendantAdded:Connect(function(obj)
if not obj:IsA("Model") then return end
task.delay(0.15,function()
if not obj.Parent then return end
if systems_e(obj) then
aimTargets[obj] = true
if espMobsEnabled then
systems_g(obj)
end
end
end)
end)
workspace.DescendantRemoving:Connect(function(obj)
aimTargets[obj] = nil
if mobHighlights[obj] then
mobHighlights[obj]:Destroy()
mobHighlights[obj] = nil
end
if aimTarget == obj then
aimTarget = nil
end
end)
local function systems_k(target)
if not espPlayersEnabled or target == localPlayer then return end
local systems_l = target.Character
if not systems_l then return end
local systems_f = systems_l:FindFirstChildOfClass("Humanoid")
if not systems_f then return end
if playerHighlights[target] then
playerHighlights[target].Adornee = systems_l
return
end
local systems_h = Instance.new("Highlight")
systems_h.Name = "Seraph_PlayerESP"
systems_h.Adornee = systems_l
systems_h.FillColor = Color3.fromRGB(0,120,255)
systems_h.OutlineColor = Color3.fromRGB(0,120,255)
systems_h.FillTransparency = 1
systems_h.OutlineTransparency = 0
systems_h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
systems_h.Parent = workspace
playerHighlights[target] = systems_h
playerTargets[target] = true
end
local function systems_m()
for target,systems_h in pairs(playerHighlights) do
if systems_h then
systems_h:Destroy()
end
playerHighlights[target] = nil
end
table.clear(playerTargets)
end
local function systems_n()
systems_m()
if not espPlayersEnabled then return end
for _,target in ipairs(playersService:GetPlayers()) do
if target ~= localPlayer then
playerTargets[target] = true
systems_k(target)
end
end
end
playersService.PlayerAdded:Connect(function(target)
target.CharacterAdded:Connect(function()
task.wait(0.4)
playerTargets[target] = true
if espPlayersEnabled then
systems_k(target)
end
end)
end)
playersService.PlayerRemoving:Connect(function(target)
playerTargets[target] = nil
if playerHighlights[target] then
playerHighlights[target]:Destroy()
playerHighlights[target] = nil
end
if playerTarget == target then
playerTarget = nil
end
end)
local function systems_o()
local systems_p = nil
local systems_q = math.huge
local systems_l = localPlayer.Character
local systems_r = systems_l and systems_l:FindFirstChild("HumanoidRootPart")
if not systems_r then return nil end
local systems_s = workspace.CurrentCamera
if not systems_s then return nil end
local systems_t = systems_s.ViewportSize
local systems_u = Vector2.new(systems_t.X/2,systems_t.Y/2)
for mob in pairs(aimTargets) do
if systems_e(mob) then
local systems_d = systems_c(mob)
if systems_d then
local systems_v = (systems_d.Position-systems_r.Position).Magnitude
if systems_v <= maxAimDistance then
local systems_w,tail_b =
systems_s:WorldToViewportPoint(
systems_d.Position+Vector3.new(0,1.2,0)
)
if tail_b and systems_w.Z > 0 then
local systems_x =
Vector2.new(systems_w.X,systems_w.Y)
local systems_y =
(systems_x-systems_u).Magnitude
if systems_y < systems_q then
systems_q = systems_y
systems_p = mob
end
end
end
end
end
end
return systems_p
end
local function systems_z()
local effects_a = nil
local systems_q = math.huge
local systems_l = localPlayer.Character
local systems_r = systems_l and systems_l:FindFirstChild("HumanoidRootPart")
if not systems_r then return nil end
local systems_s = workspace.CurrentCamera
if not systems_s then return nil end
local systems_t = systems_s.ViewportSize
local systems_u = Vector2.new(systems_t.X/2,systems_t.Y/2)
for _,target in ipairs(playersService:GetPlayers()) do
if target ~= localPlayer then
local effects_b = target.Character
if effects_b then
local systems_f =
effects_b:FindFirstChildOfClass("Humanoid")
local systems_d = systems_c(effects_b)
if systems_f and systems_f.Health > 0 and systems_d then
local systems_v =
(systems_d.Position-systems_r.Position).Magnitude
if systems_v <= maxAimDistance then
local systems_w,tail_b =
systems_s:WorldToViewportPoint(
systems_d.Position+Vector3.new(0,1.2,0)
)
if tail_b and systems_w.Z > 0 then
local systems_x =
Vector2.new(systems_w.X,systems_w.Y)
local systems_y =
(systems_x-systems_u).Magnitude
if systems_y < systems_q then
systems_q = systems_y
effects_a = target
end
end
end
end
end
end
end
return effects_a
end
local function effects_c(systems_d,tail_c)
if not systems_d or not systems_d.Parent then return end
local systems_s = workspace.CurrentCamera
if not systems_s then return end
local effects_d = systems_s.CFrame.Position
local effects_e = systems_d.Position+Vector3.new(0,1.35,0)
local effects_f = effects_e-effects_d
if effects_f.Magnitude <= 0.01 then return end
local effects_g = CFrame.lookAt(effects_d,effects_e)
local effects_h =
1-math.pow(1-aimSmoothness,tail_c*60)
systems_s.CFrame = systems_s.CFrame:Lerp(effects_g,effects_h)
end
runService.RenderStepped:Connect(function(tail_c)
if aimbotMobsEnabled then
if os.clock()-targetTimer >= targetScanInterval then
targetTimer = os.clock()
if not aimTarget
or not aimTarget.Parent
or not systems_e(aimTarget) then
aimTarget = systems_o()
end
end
if aimTarget then
local systems_f =
aimTarget:FindFirstChildOfClass("Humanoid")
local systems_d = systems_c(aimTarget)
if not systems_f or systems_f.Health <= 0 or not systems_d then
aimTarget = nil
else
effects_c(systems_d,tail_c)
end
end
end
if aimbotPlayersEnabled then
if os.clock()-healTimer >= targetScanInterval then
healTimer = os.clock()
if not playerTarget
or not playerTarget.Parent
or not playerTarget.Character then
playerTarget = systems_z()
end
end
if playerTarget then
local systems_l = playerTarget.Character
local systems_f =
systems_l and systems_l:FindFirstChildOfClass("Humanoid")
local systems_d = systems_l and systems_c(systems_l)
if not systems_f or systems_f.Health <= 0 or not systems_d then
playerTarget = nil
else
effects_c(systems_d,tail_c)
end
end
end
end)
controls_i.Activated:Connect(function()
espMobsEnabled = not espMobsEnabled
if espMobsEnabled then
controls_i.Text = "ESP Mobs: ON"
controls_i.BackgroundColor3 = colorMob
systems_j()
else
controls_i.Text = "ESP Mobs: OFF"
controls_i.BackgroundColor3 = colorOff
systems_i()
table.clear(aimTargets)
aimTarget = nil
end
end)
controls_j.Activated:Connect(function()
espPlayersEnabled = not espPlayersEnabled
if espPlayersEnabled then
controls_j.Text = "ESP Players: ON"
controls_j.BackgroundColor3 = colorPlayer
systems_n()
else
controls_j.Text = "ESP Players: OFF"
controls_j.BackgroundColor3 = colorOff
systems_m()
playerTarget = nil
end
end)
controls_k.Activated:Connect(function()
aimbotMobsEnabled = not aimbotMobsEnabled
if aimbotMobsEnabled then
controls_k.Text = "Aimbot Mobs: ON"
controls_k.BackgroundColor3 = colorMob
aimTarget = nil
table.clear(aimTargets)
for _,obj in ipairs(workspace:GetDescendants()) do
if systems_e(obj) then
aimTargets[obj] = true
end
end
else
controls_k.Text = "Aimbot Mobs: OFF"
controls_k.BackgroundColor3 = colorOff
aimTarget = nil
end
end)
controls_l.Activated:Connect(function()
aimbotPlayersEnabled = not aimbotPlayersEnabled
if aimbotPlayersEnabled then
controls_l.Text = "Aimbot Players: ON"
controls_l.BackgroundColor3 = colorPlayer
playerTarget = nil
table.clear(playerTargets)
for _,target in ipairs(playersService:GetPlayers()) do
if target ~= localPlayer then
playerTargets[target] = true
end
end
else
controls_l.Text = "Aimbot Players: OFF"
controls_l.BackgroundColor3 = colorOff
playerTarget = nil
end
end)
local effects_i = {
Brightness = lighting.Brightness,
ClockTime = lighting.ClockTime,
FogEnd = lighting.FogEnd,
GlobalShadows = lighting.GlobalShadows,
Ambient = lighting.Ambient,
OutdoorAmbient = lighting.OutdoorAmbient
}
controls_m.Activated:Connect(function()
fullbrightEnabled = not fullbrightEnabled
if fullbrightEnabled then
controls_m.Text = "FullBright: ON"
controls_m.BackgroundColor3 = colorFullbright
lighting.Brightness = 3
lighting.ClockTime = 14
lighting.FogEnd = 100000
lighting.GlobalShadows = false
lighting.Ambient = Color3.fromRGB(255,255,255)
lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
else
controls_m.Text = "FullBright: OFF"
controls_m.BackgroundColor3 = colorOff
lighting.Brightness = effects_i.Brightness
lighting.ClockTime = effects_i.ClockTime
lighting.FogEnd = effects_i.FogEnd
lighting.GlobalShadows = effects_i.GlobalShadows
lighting.Ambient = effects_i.Ambient
lighting.OutdoorAmbient = effects_i.OutdoorAmbient
end
end)
local effects_j = nil
local function effects_k()
local systems_l = localPlayer.Character
if not systems_l then
return nil
end
return systems_l:FindFirstChildOfClass("Humanoid")
end
local function effects_l()
if not speedEnabled then return end
local systems_f = effects_k()
if systems_f then
systems_f.WalkSpeed = speedValueApplied
end
end
controls_n.Activated:Connect(function()
speedEnabled = not speedEnabled
local systems_f = effects_k()
if speedEnabled then
if systems_f then
effects_j = systems_f.WalkSpeed
end
controls_n.Text = "Speed: "..speedValueApplied
controls_n.BackgroundColor3 = colorMovement
effects_l()
else
controls_n.Text = "Speed: "..speedValueApplied
controls_n.BackgroundColor3 = colorOff
if systems_f then
if effects_j then
systems_f.WalkSpeed = effects_j
else
systems_f.WalkSpeed = 16
end
end
effects_j = nil
end
end)
controls_o.FocusLost:Connect(function()
local effects_m = tonumber(controls_o.Text)
if effects_m then
speedValueApplied = math.clamp(
math.floor(effects_m),
1,
maxSpeed
)
else
speedValueApplied = defaultSpeed
end
controls_o.Text = tostring(speedValueApplied)
controls_n.Text = "Speed: "..speedValueApplied
if speedEnabled then
effects_l()
end
end)
local function effects_n()
local systems_l = localPlayer.Character
if not systems_l then
return nil,nil,nil
end
local systems_f =
systems_l:FindFirstChildOfClass("Humanoid")
local systems_d =
systems_l:FindFirstChild("HumanoidRootPart")
if not systems_f or not systems_d then
return nil,nil,nil
end
return systems_l,systems_f,systems_d
end
local function effects_o()
if flyEnabled then
controls_r.Text = "Fly: ON"
controls_r.BackgroundColor3 = colorMovement
controls_s.BackgroundColor3 = colorMovement
controls_u.BackgroundColor3 = colorMovement
controls_w.BackgroundColor3 = colorMovement
else
controls_r.Text = "Fly: OFF"
controls_r.BackgroundColor3 = colorOff
controls_s.BackgroundColor3 = colorOff
controls_u.BackgroundColor3 = colorOff
controls_w.BackgroundColor3 = colorOff
end
end
local function effects_p()
if flyJumpConnection then
flyJumpConnection:Disconnect()
flyJumpConnection = nil
end
if flyConnection then
flyConnection:Destroy()
flyConnection = nil
end
if noclipConnection then
 noclipConnection:Destroy()
 noclipConnection = nil
end
if speedConnection then
 speedConnection:Destroy()
 speedConnection = nil
end
speedValue = 0
end
local function effects_q()
effects_p()
local systems_l,systems_f = effects_n()
if systems_f then
 systems_f.AutoRotate = true
 systems_f.PlatformStand = false
end
end
local function effects_r()
if flyEnabled then return end
local systems_l,systems_f,systems_d = effects_n()
if not systems_l or not systems_f or not systems_d then
return false
end
flyEnabled = true
speedValue = 0
systems_f.AutoRotate = false
systems_f.PlatformStand = false
speedConnection = Instance.new("Attachment")
speedConnection.Name = "Seraph_FlyAttachment"
speedConnection.Parent = systems_d
flyConnection = Instance.new("LinearVelocity")
flyConnection.Name = "Seraph_FlyVelocity"
flyConnection.Attachment0 = speedConnection
flyConnection.RelativeTo = Enum.ActuatorRelativeTo.World
flyConnection.MaxForce = math.huge
flyConnection.VectorVelocity = Vector3.zero
flyConnection.Parent = systems_d
noclipConnection = Instance.new("AlignOrientation")
noclipConnection.Name = "Seraph_FlyOrientation"
noclipConnection.Mode = Enum.OrientationAlignmentMode.OneAttachment
noclipConnection.Attachment0 = speedConnection
noclipConnection.RigidityEnabled = false
noclipConnection.Responsiveness = 30
noclipConnection.MaxTorque = math.huge
noclipConnection.Parent = systems_d
effects_o()
flyJumpConnection = runService.Heartbeat:Connect(function()
if not flyEnabled then return end
if not systems_d or not systems_d.Parent then return end
local systems_s = workspace.CurrentCamera
if not systems_s then return end
local effects_s = systems_s.CFrame
local effects_t = effects_s.LookVector
local effects_u = effects_s.RightVector
local effects_v = systems_f.MoveDirection
local effects_w = Vector3.new(effects_t.X,0,effects_t.Z)
local effects_x = Vector3.new(effects_u.X,0,effects_u.Z)
if effects_w.Magnitude > 0.001 then
 effects_w = effects_w.Unit
end
if effects_x.Magnitude > 0.001 then
 effects_x = effects_x.Unit
end
local effects_z = effects_v:Dot(effects_w)
local finalUi_a = effects_v:Dot(effects_x)
local effects_y =
 effects_t*effects_z+
 effects_u*finalUi_a
if effects_y.Magnitude > 1 then
 effects_y = effects_y.Unit
end
local finalUi_b = math.clamp(flySpeedValue,minFlySpeed,maxFlySpeed)
local finalUi_c =
 effects_y*finalUi_b+
 Vector3.new(0,speedValue*finalUi_b,0)
flyConnection.VectorVelocity = finalUi_c
noclipConnection.CFrame = effects_s.Rotation
end)
return true
end
controls_r.Activated:Connect(function()
if flyEnabled then
flyEnabled = false
effects_q()
effects_o()
else
if effects_r() then
 effects_o()
end
end
end)
controls_s.FocusLost:Connect(function()
local effects_m = tonumber(controls_s.Text)
if effects_m then
flySpeedValue =
math.clamp(
math.floor(effects_m),
minFlySpeed,
maxFlySpeed
)
else
flySpeedValue = defaultFlySpeed
end
controls_s.Text = tostring(flySpeedValue)
end)
local function finalUi_d(mainUi_s,effects_m)
mainUi_s.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseButton1 then
if flyEnabled then
speedValue = effects_m
end
end
end)
mainUi_s.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseButton1 then
if speedValue == effects_m then
speedValue = 0
end
end
end)
end
finalUi_d(controls_u,1)
finalUi_d(controls_w,-1)
local finalUi_e = {}
userInputService.InputBegan:Connect(function(input,processed)
if processed then return end
if input.KeyCode == Enum.KeyCode.Space then
finalUi_e.Space = true
end
if input.KeyCode == Enum.KeyCode.LeftControl then
finalUi_e.LeftControl = true
end
end)
userInputService.InputEnded:Connect(function(input)
if input.KeyCode == Enum.KeyCode.Space then
finalUi_e.Space = false
end
if input.KeyCode == Enum.KeyCode.LeftControl then
finalUi_e.LeftControl = false
end
end)
runService.Heartbeat:Connect(function()
if not fastHealEnabled then return end
if speedValue ~= 0 then return end
local finalUi_f = 0
if finalUi_e.Space then
finalUi_f += 1
end
if finalUi_e.LeftControl then
finalUi_f -= 1
end
speedValue = finalUi_f
end)
local function finalUi_g()
if not flyJumpEnabled then return end
local systems_l = localPlayer.Character
if not systems_l then return end
local systems_f =
systems_l:FindFirstChildOfClass("Humanoid")
local systems_d =
systems_l:FindFirstChild("HumanoidRootPart")
if not systems_f or not systems_d then return end
if systems_f.Health <= 0 then return end
systems_f:ChangeState(
Enum.HumanoidStateType.Jumping
)
systems_d.AssemblyLinearVelocity =
Vector3.new(
0,
flyJumpHeight,
0
)
end
controls_q.Activated:Connect(function()
flyJumpEnabled = not flyJumpEnabled
if flyJumpEnabled then
controls_q.Text = "FlyJump: ON"
controls_q.BackgroundColor3 = colorMovement
else
controls_q.Text = "FlyJump: OFF"
controls_q.BackgroundColor3 = colorOff
end
end)
userInputService.JumpRequest:Connect(function()
if flyJumpEnabled then
finalUi_g()
end
end)
local function finalUi_h()
if not noclipEnabled then return end
local systems_l = localPlayer.Character
if not systems_l then return end
for _,obj in ipairs(systems_l:GetDescendants()) do
if obj:IsA("BasePart") then
obj.CanCollide = false
end
end
end
controls_y.Activated:Connect(function()
noclipEnabled = not noclipEnabled
if noclipEnabled then
controls_y.Text = "Noclip: ON"
controls_y.BackgroundColor3 = colorMovement
finalUi_h()
else
controls_y.Text = "Noclip: OFF"
controls_y.BackgroundColor3 = colorOff
local systems_l = localPlayer.Character
if systems_l then
for _,obj in ipairs(systems_l:GetDescendants()) do
if obj:IsA("BasePart") then
obj.CanCollide = true
end
end
end
end
end)
runService.Stepped:Connect(function()
if noclipEnabled then
finalUi_h()
end
end)
local function finalUi_i()
if not fastHealEnabled then return end
local systems_l = localPlayer.Character
if not systems_l then return end
local systems_f =
systems_l:FindFirstChildOfClass("Humanoid")
if not systems_f then return end
if systems_f.Health <= 0 then return end
if systems_f.Health < systems_f.MaxHealth then
systems_f.Health =
math.min(
systems_f.Health+
healValue*0.1,
systems_f.MaxHealth
)
end
end
controls_z.Activated:Connect(function()
fastHealEnabled = not fastHealEnabled
if fastHealEnabled then
controls_z.Text = "Fast Heal: ON"
controls_z.BackgroundColor3 = colorMovement
else
controls_z.Text = "Fast Heal: OFF"
controls_z.BackgroundColor3 = colorOff
end
end)
systems_a.FocusLost:Connect(function()
local effects_m = tonumber(systems_a.Text)
if effects_m then
healValue =
math.clamp(
math.floor(effects_m),
1,
maxHeal
)
else
healValue = defaultHeal
end
systems_a.Text = tostring(healValue)
end)
task.spawn(function()
while task.wait(0.1) do
if fastHealEnabled then
finalUi_i()
end
end
end)
task.spawn(function()
while task.wait(0.15) do
if speedEnabled then
effects_l()
end
end
end)
localPlayer.CharacterAdded:Connect(function()
local flyEstavaAtivo = flyEnabled

if flyEnabled then
flyEnabled = false
effects_q()
effects_o()
end

task.wait(0.5)

if speedEnabled then
local humanoid = effects_k()

if humanoid then
effects_j = humanoid.WalkSpeed
humanoid.WalkSpeed = speedValueApplied
end
end

if noclipEnabled then
finalUi_h()
end

if fastHealEnabled then
task.wait(0.2)
finalUi_i()
end

if flyEstavaAtivo then
task.wait(0.3)

if localPlayer.Character then
effects_r()
end
end
end)

local finalUi_k = Instance.new("ImageButton")
finalUi_k.Name = "SeraphCircle"
finalUi_k.Size = UDim2.new(0,58,0,58)
finalUi_k.Position = UDim2.new(0,20,0.5,-29)
finalUi_k.BackgroundColor3 = Color3.fromRGB(25,25,25)
finalUi_k.BackgroundTransparency = 0.15
finalUi_k.Image = "rbxassetid://76079354740264"
finalUi_k.ImageTransparency = 0
finalUi_k.ScaleType = Enum.ScaleType.Fit
finalUi_k.BorderSizePixel = 0
finalUi_k.ZIndex = 200
finalUi_k.Visible = false
finalUi_k.Parent = loading_y
local finalUi_l = Instance.new("UICorner")
finalUi_l.CornerRadius = UDim.new(1,0)
finalUi_l.Parent = finalUi_k
mainUi_e(finalUi_k,2,0)
content_e.Activated:Connect(function()
loading_z.Visible = false
finalUi_k.Visible = true
end)
finalUi_k.Activated:Connect(function()
finalUi_k.Visible = false
loading_z.Visible = true
end)
local function finalUi_m(obj,tail_d)
local finalUi_n = false
local finalUi_o
local finalUi_p
tail_d.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then
finalUi_n = true
finalUi_o = input.Position
finalUi_p = obj.Position
end
end)
userInputService.InputChanged:Connect(function(input)
if not finalUi_n then return end
if input.UserInputType ~= Enum.UserInputType.MouseMovement
and input.UserInputType ~= Enum.UserInputType.Touch then
return
end
local finalUi_q = input.Position-finalUi_o
obj.Position =
UDim2.new(
finalUi_p.X.Scale,
finalUi_p.X.Offset+finalUi_q.X,
finalUi_p.Y.Scale,
finalUi_p.Y.Offset+finalUi_q.Y
)
end)
userInputService.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then
finalUi_n = false
end
end)
end
local finalUi_r = Instance.new("TextButton")
finalUi_r.Name = "DragArea"
finalUi_r.Size = UDim2.new(1,-55,0,45)
finalUi_r.Position = UDim2.new(0,0,0,0)
finalUi_r.BackgroundTransparency = 1
finalUi_r.Text = ""
finalUi_r.AutoButtonColor = false
finalUi_r.BorderSizePixel = 0
finalUi_r.ZIndex = 125
finalUi_r.Parent = loading_z
finalUi_m(loading_z,finalUi_r)
finalUi_m(finalUi_k,finalUi_k)
controls_e()
effects_o()
print("Seraph HUB 1.0 carregado com Fly 360°, 4 temas e sistema central de bordas.")
task.spawn(function()
local finalUi_s = 2.8
local finalUi_o = os.clock()
while os.clock() - finalUi_o < finalUi_s do
local finalUi_t =
math.clamp(
(os.clock() - finalUi_o) / finalUi_s,
0,
1
)
loading_q.Size =
UDim2.new(
finalUi_t,
0,
1,
0
)
local finalUi_u =
math.floor(finalUi_t * 100)
loading_r.Text =
tostring(finalUi_u).."%"
if finalUi_u < 35 then
loading_n.Text = "Inicializando..."
elseif finalUi_u < 70 then
loading_n.Text = "Carregando recursos..."
elseif finalUi_u < 95 then
loading_n.Text = "Preparando Seraph HUB..."
else
loading_n.Text = "Concluído!"
end
runService.RenderStepped:Wait()
end
loading_q.Size = UDim2.new(1,0,1,0)
loading_r.Text = "100%"
loading_n.Text = "Concluído!"
task.wait(0.35)
if loading_w then
loading_w:Disconnect()
loading_w = nil
end
for i = 0,1,0.08 do
if loading_e and loading_e.Parent then
loading_e.BackgroundTransparency = i
end
if loading_f and loading_f.Parent then
loading_f.BackgroundTransparency =
math.clamp(0.05 + i,0,1)
end
runService.RenderStepped:Wait()
end
if loading_d then
loading_d:Destroy()
end
print("Seraph HUB: Loading finalizado.")
end)
