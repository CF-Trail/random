repeat task.wait() until game:GetService('Players').LocalPlayer
repeat task.wait() until game:IsLoaded()
task.wait(5)

local function antiafk()
    game:GetService('Players').LocalPlayer.Idled:Connect(function()
        for i, v in next, getconnections(game:GetService('Players').LocalPlayer.Idled) do
            v:Disable()
        end
    end)
    while task.wait(555) do
        VIM:SendKeyEvent(true, "W", false, nil)
        task.wait(1)
        VIM:SendKeyEvent(false, "W", false, nil)
        task.wait(1)
        VIM:SendKeyEvent(true, "S", false, nil)
        task.wait(1)
        VIM:SendKeyEvent(false, "S", false, nil)
    end
end

task.spawn(antiafk)

local TextChannel = game:GetService('TextChatService').TextChannels.RBXGeneral
local VIM = game:GetService('VirtualInputManager')
local Players = game:GetService('Players')
local lplr = Players.LocalPlayer
local humanoid = lplr.Character.Humanoid

local function getPlot(pos)
    local maxPos = 9e9
    local plot = nil
    for i, v in next, workspace.Plots:GetChildren() do
        local dist = (v.MainRoot.Position - pos).Magnitude
        if dist < maxPos then
            maxPos = dist
            plot = v
        end
    end
    return plot
end

local LocalPlot = getPlot(lplr.Character.HumanoidRootPart.Position)
LocalPlot = LocalPlot.Multiplier

local function walkTo(part)
    local f, fcon = false, nil
    humanoid:MoveTo(part.Position)
    fcon = humanoid.MoveToFinished:Connect(function()
        f = true
    end)
    repeat task.wait() until f
    print('Moving Finished')
end

local function toMe(user)
    local userChar = user.Character.HumanoidRootPart
    walkTo(userChar)
end

local function grabPet(pet)
    workspace.CurrentCamera.CFrame = pet.CFrame * CFrame.new(1,0,1) + Vector3.new(0, -3.4, 0)
    task.wait(0.5)
    VIM:SendKeyEvent(true, "E", false, nil)
    task.wait(2)
    VIM:SendKeyEvent(false, "E", false, nil)
    task.wait(0.2)
end

local function stealStuff(petName)
    for i,v in next, workspace:GetChildren() do
        if v.Name:lower() == petName then
            local petRoot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("PrimaryPart") or v:FindFirstChildWhichIsA("BasePart")
            if petRoot then
                local lplrPos = lplr.Character.HumanoidRootPart.Position
                local closestDist = math.huge
                local closestPet = nil
                local dist = (petRoot.Position - lplrPos).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    closestPet = v
                end
                if closestPet then
                    walkTo(closestPet:FindFirstChild("RootPart") or closestPet:FindFirstChildWhichIsA("BasePart"))
                    grabPet(closestPet:FindFirstChild("RootPart") or closestPet:FindFirstChildWhichIsA("BasePart"))
                else
                    return TextChannel:SendAsync('🤖 Failed To Fetch The Pet. Report To @szze')
                end
                local currentPlot = getPlot(humanoid.RootPart.Position)
                walkTo(currentPlot.Multiplier)
                task.wait(0.3)
                walkTo(workspace.MapCenter)
                task.wait(0.5)
                walkTo(LocalPlot)
                TextChannel:SendAsync('🤖 Delivered the pet!')
                task.wait(1)
                walkTo(workspace.MapCenter)
            end
        end
    end
end

TextChannel:SendAsync('🤖 Got My Plot')
task.wait(1.5)
walkTo(workspace.MapCenter)
TextChannel:SendAsync('🤖 Waiting For Commands')

TextChannel.MessageReceived:Connect(function(msg)
    local sender = msg.TextSource and Players:FindFirstChild(msg.TextSource.Name)
    if not sender or sender == lplr then return end
    local text = msg.Text:lower()
    if text == "tm" then
        toMe(sender)
        TextChannel:SendAsync("🤖 Walking to you, " .. sender.Name)
    elseif text:sub(1,6) == "steal " then
        local petName = text:sub(7)
        TextChannel:SendAsync("🤖 Attempting to steal pet: " .. petName)
        stealStuff(petName)
    end
end)

local function patch(v)
    v:GetPropertyChangedSignal('RequiresLineOfSight'):Connect(function()
        v.RequiresLineOfSight = false
    end)
    v.RequiresLineOfSight = false
end

for i,v in next, workspace:GetDescendants() do
    if v:IsA('ProximityPrompt') then
        patch(v)
    end
end

workspace.ChildAdded:Connect(function(v)
    if v:IsA('ProximityPrompt') then
        patch(v)
    end
end)
