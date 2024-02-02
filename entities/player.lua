-- entities/player.lua

local Concord = require 'lib.concord'
Concord.utils.loadNamespace 'components'
local Entity = Concord.entity

local physics_world = require 'physics_world'
local input = require 'input'

local physics = love.physics
local shapesDict = require 'shapes_dictionary'

return function (positionX, positionY, bodyType, shapeType, drawMode, dimensions, velocityXValue, velocityYValue)
  local entity = Entity()

  local body = physics.newBody(physics_world, positionX, positionY, bodyType)
  local shape = shapesDict[shapeType].physicsFunction(dimensions)
  local fixture = physics.newFixture(body, shape)
  fixture:setUserData(entity)

  local windowWidth, windowHeight = love.window.getMode()
  local leftBoundary = 60
  local rightBoundary = windowWidth - 60
  local topBoundary = 50
  local bottomBoundary = windowHeight - dimensions.height * 2
  local velocity = {
    xValue = velocityXValue,
    yValue = velocityYValue,
    xDelta = 0,
    yDelta = 0
  }

  function entity:draw()
    shapesDict[shapeType].drawFunction(drawMode, body, shape)
  end

  function entity:update()
    local bodyX, bodyY = body:getPosition()

    if input.left and bodyX > leftBoundary then
      velocity.xDelta = -1
    elseif input.right and bodyX < rightBoundary then
      velocity.xDelta = 1
    else
      velocity.xDelta = 0
    end

    if input.up and bodyY > topBoundary then
      velocity.yDelta = -1
    elseif input.down and bodyY < bottomBoundary then
      velocity.yDelta = 1
    else
      velocity.yDelta = 0
    end

    if velocity.xDelta ~= 0 and velocity.yDelta ~= 0 then
      velocity.xDelta = velocity.xDelta * math.sqrt(2)/2
      velocity.yDelta = velocity.yDelta * math.sqrt(2)/2
    end
    body:setLinearVelocity(velocity.xValue * velocity.xDelta , velocity.yValue * velocity.yDelta )
  end

  entity
  :give('physics', body, shape, fixture)
  :give('drawable')

  return entity
end