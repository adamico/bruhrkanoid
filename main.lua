local class = require 'lib.30log'
local ECS = require 'lib.ECS'
local Component, System, World, Query = ECS.Component, ECS.System, ECS.World, ECS.Query 
local world = World()

-- Components
local Position = require 'components.position'
local Motion = require 'components.motion'
local MotionControl = require 'components.motion_control'

-- Systems
local MovementSystem = require 'systems.movement_system'
local InputSystem = require 'systems.input_system'

-- World
local update_frequency = 60
world({ MovementSystem, InputSystem }, update_frequency)

-- Entities

-- assuming we're playing, if dead: remove some components
local player = World:Entity(
	Position({ x = 0, y = 0 }),
	Motion({ velocityX = 300, velocityY = 0 }),
	MotionControl({ left = 'left', right = 'right' })
)

function love.load()
	
end

function love.draw()
end
