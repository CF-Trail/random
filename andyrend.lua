local lyrics = {
    ['Blade of Tears'] = {
        {"Andy Rend",4},
        {"(Huh, ah)",1}, -- 14.6
        {"My style's a tsunami, puts fear on you (A-ha)",4.4}, -- 18
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
        {"Road to sky (Ah, cursed)", 1.7}, -- 41.2
        
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
        {"####### are looking overtime, uh", 3.31}
    },
    ['Bloodrage'] = {
        {'The search for blood, begin', 5.5}, -- 5.5s
        {'This form’s a samurai, blades are in my hands', 2.6}, -- 8.1s
        {'I cut the screams (Ah)', 1}, -- 9.1s
        {'Piercing wind so fast, you only see the gleams (I, I)', 3.3}, -- 12.4
        {'I have a list', 1.3}, -- 13.7
        {'When I see the freaks, it’s slaughter in my mind', 2.2}, -- 15.9
        {'My style is really psycho', 1.3}, -- 17.2
        {'I’m in the role of Shinigami, these guys are psychos', 2.4}, -- 19.6
        {'I’m speeding through this map, amd my meet is Supra', 2.4}, -- 22
        {'Chrome sounds, I’m so heckin\' random, like a flicker', 2.4}, -- 24.2
        {'In me flames of bloodrage, I got teeth like Samehada (Ah)', 3.6}, -- 27.8
        {'I\'m feeling the bloodrage', 2.3}, -- 30.1
        {'There\'s bloody fogs nearby', 1.9}, -- 32
        {'I\'m feeling the bloodrage', 2.1}, -- 34.1
        {'Ah, ah, bloodrage', 1.8}, -- 35.9
        {'Ah, I, blades, blades, blades, blades', 2.9}, -- 38.8
        {'I\'m feeling the bloodrage', 2.3}, -- 30.1
        {'There\'s bloody fogs nearby', 1.9}, -- 32
        {'I\'m feeling the bloodrage', 2.1}, -- 34.1
        {'Ah, ah, bloodrage', 3}, -- 35.9
        {'On me bloodlust',3.31}
    }
}

function pickRandomSong()
    local songNames = {}
    for songName in pairs(lyrics) do
        table.insert(songNames, songName)
    end
    local randomIndex = math.random(1, #songNames)
    local chosenSong = songNames[randomIndex]
    return lyrics[chosenSong], chosenSong
end

for i, v in next, game:GetService("Players"):GetPlayers() do
    warn(v.Name)
    local songLyrics, songName = pickRandomSong()
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SendMessage"):InvokeServer(v.UserId, 'Congratulations! Your song is: ' .. songName)
    for _i, lyr in next, songLyrics do
        if lyr[1] == 'skip' then
            print('skipping')
            task.wait(lyr[2])
            continue
        end
        local resp = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SendMessage"):InvokeServer(v.UserId, lyr[1])
        if typeof(resp) == 'table' then
            resp = unpack(resp)
        end
        print(tostring(resp) .. ': ' .. lyr[1])
        if resp == false then
            warn('Skipping - blocked')
            break
        end
        task.wait(lyr[2])
        if lyr[2] == 3.31 then
            break
        end
    end
    task.wait(2)
end
