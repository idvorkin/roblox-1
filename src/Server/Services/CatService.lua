-- Cat Service
-- Username
-- September 7, 2020

local _ 


function MakeAClone(template)
    local clone = template:Clone()
    clone.Parent = game.Workspace
    clone.Name = "CLONE:" .. clone.Name 
    clone:MoveTo(Vector3.new(0,0,0))
end

local CatService = {Client = {}}
local BaseCat = 0


function CatService:Start()
    -- _ = self.Modules.underscore
    _ = self.Shared.underscore
    local catTemplate = game.Workspace.Templates.Cat --put the name of the folder here
    _.each(_.range(5), function (i) 
        MakeAClone(catTemplate)
    end) 
end


function CatService:Init()
	
end


return CatService