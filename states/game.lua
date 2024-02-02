-- states/game.lua

local manager = StateManager

local game = {}

local pause = require 'states.pause'

local world = require 'world'
local physics_world = require 'physics_world'
local input = require 'input'

love.focus = function(focused)
  input.toggle_focus(focused)
end

function game:pause(...)
	print('pause', ...)
end

function game:resume(...)
	print('resume', ...)
end

function game:enter(previous, ...)
  require('entity_creator').createGame()
end

function game:update(dt)
  if input.paused then manager:push(pause) end
  world:emit('update', dt)
  physics_world:update(dt)
end

function game:draw()
  world:emit('draw')
end

return game