local Player = Class('Player')

function Player:init(name, px, py, pw, ph)
	self.name = name
	self.position = require('components.position')(px, py)
	self.display = require('components.display')('rectangle', 'line', pw, ph)
	self.motion = require('components.motion')(300, 0)
	self.motionControl = require('components.motion_control')('left', 'right')
	self.isPlayer = true
	self.physics = require('components.physics')('kinematic', 1)
end

return Player