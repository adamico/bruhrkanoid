-- states/title.lua

local manager = StateManager

local title = {}

local game = require 'states.game'

local windowWidth, windowHeight = love.window.getMode()

function title:keypressed(key)
	if key == 'return' then
		manager:enter(game)
	end
end

function title:draw()
	love.graphics.print('Bruhrkanoid\n da game!', windowWidth / 2, windowHeight /2)
end

return title