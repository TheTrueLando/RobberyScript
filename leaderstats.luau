-- In ServerScriptService

local DataStoreService = game:GetService("DataStoreService")
local myDataStore = DataStoreService:GetDataStore("myDataStore")

game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local TFolder = Instance.new("Folder")
	TFolder.Name = "Config"
	TFolder.Parent = player
	local Timer = Instance.new("BoolValue")
	Timer.Name = "Cooldown"
	Timer.Parent = TFolder
	
	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Parent = leaderstats
	
	local data
	local success, errorMessage = pcall(function()
		data = myDataStore:GetAsync(player.UserId)
	end)
	
	if success then 
		coins.Value = data
	else
		warn(errorMessage)
	end
end)

game.Players.PlayerRemoving:Connect(function(player)
	local success, errormessage = pcall(function()
		local data = myDataStore:SetAsync(player.UserId, player.leaderstats.Coins.Value)
	end)
	
	if success then
		print("All the data has been saved!")
	else
		warn(errormessage)
	end
end)

game:BindToClose(function()
	for i, player in pairs(game.Players:GetChildren()) do
		player:Kick("Shutdown")
	end
	task.wait(1)
end)