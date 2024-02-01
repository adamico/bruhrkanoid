-- main.lua

require 'tools'

local gamestate = require 'lib.hump.gamestate'
local center = require 'lib.center'

Class = require 'lib.30log'

local menu = require 'states.menu'

function love.load()
	gamestate.registerEvents()
  gamestate.switch(menu)
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
end