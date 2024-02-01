local ecs = require 'lib.tiny'
local physicsSystem = ecs.processingSystem(Class('PhysicsSystem'))

local screen_height = love.graphics.getHeight()
local world = require 'world'
local physics_world = require 'physics_world'
physicsSystem.filter = ecs.requireAll('physics')

function physicsSystem:onAdd(e)
  local px, py = e.position.x, e.position.y
  local shape = e.display.shape
  local width = shape == "rectangle" and e.display.width or e.display.radius
  local height = shape == "rectangle" and e.display.height or width

  physics_world:add(e, px, py, width, height)
end

function physicsSystem:onRemove(e)
  physics_world:remove(e)
end

function physicsSystem:process(e, dt)
  if e.motion then physicsSystem:move(e, dt) end

  -- if e.isBall then
  --   balldx = e.motion.dx
  --   balldy = e.motion.dy
  -- end

  if e.position.y >= screen_height + screen_height/2 then
    ecs.removeEntity(world, e)
    physics_world:remove(e)
  end
end

function physicsSystem:move(e, dt)
  local px, py = e.position.x, e.position.y
  local dx, dy = e.motion.dx, e.motion.dy
  local vx, vy = e.motion.vx, e.motion.vy
  local goalx, goaly = px + dx * vx * dt, py + dy * vy * dt
  local actualX, actualY, cols, len = physics_world:move(e, goalx, goaly, collisionFilter)
  e.position.x, e.position.y = actualX, actualY

  for i = 1, len do
    local col = cols[i]
    local other = col.other
    if col.type == 'bounce' then
      e.motion.dx = e.motion.dx
      e.motion.dy = - e.motion.dy
    end
  end
end


return physicsSystem