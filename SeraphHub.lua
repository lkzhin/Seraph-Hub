--[[ Made with love, https://bobloscript.com/obfuscator ]]
local B = game:GetService("Players");
local W = game:GetService("UserInputService");
local u = game:GetService("RunService");
local H = game:GetService("Lighting");
local h = B.LocalPlayer;
local J = 500;
local N = .28;
local O = .12;
local S = 45;
local y = 500;
local Y = 100;
local T = 500;
local d = 55;
local v = 70;
local g = 1;
local P = 1000;
local m = Color3.fromRGB(55, 55, 55);
local a = Color3.fromRGB(150, 0, 0);
local Z = Color3.fromRGB(0, 90, 180);
local V = Color3.fromRGB(0, 130, 70);
local R = Color3.fromRGB(180, 150, 0);
local r = Color3.fromRGB(0, 120, 255);
local X = {
		Original = {
			Color3.fromRGB(255, 70, 120),
			Color3.fromRGB(255, 120, 70),
			Color3.fromRGB(255, 50, 180),
			Color3.fromRGB(170, 60, 255),
		},
		["Black / Grey / White"] = {
			Color3.fromRGB(255, 255, 255),
			Color3.fromRGB(150, 150, 150),
			Color3.fromRGB(70, 70, 70),
			Color3.fromRGB(230, 230, 230),
		},
		RGB = {
			Color3.fromRGB(255, 0, 0),
			Color3.fromRGB(0, 255, 0),
			Color3.fromRGB(0, 140, 255),
			Color3.fromRGB(180, 0, 255),
		},
		["Ocean Theme"] = {
			Color3.fromRGB(0, 255, 255),
			Color3.fromRGB(0, 150, 255),
			Color3.fromRGB(0, 80, 255),
			Color3.fromRGB(0, 255, 180),
		},
	};
local j = "RGB";
local L = true;
local b = .8;
local k = false;
local z = false;
local n = false;
local D = false;
local E = false;
local w = false;
local A = false;
local i = false;
local M = false;
local I = false;
local G = 0;
local Q = v;
local l = S;
local s = Y;
local f = {};
local q = {};
local K = {};
local x = {};
local o = nil;
local t = nil;
local F = 0;
local U = 0;
local C = nil;
local p = nil;
local e = nil;
local c = nil;
local Bn = h:WaitForChild("PlayerGui");
local Wn = Bn:FindFirstChild("Seraph_PANEL");
if Wn then
	Wn:Destroy();
end;
local un = Bn:FindFirstChild("Seraph_LOADING");
if un then
	un:Destroy();
end;
local Hn = Instance.new("ScreenGui");
Hn.Name = "Seraph_LOADING";
Hn.DisplayOrder = 1000;
Hn.IgnoreGuiInset = true;
Hn.ResetOnSpawn = false;
Hn.ZIndexBehavior = Enum.ZIndexBehavior.Global;
Hn.Parent = Bn;
local hn = Instance.new("Frame");
hn.Size = UDim2.new(1, 0, 1, 0);
hn.Position = UDim2.new(0, 0, 0, 0);
hn.BackgroundColor3 = Color3.fromRGB(5, 5, 8);
hn.BorderSizePixel = 0;
hn.ZIndex = 1;
hn.Parent = Hn;
local Jn = Instance.new("Frame");
Jn.Size = UDim2.new(0, 360, 0, 300);
Jn.AnchorPoint = Vector2.new(.5, .5);
Jn.Position = UDim2.new(.5, 0, .5, 0);
Jn.BackgroundColor3 = Color3.fromRGB(15, 15, 20);
Jn.BackgroundTransparency = .05;
Jn.BorderSizePixel = 0;
Jn.ZIndex = 10;
Jn.Parent = Hn;
local Nn = Instance.new("UICorner");
Nn.CornerRadius = UDim.new(0, 18);
Nn.Parent = Jn;
local On = Instance.new("UIStroke");
On.Name = "Seraph_LoadingRGB";
On.Thickness = 2.5;
On.Color = Color3.fromRGB(255, 0, 0);
On.Parent = Jn;
local Sn = Instance.new("ImageLabel");
Sn.Size = UDim2.new(0, 125, 0, 125);
Sn.AnchorPoint = Vector2.new(.5, 0);
Sn.Position = UDim2.new(.5, 0, 0, 30);
Sn.BackgroundColor3 = Color3.fromRGB(25, 25, 30);
Sn.BackgroundTransparency = 0;
Sn.BorderSizePixel = 0;
Sn.Image = "";
Sn.ScaleType = Enum.ScaleType.Crop;
Sn.ZIndex = 11;
Sn.Parent = Jn;
local yn = Instance.new("UICorner");
yn.CornerRadius = UDim.new(1, 0);
yn.Parent = Sn;
local Yn = Instance.new("UIStroke");
Yn.Name = "Seraph_LoadingImageRGB";
Yn.Thickness = 2;
Yn.Color = Color3.fromRGB(255, 0, 0);
Yn.Parent = Sn;
local Tn = Instance.new("TextLabel");
Tn.Size = UDim2.new(1, 0, 1, 0);
Tn.BackgroundTransparency = 1;
Tn.Text = "Seraph";
Tn.TextColor3 = Color3.fromRGB(255, 255, 255);
Tn.TextSize = 25;
Tn.Font = Enum.Font.GothamBold;
Tn.ZIndex = 12;
Tn.Parent = Sn;
local dn = Instance.new("TextLabel");
dn.Size = UDim2.new(1, -30, 0, 35);
dn.Position = UDim2.new(0, 15, 0, 165);
dn.BackgroundTransparency = 1;
dn.Text = "Seraph HUB";
dn.TextColor3 = Color3.fromRGB(255, 255, 255);
dn.TextSize = 23;
dn.Font = Enum.Font.GothamBold;
dn.TextXAlignment = Enum.TextXAlignment.Center;
dn.ZIndex = 11;
dn.Parent = Jn;
local vn = Instance.new("TextLabel");
vn.Size = UDim2.new(1, -30, 0, 25);
vn.Position = UDim2.new(0, 15, 0, 200);
vn.BackgroundTransparency = 1;
vn.Text = "Carregando painel...";
vn.TextColor3 = Color3.fromRGB(180, 180, 180);
vn.TextSize = 11;
vn.Font = Enum.Font.Gotham;
vn.TextXAlignment = Enum.TextXAlignment.Center;
vn.ZIndex = 11;
vn.Parent = Jn;
local gn = Instance.new("Frame");
gn.Size = UDim2.new(1, -50, 0, 8);
gn.Position = UDim2.new(0, 25, 0, 238);
gn.BackgroundColor3 = Color3.fromRGB(35, 35, 40);
gn.BorderSizePixel = 0;
gn.ZIndex = 11;
gn.Parent = Jn;
local Pn = Instance.new("UICorner");
Pn.CornerRadius = UDim.new(1, 0);
Pn.Parent = gn;
local mn = Instance.new("Frame");
mn.Size = UDim2.new(0, 0, 1, 0);
mn.BackgroundColor3 = Color3.fromRGB(255, 0, 100);
mn.BorderSizePixel = 0;
mn.ZIndex = 12;
mn.Parent = gn;
local an = Instance.new("UICorner");
an.CornerRadius = UDim.new(1, 0);
an.Parent = mn;
local Zn = Instance.new("TextLabel");
Zn.Size = UDim2.new(1, -30, 0, 25);
Zn.Position = UDim2.new(0, 15, 0, 255);
Zn.BackgroundTransparency = 1;
Zn.Text = "0%";
Zn.TextColor3 = Color3.fromRGB(255, 255, 255);
Zn.TextSize = 11;
Zn.Font = Enum.Font.GothamBold;
Zn.TextXAlignment = Enum.TextXAlignment.Center;
Zn.ZIndex = 11;
Zn.Parent = Jn;
local function Vn(B)
	local W = math.sin(B) * .5 + .5;
	local u = math.sin(B + 2.094) * .5 + .5;
	local H = math.sin(B + 4.188) * .5 + .5;
	return Color3.new(W, u, H);
end;
local Rn;
Rn = u.RenderStepped:Connect(function()
		if not Hn or not Hn.Parent then
			if Rn then
				Rn:Disconnect();
			end;
			return;
		end;
		local B = Vn(os.clock() * 1.8);
		On.Color = B;
		Yn.Color = B;
		mn.BackgroundColor3 = B;
	end);
u.RenderStepped:Wait();
local rn = Instance.new("ScreenGui");
rn.Name = "Seraph_PANEL";
rn.DisplayOrder = 999;
rn.IgnoreGuiInset = true;
rn.ResetOnSpawn = false;
rn.ZIndexBehavior = Enum.ZIndexBehavior.Global;
rn.Parent = Bn;
local Xn = Instance.new("Frame");
Xn.Name = "MainPanel";
Xn.Size = UDim2.new(0, 700, 0, 400);
Xn.AnchorPoint = Vector2.new(.5, .5);
Xn.Position = UDim2.new(.5, 0, .5, 0);
Xn.BackgroundColor3 = Color3.fromRGB(20, 20, 20);
Xn.BackgroundTransparency = .14;
Xn.BorderSizePixel = 0;
Xn.ZIndex = 100;
Xn.Parent = rn;
local jn = Instance.new("UICorner");
jn.CornerRadius = UDim.new(0, 14);
jn.Parent = Xn;
local Ln = Instance.new("UIStroke");
Ln.Name = "AnimatedBorder";
Ln.Thickness = 2.5;
Ln.Transparency = 0;
Ln.Color = X[j][1];
Ln.Parent = Xn;
local bn = {};
local function kn(B)
	if not B then
		return;
	end;
	if not table.find(bn, B) then
		table.insert(bn, B);
	end;
end;
local function zn(B, W, u)
	if not B then
		return nil;
	end;
	local H = B:FindFirstChild("Seraph_AnimatedBorder");
	if not H then
		H = Instance.new("UIStroke");
		H.Name = "Seraph_AnimatedBorder";
		H.Thickness = W or 1.8;
		H.Transparency = u or 0;
		H.Color = X[j][1];
		H.Parent = B;
	end;
	kn(H);
	return H;
end;
kn(Ln);
local function nn(B, W)
	local u = #B;
	if u <= 1 then
		return B[1];
	end;
	local H = W % u;
	local h = math.floor(H) + 1;
	local J = h + 1;
	if J > u then
		J = 1;
	end;
	local N = H - math.floor(H);
	return B[h]:Lerp(B[J], N);
end;
u.RenderStepped:Connect(function()
	local B = X[j];
	local W;
	if L then
		W = nn(B, os.clock() * b);
	else
		W = B[1];
	end;
	for B = #bn, 1, -1 do
		local u = bn[B];
		if u and u.Parent then
			u.Color = W;
		else
			table.remove(bn, B);
		end;
	end;
end);
local Dn = Instance.new("Frame");
Dn.Name = "Sidebar";
Dn.Size = UDim2.new(0, 145, 1, -20);
Dn.Position = UDim2.new(0, 10, 0, 10);
Dn.BackgroundColor3 = Color3.fromRGB(12, 12, 12);
Dn.BackgroundTransparency = .18;
Dn.BorderSizePixel = 0;
Dn.ZIndex = 105;
Dn.Parent = Xn;
local En = Instance.new("UICorner");
En.CornerRadius = UDim.new(0, 12);
En.Parent = Dn;
local wn = Instance.new("TextLabel");
wn.Size = UDim2.new(1, -20, 0, 30);
wn.Position = UDim2.new(0, 10, 0, 8);
wn.BackgroundTransparency = 1;
wn.Text = "Seraph";
wn.TextColor3 = Color3.fromRGB(255, 255, 255);
wn.TextSize = 21;
wn.Font = Enum.Font.GothamBold;
wn.TextXAlignment = Enum.TextXAlignment.Left;
wn.ZIndex = 110;
wn.Parent = Dn;
local An = Instance.new("TextLabel");
An.Size = UDim2.new(1, -20, 0, 18);
An.Position = UDim2.new(0, 10, 0, 35);
An.BackgroundTransparency = 1;
An.Text = "PLAYER HUB";
An.TextColor3 = Color3.fromRGB(130, 130, 130);
An.TextSize = 9;
An.Font = Enum.Font.GothamBold;
An.TextXAlignment = Enum.TextXAlignment.Left;
An.ZIndex = 110;
An.Parent = Dn;
local function Mn(B, W)
	local u = Instance.new("TextButton");
	u.Size = UDim2.new(1, -20, 0, 43);
	u.Position = UDim2.new(0, 10, 0, W);
	u.BackgroundColor3 = m;
	u.BackgroundTransparency = .12;
	u.Text = B;
	u.TextColor3 = Color3.fromRGB(235, 235, 235);
	u.TextSize = 13;
	u.Font = Enum.Font.GothamBold;
	u.BorderSizePixel = 0;
	u.AutoButtonColor = false;
	u.ZIndex = 110;
	u.Parent = Dn;
	local H = Instance.new("UICorner");
	H.CornerRadius = UDim.new(0, 9);
	H.Parent = u;
	zn(u, 1.8, 0);
	return u;
end;
local In = Mn("\226\140\130  Home", 65);
local Gn = Mn("\226\154\153  Player Settings", 113);
local Qn = Mn("\226\154\153  Configura\195\167\195\181es", 161);
In.BackgroundColor3 = r;
local ln = Instance.new("Frame");
ln.Name = "PlayerProfile";
ln.Size = UDim2.new(1, -20, 0, 61);
ln.Position = UDim2.new(0, 10, 1, -71);
ln.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
ln.BackgroundTransparency = .12;
ln.BorderSizePixel = 0;
ln.ZIndex = 110;
ln.Parent = Dn;
local sn = Instance.new("UICorner");
sn.CornerRadius = UDim.new(0, 9);
sn.Parent = ln;
zn(ln, 1.8, 0);
local fn = Instance.new("ImageLabel");
fn.Size = UDim2.new(0, 42, 0, 42);
fn.Position = UDim2.new(0, 7, .5, -21);
fn.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
fn.BorderSizePixel = 0;
fn.ZIndex = 112;
fn.Parent = ln;
local qn = Instance.new("UICorner");
qn.CornerRadius = UDim.new(1, 0);
qn.Parent = fn;
local Kn, xn = pcall(function()
		return B:GetUserThumbnailAsync(h.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100);
	end);
if Kn and xn then
	fn.Image = xn;
end;
local on = Instance.new("TextLabel");
on.Size = UDim2.new(1, -57, 0, 21);
on.Position = UDim2.new(0, 54, 0, 8);
on.BackgroundTransparency = 1;
on.Text = h.Name;
on.TextColor3 = Color3.fromRGB(255, 255, 255);
on.TextSize = 12;
on.Font = Enum.Font.GothamBold;
on.TextXAlignment = Enum.TextXAlignment.Left;
on.TextTruncate = Enum.TextTruncate.AtEnd;
on.ZIndex = 112;
on.Parent = ln;
local tn = Instance.new("TextLabel");
tn.Size = UDim2.new(1, -57, 0, 18);
tn.Position = UDim2.new(0, 54, 0, 30);
tn.BackgroundTransparency = 1;
tn.Text = "ID: " .. tostring(h.UserId);
tn.TextColor3 = Color3.fromRGB(125, 125, 125);
tn.TextSize = 8;
tn.Font = Enum.Font.Gotham;
tn.TextXAlignment = Enum.TextXAlignment.Left;
tn.ZIndex = 112;
tn.Parent = ln;
local Fn = Instance.new("TextButton");
Fn.Name = "Close";
Fn.Size = UDim2.new(0, 34, 0, 34);
Fn.Position = UDim2.new(1, -43, 0, 8);
Fn.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
Fn.BackgroundTransparency = .15;
Fn.Text = "\195\151";
Fn.TextColor3 = Color3.fromRGB(255, 255, 255);
Fn.TextSize = 21;
Fn.Font = Enum.Font.GothamBold;
Fn.BorderSizePixel = 0;
Fn.AutoButtonColor = true;
Fn.ZIndex = 130;
Fn.Parent = Xn;
local Un = Instance.new("UICorner");
Un.CornerRadius = UDim.new(0, 8);
Un.Parent = Fn;
zn(Fn, 1.8, 0);
local Cn = Instance.new("Frame");
Cn.Name = "Content";
Cn.Size = UDim2.new(1, -165, 1, -20);
Cn.Position = UDim2.new(0, 155, 0, 10);
Cn.BackgroundTransparency = 1;
Cn.BorderSizePixel = 0;
Cn.ZIndex = 101;
Cn.Parent = Xn;
local pn = Instance.new("TextLabel");
pn.Size = UDim2.new(1, -55, 0, 38);
pn.Position = UDim2.new(0, 10, 0, 0);
pn.BackgroundTransparency = 1;
pn.Text = "Home";
pn.TextColor3 = Color3.fromRGB(255, 255, 255);
pn.TextSize = 19;
pn.Font = Enum.Font.GothamBold;
pn.TextXAlignment = Enum.TextXAlignment.Left;
pn.ZIndex = 110;
pn.Parent = Cn;
local en = Instance.new("Frame");
en.Size = UDim2.new(1, -10, 1, -48);
en.Position = UDim2.new(0, 5, 0, 45);
en.BackgroundTransparency = 1;
en.BorderSizePixel = 0;
en.ZIndex = 103;
en.Parent = Cn;
local cn = Instance.new("TextLabel");
cn.Size = UDim2.new(1, -10, 0, 40);
cn.Position = UDim2.new(0, 5, 0, 0);
cn.BackgroundTransparency = 1;
cn.Text = "Seraph HUB";
cn.TextColor3 = Color3.fromRGB(255, 255, 255);
cn.TextSize = 23;
cn.Font = Enum.Font.GothamBold;
cn.TextXAlignment = Enum.TextXAlignment.Left;
cn.ZIndex = 110;
cn.Parent = en;
local B_ = Instance.new("TextLabel");
B_.Size = UDim2.new(1, -20, 0, 115);
B_.Position = UDim2.new(0, 10, 0, 48);
B_.BackgroundTransparency = 1;
B_.Text = "PLAYER HUB\n\nVers\195\163o: 1.0\n\nDesenvolvido por: Lkzhin\n\nComunidade: Roblox Scripts Community";
B_.TextColor3 = Color3.fromRGB(190, 190, 190);
B_.TextSize = 12;
B_.Font = Enum.Font.Gotham;
B_.TextXAlignment = Enum.TextXAlignment.Left;
B_.TextYAlignment = Enum.TextYAlignment.Top;
B_.ZIndex = 110;
B_.Parent = en;
local W_ = Instance.new("TextButton");
W_.Size = UDim2.new(1, -20, 0, 42);
W_.Position = UDim2.new(0, 10, 0, 170);
W_.BackgroundColor3 = r;
W_.BackgroundTransparency = .08;
W_.Text = "\240\159\146\172  Copiar Discord";
W_.TextColor3 = Color3.fromRGB(255, 255, 255);
W_.TextSize = 13;
W_.Font = Enum.Font.GothamBold;
W_.BorderSizePixel = 0;
W_.ZIndex = 110;
W_.Parent = en;
local u_ = Instance.new("UICorner");
u_.CornerRadius = UDim.new(0, 9);
u_.Parent = W_;
zn(W_, 1.8, 0);
local H_ = Instance.new("TextLabel");
H_.Size = UDim2.new(1, -20, 0, 25);
H_.Position = UDim2.new(0, 10, 0, 218);
H_.BackgroundTransparency = 1;
H_.Text = "";
H_.TextColor3 = Color3.fromRGB(100, 255, 150);
H_.TextSize = 11;
H_.Font = Enum.Font.GothamBold;
H_.ZIndex = 110;
H_.Parent = en;
local h_ = "https://discord.gg/9ZdJQJ9W5U";
W_.Activated:Connect(function()
	if setclipboard then
		setclipboard(h_);
		H_.Text = "\226\156\147 Link copiado!";
	else
		H_.Text = h_;
	end;
	task.delay(3, function()
		if H_ and H_.Parent then
			H_.Text = "";
		end;
	end);
end);
local J_ = Instance.new("ScrollingFrame");
J_.Name = "Options";
J_.Size = UDim2.new(1, -10, 1, -48);
J_.Position = UDim2.new(0, 5, 0, 45);
J_.BackgroundTransparency = 1;
J_.BorderSizePixel = 0;
J_.ScrollBarThickness = 4;
J_.ScrollBarImageTransparency = .3;
J_.CanvasSize = UDim2.new(0, 0, 0, 795);
J_.Active = true;
J_.ClipsDescendants = true;
J_.ZIndex = 102;
J_.Visible = false;
J_.Parent = Cn;
local N_ = Instance.new("Frame");
N_.Name = "ConfigContent";
N_.Size = UDim2.new(1, -10, 1, -48);
N_.Position = UDim2.new(0, 5, 0, 45);
N_.BackgroundTransparency = 1;
N_.BorderSizePixel = 0;
N_.ZIndex = 103;
N_.Visible = false;
N_.Parent = Cn;
local O_ = Instance.new("TextLabel");
O_.Size = UDim2.new(1, -10, 0, 28);
O_.Position = UDim2.new(0, 8, 0, 0);
O_.BackgroundTransparency = 1;
O_.Text = "APAR\195\138NCIA";
O_.TextColor3 = Color3.fromRGB(255, 255, 255);
O_.TextSize = 13;
O_.Font = Enum.Font.GothamBold;
O_.TextXAlignment = Enum.TextXAlignment.Left;
O_.ZIndex = 110;
O_.Parent = N_;
local S_ = Instance.new("TextLabel");
S_.Size = UDim2.new(1, -16, 0, 38);
S_.Position = UDim2.new(0, 8, 0, 27);
S_.BackgroundTransparency = 1;
S_.Text = "Escolha o estilo da borda do Seraph.";
S_.TextColor3 = Color3.fromRGB(140, 140, 140);
S_.TextSize = 10;
S_.Font = Enum.Font.Gotham;
S_.TextXAlignment = Enum.TextXAlignment.Left;
S_.TextYAlignment = Enum.TextYAlignment.Top;
S_.ZIndex = 110;
S_.Parent = N_;
local y_ = Instance.new("TextButton");
y_.Size = UDim2.new(1, -16, 0, 43);
y_.Position = UDim2.new(0, 8, 0, 68);
y_.BackgroundColor3 = V;
y_.BackgroundTransparency = .05;
y_.Text = "Animated colors: ON";
y_.TextColor3 = Color3.fromRGB(255, 255, 255);
y_.TextSize = 12;
y_.Font = Enum.Font.GothamBold;
y_.BorderSizePixel = 0;
y_.ZIndex = 110;
y_.Parent = N_;
local Y_ = Instance.new("UICorner");
Y_.CornerRadius = UDim.new(0, 9);
Y_.Parent = y_;
zn(y_, 1.8, 0);
local T_ = Instance.new("TextLabel");
T_.Size = UDim2.new(1, -16, 0, 25);
T_.Position = UDim2.new(0, 8, 0, 120);
T_.BackgroundTransparency = 1;
T_.Text = "TEMAS";
T_.TextColor3 = Color3.fromRGB(255, 255, 255);
T_.TextSize = 12;
T_.Font = Enum.Font.GothamBold;
T_.TextXAlignment = Enum.TextXAlignment.Left;
T_.ZIndex = 110;
T_.Parent = N_;
local d_ = {};
local function v_(B, W, u)
	local H = Instance.new("TextButton");
	H.Size = UDim2.new(.5, -7, 0, 53);
	H.Position = UDim2.new(W, 0, 0, u);
	H.BackgroundColor3 = Color3.fromRGB(28, 28, 28);
	H.BackgroundTransparency = .05;
	H.Text = B;
	H.TextColor3 = Color3.fromRGB(235, 235, 235);
	H.TextSize = 10;
	H.Font = Enum.Font.GothamBold;
	H.BorderSizePixel = 0;
	H.AutoButtonColor = false;
	H.ZIndex = 110;
	H.Parent = N_;
	local h = Instance.new("UICorner");
	h.CornerRadius = UDim.new(0, 9);
	h.Parent = H;
	zn(H, 1.5, .15);
	d_[B] = H;
	return H;
end;
local g_ = v_("Original", 0, 150);
local P_ = v_("Black / Grey / White", .5, 150);
local m_ = v_("RGB", 0, 211);
local a_ = v_("Ocean Theme", .5, 211);
local function Z_()
	for B, W in pairs(d_) do
		if B == j then
			W.BackgroundColor3 = X[B][1];
			W.BackgroundTransparency = .05;
			W.TextColor3 = Color3.fromRGB(255, 255, 255);
		else
			W.BackgroundColor3 = Color3.fromRGB(28, 28, 28);
			W.BackgroundTransparency = .05;
			W.TextColor3 = Color3.fromRGB(220, 220, 220);
		end;
	end;
end;
local function V_(B)
	if not X[B] then
		return;
	end;
	j = B;
	Z_();
	S_.Text = "Borda: " .. (B .. ("\nAnimated colors: " .. ((L and "ON" or "OFF"))));
end;
g_.Activated:Connect(function()
	V_("Original");
end);
P_.Activated:Connect(function()
	V_("Black / Grey / White");
end);
m_.Activated:Connect(function()
	V_("RGB");
end);
a_.Activated:Connect(function()
	V_("Ocean Theme");
end);
y_.Activated:Connect(function()
	L = not L;
	if L then
		y_.Text = "Animated colors: ON";
		y_.BackgroundColor3 = V;
	else
		y_.Text = "Animated colors: OFF";
		y_.BackgroundColor3 = m;
	end;
	S_.Text = "Borda: " .. (j .. ("\nAnimated colors: " .. ((L and "ON" or "OFF"))));
end);
Z_();
local R_;
local r_;
local function X_()
	en.Visible = true;
	J_.Visible = false;
	N_.Visible = false;
	R_.Visible = false;
	In.BackgroundColor3 = r;
	Gn.BackgroundColor3 = m;
	Qn.BackgroundColor3 = m;
	r_.BackgroundColor3 = m;
	pn.Text = "Home";
end;
local function j_()
	en.Visible = false;
	J_.Visible = true;
	N_.Visible = false;
	R_.Visible = false;
	In.BackgroundColor3 = m;
	Gn.BackgroundColor3 = r;
	Qn.BackgroundColor3 = m;
	r_.BackgroundColor3 = m;
	pn.Text = "Player Settings";
end;
local function L_()
	en.Visible = false;
	J_.Visible = false;
	N_.Visible = true;
	R_.Visible = false;
	In.BackgroundColor3 = m;
	Gn.BackgroundColor3 = m;
	Qn.BackgroundColor3 = r;
	r_.BackgroundColor3 = m;
	pn.Text = "Configura\195\167\195\181es";
end;
In.Activated:Connect(X_);
Gn.Activated:Connect(j_);
Qn.Activated:Connect(L_);
R_ = Instance.new("Frame");
R_.Name = "ShadersContent";
R_.Size = UDim2.new(1, -10, 1, -48);
R_.Position = UDim2.new(0, 5, 0, 45);
R_.BackgroundTransparency = 1;
R_.BorderSizePixel = 0;
R_.ZIndex = 103;
R_.Visible = false;
R_.Parent = Cn;
local b_ = Instance.new("TextLabel");
b_.Size = UDim2.new(1, -10, 0, 22);
b_.Position = UDim2.new(0, 10, 0, 0);
b_.BackgroundTransparency = 1;
b_.Text = "VISUALS";
b_.TextColor3 = Color3.fromRGB(180, 70, 255);
b_.TextSize = 11;
b_.Font = Enum.Font.GothamBold;
b_.TextXAlignment = Enum.TextXAlignment.Left;
b_.ZIndex = 110;
b_.Parent = R_;
local k_ = Instance.new("TextLabel");
k_.Size = UDim2.new(1, -10, 0, 38);
k_.Position = UDim2.new(0, 10, 0, 23);
k_.BackgroundTransparency = 1;
k_.Text = "Shaders";
k_.TextColor3 = Color3.fromRGB(255, 255, 255);
k_.TextSize = 22;
k_.Font = Enum.Font.GothamBold;
k_.TextXAlignment = Enum.TextXAlignment.Left;
k_.ZIndex = 110;
k_.Parent = R_;
local z_ = Instance.new("Frame");
z_.Name = "SeraphShadersCard";
z_.Size = UDim2.new(1, -20, 0, 105);
z_.Position = UDim2.new(0, 10, 0, 72);
z_.BackgroundColor3 = Color3.fromRGB(22, 22, 25);
z_.BackgroundTransparency = .05;
z_.BorderSizePixel = 0;
z_.ZIndex = 108;
z_.Parent = R_;
local n_ = Instance.new("UICorner");
n_.CornerRadius = UDim.new(0, 12);
n_.Parent = z_;
zn(z_, 1.8, .1);
local D_ = Instance.new("TextLabel");
D_.Size = UDim2.new(1, -160, 0, 28);
D_.Position = UDim2.new(0, 18, 0, 20);
D_.BackgroundTransparency = 1;
D_.Text = "SERAPH SHADERS";
D_.TextColor3 = Color3.fromRGB(255, 255, 255);
D_.TextSize = 16;
D_.Font = Enum.Font.GothamBold;
D_.TextXAlignment = Enum.TextXAlignment.Left;
D_.ZIndex = 112;
D_.Parent = z_;
local E_ = Instance.new("TextLabel");
E_.Size = UDim2.new(1, -180, 0, 24);
E_.Position = UDim2.new(0, 18, 0, 52);
E_.BackgroundTransparency = 1;
E_.Text = "Tap to execute";
E_.TextColor3 = Color3.fromRGB(145, 145, 145);
E_.TextSize = 11;
E_.Font = Enum.Font.Gotham;
E_.TextXAlignment = Enum.TextXAlignment.Left;
E_.ZIndex = 112;
E_.Parent = z_;
local w_ = Instance.new("TextButton");
w_.Name = "ExecuteShaders";
w_.Size = UDim2.new(0, 135, 0, 48);
w_.Position = UDim2.new(1, -150, .5, -24);
w_.BackgroundColor3 = Color3.fromRGB(90, 20, 35);
w_.BackgroundTransparency = .05;
w_.Text = "EXECUTE  >";
w_.TextColor3 = Color3.fromRGB(255, 255, 255);
w_.TextSize = 12;
w_.Font = Enum.Font.GothamBold;
w_.BorderSizePixel = 0;
w_.AutoButtonColor = false;
w_.ZIndex = 113;
w_.Parent = z_;
local A_ = Instance.new("UICorner");
A_.CornerRadius = UDim.new(0, 9);
A_.Parent = w_;
zn(w_, 1.8, 0);
r_ = Instance.new("TextButton");
r_.Name = "ShadersTab";
r_.Size = UDim2.new(1, -20, 0, 43);
r_.Position = UDim2.new(0, 10, 0, 209);
r_.BackgroundColor3 = m;
r_.BackgroundTransparency = .12;
r_.Text = "\226\156\166  Shaders";
r_.TextColor3 = Color3.fromRGB(235, 235, 235);
r_.TextSize = 13;
r_.Font = Enum.Font.GothamBold;
r_.BorderSizePixel = 0;
r_.AutoButtonColor = false;
r_.ZIndex = 110;
r_.Parent = Dn;
local i_ = Instance.new("UICorner");
i_.CornerRadius = UDim.new(0, 9);
i_.Parent = r_;
zn(r_, 1.8, 0);
r_.Activated:Connect(function()
	en.Visible = false;
	J_.Visible = false;
	N_.Visible = false;
	R_.Visible = true;
	In.BackgroundColor3 = m;
	Gn.BackgroundColor3 = m;
	Qn.BackgroundColor3 = m;
	r_.BackgroundColor3 = r;
	pn.Text = "Shaders";
end);
local M_ = "https://raw.githubusercontent.com/lkzhin/Seraph-Shaders/refs/heads/main/SeraphShader.lua";
w_.Activated:Connect(function()
	local B, W = pcall(function()
			(loadstring(game:HttpGet(M_)))();
		end);
	if B then
		E_.Text = "Shaders abertos em painel separado.";
		E_.TextColor3 = Color3.fromRGB(100, 255, 150);
	else
		E_.Text = "Erro ao executar os shaders.";
		E_.TextColor3 = Color3.fromRGB(255, 100, 100);
		warn("Seraph Shaders:", W);
	end;
	task.delay(3, function()
		if E_ and E_.Parent then
			E_.Text = "Tap to execute";
			E_.TextColor3 = Color3.fromRGB(145, 145, 145);
		end;
	end);
end);
local function I_(B, W)
	local u = Instance.new("TextButton");
	u.Size = UDim2.new(1, -8, 0, 45);
	u.Position = UDim2.new(0, 2, 0, W);
	u.BackgroundColor3 = m;
	u.BackgroundTransparency = .22;
	u.Text = B;
	u.TextColor3 = Color3.fromRGB(235, 235, 235);
	u.TextSize = 13;
	u.Font = Enum.Font.GothamBold;
	u.BorderSizePixel = 0;
	u.AutoButtonColor = true;
	u.ZIndex = 105;
	u.Parent = J_;
	local H = Instance.new("UICorner");
	H.CornerRadius = UDim.new(0, 8);
	H.Parent = u;
	zn(u, 1.8, 0);
	return u;
end;
local G_ = I_("ESP Mobs: OFF", 5);
local Q_ = I_("ESP Players: OFF", 60);
local l_ = I_("Aimbot Mobs: OFF", 115);
local s_ = I_("Aimbot Players: OFF", 170);
local f_ = I_("FullBright: OFF", 225);
local q_ = I_("Speed: 45", 280);
local K_ = Instance.new("TextBox");
K_.Size = UDim2.new(1, -8, 0, 45);
K_.Position = UDim2.new(0, 2, 0, 335);
K_.BackgroundColor3 = m;
K_.BackgroundTransparency = .22;
K_.Text = "45";
K_.PlaceholderText = "Velocidade (1-500)";
K_.TextColor3 = Color3.fromRGB(255, 255, 255);
K_.PlaceholderColor3 = Color3.fromRGB(180, 180, 180);
K_.TextSize = 13;
K_.Font = Enum.Font.GothamBold;
K_.ClearTextOnFocus = false;
K_.TextXAlignment = Enum.TextXAlignment.Center;
K_.BorderSizePixel = 0;
K_.ZIndex = 105;
K_.Parent = J_;
local x_ = Instance.new("UICorner");
x_.CornerRadius = UDim.new(0, 8);
x_.Parent = K_;
zn(K_, 1.8, 0);
local o_ = I_("FlyJump: OFF", 400);
local t_ = I_("Fly: OFF", 455);
local F_ = Instance.new("TextBox");
F_.Size = UDim2.new(1, -8, 0, 45);
F_.Position = UDim2.new(0, 2, 0, 510);
F_.BackgroundColor3 = m;
F_.BackgroundTransparency = .22;
F_.Text = tostring(v);
F_.PlaceholderText = "Velocidade Fly (1-1000)";
F_.TextColor3 = Color3.fromRGB(255, 255, 255);
F_.PlaceholderColor3 = Color3.fromRGB(180, 180, 180);
F_.TextSize = 13;
F_.Font = Enum.Font.GothamBold;
F_.ClearTextOnFocus = false;
F_.TextXAlignment = Enum.TextXAlignment.Center;
F_.BorderSizePixel = 0;
F_.ZIndex = 105;
F_.Parent = J_;
local U_ = Instance.new("UICorner");
U_.CornerRadius = UDim.new(0, 8);
U_.Parent = F_;
zn(F_, 1.8, 0);
local C_ = Instance.new("TextButton");
C_.Size = UDim2.new(.5, -5, 0, 45);
C_.Position = UDim2.new(0, 2, 0, 565);
C_.BackgroundColor3 = m;
C_.BackgroundTransparency = .22;
C_.Text = "\226\150\178  SUBIR";
C_.TextColor3 = Color3.fromRGB(235, 235, 235);
C_.TextSize = 12;
C_.Font = Enum.Font.GothamBold;
C_.BorderSizePixel = 0;
C_.ZIndex = 105;
C_.Parent = J_;
local p_ = Instance.new("UICorner");
p_.CornerRadius = UDim.new(0, 8);
p_.Parent = C_;
zn(C_, 1.8, 0);
local e_ = Instance.new("TextButton");
e_.Size = UDim2.new(.5, -5, 0, 45);
e_.Position = UDim2.new(.5, 3, 0, 565);
e_.BackgroundColor3 = m;
e_.BackgroundTransparency = .22;
e_.Text = "\226\150\188  DESCER";
e_.TextColor3 = Color3.fromRGB(235, 235, 235);
e_.TextSize = 12;
e_.Font = Enum.Font.GothamBold;
e_.BorderSizePixel = 0;
e_.ZIndex = 105;
e_.Parent = J_;
local c_ = Instance.new("UICorner");
c_.CornerRadius = UDim.new(0, 8);
c_.Parent = e_;
zn(e_, 1.8, 0);
local BH = I_("Noclip: OFF", 625);
local WH = I_("Fast Heal: OFF", 680);
local uH = Instance.new("TextBox");
uH.Size = UDim2.new(1, -8, 0, 45);
uH.Position = UDim2.new(0, 2, 0, 735);
uH.BackgroundColor3 = m;
uH.BackgroundTransparency = .22;
uH.Text = "500";
uH.PlaceholderText = "Cura por segundo (1-500)";
uH.TextColor3 = Color3.fromRGB(255, 255, 255);
uH.PlaceholderColor3 = Color3.fromRGB(180, 180, 180);
uH.TextSize = 13;
uH.Font = Enum.Font.GothamBold;
uH.ClearTextOnFocus = false;
uH.TextXAlignment = Enum.TextXAlignment.Center;
uH.BorderSizePixel = 0;
uH.ZIndex = 105;
uH.Parent = J_;
local HH = Instance.new("UICorner");
HH.CornerRadius = UDim.new(0, 8);
HH.Parent = uH;
zn(uH, 1.8, 0);
local function hH(B)
	if not B then
		return nil;
	end;
	local W = B:FindFirstChild("HumanoidRootPart");
	if W and W:IsA("BasePart") then
		return W;
	end;
	if B.PrimaryPart then
		return B.PrimaryPart;
	end;
	return B:FindFirstChildWhichIsA("BasePart", true);
end;
local function JH(W)
	if not W or not W:IsA("Model") then
		return false;
	end;
	if B:GetPlayerFromCharacter(W) then
		return false;
	end;
	local u = W:FindFirstChildOfClass("Humanoid");
	if not u or u.Health <= 0 then
		return false;
	end;
	return hH(W) ~= nil;
end;
local function NH(B)
	if not k or f[B] or not JH(B) then
		return;
	end;
	local W = Instance.new("Highlight");
	W.Name = "Seraph_MobESP";
	W.Adornee = B;
	W.FillColor = Color3.fromRGB(255, 0, 0);
	W.OutlineColor = Color3.fromRGB(255, 0, 0);
	W.FillTransparency = 1;
	W.OutlineTransparency = 0;
	W.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
	W.Parent = workspace;
	f[B] = W;
end;
local function OH()
	for B, W in pairs(f) do
		if W then
			W:Destroy();
		end;
		f[B] = nil;
	end;
end;
local function SH()
	OH();
	table.clear(K);
	if not k then
		return;
	end;
	for B, W in ipairs(workspace:GetDescendants()) do
		if JH(W) then
			K[W] = true;
			NH(W);
		end;
	end;
end;
workspace.DescendantAdded:Connect(function(B)
	if not B:IsA("Model") then
		return;
	end;
	task.delay(.15, function()
		if not B.Parent then
			return;
		end;
		if JH(B) then
			K[B] = true;
			if k then
				NH(B);
			end;
		end;
	end);
end);
workspace.DescendantRemoving:Connect(function(B)
	K[B] = nil;
	if f[B] then
		f[B]:Destroy();
		f[B] = nil;
	end;
	if o == B then
		o = nil;
	end;
end);
local function yH(B)
	if not z or B == h then
		return;
	end;
	local W = B.Character;
	if not W then
		return;
	end;
	local u = W:FindFirstChildOfClass("Humanoid");
	if not u then
		return;
	end;
	if q[B] then
		q[B].Adornee = W;
		return;
	end;
	local H = Instance.new("Highlight");
	H.Name = "Seraph_PlayerESP";
	H.Adornee = W;
	H.FillColor = Color3.fromRGB(0, 120, 255);
	H.OutlineColor = Color3.fromRGB(0, 120, 255);
	H.FillTransparency = 1;
	H.OutlineTransparency = 0;
	H.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
	H.Parent = workspace;
	q[B] = H;
	x[B] = true;
end;
local function YH()
	for B, W in pairs(q) do
		if W then
			W:Destroy();
		end;
		q[B] = nil;
	end;
	table.clear(x);
end;
local function TH()
	YH();
	if not z then
		return;
	end;
	for B, W in ipairs(B:GetPlayers()) do
		if W ~= h then
			x[W] = true;
			yH(W);
		end;
	end;
end;
B.PlayerAdded:Connect(function(B)
	B.CharacterAdded:Connect(function()
		task.wait(.4);
		x[B] = true;
		if z then
			yH(B);
		end;
	end);
end);
B.PlayerRemoving:Connect(function(B)
	x[B] = nil;
	if q[B] then
		q[B]:Destroy();
		q[B] = nil;
	end;
	if t == B then
		t = nil;
	end;
end);
local function dH()
	local B = nil;
	local W = math.huge;
	local u = h.Character;
	local H = u and u:FindFirstChild("HumanoidRootPart");
	if not H then
		return nil;
	end;
	local N = workspace.CurrentCamera;
	if not N then
		return nil;
	end;
	local O = N.ViewportSize;
	local S = Vector2.new(O.X / 2, O.Y / 2);
	for u in pairs(K) do
		if JH(u) then
			local h = hH(u);
			if h then
				local O = ((h.Position - H.Position)).Magnitude;
				if O <= J then
					local H, J = N:WorldToViewportPoint(h.Position + Vector3.new(0, 1.2, 0));
					if J and H.Z > 0 then
						local h = Vector2.new(H.X, H.Y);
						local J = ((h - S)).Magnitude;
						if J < W then
							W = J;
							B = u;
						end;
					end;
				end;
			end;
		end;
	end;
	return B;
end;
local function vH()
	local W = nil;
	local u = math.huge;
	local H = h.Character;
	local N = H and H:FindFirstChild("HumanoidRootPart");
	if not N then
		return nil;
	end;
	local O = workspace.CurrentCamera;
	if not O then
		return nil;
	end;
	local S = O.ViewportSize;
	local y = Vector2.new(S.X / 2, S.Y / 2);
	for B, H in ipairs(B:GetPlayers()) do
		if H ~= h then
			local B = H.Character;
			if B then
				local h = B:FindFirstChildOfClass("Humanoid");
				local S = hH(B);
				if h and (h.Health > 0 and S) then
					local B = ((S.Position - N.Position)).Magnitude;
					if B <= J then
						local B, h = O:WorldToViewportPoint(S.Position + Vector3.new(0, 1.2, 0));
						if h and B.Z > 0 then
							local h = Vector2.new(B.X, B.Y);
							local J = ((h - y)).Magnitude;
							if J < u then
								u = J;
								W = H;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
	return W;
end;
local function gH(B, W)
	if not B or not B.Parent then
		return;
	end;
	local u = workspace.CurrentCamera;
	if not u then
		return;
	end;
	local H = u.CFrame.Position;
	local h = B.Position + Vector3.new(0, 1.35, 0);
	local J = h - H;
	if J.Magnitude <= .01 then
		return;
	end;
	local O = CFrame.lookAt(H, h);
	local S = 1 - math.pow(1 - N, W * 60);
	u.CFrame = u.CFrame:Lerp(O, S);
end;
u.RenderStepped:Connect(function(B)
	if n then
		if os.clock() - F >= O then
			F = os.clock();
			if not o or not o.Parent or not JH(o) then
				o = dH();
			end;
		end;
		if o then
			local W = o:FindFirstChildOfClass("Humanoid");
			local u = hH(o);
			if not W or W.Health <= 0 or not u then
				o = nil;
			else
				gH(u, B);
			end;
		end;
	end;
	if D then
		if os.clock() - U >= O then
			U = os.clock();
			if not t or not t.Parent or not t.Character then
				t = vH();
			end;
		end;
		if t then
			local W = t.Character;
			local u = W and W:FindFirstChildOfClass("Humanoid");
			local H = W and hH(W);
			if not u or u.Health <= 0 or not H then
				t = nil;
			else
				gH(H, B);
			end;
		end;
	end;
end);
G_.Activated:Connect(function()
	k = not k;
	if k then
		G_.Text = "ESP Mobs: ON";
		G_.BackgroundColor3 = a;
		SH();
	else
		G_.Text = "ESP Mobs: OFF";
		G_.BackgroundColor3 = m;
		OH();
		table.clear(K);
		o = nil;
	end;
end);
Q_.Activated:Connect(function()
	z = not z;
	if z then
		Q_.Text = "ESP Players: ON";
		Q_.BackgroundColor3 = Z;
		TH();
	else
		Q_.Text = "ESP Players: OFF";
		Q_.BackgroundColor3 = m;
		YH();
		t = nil;
	end;
end);
l_.Activated:Connect(function()
	n = not n;
	if n then
		l_.Text = "Aimbot Mobs: ON";
		l_.BackgroundColor3 = a;
		o = nil;
		table.clear(K);
		for B, W in ipairs(workspace:GetDescendants()) do
			if JH(W) then
				K[W] = true;
			end;
		end;
	else
		l_.Text = "Aimbot Mobs: OFF";
		l_.BackgroundColor3 = m;
		o = nil;
	end;
end);
s_.Activated:Connect(function()
	D = not D;
	if D then
		s_.Text = "Aimbot Players: ON";
		s_.BackgroundColor3 = Z;
		t = nil;
		table.clear(x);
		for B, W in ipairs(B:GetPlayers()) do
			if W ~= h then
				x[W] = true;
			end;
		end;
	else
		s_.Text = "Aimbot Players: OFF";
		s_.BackgroundColor3 = m;
		t = nil;
	end;
end);
local PH = {
		Brightness = H.Brightness,
		ClockTime = H.ClockTime,
		FogEnd = H.FogEnd,
		GlobalShadows = H.GlobalShadows,
		Ambient = H.Ambient,
		OutdoorAmbient = H.OutdoorAmbient,
	};
f_.Activated:Connect(function()
	E = not E;
	if E then
		f_.Text = "FullBright: ON";
		f_.BackgroundColor3 = R;
		H.Brightness = 3;
		H.ClockTime = 14;
		H.FogEnd = 100000;
		H.GlobalShadows = false;
		H.Ambient = Color3.fromRGB(255, 255, 255);
		H.OutdoorAmbient = Color3.fromRGB(255, 255, 255);
	else
		f_.Text = "FullBright: OFF";
		f_.BackgroundColor3 = m;
		H.Brightness = PH.Brightness;
		H.ClockTime = PH.ClockTime;
		H.FogEnd = PH.FogEnd;
		H.GlobalShadows = PH.GlobalShadows;
		H.Ambient = PH.Ambient;
		H.OutdoorAmbient = PH.OutdoorAmbient;
	end;
end);
local mH = nil;
local function aH()
	local B = h.Character;
	if not B then
		return nil;
	end;
	return B:FindFirstChildOfClass("Humanoid");
end;
local function ZH()
	if not w then
		return;
	end;
	local B = aH();
	if B then
		B.WalkSpeed = l;
	end;
end;
q_.Activated:Connect(function()
	w = not w;
	local B = aH();
	if w then
		if B then
			mH = B.WalkSpeed;
		end;
		q_.Text = "Speed: " .. l;
		q_.BackgroundColor3 = V;
		ZH();
	else
		q_.Text = "Speed: " .. l;
		q_.BackgroundColor3 = m;
		if B then
			if mH then
				B.WalkSpeed = mH;
			else
				B.WalkSpeed = 16;
			end;
		end;
		mH = nil;
	end;
end);
K_.FocusLost:Connect(function()
	local B = tonumber(K_.Text);
	if B then
		l = math.clamp(math.floor(B), 1, y);
	else
		l = S;
	end;
	K_.Text = tostring(l);
	q_.Text = "Speed: " .. l;
	if w then
		ZH();
	end;
end);
local function VH()
	local B = h.Character;
	if not B then
		return nil, nil, nil;
	end;
	local W = B:FindFirstChildOfClass("Humanoid");
	local u = B:FindFirstChild("HumanoidRootPart");
	if not W or not u then
		return nil, nil, nil;
	end;
	return B, W, u;
end;
local function RH()
	if M then
		t_.Text = "Fly: ON";
		t_.BackgroundColor3 = V;
		F_.BackgroundColor3 = V;
		C_.BackgroundColor3 = V;
		e_.BackgroundColor3 = V;
	else
		t_.Text = "Fly: OFF";
		t_.BackgroundColor3 = m;
		F_.BackgroundColor3 = m;
		C_.BackgroundColor3 = m;
		e_.BackgroundColor3 = m;
	end;
end;
local function rH()
	if c then
		c:Disconnect();
		c = nil;
	end;
	if p then
		p:Destroy();
		p = nil;
	end;
	if e then
		e:Destroy();
		e = nil;
	end;
	if C then
		C:Destroy();
		C = nil;
	end;
	G = 0;
end;
local function XH()
	rH();
	local B, W = VH();
	if W then
		W.AutoRotate = true;
		W.PlatformStand = false;
	end;
end;
local function jH()
	if M then
		return;
	end;
	local B, W, H = VH();
	if not B or not W or not H then
		return false;
	end;
	M = true;
	G = 0;
	W.AutoRotate = false;
	W.PlatformStand = false;
	C = Instance.new("Attachment");
	C.Name = "Seraph_FlyAttachment";
	C.Parent = H;
	p = Instance.new("LinearVelocity");
	p.Name = "Seraph_FlyVelocity";
	p.Attachment0 = C;
	p.RelativeTo = Enum.ActuatorRelativeTo.World;
	p.MaxForce = math.huge;
	p.VectorVelocity = Vector3.zero;
	p.Parent = H;
	e = Instance.new("AlignOrientation");
	e.Name = "Seraph_FlyOrientation";
	e.Mode = Enum.OrientationAlignmentMode.OneAttachment;
	e.Attachment0 = C;
	e.RigidityEnabled = false;
	e.Responsiveness = 30;
	e.MaxTorque = math.huge;
	e.Parent = H;
	RH();
	c = u.Heartbeat:Connect(function()
			if not M then
				return;
			end;
			if not H or not H.Parent then
				return;
			end;
			local B = workspace.CurrentCamera;
			if not B then
				return;
			end;
			local u = B.CFrame;
			local h = u.LookVector;
			local J = u.RightVector;
			local N = W.MoveDirection;
			local O = Vector3.new(h.X, 0, h.Z);
			local S = Vector3.new(J.X, 0, J.Z);
			if O.Magnitude > .001 then
				O = O.Unit;
			end;
			if S.Magnitude > .001 then
				S = S.Unit;
			end;
			local y = N:Dot(O);
			local Y = N:Dot(S);
			local T = h * y + J * Y;
			if T.Magnitude > 1 then
				T = T.Unit;
			end;
			local d = math.clamp(Q, g, P);
			local v = T * d + Vector3.new(0, G * d, 0);
			p.VectorVelocity = v;
			e.CFrame = u.Rotation;
		end);
	return true;
end;
t_.Activated:Connect(function()
	if M then
		M = false;
		XH();
		RH();
	else
		if jH() then
			RH();
		end;
	end;
end);
F_.FocusLost:Connect(function()
	local B = tonumber(F_.Text);
	if B then
		Q = math.clamp(math.floor(B), g, P);
	else
		Q = v;
	end;
	F_.Text = tostring(Q);
end);
local function LH(B, W)
	B.InputBegan:Connect(function(B)
		if B.UserInputType == Enum.UserInputType.Touch or B.UserInputType == Enum.UserInputType.MouseButton1 then
			if M then
				G = W;
			end;
		end;
	end);
	B.InputEnded:Connect(function(B)
		if B.UserInputType == Enum.UserInputType.Touch or B.UserInputType == Enum.UserInputType.MouseButton1 then
			if G == W then
				G = 0;
			end;
		end;
	end);
end;
LH(C_, 1);
LH(e_, -1);
local bH = {};
W.InputBegan:Connect(function(B, W)
	if W then
		return;
	end;
	if B.KeyCode == Enum.KeyCode.Space then
		bH.Space = true;
	end;
	if B.KeyCode == Enum.KeyCode.LeftControl then
		bH.LeftControl = true;
	end;
end);
W.InputEnded:Connect(function(B)
	if B.KeyCode == Enum.KeyCode.Space then
		bH.Space = false;
	end;
	if B.KeyCode == Enum.KeyCode.LeftControl then
		bH.LeftControl = false;
	end;
end);
u.Heartbeat:Connect(function()
	if not I then
		return;
	end;
	if G ~= 0 then
		return;
	end;
	local B = 0;
	if bH.Space then
		B += 1;
	end;
	if bH.LeftControl then
		B -= 1;
	end;
	G = B;
end);
local function kH()
	if not A then
		return;
	end;
	local B = h.Character;
	if not B then
		return;
	end;
	local W = B:FindFirstChildOfClass("Humanoid");
	local u = B:FindFirstChild("HumanoidRootPart");
	if not W or not u then
		return;
	end;
	if W.Health <= 0 then
		return;
	end;
	W:ChangeState(Enum.HumanoidStateType.Jumping);
	u.AssemblyLinearVelocity = Vector3.new(0, d, 0);
end;
o_.Activated:Connect(function()
	A = not A;
	if A then
		o_.Text = "FlyJump: ON";
		o_.BackgroundColor3 = V;
	else
		o_.Text = "FlyJump: OFF";
		o_.BackgroundColor3 = m;
	end;
end);
W.JumpRequest:Connect(function()
	if A then
		kH();
	end;
end);
local function zH()
	if not i then
		return;
	end;
	local B = h.Character;
	if not B then
		return;
	end;
	for B, W in ipairs(B:GetDescendants()) do
		if W:IsA("BasePart") then
			W.CanCollide = false;
		end;
	end;
end;
BH.Activated:Connect(function()
	i = not i;
	if i then
		BH.Text = "Noclip: ON";
		BH.BackgroundColor3 = V;
		zH();
	else
		BH.Text = "Noclip: OFF";
		BH.BackgroundColor3 = m;
		local B = h.Character;
		if B then
			for B, W in ipairs(B:GetDescendants()) do
				if W:IsA("BasePart") then
					W.CanCollide = true;
				end;
			end;
		end;
	end;
end);
u.Stepped:Connect(function()
	if i then
		zH();
	end;
end);
local function nH()
	if not I then
		return;
	end;
	local B = h.Character;
	if not B then
		return;
	end;
	local W = B:FindFirstChildOfClass("Humanoid");
	if not W then
		return;
	end;
	if W.Health <= 0 then
		return;
	end;
	if W.Health < W.MaxHealth then
		W.Health = math.min(W.Health + s * .1, W.MaxHealth);
	end;
end;
WH.Activated:Connect(function()
	I = not I;
	if I then
		WH.Text = "Fast Heal: ON";
		WH.BackgroundColor3 = V;
	else
		WH.Text = "Fast Heal: OFF";
		WH.BackgroundColor3 = m;
	end;
end);
uH.FocusLost:Connect(function()
	local B = tonumber(uH.Text);
	if B then
		s = math.clamp(math.floor(B), 1, T);
	else
		s = Y;
	end;
	uH.Text = tostring(s);
end);
task.spawn(function()
	while task.wait(.1) do
		if I then
			nH();
		end;
	end;
end);
task.spawn(function()
	while task.wait(.15) do
		if w then
			ZH();
		end;
	end;
end);
h.CharacterAdded:Connect(function()
	local B = M;
	if M then
		M = false;
		XH();
		RH();
	end;
	task.wait(.5);
	if w then
		local B = aH();
		if B then
			mH = B.WalkSpeed;
			B.WalkSpeed = l;
		end;
	end;
	if i then
		zH();
	end;
	if I then
		task.wait(.2);
		nH();
	end;
	if B then
		task.wait(.3);
		if h.Character then
			jH();
		end;
	end;
end);
local DH = Instance.new("ImageButton");
DH.Name = "SeraphCircle";
DH.Size = UDim2.new(0, 58, 0, 58);
DH.Position = UDim2.new(0, 20, .5, -29);
DH.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
DH.BackgroundTransparency = .15;
DH.Image = "rbxassetid://76079354740264";
DH.ImageTransparency = 0;
DH.ScaleType = Enum.ScaleType.Fit;
DH.BorderSizePixel = 0;
DH.ZIndex = 200;
DH.Visible = false;
DH.Parent = rn;
local EH = Instance.new("UICorner");
EH.CornerRadius = UDim.new(1, 0);
EH.Parent = DH;
zn(DH, 2, 0);
Fn.Activated:Connect(function()
	Xn.Visible = false;
	DH.Visible = true;
end);
DH.Activated:Connect(function()
	DH.Visible = false;
	Xn.Visible = true;
end);
local function wH(B, u)
	local H = false;
	local h;
	local J;
	u.InputBegan:Connect(function(W)
		if W.UserInputType == Enum.UserInputType.MouseButton1 or W.UserInputType == Enum.UserInputType.Touch then
			H = true;
			h = W.Position;
			J = B.Position;
		end;
	end);
	W.InputChanged:Connect(function(W)
		if not H then
			return;
		end;
		if W.UserInputType ~= Enum.UserInputType.MouseMovement and W.UserInputType ~= Enum.UserInputType.Touch then
			return;
		end;
		local u = W.Position - h;
		B.Position = UDim2.new(J.X.Scale, J.X.Offset + u.X, J.Y.Scale, J.Y.Offset + u.Y);
	end);
	W.InputEnded:Connect(function(B)
		if B.UserInputType == Enum.UserInputType.MouseButton1 or B.UserInputType == Enum.UserInputType.Touch then
			H = false;
		end;
	end);
end;
local AH = Instance.new("TextButton");
AH.Name = "DragArea";
AH.Size = UDim2.new(1, -55, 0, 45);
AH.Position = UDim2.new(0, 0, 0, 0);
AH.BackgroundTransparency = 1;
AH.Text = "";
AH.AutoButtonColor = false;
AH.BorderSizePixel = 0;
AH.ZIndex = 125;
AH.Parent = Xn;
wH(Xn, AH);
wH(DH, DH);
X_();
RH();
print("Seraph HUB 1.0 carregado com Fly 360\194\176, 4 temas e sistema central de bordas.");
task.spawn(function()
	local B = 2.8;
	local W = os.clock();
	while os.clock() - W < B do
		local H = math.clamp(((os.clock() - W)) / B, 0, 1);
		mn.Size = UDim2.new(H, 0, 1, 0);
		local h = math.floor(H * 100);
		Zn.Text = tostring(h) .. "%";
		if h < 35 then
			vn.Text = "Inicializando...";
		elseif h < 70 then
			vn.Text = "Carregando recursos...";
		elseif h < 95 then
			vn.Text = "Preparando Seraph HUB...";
		else
			vn.Text = "Conclu\195\173do!";
		end;
		u.RenderStepped:Wait();
	end;
	mn.Size = UDim2.new(1, 0, 1, 0);
	Zn.Text = "100%";
	vn.Text = "Conclu\195\173do!";
	task.wait(.35);
	if Rn then
		Rn:Disconnect();
		Rn = nil;
	end;
	for B = 0, 1, .08 do
		if hn and hn.Parent then
			hn.BackgroundTransparency = B;
		end;
		if Jn and Jn.Parent then
			Jn.BackgroundTransparency = math.clamp(.05 + B, 0, 1);
		end;
		u.RenderStepped:Wait();
	end;
	if Hn then
		Hn:Destroy();
	end;
	print("Seraph HUB: Loading finalizado.");
end);
