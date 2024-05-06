s, e = pcall(function()
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()
local notifs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local watermark = library:Watermark("dot.hub | Doors")
pcall(function()
chasePred = game:GetService("ReplicatedStorage").GameData.ChaseStart
collision = game.Players.LocalPlayer.Character.Collision
humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
getgenv().ws = 0
getgenv().avoidsc = false
getgenv().winhb = true
end)
	

if not fireproximityprompt or not hookmetamethod then
    makeNotification("error","dot.hub | Error [DOORS]",'Your executor is not supported. Please get better one.')
    return
end

if rconsoleprint then rconsoleprint('This has been unpatched for the new AC update') end
 	
function startFiring()
   for i,v in next, game:GetService("Workspace").CurrentRooms:GetDescendants() do
      if v.IsA(v,"RemoteEvent") and string.match(v.Name,"Client") then
         while task.wait() do
            v:FireServer()
         end
      end
   end
   game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(v)
       if v.IsA(v,"RemoteEvent") and string.match(v.Name,"Client") then
          while task.wait() do
             v:FireServer()
          end
       end
   end)
end

function makeNotification(type,head,body)
    notifs.new(type, head, body,true,5)
end

local old
old = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    
    if tostring(self) == 'Screech' and method == "FireServer" and getgenv().avoidsc then
        args[1] = true
        return old(self,unpack(args))
    end
    if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and getgenv().winhb then
        args[2] = true
        return old(self,unpack(args))
    end
    
    return old(self,...)
end)

chasePred.Changed:Connect(function(d)
    if getgenv().chasenot then
    if chasePred.Value <= 100 then
    makeNotification("warning","dot.hub | Event notifications","Event ended! Next event at door " .. chasePred.Value)
    else
    makeNotification("warning","dot.hub | Event notifications","There will be no more events.")
    end
end
end)

game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(v)
    if not getgenv().midd then return end
    if v.IsA(v,"ProximityPrompt") then
       if getgenv().midd then
        v.MaxActivationDistance = 17
       end
    end
end)

workspace.ChildAdded:Connect(function(v)
    task.wait()
    if (v.Name == "RushMoving" or v.Name == "AmbushMoving") and not v:GetAttribute('Fake') then
        while workspace:FindFirstChild(v.Name) and getgenv().hxde do
            task.wait()
            part = v:WaitForChild("RushNew",2)
            if not part then 
		v:SetAttribute('Fake',true)					
	    return end
            game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame = CFrame.new(v.PrimaryPart.Position - Vector3.new(0,85,0))
        end
    end
end)

workspace.DescendantAdded:Connect(function(v)
    task.wait(0.01)
    if (string.match(string.lower(v.Name),"seek") or string.match(string.lower(v.Name),"triggerse")) and getgenv().removearms then
       v:Destroy()
    end
end)

local lib = library:Load{
    Name = "dot.hub",
    SizeX = 400,
    SizeY = 450,
    Theme = "Midnight",
    Extension = "extension", -- config file extension
    Folder = "dothub" -- config folder name
}

local main = lib:Tab("Main")
local misc = lib:Tab("Misc")

local sec1 = main:Section{
    Name = "",
    Side = "Left"
}

local unload = misc:Section{
    Name = "",
    Side = "Left"
}

unload:Button{
    Name = 'Unload',
    Callback = function()
        library:Unload()
    end
}

local sec2 = main:Section{
    Name = "",
    Side = "Right"
}

sec1:Toggle{
    Name = "Avoid Rush/Ambush",
    Flag = "ara",
    Default = false,
    Callback  = function(hide)
        getgenv().hxde = hide
    end
}

sec1:Toggle{
    Name = "Avoid Screech",
    Flag = "avs",
    Default = false,
    Callback  = function(key)
        getgenv().avoidsc = key
    end
}

sec1:Toggle{
    Name = "Win Heartbeat",
    Flag = "wh",
    Default = false,
    Callback  = function(key)
        getgenv().winhb = key
    end
}

