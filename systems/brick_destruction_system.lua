-- systems/brick_destruction_system.lua

local Concord = require 'lib.concord'
local components = require 'components'
local world = require 'world'

local brickDestructionSystem = Concord.system({
  pool = { 'physics', 'health' }
})

function brickDestructionSystem:update(dt)
  for _, entity in ipairs(self.pool) do
    if entity.health.value == 0 then
      world:removeEntity(entity)
      entity.physics.fixture:destroy()
    end
  end
end

return brickDestructionSystem