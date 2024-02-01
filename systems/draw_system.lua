local ecs = require 'lib.tiny'
local drawSystem = ecs.processingSystem()

drawSystem.filter = ecs.requireAll('display', 'position', ecs.rejectAny('isWall'))
drawSystem.isDrawSystem = true

function drawSystem:process(e, dt)
  drawSystem:shape(e)
end

function drawSystem:rect(m, x, y, w, h)
  love.graphics.rectangle(m, x, y, w, h)
end

function drawSystem:circle(m, x, y, r)
  love.graphics.circle(m, x, y, r)
end

function drawSystem:shape(e)
  local display = e.display
  local shape = display.shape
  local mode = display.mode
  local px, py = e.position.x, e.position.y

  if shape == 'circle' then drawSystem:circle(mode, px, py, display.radius) end
  if shape == 'rectangle' then drawSystem:rect(mode, px, py, display.width, display.height) end
end

return drawSystem