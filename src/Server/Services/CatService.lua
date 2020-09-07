-- Cat Service
-- Username
-- September 7, 2020

local _ 
local count_cats = 20

-- Can't figure out how to map to in game position, so store it externally
-- Arguably, this is closer to a view model, so it's more gooder


function MakeAClone(template)
    local clone = template:Clone()
    clone.Parent = game.Workspace
    clone.Name = "CLONE:" .. clone.Name 
    return clone
end

function randomNegate(x)
    local dice = math.random()
    if dice < 0.5 then 
        return -1*x
    end
    return x
end 

function MoveOneSquareRandom(model)
    print('moving one')
    old_pos = model.PrimaryPart.Position
    local new_x  = old_pos.X + randomNegate(1) 
    local new_z  = old_pos.Y + randomNegate(1)
    local new_pos = Vector3.new(new_x,old_pos.y,new_z)
    print (old_pos)
    print (new_pos)
    model:MoveTo(new_pos)
end

function MoveRandom(model)
    print('moving random')
    local radius = 100
    local x = math.random(-1*radius, 1*radius)
    local z = math.random(-1*radius, 1*radius)
    local location = Vector3.new(x,0,z)
    model:MoveTo(location)
end


local CatService = {Client = {}}

function CatService:Start()
    _ = self.Shared.underscore
    print('CatService:Start')
    local radius = 100
    local catTemplate = game.Workspace.Templates.Cat --put the name of the folder here

    local all_cats = _.map(_.range(count_cats), function (i) 
        return MakeAClone(catTemplate) 
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