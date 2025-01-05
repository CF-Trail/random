if or not hookmetamethod or not hookfunction then
	repeat
		task.wait()
	until game:GetService('Players').LocalPlayer
	game:GetService('Players').LocalPlayer:Kick('Bad executor')
end

if not rconsoleprint then
	rconsoleprint = function(...)
		print(...)
	end
end

if not newcclosure then
	rconsoleprint('PLEASE GET A BETTER EXECUTOR THAT SUPPORTS newcclosure' .. '\n')
end

local closure = syn_newcclosure or newcclosure or function (w)
	--aaa
end

local function blueRPRINT(text)
	rconsoleprint('@@BLUE@@')
	rconsoleprint(text)
end

local function LMagentaPrint(text)
	rconsoleprint('@@LIGHT_MAGENTA@@')
	rconsoleprint(text)
end

local function GreenPrint(text)
	rconsoleprint('@@GREEN@@')
	rconsoleprint(text)
end

--// VoiceChat spoof

local oldhOwOok
oldhOwOok = hookmetamethod(game, "__namecall", closure(function(self, ...)
	if getnamecallmethod() == "IsVoiceEnabledForUserIdAsync" then
		return true
	end
	return oldhOwOok(self, ...)
end))

--// PreloadBypass

local tbl = {}
local CollectionService = game:GetService('CollectionService')
local CoreGui = game:GetService('CoreGui')

for i, v in pairs(CoreGui.GetDescendants(CoreGui)) do
	if v.IsA(v, "ImageLabel") and v.Image:find('rbxasset://') then
		table.insert(tbl, v.Image)
	end
end

local hello;
hello = hookfunction(game:GetService("ContentProvider").PreloadAsync, closure(function(self, ...)
	local Args = {
		...
	}
	if not checkcaller() and type(Args[1]) == "table" and table.find(Args[1], CoreGui) then
		LMagentaPrint("szze's utilities | Blocked PreloadAsync detection" .. ' | Method used: __index \n')
		Args[1] = tbl
		return hello(self, unpack(Args))
	end
	return hello(self, ...)
end))

local function football(ncm)
	if ncm == "PreloadAsync" or ncm == "preloadAsync" then
		return true
	end
	return false
end

local __namecall;

__namecall = hookmetamethod(game, "__namecall", closure(function(Self, ...)
	local Args = {
		...
	}
	local NamecallMethod = getnamecallmethod()
	if not checkcaller() and type(Args[1]) == "table" and table.find(Args[1], CoreGui) and Self == game.GetService(game, "ContentProvider") and football(NamecallMethod) then
		LMagentaPrint("szze's utilities | Blocked PreloadAsync detection from " .. getcallingscript():GetFullName() .. ' | Method used: __namecall \n')
		Args[1] = tbl
		return __namecall(Self, unpack(Args))
	end
	return __namecall(Self, ...)
end))

--// Local GamePass bypasser

local owold
owold = hookmetamethod(game, '__namecall', closure(function(...)
	local method = getnamecallmethod()
	if method == 'UserOwnsGamePassAsync' and not checkcaller() then
		return true
	end
	return owold(...)
end))

-- // Memory bypass

local uwu
uwu = hookmetamethod(game, '__namecall', closure(function(...)
	local method = getnamecallmethod()
	if method == 'GetTotalMemoryUsageMb' then
		return math.random(400, 450)
	end
	return uwu(...)
end))

--// AntiShutdown

hookfunction(game.Shutdown, closure(function(...)
	local args = { ... }
	if not checkcaller() then
		LMagentaPrint("szze's utilities | Blocked kick " .. '| Method used: __index [SHUTDOWN] \n')
		return wait(9e9)
	end
end))

local twt
twt = hookmetamethod(game, '__namecall', closure(function(self, ...)
	local kscriptz, kscript
	local method = getnamecallmethod()
	if self == game and string.lower(method) == 'shutdown' and not checkcaller() then
		kscriptz = getcallingscript()
		if kscriptz then
			kscript = kscript:GetFullName()
		else
			kscript = "Couldn't fetch"
		end
		LMagentaPrint("szze's utilities | Blocked kick from " .. tostring(kscript) .. ' | Method used: __namecall [SHUTDOWN] \n')
		return wait(9e9)
	end
	return twt(self, ...)
end))

--// Script

repeat
	task.wait()
until game:GetService('Players').LocalPlayer
local lplr = game:GetService('Players').LocalPlayer
local isAFK = false

