local Ball = Class('Ball')

function Ball:init(name, bx, by, vx, vy, dx, dy)
  self.name = name
  self.position = require('components.position')(bx, by)
  self.motion = require('components.motion')(vx, vy, dx, dy)
  self.display = require('components.display')('circle', 'line', 10)
  self.isBall = true
  self.physics = require('components.physics')('dynamic', 1)
end

return Ball