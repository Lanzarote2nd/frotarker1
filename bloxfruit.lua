local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
   Name = "🔥 Blox Fruits Script 🔥",
   LoadingTitle = "Loading...",
   LoadingSubtitle = "By Developer",
   ConfigurationSaving = {
      Enabled = false
   }
})

local Tab = Window:CreateTab("Main")

Tab:CreateButton({
   Name = "Test Button",
   Callback = function()
      print("Rayfield UI Works!")
   end
})

Rayfield:Notify({
   Title = "Blox Fruits Script",
   Content = "🔥 GUI Loaded Successfully 🔥",
   Duration = 5
})

