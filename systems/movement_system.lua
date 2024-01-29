local MovementSystem = System('process', 1, Query.All(Position, Motion))

function 

function MovementSystem:Update(Time)
  local dt = Time.DeltaFixed
  for i, entity in self:Result():Iterator() do
    local motion = entity[Motion]
    local position = entity[Position]
    
    position.x = position.x + motion.dx * motion.velocityX * dt
    position.y = position.y + motion.dy * motion.velocityY * dt
  end
end

return MovementSystem
