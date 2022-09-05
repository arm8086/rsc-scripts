script.Name = "xterminals"
local function require(url)
	return loadstring(game:GetService("HttpService"):GetAsync(url))
end
local halt = false
local stm = "VSH Terminal v1.4"
local changelogs = {
	"+ Added file API for packages",
}
local xyzwabc = tick()
NULL = 0
null = nil
local part = Instance.new("Part",script)
part.Name = "btermx"
part.Size = Vector3.new(9.6,4.8,1)
part.Transparency = 1
part.Anchored = true
part.CanCollide = false
part.CFrame = owner.Character.HumanoidRootPart.CFrame*CFrame.new(0,2,-5)
local bterm = Instance.new("SurfaceGui")
bterm.Name = "bterm"
bterm.SizingMode = Enum.SurfaceGuiSizingMode.FixedSize
bterm.CanvasSize = Vector2.new(960,480)
bterm.Face = Enum.NormalId.Back
bterm.Adornee = part
local btm = Instance.new("Frame")
btm.Name = "btm"
btm.Size = UDim2.new(1,0,1,0)
btm.Position = UDim2.new(0,0,0,0)
btm.BorderSizePixel = 0
btm.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
btm.Parent = bterm
local TS = Instance.new("ScrollingFrame")
TS.Name = "TS"
TS.Size = UDim2.new(1,0,1,0)
TS.Position = UDim2.new(0,0,0,0)
TS.Active = true
TS.BorderSizePixel = 0
TS.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
TS.AutomaticCanvasSize = Enum.AutomaticSize.Y
TS.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
TS.Parent = btm
local Terminal = Instance.new("TextBox")
Terminal.Name = "Terminal"
Terminal.AutomaticSize = Enum.AutomaticSize.XY
Terminal.Size = UDim2.new(1, 0, 1, 0)
Terminal.BorderSizePixel = 0
Terminal.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
Terminal.FontSize = Enum.FontSize.Size14
Terminal.TextYAlignment = Enum.TextYAlignment.Top
Terminal.TextSize = 14
Terminal.RichText = true
Terminal.TextTruncate = Enum.TextTruncate.AtEnd
Terminal.TextColor3 = Color3.fromRGB(255, 255, 255)
Terminal.Text = ""
Terminal.MultiLine = true
Terminal.Font = Enum.Font.Code
Terminal.TextXAlignment = Enum.TextXAlignment.Left
Terminal.Parent = TS
bterm.Parent = part
local com = {}
local f = "<font color='rgb(22, 198, 12)'>%s</font>:<font color='rgb(59,120,255)'>%s</font>$ "
local p = "~"
local un = owner.Name:lower().."@vsb"
local captured = false
function key()
	local s = ""
	for i = 1,8 do
		if math.random(1,2) == 1 then
			s ..= string.char(math.random(48,57))
		else
			s ..= string.char(math.random(97,122))
		end
	end
	return s
end
local rocon = { -- if anything is corrupted, it will be changed to this value (unless it is the verify key, then the system will halt.)
	key()
}
local unconnected = { -- disconnected media (verification key)
	rocon[1]
}
function brh() local s = "" for i = 1,64 do s ..= string.char(math.random(0,128)) end return s end
local stuf = {
	dev = {
		urandom = {Content = brh()},
		["null"] = {Content = string.rep("\0",64)}
	},
	home = {
		[un:split("@")[1]] = {
			["FSTest"] = {FileSize = math.random(0,1000), Content = ""}
		}
	}
}
stuf.home[un:split("@")[1]].FSTest.Content = stuf.dev.urandom.Content
stuf["~"] = stuf.home[un]
com.neofetch = function(arg)
	local uptime = os.date("!%X",tick()-xyzwabc)
	local str = [[<font color='rgb(255,0,0)'>      +*+=-:.                      </font>]]..un..[[
<font color='rgb(255,0,0)'>     .#########*+=-:.              </font>-----------
<font color='rgb(255,0,0)'>     +#################*+=-:.      </font>Model: Docker Customized Container None
<font color='rgb(255,0,0)'>    :##########################=   </font>OS: voidl 1
<font color='rgb(255,0,0)'>    *##########################:   </font>Kernel: ]].._VERSION..[[

<font color='rgb(255,0,0)'>   :##########################*    </font>Uptime: ]]..uptime..[[

<font color='rgb(255,0,0)'>   *##########-=+*############:    </font>Packages: 1
<font color='rgb(255,0,0)'>  :##########=    .##########*     </font>Shell: vsh 1.0
<font color='rgb(255,0,0)'>  *##########     =##########:     </font>Resolution: 960x480
<font color='rgb(255,0,0)'> :############*+==##########*      </font>DE: None
<font color='rgb(255,0,0)'> *##########################.      </font>WM: None
<font color='rgb(255,0,0)'>:##########################+       </font>WM Theme: None
<font color='rgb(255,0,0)'>+##########################.       </font>Theme: None
<font color='rgb(255,0,0)'>   .:-=+*#################+        </font>Icons: None
<font color='rgb(255,0,0)'>           .:-=+*#########.        </font>Terminal: bterm
<font color='rgb(255,0,0)'>                  .:-=+*+         </font><font color='rgb(0,0,0)'>█</font><font color='rgb(255,0,0)'>█</font><font color='rgb(0,255,0)'>█</font><font color='rgb(255,255,0)'>█</font><font color='rgb(0,0,255)'>█</font><font color='rgb(128,0,128)'>█</font><font color='rgb(0,255,255)'>█</font><font color='rgb(255,255,255)'>█</font>]]
	Terminal.Text ..= str.."\n"
