-- Player Module
-- Username
-- September 7, 2020

local PlayerModule = {}

local function onPlayerAdded(player, onCharacterAdded)
	if player.Character then
        onCharacterAdded(player.Character)
    else
	    -- Listen for the player (re)spawning 
	    player.CharacterAdded:Connect(onCharacterAdded)
	end
end

function PlayerModule.ConnectOnNewCharacter(underscore_module,onCharacterAdded)
    -- BLEH Need to figure out how to get this stuff passed in.
    -- local _ = self.Shared.underscore
    -- Should be in it's own service
    local _ = underscore_module
    local Players = game:GetService("Players")

    local boundOnPlayerAdded = _.curry(onPlayerAdded, onCharacterAdded)

    -- Call on player added for everyone already in the game.
    _.each(Players:GetPlayers(), boundOnPlayerAdded)

    -- Register for any new players to be added
    Players.PlayerAdded:Connect(boundOnPlayerAdded)
end


return PlayerModule