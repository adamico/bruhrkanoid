Class = require 'lib.30log'
ECS = require 'ecs'

-- Components
local Position = require 'components.position'
local Motion = require 'components.motion'
local MotionControl = require 'components.motion_control'
local Display = require 'components.display'
local PlayerState = require 'components.player_state'

-- Systems
local movementSystem = require 'systems.movement_system'
local inputSystem = require 'systems.input_system'
local displaySystem = require 'systems.display_system'
-- World
local world = require 'world'

-- Entities
local player_sprite = {}

local player = {
  name = 'player1',
	Position(),
	Motion(300, 0),
	MotionControl('left', 'right'),
	PlayerState(),
	Display(player_sprite)
}

function love.load()
	world.addEntity(player)
	world.addSystems({
	  movementSystem,
	  inputSystem
	})
end

function love.update(dt)
	ECS.update(world, dt)
end

function love.draw()
end
