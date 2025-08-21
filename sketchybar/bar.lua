local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  height = 35,
  color = colors.with_alpha(colors.bg2, 0.7),
  corner_radius = 0,
  padding_right = 15,
  padding_left = 15,
  padding_bottom = 13,
  position = "top",
})
