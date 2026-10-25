require("isaac-shims")

function love.load()
  local ok, err = pcall(require, "palette_scripts.palette_utils")
  print(ok, err)
end