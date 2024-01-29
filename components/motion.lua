local Motion = Component(function(params)
  return {
    velocityX = params.velocityX or 0,
    velocityY = params.velocityy or 0,
    dx = params.dx or 0,
    dy = params.dy or 0
  }
end)
