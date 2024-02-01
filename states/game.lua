local game = {}

local screen_width, screen_height = love.window.getMode()

local Wall = require 'entities.wall'
local Brick = require 'entities.brick'
local world = require 'world'
local wall_thickness = screen_width/32

function game:enter()
	-- TODO: create player and ball classes
	local player = require 'entities.player'
	local ball = require 'entities.ball'
	local top_wall = Wall('top', 0, 0, screen_width, wall_thickness)
	local left_wall = Wall('left', 0, 0, wall_thickness, screen_height)
	local right_wall = Wall('right', screen_width - wall_thickness, 0, wall_thickness, screen_height)

	game.createLevel(world)

  world:add(
		player,
		ball,
		left_wall,
		top_wall,
		right_wall
	)

	world:add(
	  require('systems.input_system'),
		require('systems.physics_system'),
		require('systems.draw_wall_system'),
		require('systems.draw_system')
	)
end

function game.createLevel(world)
	local width, height = 50, 20
	local top_left = { x = wall_thickness * 2 + 6, y = wall_thickness * 2 }
	local gap = 8
	for row = 1, 5 do
		for col = 1, 12 do
			local name = ('Brick %d-%d'):format(row, col)
			local px = top_left.x + (width + gap) * (col - 1) 
			local py = top_left.y + (height + gap) * (row - 1)
			local brick = Brick(name, px, py, width, height)
			world:add(brick)
		end
	end
end

return game