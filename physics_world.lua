-- physics_world.lua

-- Called at the end of any contact in the world. Parameters:
-- {fixture} fixture_a - first fixture object in the collision.
-- {fixture} fixture_b - second fixture object in the collision.
-- {contact} contact - world object created on and at the point of contact
--   See further: https://love2d.org/wiki/Contact

local end_contact_callback = function(fixture_a, fixture_b, contact)
  local entity_a = fixture_a:getUserData()
  local entity_b = fixture_b:getUserData()
  if entity_a.endContact then entity_a:endContact() end
  if entity_b.endContact then entity_b:endContact() end
end

local gravityX, gravityY = 0, 0
local bodiesAllowedToSleep = false

local physics_world = love.physics.newWorld(gravityX, gravityY, bodiesAllowedToSleep)

physics_world:setCallbacks(nil, end_contact_callback, nil, nil)

return physics_world