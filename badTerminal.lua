local CreateLib = {}
local Memes = {"amogus", "eminem actin real quiet after bambi dropped 'vs dave and bambi' on us", "part limit: exists, vsb players: BAD 😡😡😡😡😡"}
local HttpService = game:GetService("HttpService")
local BaseUrl = "https://console-g.x32gex5.repl.co/%s"
local LangUrl = "https://be-exec.x32gex5.repl.co/%s"
local RequestTypes = {
	ProfileName = "getFileNameForPlayer/%s", -- returns the hashed ID used to get profiles
	CreateProfile = "createProfile/%s/%s", -- used for creating/editing a profile
	ProfileExists = "profileExists/%s/%s", -- used for checking if a profile, %s exists in a type, %s. (types are "auto_profile" and "customization_profile")
	GetProfile = "%s/%s",
	CheckLanguage = "inst?lang=%s",
	ProcessLanguage = "run?lang=%s&code=%s"
}
function GetWeb(Type,...)
	return HttpService:GetAsync((BaseUrl:format(RequestTypes[Type])):format(...))
end
function GetLang(Type,...)
	local base2 = LangUrl:format(RequestTypes[Type])
	return HttpService:GetAsync(string.format(base2,...))
end
local UserWebId = GetWeb("ProfileName",owner.Name)
local FileExists = GetWeb("ProfileExists","customization_profile",UserWebId)
local FileExists2 = GetWeb("ProfileExists","auto_profile",UserWebId)
local Language = "lua"
local CustomizationProfileWarning = false
local AutoProfileWarning = false
local Customization
local AutoProfile
function SaveCustomization()
	GetWeb("CreateProfile","customization_profile",HttpService:UrlEncode(HttpService:JSONEncode(Customization)))
end
function SaveAuto()
	GetWeb("CreateProfile","auto_profile",HttpService:UrlEncode(HttpService:JSONEncode(AutoProfile)))
end
if FileExists == "true" then
	Customization = GetWeb("GetProfile","customization_profile",UserWebId..".json")
	Customization = HttpService:JSONDecode(Customization)
elseif FileExists == "false" then
	Customization = {
		player = owner.Name,
		aero = false,
		color = {0,0,0}
	}
	CustomizationProfileWarning = true
	SaveCustomization()
end
if FileExists2 == "true" then
	AutoProfile = GetWeb("GetProfile","auto_profile",UserWebId..".json")
	AutoProfile = HttpService:JSONDecode(AutoProfile)
elseif FileExists2 == "false" then
	AutoProfile = {
		player = owner.Name,
		commands = {}
	}
	AutoProfileWarning = true
	SaveAuto()
end
function CreateLib:MassApplyProperties(Instance,Properties)
	for i,v in pairs(Properties) do
		Instance[i] = v
	end
