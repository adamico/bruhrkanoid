-- main.lua

local vudu = require 'lib.vudu'
StateManager = require 'lib.roomy'.new()

local physics_world = require 'physics_world'

local input = require 'input'

function love.load()
  vudu.initialize()
  vudu.physics.setWorld(physics_world)
  StateManager:hook()
	StateManager:enter(require 'states.title')
end

love.keypressed = function(pressed_key)
  input.press(pressed_key)
end

love.keyreleased = function(released_key)
  input.release(released_key)
end