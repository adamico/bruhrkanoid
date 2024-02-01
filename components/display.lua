local Display = Class('Display')

function Display:init(s, m, w, h, r, c)
  self.shape = s
  self.mode = m
  self.width = w
  self.height = h or 0
  self.radius = r or w
  self.color = c or {1, 1, 1}
end

return Display