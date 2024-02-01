local Ball = Class('Ball')

function Ball:init(name, bx, by, br)
  self.name = name
  self.position = require('components.position')(bx, by)
  self.motion = require('components.motion')(150, 150, -1, 1)
  self.display = require('components.display')('circle', 'line', br)
  self.isBall = true
  self.physics = require('components.physics')('dynamic', 1)
end

return Ball