sec1:Toggle{
    Name = "Instant Interract",
    Flag = 'ii',
    Default = false,
    Callback = function(ins)
        getgenv().iii = ins
        PromptButtonHoldBegan = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
            if getgenv().iii then
			fireproximityprompt(prompt)
            end
		end)
    end
}


sec2:Toggle{
    Name = "Event Notifications",
    Flag = "cn",
    Default = false,
    Callback = function(chasenotifs)
       getgenv().chasenot = chasenotifs
    end
}

sec2:Toggle{
    Name = "Noclip",
    Callback = function(x)
        getgenv().col = x
       for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
          if v.IsA(v,"BasePart") and getgenv().col == false then
             v.CanCollide = true
          elseif v.IsA(v,"BasePart") and getgenv().col == true then
            v.CanCollide = false
          end
       end
    end
}


sec2:Toggle{
    Name = "Remove seek arms",
    Callback = function(xx)
        getgenv().removearms = xx
    end
}

sec2:Toggle{
    Name = "Max Interact Distance",
    Callback = function(mid)
        getgenv().midd = mid
    end
}

sec2:Slider{
    Text = "Walkspeed Boost: [value]",
    Min = 0,
    Max = 7,
    Float = 0.5,
    Flag = "Speed Boost",
    Callback = function(sb)
        getgenv().ws = sb
        humanoid:SetAttribute("SpeedBoost",ws)
    end
}


--[[unload:Button{
    Name = "Unload GUI",
    Callback = function()
     library:Unload()
    end
}]]

sec1:Button{
    Name = "Skip Library",
    Callback = function()
        collision.CFrame = CFrame.new(game:GetService("Workspace").CurrentRooms["51"].RoomStart.Position)
    end
}

sec1:Button{
    Name = "Remove Jumpscares",
    Callback = function()
        game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy()
        game:GetService("ReplicatedStorage").Entities:Destroy()
        game:GetService("ReplicatedStorage").ClientModules.EntityModules:Destroy()
    end
}

sec2:Button{
    Name = "Get Key",
    Callback  = function()
        CF = CFrame.new
        local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
        for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
            if v.Name == "KeyObtain" then
                game.Players.LocalPlayer.Character:PivotTo(CF(v.Hitbox.Position))
                fireproximityprompt(v.ModulePrompt)
            end
        end
    end
}

sec2:Button{
    Name = "Trigger anticheat",
    Callback = function()
        if game:GetService("ReplicatedStorage").GameData.Preload.Value == true then
        game:GetService("ReplicatedStorage").Bricks.PreRunShop:FireServer("M249")
        else
        makeNotification("error","dot.hub | Error Handler","You can only trigger anticheat while in shop!")
        end
    end
}


sec2:Button{
    Name = "Fake Death",
    Callback = function()
        if getgenv().dead then return end
        getgenv().dead = true
        humanoid.Changed:Connect(function(prop)
            if prop == "Health" then
               humanoid.Health = 100
            end
        end)
        humanoid.Health = 0
    end
}

sec2:Button{
    Name = "Fullbright",
    Callback = function()
	while task.wait(0.1) do
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").Brightness = 3
        game:GetService("Lighting").ClockTime = 12
	end
    end
}

sec1:Button{
    Name = "Weird stuff",
    Callback = function()
        if getgenv().weird then return end
        getgenv().weird = true
        for i,v in next, game:GetDescendants() do
            if v.IsA(v,"ModuleScript") then
            pcall(function()
            x = require(v)
            x.fire()
            end)
            end
        end
    end
}
end)
if not s then
    vcb = {"Error appeared in the script","A Wild Error appeared","Error joined. Stay awhile and listen.",'Welcome, Error. We hope you brought pizza.','Error just arrived. Seems OP - please nerf.','Error has spawned in the script','Error comes in. Leave your weapons by the door.','Error joined. You must construct additional pylons.','Error just showed up. Hold my beer.','Error hopped into the server. Kangaroo!!','Error joined your party.'}
    makeNotification("error","dot.hub | Error Handler",vcb[math.random(1,#vcb)])
end
