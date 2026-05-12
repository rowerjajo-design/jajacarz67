local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🥚 JAJCARZ 67 | FINAL MM2",
   LoadingTitle = "Wczytywanie potęgi Jajcarza...",
   LoadingSubtitle = "by Jajcarz Industries",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "JajcarzHub",
      FileName = "Ustawienia"
   },
   KeySystem = false
})

-- ZAKŁADKI
local MainTab = Window:CreateTab("Główne", 4483362458) 
local PlayerTab = Window:CreateTab("Gracz", 4483345998)
local WorldTab = Window:CreateTab("Świat", 4483362458)

-- 1. ZAKŁADKA GŁÓWNE (ESP I MM2)
MainTab:CreateSection("Wizualizacje")

MainTab:CreateButton({
   Name = "ESP Ról (Morderca/Szeryf)",
   Callback = function()
       for _, v in pairs(game.Players:GetPlayers()) do
           if v ~= game.Players.LocalPlayer and v.Character then
               local highlight = v.Character:FindFirstChild("Highlight") or Instance.new("Highlight", v.Character)
               highlight.FillTransparency = 0.5
               
               -- Sprawdzanie roli
               if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
                   highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Czerwony
               elseif v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
                   highlight.FillColor = Color3.fromRGB(0, 0, 255) -- Niebieski
               else
                   highlight.FillColor = Color3.fromRGB(150, 0, 255) -- Fioletowy Jajcarz
               end
           end
       end
   end,
})

-- 2. ZAKŁADKA GRACZ (SPEED & JUMP)
PlayerTab:CreateSection("Ulepszenia")

local CurrentSpeed = 16
PlayerTab:CreateSlider({
   Name = "Prędkość",
   Range = {16, 200},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      CurrentSpeed = Value
      if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
          game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

PlayerTab:CreateToggle({
   Name = "Fioletowa Smuga (Trail)",
   CurrentValue = false,
   Callback = function(Value)
       if Value then
           local trail = Instance.new("Trail", game.Players.LocalPlayer.Character.HumanoidRootPart)
           -- (tutaj kod smugi, który już znasz)
       end
   end,
})

-- 3. ZAKŁADKA ŚWIAT
WorldTab:CreateSection("Efekty Mapy")

WorldTab:CreateButton({
   Name = "Przezroczyste Ściany (X-Ray)",
   Callback = function()
       for _, obj in pairs(game.Workspace:GetDescendants()) do
           if obj:IsA("BasePart") and not obj.Parent:FindFirstChild("Humanoid") then
               obj.Transparency = obj.Transparency == 0 and 0.5 or 0
           end
       end
   end,
})

-- Pętla pilnująca prędkości (Naprawiona!)
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = CurrentSpeed
        end)
    end
end)
