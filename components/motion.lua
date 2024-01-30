local Motion = Class('Motion')

function Motion:init(vx, vy, dx, dy)
    self.vx = vx or 0
    self.vy = vy or 0
    self.dx = dx or 0
    self.dy = dy or 0
end

return Motion
