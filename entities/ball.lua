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

  local entityMaxVelocity = 600

  local velocity = {
    xValue = velocityXValue,
    yValue = velocityYValue,
    xDelta = 0.3,
    yDelta = 1
  }

  local body = physics.newBody(physics_world, positionX, positionY, bodyType)
  body:setMass(32)

  body:setLinearVelocity(velocity.xValue * velocity.xDelta , velocity.yValue * velocity.yDelta )

  local shape = shapesDict[shapeType].physicsFunction(dimensions)
  local fixture = physics.newFixture(body, shape, 1)
  fixture:setFriction(0)
  fixture:setRestitution(1)
  fixture:setUserData(entity)

  function entity:draw()
    local bodyCenterX, bodyCenterY = body:getWorldCenter()
    shapesDict[shapeType].drawFunction(drawMode, body, shape)
  end

  function entity:update()
    local currentVelocityX, currentVelocityY = body:getLinearVelocity()
    local totalVelocity = math.abs(currentVelocityX) + math.abs(currentVelocityY)

    local velocityXisCritical = math.abs(currentVelocityX) > entityMaxVelocity * 2
    local velocityYisCritical = math.abs(currentVelocityY) > entityMaxVelocity * 2

    if velocityXisCritical or velocityYisCritical then
      body:setLinearVelocity(
        currentVelocityX * 0.5,
        currentVelocityY * 0.5
      )
    end

  
    if totalVelocity > entityMaxVelocity then
      body:setLinearDamping(0.1)
    else
      body:setLinearDamping(0)
    end

    print("ball velocity: "..currentVelocityX.."/"..currentVelocityY)
  end

  entity
  :give('physics', body, shape, fixture)
  :give('drawable')

  return entity
end