local Creator = Class('EntityCreator')

local world = require 'world'

function Creator:createGame()
	self:setLevelDimensions()
	self:createWalls()
	self:createBricks()

	local pwidth, pheight = 80, 20
	local px = (self.screen_width - pwidth) / 2
  local py = self.screen_height - self.wall_thickness - pheight
  self:createPlayer(px, py, pwidth, pheight)

	local bx = px + pwidth / 2
	local by = py - pheight / 2
	math.randomseed(os.clock()*100000000000)
	local range = { min = -10, max = 10 }
	local dx, dy = math.random(range.min, range.max)/10, -1
	self:createBall(bx, by, 300, 300, dx, dy)
end

function Creator:setLevelDimensions()
	self.screen_width, self.screen_height, self.wall_thickness = 800, 800, 20
end

function Creator:createWalls()
  local Wall = require 'entities.wall'
	local top_wall = Wall('top', 0, 0, self.screen_width, self.wall_thickness)
	local left_wall = Wall('left', 0, 0, self.wall_thickness, self.screen_height)
	local right_wall = Wall('right', self.screen_width - self.wall_thickness, 0, self.wall_thickness, self.screen_height)

	world:add(left_wall, top_wall, right_wall)
end

function Creator:createBricks()
  -- TODO: fix centering algorithm
  local Brick = require 'entities.brick'
	local width, height = 50, 20
	local top_left = { x = self.wall_thickness * 2 + 6, y = self.wall_thickness * 2 }
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

function Creator:createPlayer(px, py, pwidth, pheight)
  local Player = require 'entities.player'
  world:add(Player('player1', px, py, pwidth, pheight))
end

function Creator:createBall(bx, by, vx, vy, dx, dy)
  local Ball = require 'entities.ball'
  world:add(Ball('ball1', bx, by, vx, vy, dx, dy))
end

return Creator