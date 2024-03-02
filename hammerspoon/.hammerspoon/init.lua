-- Bind the enable function to a hotkey, for example: ctrl + alt + cmd + E
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "E", function()
	hs.execute("networksetup -setsecurewebproxystate 'Wi-Fi' on", true)
	hs.alert.show("HTTPS Proxy Enabled")
end)

-- Bind the disable function to a hotkey, for example: ctrl + alt + cmd + D
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "D", function()
	hs.execute("networksetup -setsecurewebproxystate 'Wi-Fi' off", true)
	hs.alert.show("HTTPS Proxy Disabled")
end)

-- Script launcher menu
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "S", function()
	local function chooserCallback(choice)
		if not choice then
			hs.alert.show("No selection made")
			return
		end

		local scriptPath = hs.fs.pathToAbsolute("~/Developer/script-launcher/macos/" .. choice.scriptName)
		local output, status, type, rc

        print(scriptPath)
		-- Determine if the selected script is an AppleScript by its extension
		if string.match(choice.scriptName, "%.applescript$") then
			status, output, rc = hs.osascript.applescriptFromFile(scriptPath)
			if status then
				hs.alert.show(string.format("Success: %s", output))
			else
				hs.alert.show(string.format("Error running Applescript: %s", output))
			end
		else
			-- Assume it's a shell script or other executable
			output, status, type, rc = hs.execute(scriptPath, true)
			if status and rc == 0 then
				hs.alert.show("Success: " .. output)
			else
				hs.alert.show(string.format("Error: %s, %s, %s, %s", output, status, type, rc))
			end
		end
	end

	local choices = {
		{
			text = "Restart ControlCenter",
			subText = "Restart ControlCenter when it bugs out after changing displays",
			scriptName = "restart_controlcenter.sh",
		},
		{
			text = "(Finder) Create New File",
			subText = "Create an empty file in the current Finder window",
			scriptName = "create_new_file.applescript",
		},
		{
			text = "(Finder) Move to workdir",
			subText = "Moves the currently selected file/directory to ~work",
			scriptName = "move_to_workdir.applescript",
		},
	}

	local chooser = hs.chooser.new(chooserCallback)
	chooser:choices(choices)
	chooser:show()
end)

