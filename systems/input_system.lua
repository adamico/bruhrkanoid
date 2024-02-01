local ecs = require 'lib.tiny'

local inputSystem = ecs.processingSystem()

inputSystem.filter = ecs.requireAll('name', 'motionControl')

function inputSystem:process(e, dt)
  local control = e.motionControl
  local motion = e.motion
  motion.dx = 0
  motion.dy = 0
  if love.keyboard.isDown(control.left) then
    motion.dx = -1
  end
  if love.keyboard.isDown(control.right) then
    motion.dx = 1
  end
end

return inputSystem