if not hookmetamethod or not hookfunction then
    repeat task.wait() until game:GetService("Players").LocalPlayer
    game:GetService("Players").LocalPlayer:Kick("Bad executor")
    return
end

if not rconsoleprint then
    rconsoleprint = function(...) print(...) end
end

local closure = syn_newcclosure or newcclosure or function(f) return f end

local ANSI = {
    RESET = "\27[0m",
    BLUE  = "\27[34m",
    GREEN = "\27[32m",
    LIGHT_MAGENTA = "\27[95m",
}

local function blueRPRINT(t)    rconsoleprint(ANSI.BLUE          .. t .. ANSI.RESET) end
local function LMagentaPrint(t)  rconsoleprint(ANSI.LIGHT_MAGENTA .. t .. ANSI.RESET) end
local function GreenPrint(t)     rconsoleprint(ANSI.GREEN         .. t .. ANSI.RESET) end

local Players          = game:GetService("Players")
local CoreGui          = game:GetService("CoreGui")
local ContentProvider  = game:GetService("ContentProvider")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

repeat task.wait() until Players.LocalPlayer
local lplr  = Players.LocalPlayer
local isAFK = false
local isAdonis = false

local tbl = {}
for _, v in pairs(CoreGui:GetDescendants()) do
    if v:IsA("ImageLabel") and v.Image:find("rbxasset://") then
        table.insert(tbl, v.Image)
    end
end

blueRPRINT([[
    _____   ______  ______  ______   _    _____     _    _   _______   _____   _        _____   _______   _____   ______    _____
    / ____| |___  / |___  / |  ____| ( )  / ____|   | |  | | |__   __| |_   _| | |      |_   _| |__   __| |_   _| |  ____|  / ____|
   | (___      / /     / /  | |__    |/  | (___     | |  | |    | |      | |   | |        | |      | |      | |   | |__    | (___
    \___ \    / /     / /   |  __|        \___ \    | |  | |    | |      | |   | |        | |      | |      | |   |  __|    \___ \
    ____) |  / /__   / /__  | |____       ____) |   | |__| |    | |     _| |_  | |____   _| |_     | |     _| |_  | |____   ____) |
   |_____/  /_____| /_____| |______|     |_____/     \____/     |_|    |_____| |______| |_____|    |_|    |_____| |______| |_____/

                                                            Made by szze#6220
                                                                  V1.5
]] .. "\n")

local statsService = game:GetService("Stats")
local totalMemory = statsService:GetTotalMemoryUsageMb()

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", closure(function(self, ...)
    local method = getnamecallmethod()

    if method == "IsVoiceEnabledForUserIdAsync" then
        return true
    elseif method == "GetTotalMemoryUsageMb" then
		return math.random(totalMemory - 25, totalMemory + 25)
    end

    if not checkcaller() then
        local args = { ... }

        if method == "UserOwnsGamePassAsync" or method == "PlayerHasPass" then
            return true

        elseif string.lower(method) == "kick" and self == lplr then
            local s = getcallingscript()
            LMagentaPrint("szze's utilities | Blocked kick from " .. (s and s:GetFullName() or "Couldn't fetch") .. " | Method used: __namecall \n")
            return wait(9e9)

        elseif string.lower(method) == "destroy" and self == lplr then
            local s = getcallingscript()
            LMagentaPrint("szze's utilities | Blocked kick from " .. (s and s:GetFullName() or "Couldn't fetch") .. " | Method used: __namecall [DESTROY] \n")
            return wait(9e9)

        elseif string.lower(method) == "shutdown" and self == game then
            local s = getcallingscript()
            LMagentaPrint("szze's utilities | Blocked kick from " .. (s and s:GetFullName() or "Couldn't fetch") .. " | Method used: __namecall [SHUTDOWN] \n")
            return wait(9e9)

        elseif (method == "PreloadAsync" or method == "preloadAsync")
            and self == ContentProvider
            and type(args[1]) == "table" and table.find(args[1], CoreGui) then
            local s = getcallingscript()
            LMagentaPrint("szze's utilities | Blocked PreloadAsync detection from " .. (s and s:GetFullName() or "Couldn't fetch") .. " | Method used: __namecall \n")
            args[1] = tbl
            return oldNamecall(self, unpack(args))
        end
    end

    return oldNamecall(self, ...)
end))

local function blockKickFunc(fn, label)
    local orig
    orig = hookfunction(fn, closure(function(...)
        if not checkcaller() then
            LMagentaPrint("szze's utilities | Blocked kick | Method used: __index " .. label .. "\n")
            return wait(9e9)
        end
        return orig(...)
    end))
    return orig
end

local oldPreload
oldPreload = hookfunction(ContentProvider.PreloadAsync, closure(function(self, ...)
    local args = { ... }
    if not checkcaller() and type(args[1]) == "table" and table.find(args[1], CoreGui) then
        LMagentaPrint("szze's utilities | Blocked PreloadAsync detection | Method used: __index \n")
        args[1] = tbl
        return oldPreload(self, unpack(args))
    end
    return oldPreload(self, ...)
end))

blockKickFunc(game.Shutdown,  "[SHUTDOWN]")

task.spawn(function()
    repeat task.wait() until game:IsLoaded()

    for _, v in next, ReplicatedStorage:GetDescendants() do
        if v.Name == "__FUNCTION" and v:IsA("RemoteFunction") and v.Parent:IsA("RemoteEvent") then
            isAdonis = true
        end
    end
    ReplicatedStorage.ChildAdded:Connect(function(v)
        task.wait()
        if v:IsA("RemoteEvent") then
            local f = v:FindFirstChildWhichIsA("RemoteFunction")
            if f and f.Name == "__FUNCTION" then isAdonis = true end
        end
    end)

    blockKickFunc(lplr.Destroy, "[DESTROY]")

    if not isAdonis then
        blockKickFunc(lplr.Kick, "")
    else
        rconsoleprint("@@RED@@")
        rconsoleprint("Adonis detected! __index kick bypass will not work. \n")
    end
end)

local connections = getconnections or get_signal_cons
if connections then
    for _, v in next, connections(lplr.Idled) do
        v:Disable()
    end
end
lplr.Idled:Connect(function(t)
    if t > 1200 and not isAFK then
        LMagentaPrint("AntiAFK bypassed the kick \n")
        isAFK = true
    end
end)

GreenPrint("Client Anti-Kick loaded \n")
GreenPrint("VoiceChat spoofer loaded \n")
GreenPrint("PreloadBypass loaded \n")
GreenPrint("Memory bypasser loaded \n")
GreenPrint("Local GamePass bypasser loaded \n")
GreenPrint("AntiAFK loaded \n")

local ver = "V1.5"
local ok, verMain = pcall(function()
    return loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/CF-Trail/random/main/utilLoader/ver"))()
end)
if ok and ver ~= verMain then
    LMagentaPrint("Please update your utils script. -CF-Trail.")
end
