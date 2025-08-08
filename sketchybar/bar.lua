local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  height = 31,
  color = colors.with_alpha(colors.bg1, 0.8),
  corner_radius = 0,
  padding_right = 15,
  padding_left = 15,
  padding_bottom = 13,
  position = "top",
})
