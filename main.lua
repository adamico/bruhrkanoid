-- main.lua

require 'tools'

local gamestate = require 'lib.hump.gamestate'
local ecs = require 'lib.tiny'
local center = require 'lib.center'

Class = require 'lib.30log'

Game = require 'states.game'

local world = require 'world'

center:setupScreen(800, 800)

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
	center:start()
	if world then
		world:update(dt, ecs.requireAll('isDrawSystem'))
	end
	center:finish()
end

function love.resize(width, height)
  center:resize(width, height)
end

function love.keypressed(k)
	if k == 'escape' then
		love.event.quit()
	end
end