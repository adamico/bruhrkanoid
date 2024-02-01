-- main.lua

require 'tools'
local gamestate = require 'lib.hump.gamestate'
local ecs = require 'lib.tiny'
Class = require 'lib.30log'

Game = require 'states.game'

local world = require 'world'

function love.load()
	gamestate.registerEvents()
  gamestate.switch(Game)
end

function love.update(dt)
	if world then
		world:update(dt, ecs.rejectAny('isDrawSystem'))
	end
end

function love.draw()
	local dt = love.timer.getDelta()
	if world then
		world:update(dt, ecs.requireAll('isDrawSystem'))
	end
end

function love.keypressed(k)
	if k == 'escape' then
		love.event.quit()
	end
end