return {
  name = 'ball',
  position = require('components.position')(300, 300),
  motion = require('components.motion')(150, 150, -1, 1),
  display = require('components.display')('circle', 'line', 10),
  isBall = true,
  physics = require('components.physics')('dynamic', 1)
}