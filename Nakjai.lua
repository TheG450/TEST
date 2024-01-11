repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "CraftWar Test",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}
local Tab = GUI:Tab{
	Name = "Main",
	Icon = "rbxassetid://4034483344"
}
Tab:Toggle{
	Name = "Auto Farm",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        _G.AutoFarn = state
    end
}

spawn(function()
    while wait() do
        if _G.AutoFarn == true then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("Animation") and v.Humanoid.Health > 0 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.AutoFarn == true then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("Animation") and v.Humanoid.Health > 0 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                        game.Players.LocalPlayer.Character:WaitForChild("Charged Desert King's Glaive").Client:FireServer(v.HumanoidRootPart.Position, "Swing")
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.AutoFarn == true then
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.name == "Charged Desert King's Glaive" then
                    v.Parent = game.Players.LocalPlayer.Character
                end
            end
        end
    end
end)
