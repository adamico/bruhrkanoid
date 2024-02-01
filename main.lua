-- main.lua

require 'tools'

local gamestate = require 'lib.hump.gamestate'
local center = require 'lib.center'

Class = require 'lib.30log'

local initial_state = require 'states.pre_game'

function love.load()
	gamestate.registerEvents()
  gamestate.switch(initial_state)
end

function love.update(dt)
end

function love.draw()
end

function love.resize(width, height)
  center:resize(width, height)
end

function love.keypressed(k)
	if k == 'escape' then
		love.event.quit()
	end

	if k == 'r' then
		gamestate.switch(initial_state)
	end
end