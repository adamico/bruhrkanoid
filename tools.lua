function _G.CenterText(string_array, color, vertical_offset)
  local font = love.graphics.getFont()
  local text_array = {}
  for _, string in pairs(string_array) do
    local text = love.graphics.newText(font, string)
    table.insert(text_array, text)
  end
  
  local widths = {}
  for i, text in pairs(text_array) do
    widths[i] = text:getWidth()
  end
  
  local width = math.max(table.unpack(widths))
  
  local height = font:getHeight()
  love.graphics.setColor(color)
  for i, text in pairs(text_array) do
    love.graphics.draw(text, love.graphics.getWidth()/2-width/2, vertical_offset-height/2+(i-1)*height)
  end
end