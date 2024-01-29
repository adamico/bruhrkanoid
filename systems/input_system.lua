local InputSystem = System('process', 1, Query.All(Motion, MotionControl))

function InputSystem:Update(Time)
  local dt = Time.DeltaFixed

  for i, entity in self:Result():Iterator() do
    local control = entity[MotionControl]
    local motion = entity[Motion]
    
    if love.keyboard.isDown(control.left) then
        motion.dx = -1
    end
    if love.keyboard.isDown(control.right) then
        motion.dx = 1
    end
  end
end

return InputSystem
