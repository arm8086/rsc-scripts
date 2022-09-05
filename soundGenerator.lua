--local owner = game.Players.PlayerAdded:Wait()
local PerlinMusicBox = Instance.new("ScreenGui")
PerlinMusicBox.Name = "PerlinMusicBox"
PerlinMusicBox.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
PerlinMusicBox.ResetOnSpawn = false
PerlinMusicBox.IgnoreGuiInset = true
local Window = Instance.new("Frame")
Window.Name = "Window"
Window.Size = UDim2.new(0, 206, 0, 253)
Window.Position = UDim2.new(0.7325408, 0, 0.5488722, 0)
Window.BorderSizePixel = 0
Window.BackgroundColor3 = Color3.fromRGB(64, 0, 0)
Window.Parent = PerlinMusicBox
local PlayEveryone = Instance.new("TextButton")
PlayEveryone.Name = "PlayEveryone"
PlayEveryone.AnchorPoint = Vector2.new(0.5, 0.5)
PlayEveryone.Size = UDim2.new(0.8834952, 0, 0.1, 0)
PlayEveryone.BackgroundTransparency = 1
PlayEveryone.Position = UDim2.new(0.5, 0, 0.138336, 0)
PlayEveryone.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayEveryone.FontSize = Enum.FontSize.Size14
PlayEveryone.TextSize = 14
PlayEveryone.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayEveryone.Text = "[ ] Play for everyone"
PlayEveryone.Font = Enum.Font.Code
PlayEveryone.Parent = Window
local Chunks = Instance.new("TextBox")
Chunks.Name = "Chunks"
Chunks.AnchorPoint = Vector2.new(0.5, 0.5)
Chunks.Size = UDim2.new(0.883, 0, 0.1, 0)
Chunks.Position = UDim2.new(0.5, 0, 0.3514387, 0)
Chunks.BorderSizePixel = 0
Chunks.BackgroundColor3 = Color3.fromRGB(72, 0, 0)
Chunks.FontSize = Enum.FontSize.Size14
Chunks.TextSize = 14
Chunks.TextColor3 = Color3.fromRGB(255, 255, 255)
Chunks.Text = "32"
Chunks.CursorPosition = -1
Chunks.Font = Enum.Font.Code
Chunks.Parent = Window
local TextBox = Instance.new("TextBox")
TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
TextBox.Size = UDim2.new(0.8830001, 0, 0.072332, 0)
TextBox.BackgroundTransparency = 1
TextBox.Position = UDim2.new(0.5, 0, 0.2625059, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.FontSize = Enum.FontSize.Size14
TextBox.TextSize = 14
TextBox.ShowNativeInput = false
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Text = "Chunks"
TextBox.TextEditable = false
TextBox.CursorPosition = -1
TextBox.Font = Enum.Font.Code
TextBox.ClearTextOnFocus = false
TextBox.Parent = Window
local TextButton = Instance.new("TextButton")
TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
TextButton.Size = UDim2.new(0.883, 0, 0.1, 0)
TextButton.Name = "Play"
TextButton.BackgroundTransparency = 1
TextButton.Position = UDim2.new(0.5, 0, 0.893, 0)
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.FontSize = Enum.FontSize.Size14
TextButton.TextSize = 14
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Text = "Play"
TextButton.Font = Enum.Font.Code
TextButton.Parent = Window
local TextButton1 = Instance.new("TextButton")
TextButton1.Name = "Generate"
TextButton1.AnchorPoint = Vector2.new(0.5, 0.5)
TextButton1.Size = UDim2.new(0.883, 0, 0.1, 0)
TextButton1.BackgroundTransparency = 1
TextButton1.Position = UDim2.new(0.4951456, 0, 0.7902332, 0)
TextButton1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton1.FontSize = Enum.FontSize.Size14
TextButton1.TextSize = 14
TextButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton1.Text = "Generate"
TextButton1.Font = Enum.Font.Code
TextButton1.Parent = Window
local NoteCount = Instance.new("TextBox")
NoteCount.Name = "NoteCount"
NoteCount.AnchorPoint = Vector2.new(0.5, 0.5)
NoteCount.Size = UDim2.new(0.883, 0, 0.1, 0)
NoteCount.Position = UDim2.new(0.5, 0, 0.5372095, 0)
NoteCount.BorderSizePixel = 0
NoteCount.BackgroundColor3 = Color3.fromRGB(72, 0, 0)
NoteCount.FontSize = Enum.FontSize.Size14
NoteCount.TextSize = 14
NoteCount.TextColor3 = Color3.fromRGB(255, 255, 255)
NoteCount.Text = "6"
NoteCount.CursorPosition = -1
NoteCount.Font = Enum.Font.Code
NoteCount.Parent = Window
local TextBox1 = Instance.new("TextBox")
TextBox1.AnchorPoint = Vector2.new(0.5, 0.5)
TextBox1.Size = UDim2.new(0.8830001, 0, 0.072332, 0)
TextBox1.BackgroundTransparency = 1
TextBox1.Position = UDim2.new(0.5, 0, 0.4482767, 0)
TextBox1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox1.FontSize = Enum.FontSize.Size14
TextBox1.TextSize = 14
TextBox1.ShowNativeInput = false
TextBox1.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox1.Text = "Notes per Chunk"
TextBox1.TextEditable = false
TextBox1.Font = Enum.Font.Code
TextBox1.ClearTextOnFocus = false
TextBox1.Parent = Window
local OneInst = Instance.new("TextButton")
OneInst.Name = "OneInst"
OneInst.AnchorPoint = Vector2.new(0.5, 0.5)
OneInst.Size = UDim2.new(0.8834952, 0, 0.1, 0)
OneInst.BackgroundTransparency = 1
OneInst.Position = UDim2.new(0.5, 0, 0.6877431, 0)
OneInst.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OneInst.FontSize = Enum.FontSize.Size14
OneInst.TextSize = 14
OneInst.TextColor3 = Color3.fromRGB(255, 255, 255)
OneInst.Text = "[ ] Only use one instrument"
OneInst.Font = Enum.Font.Code
OneInst.Parent = Window
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Window
PerlinMusicBox.Parent = owner.PlayerGui
function rand(lower, greater)
	return lower + math.random()  * (greater - lower);
end
local remote = Instance.new("RemoteEvent",owner.PlayerGui)
local sf = Instance.new("Folder",owner.PlayerGui)
sf.Name = "PerlinNoiseSounds"
local sound1 = Instance.new("Sound")
sound1.SoundId = "rbxasset://sounds/bass.wav"
sound1.Volume = 1.5
sound1.Looped = true
local sound2 = Instance.new("Sound")
sound2.SoundId = "rbxasset://sounds/electronicpingshort.wav"
sound2.Volume = 0.5
sound2.Looped = true
local npc=6
local c=32
local song = {}
local songi2 = {}
local mode = "BothInstruments"
local modeb = true
local pfe = false
function music_make_note(x,s,l,j)
	local n = math.noise(x,j,s)
	return l+n
end
function music_make_chunk(x,s)
	local ch={}
	local l=1
	local jx=rand(-65536,65536)
	for i = 1, npc do
		local n = music_make_note(x+i,s,l,jx)
		table.insert(ch,n)
		l=n
	end
	return ch
end
function regenerate(m)
	local noise_seed = rand(-32,32) -- thank god for precision
	local jx = rand(-65536,65536)
	song = {}
	songi2 = {}
	if m == "OneInstrument" then
		for i = 1, c do
			local ch = music_make_chunk(i,noise_seed)
			for j = 1, npc do
				table.insert(song,ch[j])
			end
			task.wait()
		end
	elseif m == "BothInstruments" then
		for i = 1, c do
			local ch = music_make_chunk(i,noise_seed)
			local ch2 = music_make_note(i,noise_seed,songi2[i] or 1,jx)
			for j = 1, npc do
				table.insert(song,ch[j])
				table.insert(songi2,ch2)
			end
			task.wait()
		end
	end
end
function play(m)
	if m == "OneInstrument" then
		for i = 1, #song do
			sound1.TimePosition = 0
			local p = song[i]
			local sound = sound1:Clone()
			sound.PlayOnRemove = true
			sound.Pitch = math.clamp(p,0.6,20)
			sound.Parent = sf
			sound:Destroy()
			task.wait(0.2)
		end
	elseif m == "BothInstruments" then
		for i = 1, #song do
			local p = song[i]
			local p2 = songi2[i]
			local sound = sound1:Clone()
			sound.PlayOnRemove = true
			sound.Pitch = math.clamp(p,0.6,20)
			sound.Parent = sf
			local sound_1 = sound2:Clone()
			sound_1.PlayOnRemove = true
			sound_1.Pitch = math.clamp(p2,0.6,20)
			sound_1.Parent = sf
			sound_1:Destroy()
			sound:Destroy()
			task.wait(0.2)
		end
	end
end
PerlinMusicBox.Name = game:GetService("HttpService"):GenerateGUID(false)
-- textbutton: play
-- textbutton1: generate
-- PlayEveryone: play for all
remote.Name = game:GetService("HttpService"):GenerateGUID(false)
NLS([[
local remote = script.Parent
local gui = owner.PlayerGui["]]..PerlinMusicBox.Name..[["]
local play = gui.Window.Play
local gen = gui.Window.Generate
local npc = gui.Window.NoteCount
local pfe = gui.Window.PlayEveryone
local chu = gui.Window.Chunks
local mde = gui.Window.OneInst
play.MouseButton1Click:Connect(function()
	remote:FireServer(1)
end)
gen.MouseButton1Click:Connect(function()
	remote:FireServer(2)
end)
pfe.MouseButton1Click:Connect(function()
	remote:FireServer(3)
end)
chu.FocusLost:Connect(function()
	remote:FireServer(4, chu.Text)
end)
npc.FocusLost:Connect(function()
	remote:FireServer(5, npc.text)
end)
mde.MouseButton1Click:Connect(function()
	remote:FireServer(6)
end)
function dragify(Frame)
    dragToggle = nil
    local dragSpeed = 0.50
    dragInput = nil
    dragStart = nil
    local dragPos = nil
    function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        Frame.Position = Position
    end
    Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and game:GetService("UserInputService"):GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
end
dragify(gui.Window)
]],remote)
remote.OnServerEvent:Connect(function(plr,x,y)
	if x == 1 then
		print("Playing")
		play(mode)
	elseif x == 2 then
		print("Generating")
		regenerate(mode)
		print("Finished")
	elseif x == 3 then
		pfe = not pfe
		if pfe then
			PlayEveryone.Text = "[X] Play for everyone"
			sf.Parent = owner.Character.Head
		else
			PlayEveryone.Text = "[ ] Play for everyone"
			sf.Parent = owner.PlayerGui
		end
	elseif x == 4 then
		c = tonumber(y)
	elseif x == 5 then
		npc = tonumber(y)
	elseif x == 6 then
		modeb = not modeb
		if modeb then
			mode = "BothInstruments"
			OneInst.Text = "[ ] Only use one instrument"
		else
			mode = "OneInstrument"
			OneInst.Text = "[X] Only use one instrument"
		end
		print("Switched mode to",mode)
	end
end)