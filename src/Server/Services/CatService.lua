-- Cat Service
-- Username
-- September 7, 2020

local _ 
local all_cats 

function MakeAClone(template)
    local clone = template:Clone()
    clone.Parent = game.Workspace
    clone.Name = "CLONE:" .. clone.Name 
    return clone
end
--    clone:MoveTo(start_location)

function MoveRandom(part)
    local radius = 100
    local x = math.random(-1*radius, 1*radius)
    local z = math.random(-1*radius, 1*radius)
    local location = Vector3.new(x,0,z)
    part:MoveTo(location)
end

function MoveOneSquareRandom(part)
    local radius = 100
    local x = part.position.x
    local z = part.position.z
    local location = Vector3.new(x,0,z)
    part:MoveTo(location)
end




local CatService = {Client = {}}
local BaseCat = 0


function CatService:Start()
    -- _ = self.Modules.underscore
    _ = self.Shared.underscore
    local catTemplate = game.Workspace.Templates.Cat --put the name of the folder here
    local all_cats = _.map(_.range(5), function (i) 
        return  MakeAClone(catTemplate)
    end)

    -- Set initial Values
    _.each(all_cats, MoveRandom)

    _.each(_.range(1000), function (i)
        _.each(all_cats, MoveOneSquareRandom)
        wait (1)
    end )
end


function CatService:Init()
	
end


return CatService