--[[
uwu??
]]
lp = game:GetService("Players").LocalPlayer
local oldhook

oldhook = hookmetamethod(game, "__namecall", function(Self, ...)
	local method = getnamecallmethod()

	if not checkcaller() and Self == lp and (method == "Kick" or method == "kick") then
		return wait(9e9)
	end

	return oldhook(Self, ...)
end)