end
function pathparse(t)
	local root = stuf
	t = t:gsub("~", "/home/"..un:split("@")[1])
	if t:sub(1,1) == "/" then
		t = t:sub(2, #t)
	end
	print(t)
	for i,v in pairs(t:split("/")) do
		root = root[v]
	end
	return root
end
com["#SYSCALL#1#"] = function(arg)
	stuf.dev[arg[2]] = {Content = unconnected[arg[1]]}
	task.spawn(function()
		while true do
			unconnected[arg[1]] = stuf.dev[arg[2]]
			task.wait(1)
		end
	end)
end
function reflect(a,b)
	if a ~= b then
		return false
	else
		return true
	end
end
function boot()
	Terminal.Text ..= "mount dm-verity\n"
	com["#SYSCALL#1#"]({1,"dm-verity"})
	Terminal.Text ..= "check key\n"
	local verified = reflect(rocon[1],stuf.dev["dm-verity"].Content)
	if not verified then
		Terminal.Text = "The system cannot be verified. HALT!"
		return false
	else
		stuf.dev.urandom = {Content = brh()}
		return true
	end
end
local events = {typing = false,xprint = function(...)
	local x = table.concat({...}," ")
	Terminal.Text ..= x.."\n"
	TS.CanvasPosition += Vector2.new(0,14)
end, ids = {}, path = p, setfile = function(path, contents)
	local sp = path:split("/")
	local filename = table.remove(sp, #sp)
	local cwd = pathparse(table.concat(sp, "/"))
	cwd[filename] = {Content = contents}
end, readfile = function(path)
	local sp = path:split("/")
	local filename = table.remove(sp, #sp)
	local cwd = pathparse(table.concat(sp, "/"))
	return cwd[filename].Content
end, ["pathparse"] = pathparse}
com.echo = function(arg)
	local j = arg
	table.remove(j,1)
	local str = string.gsub(table.concat(j," "),"\"","")
	Terminal.Text ..= str.."\n"
end
com.ls = function(arg)
	local realpath = string.gsub(p,"~","/home/"..un:split("@")[1])
	print(realpath)
	Terminal.Text ..= "File contents of "..realpath..":\n"
	Terminal.Text ..= "File name ######## File size / Directory count number\n"
	for i,v in pairs(pathparse(realpath)) do
		if v.FileSize then
			Terminal.Text ..= i.."        "..tostring(v.FileSize).."\n"
		else
			Terminal.Text ..= i.."        "..tostring(#v).."\n"
		end
	end
end
com.cat = function(arg)
	local path = arg[2]:gsub("~","/home/"..un:split("@")[1])
	print(path)
	local p = pathparse(path)
	if p.Content then
		Terminal.Text ..= p.Content.."\n"
	else
		Terminal.Text ..= "Argument is not a path\n"
	end
end
com.set = function(arg)
	local z = arg[2]:gsub("~","/home/"..un:split("@")[1])
	table.remove(arg,1)
	table.remove(arg,2)
	print(z)
	local p = pathparse(z)
	if p.Content then
		p.Content = table.concat(arg," ")
	end
end
com.cd = function(arg)
	if pathparse(arg[2]) then
		p = arg[2]
		events.path = p
	end
end

local packagelist = ""
local installedPackages = {}
com.reboot = function(arg)
	Terminal.Text = ""
	local x = boot()
	if x == false then
		halt = true
	else
		events.xprint(stm)
		events.xprint("Changelogs:")
		for _,log in changelogs do
			events.xprint(log)
		end
		com.vpe = function(arg)
			local m = arg[2]
			local m2 = arg[3]
			local o = arg[4]
			if m == "install" then
				if packagelist == "" then
					events.xprint("vpe: Updating package list...\nget https://cdn.atom24.tk/?path=vpe/pl.json")
					packagelist = game:GetService("HttpService"):GetAsync("https://cdn.atom24.tk/?path=vpe/pl.json")
				end
				local a = game:GetService("HttpService"):JSONDecode(packagelist)
				if a.packages[m2] then
					if installedPackages[m2] then
						if o == "--upgrade" then
							events.xprint("get "..a.packages[m2])
							local pkg = game:GetService("HttpService"):GetAsync(a.packages[m2])
							loadstring(pkg)(com,owner,Terminal,events)
							events.xprint("upgraded "..m2)
							return
						end
						events.xprint(m2.." is already installed. To reinstall run 'vpe install "..m2.." --upgrade'")
						return
					end
					events.xprint("get "..a.packages[m2])
					local pkg = game:GetService("HttpService"):GetAsync(a.packages[m2])
					loadstring(pkg)(com,owner,Terminal,events)
					Terminal.Text ..= "installed "..m2.."\n"
					installedPackages[m2] = true
				else
					events.xprint("vpe: Could not find package "..m2.." in list.")
					return
				end
			else
				events.xprint("vpe: vsh's builtin package manager.")
				return
			end
		end
	end
end
com.hide = function(arg)
	Terminal.TextTransparency = 1
	bterm.Enabled = false
end
com.show = function(arg)
	Terminal.TextTransparency = 0
	bterm.Enabled = true
end
com.vpe = function(arg)
	local m = arg[2]
	local m2 = arg[3]
	local o = arg[4]
	if m == "install" then
		if packagelist == "" then
			events.xprint"vpe: Updating package list...\nget https://cdn.virtualcoffee.tk/?path=vpe/pl.json"
			packagelist = game:GetService("HttpService"):GetAsync("https://cdn.virtualcoffee.tk/?path=vpe/pl.json")
		end
		local a = game:GetService("HttpService"):JSONDecode(packagelist)
		if a.packages[m2] then
			if installedPackages[m2] then
				if o == "--upgrade" then
					events.xprint("get "..a.packages[m2])
					local pkg = game:GetService("HttpService"):GetAsync(a.packages[m2])
					loadstring(pkg)(com,owner,Terminal,events)
					Terminal.Text ..= "upgraded "..m2.."\n"
					return
				end
				events.xprint(m2.." is already installed. To reinstall run 'vpe install "..m2.." --upgrade'")
				return
			end
			events.xprint("get "..a.packages[m2])
			local pkg = game:GetService("HttpService"):GetAsync(a.packages[m2])
			loadstring(pkg)(com,owner,Terminal,events)
			Terminal.Text ..= "installed "..m2.."\n"
			installedPackages[m2] = true
		else
			events.xprint("vpe: Could not find package "..m2.." in list.")
			return
		end
	else
		events.xprint("vpe: vsh's builtin package manager.")
		return
	end
end
function eve()
	Terminal.Text = "welcome to evl (emergency vsh loader)\nthis is an emergency terminal which can be used to recover your system.\n"
	un = "evl"
	p = "/"
	com.vpe = nil
end
local textboxgaming = Instance.new("ScreenGui")
textboxgaming.Name = "textboxgaming"
textboxgaming.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local textboxframe = Instance.new("Frame")
textboxframe.Name = "textboxframe"
textboxframe.Transparency = 1
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
actualbox.TextWrapped = true
actualbox.TextSize = 20
actualbox.TextWrap = true
actualbox.TextColor3 = Color3.fromRGB(255, 255, 255)
actualbox.Text = ""
actualbox.TextTransparency = 1
actualbox.Font = Enum.Font.SourceSans
actualbox.TextXAlignment = Enum.TextXAlignment.Left
actualbox.Parent = textboxframe

local remotegaming = Instance.new("RemoteEvent")
remotegaming.Name = "remotegaming"
remotegaming.Parent = textboxgaming

textboxgaming.Parent = owner.PlayerGui
com.touch = function(arg)
	local pat = pathparse(p)
	local filename = arg[2]
	pat[filename] = {Content = ""}
end
local editing = false
local combo = ""
local filetypes = {
	vxm = "compiled system module",
	lua = "lua script",
	cpp = "c++ script",
	vsh = "shell script"
}
local editedLine = ""
local arrowup = false
local edit_enter = false
local arrowdown = false
local oldws = 16
com.nano = function(arg)
	oldws = owner.Character.Humanoid.WalkSpeed
	editing = true
	owner.Character.Humanoid.WalkSpeed = 0
	local pth = pathparse(arg[2])
	local ae = arg[2]:split("/")
	local cwd = pathparse(ae[#ae-1])
	local TextBuffer = Terminal.Text
	local extension = filetypes[ae[#ae]:split(".")[2]] or nil
	local h1 = "GNU nano for void        Line: %s        File Format: %s"
	local Text = pth.Content or ""
	local TextLines = string.split(Text, "\n")
	local NewText = ""
	local CurrentLine = 1
	actualbox.Text = TextLines[CurrentLine]
	while true do
		local ft = "None"
		if extension then
			ft = extension
		end
		local BuiltText = h1:format(CurrentLine, ft).."\n"
		local oldline = CurrentLine
		if arrowup == true then
			arrowup = false
			CurrentLine = math.clamp(CurrentLine-1, 1, #TextLines)
		end
		if arrowdown == true then
			arrowdown = false
			CurrentLine = math.clamp(CurrentLine+1, 1, #TextLines)
		end
		if edit_enter == true then
			edit_enter = false
			TextLines[#TextLines+1] = ""
			CurrentLine = math.clamp(CurrentLine+1, 1, #TextLines)
			editedLine = ""
		end
		if CurrentLine ~= oldline then
			actualbox.Text = TextLines[CurrentLine]
		end
		TextLines[CurrentLine] = editedLine
		BuiltText = BuiltText..table.concat(TextLines, "\n").."\n^X: save+exit"
		Terminal.Text = BuiltText.."\n"
		if combo == "X" then
			NewText = table.concat(TextLines, "\n")
			break
		end
		task.wait()
	end
	cwd[ae[#ae]] = {Content = NewText}
	owner.Character.Humanoid.WalkSpeed = oldws
	editing = false
	Terminal.Text = TextBuffer
end

NLS([[
local textbox = script.Parent.Parent.textboxframe
local remote = script.Parent
textbox.Visible = false
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
UIS.InputBegan:Connect(function(input, a)
	if a then
		return
	end
	if (input.KeyCode == Enum.KeyCode.Eight) or (input.KeyCode == Enum.KeyCode.Two) or (input.KeyCode == Enum.KeyCode.One) or (input.KeyCode == Enum.KeyCode.Four) then
		remote:FireServer("8882124",game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode))
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
	if input.KeyCode == Enum.KeyCode.X and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
		print("KeyCombo")
		remote:FireServer("KeyCombo", "X")
	end
	if input.KeyCode == Enum.KeyCode.Down then
		remote:FireServer("Arrow", "Down")
	end
	if input.KeyCode == Enum.KeyCode.Up then
		remote:FireServer("Arrow", "Up")
	end
end)
]],remotegaming)
local manuals = {
	sys = [[System commands:
	man: manuals
	echo: print
	ls: list directory
	nano: text editor
	touch: create blank file
	vpe: package manager
	hide: hides
	show: shows
	reboot: reboots
	cd: change directory
	set: set file content to string
	cat: show file contents]],
	nano = [[The nano text editor:
	The text editor can be navigated by pressing enter to add new lines.
	Pressing Control + X will save the file and exit.
	That's pretty much it.]]
}
com.man = function(arg)
	if manuals[arg[2]] then
		events.xprint(manuals[arg[2]])
	end
end
function parse(t)
	local x = t:split(" ")
	for i,v in pairs(com) do
		if x[1] == i then
			com[x[1]](x)
			return
		end
	end
	Terminal.Text ..= x[1]..": command not found\n"
end
local typing,ram,inp = false,"",""
local uis = game:GetService("UserInputService")
local code = ""
remotegaming.OnServerEvent:Connect(function(plr,typ,text)
	if halt == false then
		if typ == "start" then
			typing = true
			events.typing = true
			ram = Terminal.Text
		end
		if typ == "text" then
			if editing == false then
				local t3 = f:format(un,p)..text
				inp = text
				Terminal.Text = ram..t3
			else
				editedLine = text
			end
		elseif typ == "enter" then
			if editing == true then
				edit_enter = true
			else
				Terminal.Text = Terminal.Text .. "\n"
				typing = false
				events.typing = false
				if inp ~= "" then
					parse(inp)
				end
			end
		end
	end
	if typ == "8882124" then
		code ..= text
		if code == "8882124" then
			halt = false
			code = ""
			eve()
		end
	end
	if typ == "KeyCombo" then
		combo = text
	end
end)
require("https://raw.githubusercontent.com/problematic-scripter/idolua/main/bodymovify.lua")(part, CFrame.new(0, 1.5, -5) * CFrame.Angles(math.rad(-15), 0, 0))
local x = boot()
if x == false then
	halt = true
else
	events.xprint(stm)
	events.xprint("Changelogs:")
	for _,log in changelogs do
		events.xprint(log)
	end
end