-- entities/wall.lua

local Concord = require 'lib.concord'
Concord.utils.loadNamespace 'components'
local Entity = Concord.entity

local physics_world = require 'physics_world'

local physics = love.physics
local shapesDict = require 'shapes_dictionary'

return function (positionX, positionY, bodyType, shapeType, drawMode, dimensions, color)
  local entity = Entity()

  local body = physics.newBody(physics_world, positionX, positionY, bodyType)
  local shape = shapesDict[shapeType].physicsFunction(dimensions)
  local fixture = physics.newFixture(body, shape)
  fixture:setUserData(entity)

  function entity:draw()
    love.graphics.setColor(color)
    shapesDict[shapeType].drawFunction(drawMode, body, shape)
    love.graphics.setColor(1, 1, 1)
  end

  entity
  :give('physics', body, shape, fixture)
  :give('drawable')

  return entity
end