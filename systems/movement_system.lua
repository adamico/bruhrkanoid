local movementSystem = ECS.processingSystem()

movementSystem.filter = ECS.requireAll('name', 'position', 'motion')

function movementSystem:process(e, dt) 
  local px, py = e.position.x, e.position.y
  local dx, dy = e.motion.dx, e.motion.dy
  local vx, vy = e.motion.vx, e.motion.vy
  e.position.x = px + dx * vx * dt
  e.position.y = px + dy * vy * dt
  print(("%s has been moved to position %d/%d"):format(e.name, e.position.x, e.position.y))
end

return movementSystem
