local ecs = require 'lib.tiny'
local center = require 'lib.center'

local gamestate = require 'lib.hump.gamestate'

local game = {}
local game_over = require 'states.game_over'

local world = require 'world'
local Creator = require 'entity_creator'

center:setupScreen(800, 800)

function game:enter()
	world:add(
		require('systems.input_system'),
		require('systems.physics_system')
	)
end

function game:draw()
	local dt = love.timer.getDelta()
	center:start()
	if world then
		world:update(dt, ecs.requireAll('isDrawSystem'))
	end
	center:finish()
end

function game:update(dt)
	if world then
		world:update(dt, ecs.rejectAny('isDrawSystem'))
	end
end

function game:keypressed(k)
	if k == 'c' then
		gamestate.switch(game_over)
	end
end

function game:leave()
  ecs.clearSystems(world)
  ecs.clearEntities(world)
  ecs.refresh(world)
end

return game