blueRPRINT(
    [[ 
    _____   ______  ______  ______   _    _____     _    _   _______   _____   _        _____   _______   _____   ______    _____ 
    / ____| |___  / |___  / |  ____| ( )  / ____|   | |  | | |__   __| |_   _| | |      |_   _| |__   __| |_   _| |  ____|  / ____|
   | (___      / /     / /  | |__    |/  | (___     | |  | |    | |      | |   | |        | |      | |      | |   | |__    | (___  
    \___ \    / /     / /   |  __|        \___ \    | |  | |    | |      | |   | |        | |      | |      | |   |  __|    \___ \ 
    ____) |  / /__   / /__  | |____       ____) |   | |__| |    | |     _| |_  | |____   _| |_     | |     _| |_  | |____   ____) |
   |_____/  /_____| /_____| |______|     |_____/     \____/     |_|    |_____| |______| |_____|    |_|    |_____| |______| |_____/ 
                                                                                                                                   
                                                            Made by szze#6220
                                                                  V1.3
                                                    
    ]] .. '\n'
)

--// AntiKick: __namecall

local OldNameCall 
OldNameCall = hookmetamethod(game, "__namecall", closure(function(...)
	local Self, Args = (...), ({
		select(2, ...),
	})
	local kscript, kscriptz
	if string.lower(getnamecallmethod()) == "kick" and Self == lplr and not checkcaller() then
		kscriptz = getcallingscript()
		if kscriptz then
			kscript = kscriptz:GetFullName()
		else
			kscript = "Couldn't fetch"
		end
		LMagentaPrint("szze's utilities | Blocked kick from " .. tostring(kscript) .. ' | Method used: __namecall \n')
		return wait(9e9)
	end
	return OldNameCall(...)
end))

--// AntiKick: __index
local isAdonis = false
task.spawn(function()
	repeat
		task.wait()
	until game:IsLoaded()
	for i, v in next, game:GetService('ReplicatedStorage'):GetDescendants() do
		if v.Name == "__FUNCTION" and v:IsA('RemoteFunction') and v.Parent:IsA('RemoteEvent') then
			isAdonis = true
		end
	end
	game:GetService('ReplicatedStorage').ChildAdded:Connect(function(v)
		task.wait()
		if v:IsA('RemoteEvent') and v:FindFirstChildWhichIsA('RemoteFunction') and v:FindFirstChildWhichIsA('RemoteFunction').Name == '__FUNCTION' then
			isAdonis = true
		end
	end)
	hookfunction(lplr.Destroy, closure(function(...)
		local args = {
			...
		}
		if not checkcaller() then
			LMagentaPrint("szze's utilities | Blocked kick " .. '| Method used: __index [DESTROY] \n')
			return wait(9e9)
		end
	end))
	if isAdonis == false then
		hookfunction(lplr.Kick, closure(function(...)
			local args = {
				...
			}
			if not checkcaller() and not isAdonis then
				LMagentaPrint("szze's utilities | Blocked kick " .. '| Method used: __index \n')
				return wait(9e9)
			end
		end))
	else
		rconsoleprint('@@RED@@')
		rconsoleprint('Adonis detected! __index kick bypass will not work. \n')
	end
end)

--// AntiKick: Destroy() method

local qwq
qwq = hookmetamethod(game, '__namecall', closure(function(self, ...)
	local kscriptz, kscript
	local method = getnamecallmethod()
	if self == lplr and string.lower(method) == 'destroy' and not checkcaller() then
		kscriptz = getcallingscript()
		if kscriptz then
			kscript = kscriptz:GetFullName()
		else
			kscript = "Couldn't fetch"
		end
		LMagentaPrint("szze's utilities | Blocked kick from " .. tostring(kscript) .. ' | Method used: __namecall [DESTROY] \n')
		return wait(9e9)
	end
	return qwq(self, ...)
end))

--// Prints

GreenPrint('Client Anti-Kick loaded \n')
GreenPrint('VoiceChat spoofer loaded \n')
GreenPrint('PreloadBypass loaded \n')
GreenPrint('Memory bypasser loaded \n')
GreenPrint('Local GamePass bypasser loaded \n')

--// AntiAFK

local connections = getconnections or get_signal_cons
if connections then
	for i, v in next, connections(lplr.Idled) do
		v:Disable()
	end
end

lplr.Idled:Connect(function(time)
	if time > 1200 and not isAFK then
		LMagentaPrint('AntiAFK bypassed the kick \n')
		isAFK = true
	end
end)

GreenPrint('AntiAFK loaded \n')

--// Ver Checker

local ver = 'V1.3'
local verMain = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/CF-Trail/random/main/utilLoader/ver"))()

if ver ~= verMain then
	game:GetService('Players').LocalPlayer:Kick('Please get newer version. Your ver: ' .. ver .. ' | Script ver: ' .. verMain)
end
