-- entity_creator.lua

local creator = {}

local world = require 'world'
local draw_system = require 'systems.draw_system'
local physics_system = require 'systems.physics_system'

local screenWidth, screenHeight, flags = love.window.getMode()

function creator.createGame()
  creator.createPlayer()
  creator.createBall()
  world:addSystems(physics_system, draw_system)
end

function creator.createPlayer()
  local playerWidth, playerHeight = 70, 20
  local playerPosition = { x = screenWidth / 2, y = screenHeight - playerHeight * 2}
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