-- Cat Service
-- Username
-- September 7, 2020

function MakeAClone(template)
    local clone = template:Clone()
    clone.Parent = game.Workspace
    clone.Name = "CLONE:" .. clone.Name 
    clone:MoveTo(Vector3.new(0,0,0))
end

local CatService = {Client = {}}
local BaseCat = 0


function CatService:Start()
    local npc_directory = game.Workspace['NPC'] --put the name of the folder here
    local npcs = npc_directory:GetChildren();
    for _,v in pairs(npcs) do
        print (v.name)
        MakeAClone(v)
    end
end


function CatService:Init()
	
end


return CatService