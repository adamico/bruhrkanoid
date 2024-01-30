local world = ECS.world()

function world.addSystems(systems)
  for _, system in pair(systems) do
    ECS.addSystem(world, system)
  end
end

function world.addEntity(entity)
  ECS.addEntity(world, entity)
end

function world.removeEntity(entity)
  ECS.removeEntity(world, entity)
end

return world
