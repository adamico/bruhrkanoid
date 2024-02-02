-- entities/ball.lua

local Concord = require 'lib.concord'
Concord.utils.loadNamespace 'components'
local Entity = Concord.entity

local physics_world = require 'physics_world'
local input = require 'input'

local physics = love.physics

local shapesDict = require 'shapes_dictionary'

return function (positionX, positionY, bodyType, shapeType, drawMode, dimensions, velocityXValue, velocityYValue)
  local entity = Entity()

  local velocity = {
    xValue = velocityXValue,
    yValue = velocityYValue,
    xDelta = 0,
    yDelta = 1
  }

  local body = physics.newBody(physics_world, positionX, positionY, bodyType)
  body:setMass(32)

  body:setLinearVelocity(velocity.xValue * velocity.xDelta , velocity.yValue * velocity.yDelta )

  local shape = shapesDict[shapeType].physicsFunction(dimensions)
  local fixture = physics.newFixture(body, shape, 1)
  fixture:setRestitution(1)
  fixture:setUserData(entity)

  function entity:draw()
    local bodyCenterX, bodyCenterY = body:getWorldCenter()
    shapesDict[shapeType].drawFunction(drawMode, bodyCenterX, bodyCenterY, dimensions)
  end

  entity
  :give('physics', body, shape, fixture)
  :give('drawable')

  return entity
end