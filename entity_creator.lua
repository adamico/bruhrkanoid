-- entity_creator.lua

local creator = {}

local world = require 'world'
local draw_system = require 'systems.draw_system'
local physics_system = require 'systems.physics_system'

local screenWidth, screenHeight, flags = love.window.getMode()

function creator.createGame()
  creator.createWalls()
  creator.createPlayer()
  creator.createBall()

  world:addSystems(physics_system, draw_system)
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

function creator.createPlayer()
  local playerWidth, playerHeight = 70, 20
  local playerPosition = { x = screenWidth / 2, y = screenHeight - 40}
  local player = require('entities.player')(
    playerPosition.x, playerPosition.y,
    'kinematic', 'rectangle', 'line',
    { width = playerWidth, height = playerHeight },
    300, 300
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