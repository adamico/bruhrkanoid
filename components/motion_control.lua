local MotionControl = Class('MotionControl')

function MotionControl:init(left, right)
  self.left = left
  self.right = right
end

return MotionControl
