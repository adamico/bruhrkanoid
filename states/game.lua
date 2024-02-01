local game = {}

local world = require 'world'
local Creator = require 'entity_creator'

function game:enter()

	local creator = Creator()
	creator:createGame()

	world:add(
		require('systems.input_system'),
		require('systems.physics_system'),
		require('systems.draw_system'),
		require('systems.draw_wall_system')
	)
end

return game