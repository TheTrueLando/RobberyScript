-- In Workspace > GetMoney > Script

script.Parent.ProximityPrompt.TriggerEnded:Connect(function(player)
	if player.Config.Cooldown.Value == false then
		player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 100000 --Amount of money you get per time robbing
		player.Config.Cooldown.Value = true
		task.wait(10) -- time inbetween when they can and cant rob
		player.Config.Cooldown.Value = false
	elseif player.Config.Cooldown.Value == true then
		print(player.Name .. " Is on a cooldown")
	end
end)