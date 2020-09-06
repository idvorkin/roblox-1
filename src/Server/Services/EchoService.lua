-- Echo Service
-- Username
-- September 6, 2020



local EchoService = {Client = {}}

local function ClosestHumanoid(player)
    local players = game.Players:GetPlayers();
    local npcs = npc_directory:GetChildren();
   
    local closest = { humanoid = false, distance = math.huge } --where we will store the closest humanoid found so far, along with how far away it is
    local character = player.Character or player.CharacterAdded:wait();
    local root = character:WaitForChild('HumanoidRootPart', 1);
  
    local to_check = npcs;
    for _,PLAYER in pairs(players) do
      if PLAYER.Character and PLAYER ~= player then
        table.insert(to_check, PLAYER.Character)
      end
    end
  
    for _,humanoid_model in pairs(to_check) do
      local displacement = (humanoid_model .HumanoidRootPart.Position - root.Position).magnitude;
      if displacement < closest.distance then
        closest.distance = displacement;
        closest.humanoid = humanoid_model:FindFirstChild('Humanoid');
      end
    end
  
    return closest.humanoid
  end
  

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

    for _,v in pairs(npcs) do
        print (v.name)
        MakeAClone(v)
    end
	
end


function EchoService:Init()
	
end


return EchoService