local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local PhantomForcesWindow = Library:NewWindow("Combat")
local KillingCheats = PhantomForcesWindow:NewSection("Kill Options")
local Player = game.Players.LocalPlayer
KillingCheats:CreateToggle("Auto Collect", function(value)
    _G.AutoCollect = value
end)
KillingCheats:CreateToggle("Auto Build", function(value)
    _G.AutoBuild = value
end)
KillingCheats:CreateToggle("Auto Chest", function(value)
    _G.AutoChest = value
end)
KillingCheats:CreateToggle("Auto Crate", function(value)
    _G.AutoCrate = value
end)
KillingCheats:CreateToggle("Instant Kill Boss", function(value)
    _G.InstantKill = value
end)
KillingCheats:CreateSlider("WalkSpeed", 0, 1000, 50, false, function(value)
    _G.Speed = value
end)
KillingCheats:CreateSlider("JumpPower", 0, 1000, 50, false, function(value)
    _G.Power = value
end)
KillingCheats:CreateButton("Button", function()
print("HI")
end)
KillingCheats:CreateTextbox("TextBox", function(text)
        print(text)
end)
KillingCheats:CreateToggle("Auto Chest", function(value)
    _G.AutoChest = value
end)
KillingCheats:CreateDropdown("DropDown", {"Hello", "World", "Hello World"}, 2, function(text)
print(text)
end)
-------------SCRIPT--------------------------------
spawn(function()
    while wait() do
        if _G.AutoChest == true then
            wait()
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Treasure.Chests:GetChildren()) do
                    if v.Name == "Chest" and v:FindFirstChild("ProximityPrompt") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        wait(0.5)
                        fireproximityprompt(v.ProximityPrompt)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.AutoCrate == true then
            wait()
            pcall(function()
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == "BalloonCrate" and v:FindFirstChild("Crate") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Crate.CFrame
                        wait(0.5)
                        fireproximityprompt(v.Crate.ProximityPrompt)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.InstantKill == true then
            wait()
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Characters.Enemies:GetDescendants()) do
                    if v.Name == "Boss" and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health < v.Humanoid.MaxHealth then
                        v.Humanoid.Health = 0
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.AutoCollect == true then
            wait()
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Tycoons[game.Players.LocalPlayer.Name].Auxiliary.Collector:GetChildren()) do
                    if v.Name == "Collect" and v:FindFirstChild("TouchInterest") then
                        v.CanCollide = false
                        v.Transparency = 1
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-359.567383, 7.67021751, 252.862183, -0.505788982, -5.78395607e-08, 0.862657249, -8.80229081e-08, 1, 1.54389763e-08, -0.862657249, -6.81247343e-08, -0.505788982)
                        wait(0.1)
                        Distance = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if Distance <= 200 then
                            Speed = 30
                        elseif Distance >= 400 then
                            Speed = 50
                        end
                        game:GetService("TweenService"):Create(
                            v,
                            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                            {CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame}
                        ):Play()
                        wait(0.1)
                        game:GetService("TweenService"):Create(
                            v,
                            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                            {CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,5)}
                        ):Play()
                        wait(0.1)
                        game:GetService("TweenService"):Create(
                            v,
                            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                            {CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-5)}
                        ):Play()
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait(0.1) do
        if _G.AutoBuild == true then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Tycoons[game.Players.LocalPlayer.Name].Buttons:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Button") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Button.CFrame
                    end
                end
            end)
        end
    end
end)
-------------SCRIPT2--------------------------------
spawn(function()
    while wait(0.1) do
        if _G.WS == true then
            pcall(function()
                Player.Character.Humanoid.WalkSpeed = _G.Speed
            end)
        else
            pcall(function()
                Player.Character.Humanoid.WalkSpeed = 16
            end)
        end
        if _G.JP == true then
            pcall(function()
                Player.Character.Humanoid.JumpPower = _G.JumpPower
            end)
        else
            pcall(function()
                Player.Character.Humanoid.JumpPower = 50
            end)
        end 
    end
end)
