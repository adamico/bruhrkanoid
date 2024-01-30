local inputSystem = ECS.processingSystem()

inputSystem.filter = ECS.requireAll('name', 'motionControl')

function inputSystem:process(e, dt)
    local control = e.motionControl
    local motion = e.motion
    
    if love.keyboard.isDown(control.left) then
        motion.dx = -1
        print(("%s is moving left"):format(e.name))
    end
    if love.keyboard.isDown(control.right) then
        motion.dx = 1
        print(("%s is moving right"):format(e.name))
    end
    
  end
end

return inputSystem
