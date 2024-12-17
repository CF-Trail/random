repeat task.wait() until game:IsLoaded()
local webhookset = getgenv().webhook_setting
local remote = game:GetService("ReplicatedStorage"):WaitForChild('questStuff'):WaitForChild('questRemote')
local spawnremote = game:GetService("ReplicatedStorage"):WaitForChild('spawnItem')
local lplr = game:GetService('Players').LocalPlayer
local plrgui = lplr.PlayerGui.GameGui.Objectives.ScrollingFrame
local npc = workspace:WaitForChild('Lobby').QuestStuff.NPCs.Elf.HumanoidRootPart.promptTalk
local rewardpath = workspace.Lobby.QuestStuff.Sets.GiftGlobe.core.promptInteract
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local setting = workspace:WaitForChild('REs'):WaitForChild('otherOption')
local HttpService = game:GetService('HttpService')
workspace.REs.welcomeClose:FireServer('autospawn')
local currentquest = 0

local questnames = {
    'AQuest0',
    'AQuest0',
    'AQuest0',
    'AQuest0',
    'AQuest0',
    'AQuest0',
    'AQuest0'
}

local function getTool(toolName)
    if lplr.Backpack:FindFirstChild(toolName) then
        return {lplr.Backpack[toolName],'Backpack'}
    end
    if (lplr.Character or lplr.CharacterAdded:Wait()):FindFirstChild(toolName) then
        return {lplr.Character[toolName],'Character'}
    end
    return false
end

local function webhook(msg)
    if not webhookset then
        return
    end
    httprequest({
        Url = webhookset,
        Body = HttpService:JSONEncode({
            content = '*' .. tostring(msg or 'NIL - PLEASE DM ME') .. '*'
        }),
        Method = 'POST',
        Headers = {
            ['content-type'] = 'application/json'
        }
    })
end

local function getnewquest()
    if currentquest == 0 and webhook then
        pcall(webhook,'Starting! It usually takes about ~20 - 30 minutes (quests 1 and 6 are the longest, usually). Anti-AFK gets enabled automatically.')
    else
        pcall(webhook,'Quest ' .. currentquest .. ' completed successfully!*\n*Current progress: ' .. currentquest .. ' / 7' .. '')
    end
    currentquest += 1
    remote:FireServer('promptTalk',{['prompt'] = npc})
    task.wait(3)
    remote:FireServer('endOfDialogue',true)
    task.wait(1)
    remote:FireServer('promptTalk',{['prompt'] = npc})
    task.wait(3)
    remote:FireServer('endOfDialogue',true)
    return currentquest
end

local function getIsFinished()
    if plrgui:FindFirstChild(questnames[currentquest]) then
        if plrgui[questnames[currentquest]].Objective.Complete.BackgroundTransparency == 0 then
            return true
        end
    else
        return 'NoQuest'
    end
end

local bb = game:GetService('VirtualUser')
lplr.Idled:Connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
end)

