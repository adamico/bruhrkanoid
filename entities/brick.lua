local Brick = Class('Brick')

function Brick:init(name, px, py, width, height)
  self.name = name
  self.position = require('components.position')(px, py)
  self.display = require('components.display')('rectangle', 'line', width, height)
  self.physics = require('components.physics')('static', 1)
  self.isBrick = true
  self.motion = nil
end

return Brick