end
local AdditionalScreensAmount = 0
local MainScreen = nil
local Update = true
function CreateLib:CreateLockedScreen(LockCFrame,Type)
	local inst = {}
	inst['Part0'] = Instance.new("Part")
	inst['Part0'].Parent = script
	inst['Part0'].CFrame = CFrame.new(41.375, 4.125, -52.375, 0, 0, 1, 0, 1, 0, -1, 0, 0)
	inst['Part0'].Orientation = Vector3.new(0, 90, 0)
	inst['Part0'].Position = Vector3.new(41.375, 4.125, -52.375)
	inst['Part0'].Rotation = Vector3.new(0, 90, 0)
	inst['Part0'].Color = Color3.fromRGB(Customization.color[1],Customization.color[1],Customization.color[1])
	inst['Part0'].Transparency = ((Customization.aero == true) and 0.5) or 0
	inst['Part0'].Size = Vector3.new(6.75, 4.25, 0.05)
	inst['Part0'].BottomSurface = Enum.SurfaceType.Smooth
	inst['Part0'].Material = Enum.Material.Neon
	inst['Part0'].TopSurface = Enum.SurfaceType.Smooth
	local Screen = inst.Part0
	local sg = Instance.new("SurfaceGui",Screen)
	sg.Face = Enum.NormalId.Back
	sg.LightInfluence = 0
	sg.PixelsPerStud = 100
	sg.Adornee = Screen
	local frame = Instance.new("ScrollingFrame",sg)
	frame.Size = UDim2.new(1,0,1,0)
	frame.BackgroundTransparency = 1
	frame.ScrollBarThickness = 0
	frame.BottomImage = ""
	frame.MidImage = ""
	frame.TopImage = ""
	frame.AutomaticSize = Enum.AutomaticSize.Y
	frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	local context = Instance.new("TextBox",frame)
	context.MultiLine = true
	context.TextYAlignment = "Top"
	context.TextXAlignment = "Left"
	context.Text = ""
	context.Font = "Code"
	context.TextSize = 16
	context.TextWrapped = true
	context.Size = UDim2.new(1,0,1,0)
	context.AutomaticSize = Enum.AutomaticSize.Y
	context.BackgroundTransparency = 1
	context.RichText = true
	context.TextColor3 = Color3.new(1,1,1)
	Screen.Anchored = true
	CreateLib:MassApplyProperties(Screen,{CanCollide=false,CanTouch=false,CanQuery=false,CastShadow=false})
	task.spawn(function()
		while true do
			local sine = tick()*60
			if Update==true then
				if Type == "Main" then
					MainScreen = Screen
					Screen.CFrame = Screen.CFrame:Lerp(owner.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, -5) * CFrame.Angles(math.rad(15),0,0),.15)
				else
					if MainScreen and MainScreen:IsA("BasePart") then
						Screen.CFrame = MainScreen.CFrame * LockCFrame
					end
				end
			end
			task.wait()
		end
	end)
	return context,Screen
end
function applyProperties(screen)
	local color = Customization.color
	local aero = Customization.aero
	screen.Color = Color3.fromRGB(color[1],color[2],color[3])
	screen.Transparency = ((aero == true) and 0.5) or 0
end
local consoleText1,console1 = CreateLib:CreateLockedScreen(nil,"Main")
local consoleText2,console2 = CreateLib:CreateLockedScreen(CFrame.new(-7, 0, 1, 0.965925813, 0, 0.258819044, 0, 1, 0, -0.258819044, 0, 0.965925813),"Additional")
local consoleText3,console3 = CreateLib:CreateLockedScreen(CFrame.new(7, 0, 1, -0.965925813, 0, 0.258819163, 0, 1, 0, -0.258819163, 0, -0.965925813) * CFrame.Angles(0,math.rad(180),0),"Additional")
local warning_text = "<font color='rgb(255,142,60)'>%s</font>"
local print_text = "<font color='rgb(%s,%s,%s)'>%s</font>"
local function warn(text,textbox)
	textbox.Text ..= warning_text:format(text).."\n"
end
function globalProperty()
	applyProperties(console1)
	applyProperties(console2)
	applyProperties(console3)
end
local dp = print
local function print(color,textbox,text)
	local r,g,b = color.r*255,color.g*255,color.b*255
	textbox.Text ..= print_text:format(math.round(r),math.round(g),math.round(b),text).."\n"
end
if CustomizationProfileWarning then
	warn("Customization profile was not found. Default will be used.",consoleText3)
else
	print(Color3.new(0, 0.670588, 0),consoleText2,"Imported customization profile successfully.")
end
if AutoProfileWarning then
	warn("Autorun profile was not found. Default will be used.",consoleText3)
else
	print(Color3.new(0, 0.670588, 0),consoleText2,"Imported autorun profile successfully.")
end
function toboolean(var)
	return tostring(var)=="true"
end
local answer1 = "no"
local answered = false
function read_module_meta(modname)
	local mod = GetWeb("GetProfile","modules_meta",modname)
	if mod then
		return HttpService:JSONDecode(mod)
	else
		return {}
	end