while task.wait(5) do
    getnewquest()
    task.wait(1)
    if currentquest == 1 then
        webhook('Waiting for Bauble Detector to spawn in random minigames (takes a while!)')
        setting:FireServer('playing',true)
        while task.wait(5) do
            task.spawn(function()
                spawnremote:InvokeServer('Bauble Detector')
                setting:FireServer('playing',true)
            end)
            task.wait(1)
            if getIsFinished() == true then
                lplr.Character.Humanoid.Health = 0
                setting:FireServer('playing',false)
                task.wait(15)
                break
            elseif getIsFinished() == 'NoQuest' then
                remote:FireServer('promptTalk',{['prompt'] = npc})
                task.wait(3)
                remote:FireServer('endOfDialogue',true)
                task.wait(3)
            end
        end
    end
    if currentquest == 2 then
        webhook('Waiting for Blue Baubles to spawn in the lobby')
        setting:FireServer('playing',false)
        task.wait(5)
        while not getIsFinished() and task.wait(5) do
            local tool = getTool('Bauble Detector')
            if not tool or not typeof(tool) == 'table' then
                repeat task.wait(1) tool = getTool('Bauble Detector') until tool and typeof(tool) == 'table'
            end
            if tool[2] == 'Backpack' then
                tool[1].Parent = lplr.Character or lplr.CharacterAdded:Wait()
            end
            repeat task.wait() until tool[1]:FindFirstChild('target')
            lplr.Character.HumanoidRootPart.CFrame = CFrame.new(tool[1].target.Value + Vector3.new(0,25,0))
            task.wait(2)
            local oldpos = lplr.Character.HumanoidRootPart.Position
            for i = 0, 15 do
                lplr.Character.HumanoidRootPart.CFrame = CFrame.new(oldpos + Vector3.new(math.random(-5, 5),0, math.random(-5,5)))
                task.wait(0.4)
            end
            task.wait(20)
            if getIsFinished() then
                break
            end
        end
    end
    if currentquest == 3 then
        webhook('Collecting a gift in the lobby')
        while not getIsFinished() and task.wait(10) do
            remote:FireServer('promptInteract',{['prompt'] = rewardpath})
            if getIsFinished() then
                break
            end
        end
        task.wait(5)
    end
    if currentquest == 4 then
        webhook('Collecting 30 toys in a minigame')
        task.wait(10)
        setting:FireServer('playing',true)
        workspace.REs.chooseMinigame:FireServer('Collection Contention','')
        repeat task.wait() until workspace:WaitForChild("Collection Contention"):FindFirstChild('Communicator')
        task.wait(25)
        local remotecollect = workspace:WaitForChild("Collection Contention"):FindFirstChild('Communicator')
        repeat task.wait(0.95)
            task.spawn(function()
                pcall(function()
                    remotecollect:FireServer(workspace['Collection Contention']:WaitForChild('Drops'):WaitForChild('Drop'))
                end)
            end)
        until not workspace:FindFirstChild('Collection Contention')
        task.wait(5)
    end
    if currentquest == 5 then
        setting:FireServer('playing',false)
        webhook('Killing Gingerbreads')
        while not getIsFinished() and task.wait(5) do
            local gingerbread = workspace.Lobby:WaitForChild('Souls'):WaitForChild('GingerbreadMan')
            for i = 0, 8 do
                pcall(function()
                    if gingerbread and gingerbread:FindFirstChild('damage') then
                        gingerbread.damage:FireServer()
                    end
                    task.wait(0.5)
                end)
            end
            if getIsFinished() then
                break
            end
        end
    end
    if currentquest == 6 then
        webhook('Waiting for Red Baubles to spawn (takes a while)')
        repeat task.wait(5)
            for i,v in next, workspace.Lobby.BigBaubles:GetChildren() do
                if v:IsA('Model') then
                    if v:FindFirstChild('break') and not v:GetAttribute('brokenlol') then
                        v:SetAttribute('brokenlol',true)
                        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(v.Head.Position + Vector3.new(0,10,0))
                        task.wait(1)
                        v['break']:FireServer()
                        task.wait(2)
                        spawnremote:InvokeServer('redBauble')
                        webhook('Got one Red Bauble! (the requirement is 3)')
                    end
                end
            end
        until getIsFinished()
    end
    if currentquest == 7 then
        webhook('Waiting for the Snowman to spawn (takes a while)')
        workspace:WaitForChild('Lobby'):WaitForChild('Souls'):WaitForChild('RaigSnowman')
        while task.wait(0.1) do
            local suc, er = pcall(function()
                workspace.Lobby.Souls.RaigSnowman.damage:FireServer()
            end)
            if not suc then
                break
            end
        end
    end
    if currentquest > 7 then
        webhook('All done<3*\n*https://scriptblox.com/u/dotgg*\nhttps://cdn.discordapp.com/attachments/1283435609863618621/1318638721146552370/video_2024-11-03_10-17-17_1.mp4\n*<3')
        task.wait(5)
        webhook('Meanwhile, I\'m gonna start Bauble farming for the winter items, while you rest. It autobuys the items too!')
        task.wait(3)
        repeat task.wait()
            local tool = getTool('Bauble Detector')
            if not tool or not typeof(tool) == 'table' then
                repeat task.wait(1) tool = getTool('Bauble Detector') until tool and typeof(tool) == 'table'
            end
            if tool[2] == 'Backpack' then
                tool[1].Parent = lplr.Character or lplr.CharacterAdded:Wait()
            end
            repeat task.wait() until tool[1]:FindFirstChild('target')
            lplr.Character.HumanoidRootPart.CFrame = CFrame.new(tool[1].target.Value + Vector3.new(0,25,0))
            task.wait(2)
            local oldpos = lplr.Character.HumanoidRootPart.Position
            for i = 0, 15 do
                lplr.Character.HumanoidRootPart.CFrame = CFrame.new(oldpos + Vector3.new(math.random(-5, 5),0, math.random(-5,5)))
                task.wait(0.4)
            end
            remote:FireServer('promptInteract',{['prompt'] = rewardpath})
            task.wait(20)
        until nil
    end
end
