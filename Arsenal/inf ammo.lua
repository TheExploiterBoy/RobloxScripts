--// Credit To MMSVon For Making The Script \\--

game:GetService("RunService").Stepped:connect(function() -- Loop made by MMSVon
    pcall(function() -- It is used for calling functions that may possibly error so that it does not stop the script and we can handle it manually.
        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
      end) 
  end) --Loop end
