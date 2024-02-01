local Wall = Class('Wall')

function Wall:init(name, px, py, width, height)
  self.name = name
  self.position = require('components.position')(px, py)
  self.display = require('components.display')('rectangle', 'fill', width, height, 0, {0.2, 0.2, 0.4})
  self.isWall = true
  self.physics = require('components.physics')('static', 1)
end

return Wall