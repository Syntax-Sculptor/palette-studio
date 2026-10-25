love.filesystem.setRequirePath("?.lua;?/init.lua;lib/palette/?.lua")

function love.conf(t)
  t.window.title = "Palette Studio"
  t.window.width = 1440
  t.window.height = 900
  t.modules.joystick = false
  t.modules.physics = false
  t.window.resizable = true
  t.modules.math = true
end