end
function propify(str)
	local l = str:sub(1,1)
	local r = str:sub(2,#str)
	return l:upper()..r
end
local InstalledModules = {}
Values = {
	Screen1 = consoleText2,
	ScreenMain = consoleText1,
	Screen2 = consoleText3,
	ScreenMain2 = console1,
	CustomPrint = print
}
local thisProxy = newproxy(true)
local thism = getmetatable(thisProxy)
thism.__tostring = function(self)
	return Memes[Random.new():NextInteger(1,#Memes)]
end
this = setmetatable({},thism)
local comments1 = {
	aero = "Changes whether the console windows are transparent or not.",
	color = "Self explanatory, changes console color.",
	import = "Imports a module (otherwise called package)",
	lock = "Locks the windows.",
	meta = "Pulls and shows metadata for installed module.",
	auto = "Specifies automatic commands that are ran on startup. (Usage: \"auto command!args command2!args!args\" etc.)",
	help = "Shows these comments.",
	rs = "Runs lua code (or language chosen by lang)",
	print = "Prints, I think you should know that.",
	lang = "Switches the online compiler."
}
Commands = {
	["aero"] = function(args)
		local val = args[1]
		Customization.aero = toboolean(val)
		globalProperty()
		print(Color3.new(0, 0.65098, 1),consoleText1,"Aero was set to "..val.." successfully.")
		SaveCustomization()
	end,
	["color"] = function(args)
		local r,g,b = args[1],args[2],args[3]
		Customization.color = {r,g,b}
		globalProperty()
		print(Color3.new(0, 0.65098, 1),consoleText1,"Changed screen color successfully.")
		SaveCustomization()
	end,
	["import"] = function(args)
		local module = args[1]
		local mod = GetWeb("GetProfile","modules",module..".lua")
		if mod then
			table.insert(InstalledModules,module..".lua")
			local bro = loadstring(mod)
			local renv = getfenv(bro)
			local nenv = setmetatable({},{
				__index = function(self,i)
					if i == "NLS" then
						return function(s,p)
							print(Color3.new(1,1,1),consoleText1,module.." is requesting a localscript. Allow (req [yes/no])")
							repeat task.wait() until answered == true
							if answer1 == "yes" then
								local ae1 = {IsAllowed=true,Reason=""}
								local ls = NLS(s,p)
								return setmetatable({},{
									__index = function(self,i)
										if ae1[i] then
											return ae1[i]
										else
											return ls[i]
										end
									end
								})
							else
								return {IsAllowed=false,Reason="User blocked request."}
							end
						end
					else
						return renv[i]
					end
				end,
			})
			setfenv(bro,nenv)
			bro()
		else
			print(Color3.new(1, 0, 0),consoleText1,"Failed to import \""..module.."\"")
		end
	end,
	["lock"] = function(args)
		local val = toboolean(args[1])
		val = not val
		dp(args[1],val)
		Update = val
		local message = ""
		if val == false then
			message = "Locked"
		else
			message = "Unlocked"
		end
		print(Color3.new(0.701961, 1, 0),consoleText1,message)
	end,
	["meta"] = function(args)
		local module = args[1]
		if table.find(InstalledModules,module..".lua") then
			local metadata = read_module_meta(module..".json")
			print(Color3.new(0, 1, 0.282353),consoleText2,"Module metadata for <b>"..module.."</b>: {")
			for i,v in pairs(metadata) do
				local Proper = i
				if type(v) == "table" then
					print(Color3.new(0.666667, 0, 1),consoleText2,"    "..Proper..": {")
					for j,w in pairs(v) do
						if j ~= #v then
							print(Color3.new(0.447059, 0.501961, 1),consoleText2,"        "..w..",")
						else
							print(Color3.new(0.447059, 0.501961, 1),consoleText2,"        "..w)
						end
					end
					print(Color3.new(0.666667, 0, 1),consoleText2,"    }")
				else
					if i ~= #metadata then
						if type(v) == "string" then
							print(Color3.new(0.666667, 0, 1),consoleText2,"    "..Proper..": \""..v.."\",")
						else
							print(Color3.new(0.666667, 0, 1),consoleText2,"    "..Proper..": "..v..",")
						end
					else
						if type(v) == "string" then
							print(Color3.new(0.666667, 0, 1),consoleText2,"    "..Proper..": \""..v.."\"")
						else
							print(Color3.new(0.666667, 0, 1),consoleText2,"    "..Proper..": "..v)
						end
					end
				end
			end
			print(Color3.new(0, 1, 0.282353),consoleText2,"}")
		end
	end,
	["auto"] = function(args)
		AutoProfile.commands = {}
		for i,v in pairs(args) do
			local arg = string.gsub(v,"_"," ")
			table.insert(AutoProfile.commands,arg)
		end
		SaveAuto()
	end,
	["rs"] = function(args)
		local ls = ""
		for i,v in pairs(args) do
			ls ..= v.." "
		end
		ls = string.sub(ls,1,#ls-1)
		if Language == "lua" then
			local c = loadstring(ls)
			local renv = getfenv(c)
			local nenv = setmetatable({},{
				__index = function(self,i)
					if i == "print" then
						return function(...)
							local ttt = ""
							for i,v in pairs({...}) do
								ttt ..= tostring(v).." "
							end
							print(Color3.new(1,1,1),consoleText1,ttt)
						end
					else
						return renv[i]
					end
				end,
			})
			setfenv(c,nenv)
			c()
		else
			local stdout = GetLang("ProcessLanguage",HttpService:UrlEncode(Language),HttpService:UrlEncode(ls))
			local function cprint(...)
				local ttt = ""
				for i,v in pairs({...}) do
					ttt ..= tostring(v).." "
				end
				print(Color3.new(1,1,1),consoleText1,ttt)
			end
			cprint(stdout)
		end
	end,
	["clr"] = function(args)
		local scr = args[1]
		if scr == "1" then
			consoleText1.Text = ""
		elseif scr == "2" then
			consoleText2.Text = ""
		elseif scr == "3" then
			consoleText3.Text = ""
		else
			consoleText1.Text = ""
			consoleText2.Text = ""
			consoleText3.Text = ""
		end
	end,
	["print"] = function(args)
		local con = ""
		for i,v in pairs(args) do
			if string.sub(v,1,1) == "$" then
				local maybevar = string.sub(v,2,#v)
				local e = getfenv(1)
				if maybevar[e] then
					con ..= tostring(maybevar[e])
				else
					con ..= "null"
				end
			else
				con ..= tostring(v)
			end
		end
		print(Color3.new(1,1,1),consoleText1,con)
	end,
	["req"] = function(args)
		answer1 = args[1]
		task.spawn(function()
			answered = true
			task.wait(.1)
			answered = false
		end)
	end,
	["lang"] = function(args)
		local l = HttpService:UrlEncode(args[1])
		if GetLang("CheckLanguage",l) == "true" then
			Language = args[1]
			print(Color3.new(0,0.5,1),consoleText1,"lang: switched language to <font color=\"#00D1FF\">"..propify(Language).."</font>.")
		else
			print(Color3.new(1,0,0),consoleText1,"lang: invalid language")
		end
	end,
}
local helptext = "%s: %s"
Commands["help"] = function(args)
	for i,v in pairs(Commands) do
		if comments1[i] then
			print(Color3.new(0.968627, 0, 1),consoleText1,helptext:format(i,comments1[i]))
		end
	end
	print(Color3.new(0.968627, 0, 1),consoleText1,helptext:format("help",comments1.help))
end
local textboxgaming = Instance.new("ScreenGui")
textboxgaming.Name = "textboxgaming"
textboxgaming.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local textboxframe = Instance.new("Frame")
textboxframe.Name = "textboxframe"
textboxframe.Size = UDim2.new(0.9124088, 0, 0.0321543, 0)
textboxframe.Position = UDim2.new(0.0437956, 0, 0.937299, 0)
textboxframe.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
textboxframe.Parent = textboxgaming

local actualbox = Instance.new("TextBox")
actualbox.Name = "actualbox"
actualbox.Size = UDim2.new(1, 0, 1, 0)
actualbox.BackgroundTransparency = 1
actualbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
actualbox.FontSize = Enum.FontSize.Size24
actualbox.TextStrokeColor3 = Color3.fromRGB(200, 200, 200)
actualbox.TextStrokeTransparency = 0.8
actualbox.MultiLine = true
actualbox.TextWrapped = true
actualbox.TextSize = 20
actualbox.TextWrap = true
actualbox.TextColor3 = Color3.fromRGB(255, 255, 255)
actualbox.Text = ""
actualbox.Font = Enum.Font.SourceSans
actualbox.TextXAlignment = Enum.TextXAlignment.Left
actualbox.Parent = textboxframe

local highlight = Instance.new("Frame")
highlight.Name = "highlight"
highlight.Size = UDim2.new(1, 0, 0.1, 0)
highlight.Position = UDim2.new(-0.0002044, 0, 0.9678457, 0)
highlight.BorderSizePixel = 0
highlight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
highlight.Parent = textboxframe

local sendgaming = Instance.new("TextButton")
sendgaming.Name = "sendgaming"
sendgaming.Size = UDim2.new(0.025, 0, 1, 0)
sendgaming.Position = UDim2.new(0.975, 0, 0, 0)
sendgaming.BorderSizePixel = 0
sendgaming.BackgroundColor3 = Color3.fromRGB(10, 255, 6)
sendgaming.FontSize = Enum.FontSize.Size14
sendgaming.TextSize = 14
sendgaming.TextColor3 = Color3.fromRGB(255, 255, 255)
sendgaming.Text = ">"
sendgaming.TextWrapped = true
sendgaming.Font = Enum.Font.SourceSans
sendgaming.TextWrap = true
sendgaming.TextScaled = true
sendgaming.Parent = textboxframe

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = sendgaming

local remotegaming = Instance.new("RemoteEvent")
remotegaming.Name = "remotegaming"
remotegaming.Parent = textboxgaming

textboxgaming.Parent = owner.PlayerGui
NLS([[
local textbox = script.Parent.Parent.textboxframe
local button = textbox.sendgaming
local remote = script.Parent
textbox.Visible = false
coroutine.resume(coroutine.create(function()
	while true do
		local s = tick()*60
		textbox.highlight.BackgroundColor3 = Color3.fromHSV(0, 1, math.abs(0.5*math.sin(s/45)))
		button.BackgroundColor3 = Color3.fromHSV(0, 1, math.abs(0.5*math.sin(s/45)))
		task.wait()
	end
end))
local UIS = game:GetService("UserInputService")
local function onVisible()
	textbox.actualbox:CaptureFocus()
end
local function onInvisible()
	textbox.Visible = true
	remote:FireServer("enter","")
	coroutine.resume(coroutine.create(function()
	textbox:TweenPosition(
		UDim2.new(0.0437956192,0,1.5,0),
		Enum.EasingDirection.In,
		Enum.EasingStyle.Sine,
		.5)
	wait(.5)
	textbox.Visible = false
	end))
end
textbox.actualbox.Changed:Connect(function(prop)
	if prop == "Text" then
		remote:FireServer("text",textbox.actualbox.Text)
	end
end)
textbox.actualbox.FocusLost:Connect(onInvisible)
button.MouseButton1Click:Connect(onInvisible)
UIS.InputBegan:Connect(function(input, a)
	if a then
		return
	end
	if input.KeyCode == Enum.KeyCode.E then
		textbox.Visible = not textbox.Visible
		if textbox.Visible then
			coroutine.resume(coroutine.create(function()
			textbox.Position = UDim2.new(0.0437956192,0,1.5,0)
			textbox:TweenPosition(
				UDim2.new(0.0437956192, 0, 0.937299013, 0),
				Enum.EasingDirection.In,
				Enum.EasingStyle.Sine,
				.5, false, onVisible)
				remote:FireServer("start","")
			end))
		else
			onInvisible()
		end
	end
end)
]],remotegaming)
local typing = false
local textram = ""
local inputtext = ""
function Interp(text)
	local eee = text:split" "
	for i,v in pairs(Commands) do
		if eee[1] == i then
			local args = {}
			for j = 2,#eee do
				table.insert(args,eee[j])
			end
			v(args)
			return
		end
	end
	print(Color3.new(1, 0, 0),consoleText1,eee[1].." is not a valid command or module.")
end
xpcall(function()
	for i,v in pairs(AutoProfile.commands) do
		Interp(v)
	end
end,function()
	print(Color3.new(1, 0, 0),consoleText2,"Could not load autorun commands.")
end)
remotegaming.OnServerEvent:Connect(function(plr,typ,text)
	if typ == "start" then
		typing = true
		textram = consoleText1.Text
	end
	if typ == "text" then
		local t3 = text
		inputtext = text
		consoleText1.Text = textram..t3
	elseif typ == "enter" then
		consoleText1.Text = consoleText1.Text .. "\n"
		typing = false
		if inputtext ~= "" then
			Interp(inputtext)
		end
	end
end)