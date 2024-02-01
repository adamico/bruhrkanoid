local ecs = require 'lib.tiny'
local center = require 'lib.center'
local gamestate = require 'lib.hump.gamestate'

local pre_game = {}
local game = require 'states.game'

local world = require 'world'
local Creator = require 'entity_creator'

local screen_width = love.graphics.getWidth()
local screen_height = love.graphics.getHeight()


function pre_game:enter()
  local creator = Creator()
	creator:createGame()

	world:add(
		require('systems.draw_system'),
		require('systems.draw_wall_system')
	)

  love.mouse.setVisible(false)
end

function pre_game:draw()
	local dt = love.timer.getDelta()
	center:start()
	if world then
		world:update(dt, ecs.requireAll('isDrawSystem'))
	end
	center:finish()

  local margin = 100
  love.graphics.setColor(0.8, 0.8, 0.8)
  love.graphics.rectangle('fill', margin, margin, screen_width-margin*2, screen_height/2 - margin)
  CenterText({'Press Space or Left Mouse button to start'}, {0, 0, 0.2}, screen_height/4)
end

function pre_game:mousereleased(x, y, button, istouch, presses)
  if button == 1 then
    gamestate.switch(game)
  end
end

function pre_game:keypressed(k)
	if k == "space" then
		gamestate.switch(game)
	end
end

return pre_game