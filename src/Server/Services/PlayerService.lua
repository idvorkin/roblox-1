-- Player Service
-- Username
-- September 7, 2020



local PlayerService = {Client = {}}

local function onCharacterAdded(character)
    g_last_player_spawned = character
    PrintTopLine(character.Name .. " Is the new Cat Lady")
end
 
local function onPlayerAdded(player)
	-- Check if they already spawned in
	if player.Character then
        onCharacterAdded(player.Character)
    else
	    -- Listen for the player (re)spawning 
	    player.CharacterAdded:Connect(onCharacterAdded)
	end
end
 

function PlayerService:Start()
	
end


function PlayerService:Init()
	
end


return PlayerService