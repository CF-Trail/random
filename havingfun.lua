local lyrics = {
    {"skip",13.6},
    {"(Huh, ah)",1}, -- 14.6
    {" My style's a tsunami, puts fear on you (A-ha)",4.4}, -- 18
    {"Got a bunch of blades, blade of tears, yeah,", 3.3}, -- 21.3
    {"My run's like shukuchi, with tears in the gear,",3.5}, -- 24.8
    {"Got a bunch of blades, blade of tears, yeah.",3.1}, -- 27.9
    
    {"Blade of tears, yeah,",1.6}, -- 29.5
    {"Blade of tears, huh,",1.6}, -- 31.1
    {"Blade of tears, yeah,",1.6}, -- 32.7
    {"Blade of tears, yeah,",1.6}, -- 34.3
    
    {"Died, and they all shout: 'die-die-die'", 1.6}, -- 35.9
    {"Blood-pattern daggers, fly-fly-fly", 1.7}, -- 37.6
    {"Crying katanas, by my side", 1.9}, -- 39.5
    {"Road to the sky (Ah, cursed)", 1.7}, -- 41.2
    
    {"Blade of tears, I'm fallen", 1.7}, -- 42.9
    {"My kicks Rick and Owens", 1.9}, -- 44.8
    {"Limiteds sold out", 2.3}, -- 47.1
    {"Blades out of me", 1.6}, -- 48.7
    {"Tears, tears became blades", 3}, -- 51.7
    {"They got revenge mode, revenge mode", 3.1}, -- 54.8
    
    {"(Huh, ah)",1}, -- 14.6
    {"My style's a tsunami, puts fear on you (A-ha)",4.4}, -- 18
    {"Got a bunch of blades, blade of tears, yeah,", 3.3}, -- 21.3
    {"My run's like shukuchi, with tears in the gear,",3.5}, -- 24.8
    {"Got a bunch of blades, blade of tears, yeah.",3.1}, -- 27.9
    
    {"Blade of tears, yeah,",1.6}, -- 29.5
    {"Blade of tears, huh,",1.6}, -- 31.1
    {"Blade of tears, yeah,",1.6}, -- 32.7
    {"Blade of tears, yeah,",1.6}, -- 86.2 1m16.2s
    
    {"Huh, in a full squad, VS you we", 1.4}, -- 1m17.8s 87.6
    {"Your tears and screams in mp3", 1,9}, -- 1m19.7 
    {"Die-die-die, keeping the terror", 1.6}, -- 1m21.3
    {"Fly-fly-fly, that's a new era", 1.8}, -- 1m23.1
    
    {"Blades of tears, I'm again Yurnero", 1.7}, -- 1m24.8
    {"Spinning the planet like a sphere", 1.8}, -- 1m26.6
    {"Changed my style, that's the new era", 2.5}, -- 1m29.1
    {"Uh, era-era (Slash)", 1.7}, -- 1m30.8
    
    {"I didn't forget, be quiet-quiet", 2}, -- 1m32.8
    {"Changed the time, switched the vibe", 1.8}, -- 1m34.6
    {"####### are looking overtime, uh", 0},
}

for i,v in next, game:GetService('Players'):GetPlayers() do
    for _i, lyr in next, lyrics do
        if lyr[1] == 'skip' then
            print('skipping')
            task.wait(lyr[2])
            continue
        end
        local resp = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SendMessage"):InvokeServer(v.UserId,lyr[1])
        if typeof(resp) == 'table' then
            resp = unpack(resp)
        end
        print(tostring(resp))
        task.wait(lyr[2])
        if lyr[2] == 0 then
            break
        end
    end
end
