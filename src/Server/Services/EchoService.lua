-- Echo Service
-- Username
-- September 6, 2020



local EchoService = {Client = {}}

function MakeAClone(me)
    local clone = me:Clone()
    clone.Parent = game.Workspace
    clone.Name = "CLONE:" .. clone.Name 
    clone:MoveTo(Vector3.new(0,0,0))
end

function EchoService:Start()
    print("Echo Server Start")
    local npc_directory = game.Workspace['NPC'] --put the name of the folder here
    local npcs = npc_directory:GetChildren();

    -- for _,v in pairs(npcs) do
        -- print (v.name)
        -- MakeAClone(v)
    -- end
	
end


function EchoService:Init()
	
end


return EchoService