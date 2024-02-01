local Physics = Class('Physics')

function Physics:init(t, r)
    self.type = t
    self.restitution = r
end

return Physics