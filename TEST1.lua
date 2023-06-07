repeat wait(3) until game:IsLoaded()
local key = _G.Key
local keys = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheG450/TEST/main/Key.lua"))()
if game.PlaceId == 11481193418 then
    if game:GetService("Players").LocalPlayer.Name == "thebigblockclock1" and game:GetService("Players").LocalPlayer.UserId == 4135685309 then
        if table.find(keys, key) then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TheG450/MakeItsPaidVIP/main/Paid.lua"))()
        else
            game:GetService("Players").LocalPlayer:Kick("Wrong Key!!!")
        end
    else
        game:GetService("Players").LocalPlayer:Kick("Wrong Player!!!")
    end
else
    game:GetService("Players").LocalPlayer:Kick("Wrong Map!!!")
end
