-- components/health.lua

local Concord = require 'lib.concord'

local drawable = Concord.component('health', function(component, value)
  component.value = value
end)

return drawable