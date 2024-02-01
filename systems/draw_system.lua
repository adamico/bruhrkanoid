local ecs = require 'lib.tiny'

local colors = require 'colors'
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

  love.graphics.setColor(display.color)
  if shape == 'circle' then drawSystem:circle(mode, px, py, display.radius) end
  if shape == 'rectangle' then drawSystem:rect(mode, px, py, display.width, display.height) end
  love.graphics.setColor(colors.WHITE)
end

return drawSystem