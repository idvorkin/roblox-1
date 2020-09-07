-- Cat Service
-- Username
-- September 7, 2020

local _ 
local count_cats = 20
local player_pos = Vector3.new(0,0,0)

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
    local new_z  = old_pos.Z + randomNegate(1)
    local new_pos = Vector3.new(new_x,old_pos.y, new_z)
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
    print (location)
    model:MoveTo(location)
end

function MoveZach(model)
    DanceUpAndDown(model)
    MoveCloserToPosition(model, player_pos)
end 

function MoveCloserToPosition(model, player_pos)
    old_pos = model.PrimaryPart.Position

    -- Start with x
    local delta_x=0
    local delta_y=0
    local delta_z=0

    if old_pos.x > player_pos.x then
        delta_x = 1
    elseif  (old_pos.x > player_pos.x) then
        delta_x = -1
    else 
        -- They're equal, do nothing
    end 

    -- Fix the x co-ordinate
    local location = Vector3.new(old_pos.X + delta_x, old_pos.Y + delta_y, old_pos.Z + delta_z)
    model:MoveTo(location)
end 

function DanceUpAndDown(model)
    old_pos = model.PrimaryPart.Position
    --local new_x  = old_pos.X + randomNegate(1) 
    --local new_z  = old_pos.Z + randomNegate(1)

    local rand = math.random() -- return a number from 0 to 1
    local delta_y = 1

    if rand > 0.5 then
        delta_y = 1 * math.random(5)
    else
        delta_y = -1 * math.random(5)
    end 

    local new_pos = Vector3.new(old_pos.X,old_pos.Y+delta_y, old_pos.Z)
    model:MoveTo(new_pos)
    --print (old_pos)
    --print (new_pos)
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
        -- _.each(all_cats, MoveOneSquareRandom)
        _.each(all_cats, MoveZach)
        wait (1)
    end )
end


function CatService:Init()
	
end


return CatService