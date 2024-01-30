local Position = Class('Position')

function Position:init(x, y)
  self.x = x or 0
  self.y = y or 0
end

return Position
