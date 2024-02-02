local physics = love.physics

local shapesDict = {
  circle = {
    drawFunction = function (mode, positionX, positionY, dimensions)
      return love.graphics.circle(mode, positionX, positionY, dimensions.radius)
    end,
    physicsFunction = function (dimensions)
      return physics.newCircleShape(dimensions.radius)
    end
  },
  rectangle = {
    drawFunction = function (mode, body, shape)
      return love.graphics.polygon(mode, body:getWorldPoints(shape:getPoints()))
    end,
    physicsFunction = function (dimensions)
      return physics.newRectangleShape(dimensions.width, dimensions.height)
    end
  }
}

return shapesDict