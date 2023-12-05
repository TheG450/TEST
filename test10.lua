local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local PhantomForcesWindow = Library:NewWindow("Poo Hub")
local KillingCheats = PhantomForcesWindow:NewSection("Main")
local KillingCheats2 = PhantomForcesWindow:NewSection("Credit")
local Player = game.Players.LocalPlayer
KillingCheats:CreateToggle("Auto Collect", function(value)
    _G.AutoCollect = value
end)
KillingCheats:CreateToggle("Auto Build", function(value)
    _G.AutoBuild = value
end)
KillingCheats:CreateToggle("Auto Rebirth", function(value)
    _G.AutoRebirth = value
end)
KillingCheats:CreateToggle("Auto Chest", function(value)
    _G.AutoChest = value
end)
KillingCheats:CreateToggle("Auto Crate", function(value)
    _G.AutoCrate = value
end)
KillingCheats:CreateToggle("Auto Collect BossDrop", function(value)
    _G.AutoDrop = value
end)
KillingCheats:CreateToggle("Instant Kill Boss", function(value)
    _G.InstantKill = value
end)
KillingCheats:CreateDropdown("Select Element", {"Super Sonic", "Gravity", "Nature", "Earth", "Time", "Darkness", "Lava", "Light", "Crystal", "Devil", "Technology", "Thunder", "Space", "Bone", "Fire", "Ice", "Venom"}, 2, function(text)
    _G.Element = text
end)
KillingCheats:CreateToggle("Auto Select Element", function(value)
    _G.AutoSE = value
end)
KillingCheats2:CreateButton("Copy DiscordName", function()
    setclipboard("TheBlobby")
    wait(1)
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.5
    frame.Parent = screenGui

    local copyDoneLabel = Instance.new("TextLabel")
    copyDoneLabel.Text = "Copy Done"
    copyDoneLabel.Size = UDim2.new(0, 200, 0, 50)
    copyDoneLabel.Position = UDim2.new(0.5, -100, 0.5, -25)
    copyDoneLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    copyDoneLabel.BackgroundTransparency = 1
    copyDoneLabel.TextColor3 = Color3.new(255,255,255)
    copyDoneLabel.TextSize = 50
    copyDoneLabel.Parent = frame
    wait(3.5)
    screenGui:Destroy()
end)
-------------SCRIPT--------------------------------
spawn(function()
	while wait() do
        pcall(function()
            local anti = game:GetService("VirtualUser")
                game:GetService("Players").LocalPlayer.Idled:connect(function()
                anti:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                anti:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end)
    end
end)
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
            pcall(function()
                local collector = game:GetService("Workspace").Tycoons[game.Players.LocalPlayer.Name].Auxiliary.Collector
                if collector then
                    for i, v in pairs(collector:GetChildren()) do
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
                                TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
                                { CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame }
                            ):Play()
                            wait(0.1)
                            game:GetService("TweenService"):Create(
                                v,
                                TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
                                { CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5) }
                            ):Play()
                            wait(0.1)
                            game:GetService("TweenService"):Create(
                                v,
                                TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
                                { CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5) }
                            ):Play()
                        end
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
                local forestGreenBrickColor = BrickColor.new("Forest green")
                for i, v in pairs(game:GetService("Workspace").Tycoons[game.Players.LocalPlayer.Name].Buttons:GetDescendants()) do
                    if v.Name == "Button" and v:FindFirstChild("TouchInterest") then
                        if v.BrickColor == forestGreenBrickColor then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,2,0)
                            wait(5)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait(0.1) do
        if _G.AutoDrop == true then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == "Dollar" and v:FindFirstChild("TouchInterest") then
                        v.CanCollide = false
                        wait(0.1)
                        Distance = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if Distance <= 200 then
                            Speed = 300
                        elseif Distance >= 400 then
                            Speed = 300
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
        if _G.AutoRebirth == true then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Tycoons[game.Players.LocalPlayer.Name].Auxiliary:GetChildren()) do
                    if v.Name == "Rebirth" and v:FindFirstChild("Button") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Button.CFrame
                        wait(0.1)
                        fireproximityprompt(v.Button.ProximityPrompt)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait(0.1) do
        if _G.AutoSE == true then
            pcall(function()
                local localPlayer = game.Players.LocalPlayer
                local character = localPlayer.Character
                local tycoonUI = character and character:FindFirstChild("TycoonUI")
                if tycoonUI then
                    local textLabel = tycoonUI:FindFirstChild("TextLabel")
                    if textLabel and textLabel.Text == "For Hire!" then
                        for i,v in pairs(game:GetService("Workspace").Tycoons["Claim"].Auxiliary:GetDescendants()) do
                            if v.Name == "Door" and v:FindFirstChild("Title") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Title.CFrame
                                wait(5)
                                local ohString1 = _G.Element
                                game:GetService("Players").LocalPlayer.PlayerGui.SelectionUI.RemoteEvent:FireServer(ohString1)
                                wait(1)
                                game:GetService("Lighting").Blur.Enabled = false
                                wait(0.5)
                                game:GetService("Players").LocalPlayer.PlayerGui.HUD.Enabled = true 
                            end
                        end
                    end
                end
            end)
        end
    end
end)


