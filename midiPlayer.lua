function notetopitch(note)
    return (440 / 32) * math.pow(2, ((note - 0) / 12)) / 440
end
local sound = Instance.new("Sound")
sound.Volume = 0.5
sound.SoundId = "rbxasset://sounds/bass.wav"
local instrumental1 = true
local ms = false
local instruments = {
    "rbxasset://sounds/bass.wav",
    "rbxasset://sounds/clickfast.wav",
    "rbxasset://sounds/bass.wav",
    "rbxasset://sounds/electronicpingshort.mp3"
}
local instruments2 = {}
for i = 1, #instruments do
    local jj = Instance.new("Sound", owner.Character.Head)
    jj.Volume = 0.5
    jj.RollOffMaxDistance = 25
    jj.SoundId = instruments[i]
    jj.PlayOnRemove = true
    jj.Looped = true
    instruments2[i] = jj
end
local sineNum = 0
local instrumentalsound = 1
function PlayMIDI(b)
    local event = Instance.new("BindableEvent")
    task.spawn(
        function()
            for i, w in pairs(b.tracks) do
                task.spawn(
                    function()
                        for j, v in pairs(w.notes) do
                            task.spawn(
                                function()
                                    task.wait(v.time)
                                    local duration = 0
                                    local s =
                                        (instrumental1 == true and instruments2[instrumentalsound]:Clone()) or
                                        instruments2[i]:Clone()
                                    s.Parent = owner.Character.Head
                                    s.PlaybackSpeed = notetopitch(v.midi)
                                    game:GetService("Debris"):AddItem(s, 0)
                                    sineNum = 128 - v.midi
                                end
                            )
                            if ms == true then
                                ms = false
                                break
                            end
                        end
                    end
                )
            end
        end
    )
end
owner.Chatted:Connect(
    function(msg)
        if string.sub(msg, 1, 3) == "mp/" then
            local url = string.sub(msg, 4, #msg)
            local h = game:GetService("HttpService"):GetAsync(url)
            local t = game:GetService("HttpService"):JSONDecode(h)
            ms = true
            PlayMIDI(t)
            ms = false
        end
    end
)
