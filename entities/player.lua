return {
  name = 'player1',
	position = require('components.position')(200,500),
	motion = require('components.motion')(300, 0),
	motionControl = require('components.motion_control')('left', 'right'),
	display = require('components.display')('rectangle', 'line', 70, 20),
	isPlayer = true,
	physics = require('components.physics')('kinematic', 1)
}