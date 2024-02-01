local ecs = require 'lib.tiny'
local drawWallSystem = ecs.processingSystem()

local colors = require 'colors'

drawWallSystem.filter = ecs.requireAll('isWall')
drawWallSystem.isDrawSystem = true

function drawWallSystem:process(e, dt)
  local px, py = e.position.x, e.position.y
  local display = e.display
  love.graphics.setColor(display.color)
  love.graphics.rectangle(display.mode, px, py, display.width, display.height)
  love.graphics.setColor(colors.WHITE)
end

return drawWallSystem