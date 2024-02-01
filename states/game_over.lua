local gamestate = require 'lib.hump.gamestate'
local game_over = {}

function game_over:draw()
  love.graphics.printf( "Congratulations!\n" .. "You have finished the game!\n" .. "Press Enter to restart.", 300, 250, 200, "center" )
end

function game_over:keypressed(key)
  local menu = require 'states.menu'
  if key == 'return' then
    return gamestate.switch(menu)
  end
end

return game_over