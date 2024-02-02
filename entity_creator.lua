-- entity_creator.lua

local creator = {}

local world = require 'world'
local draw_system = require 'systems.draw_system'
local physics_system = require 'systems.physics_system'
local brick_destruction_system = require 'systems.brick_destruction_system'

local screenWidth, screenHeight, flags = love.window.getMode()

function creator.createGame()
  creator.createWalls()
  creator.createBricks()
  creator.createPlayer()
  creator.createBall()

  world:addSystems(physics_system, draw_system, brick_destruction_system)
end

function creator.createWalls()
  local wall = require('entities.wall')
  local wallThickness = 20
  local color = { 0.2, 0.2, 0.4 }

  local top_wall = wall(
    screenWidth/2, wallThickness/2,
    'static', 'rectangle', 'fill',
    { width = screenWidth, height = wallThickness },
    color
  )

  local left_wall = wall(
    wallThickness/2, screenHeight/2,
    'static', 'rectangle', 'fill',
    { width = wallThickness, height = screenHeight },
    color
  )

  local right_wall = wall(
    screenWidth - wallThickness/2,screenHeight/2,
    'static', 'rectangle', 'fill',
    { width = wallThickness, height = screenHeight },
    color
  )

  world:addEntity(top_wall)
  world:addEntity(left_wall)
  world:addEntity(right_wall)
end

function creator.createBricks()
  local brick = require('entities.brick')
  local brickWidth, brickHeight = 50, 20
  local gap = 10
  local bricks = {}
  for row = 1, 6 do
    for column = 1, 20 do
      local aBrick = brick(
         (brickWidth + gap) * column, (brickHeight + gap) * row,
        'static', 'rectangle', 'line',
        { width = brickWidth, height = brickHeight},
        { 1, 1, 1 }, 1
      )
      table.insert(bricks, aBrick)
    end
  end
  for i, brick in pairs(bricks) do
    world:addEntity(brick)
  end
end

function creator.createPlayer()
  local playerWidth, playerHeight = 70, 20
  local playerPosition = { x = screenWidth / 2, y = screenHeight - 40}
  local player = require('entities.player')(
    playerPosition.x, playerPosition.y,
    'kinematic', 'rectangle', 'line',
    { width = playerWidth, height = playerHeight },
    500, 500
  )
  world:addEntity(player)
end

function creator.createBall()
  local ballPosition = { x = screenWidth / 2, y = screenHeight / 2 }
  local ball = require('entities.ball')(
    ballPosition.x, ballPosition.y,
    'dynamic', 'circle', 'line',
    { radius = 10 },
    300, 300
  )
  world:addEntity(ball)
end

return creator