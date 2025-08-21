local settings = require("settings")
local colors = require("colors")

-- Equivalent to the --default domain
sbar.default({
  updates = "when_shown",
  icon = {
    font = {
      family = settings.font.text,
      style = settings.font.style_map["Bold"],
      size = 16.0
    },
    color = colors.magenta,
    padding_left = settings.paddings,
    padding_right = settings.paddings,
    background = { image = { corner_radius = 3 } },
  },
  label = {
    font = {
      family = settings.font.text,
      style = settings.font.style_map["Semibold"],
      size = 13.0
    },
    color = colors.green,
    padding_left = settings.paddings,
    padding_right = settings.paddings,
  },
  background = {
    height = 26,
    corner_radius = 3,
    border_width = 0,
    border_color = colors.magenta,
    image = {
      corner_radius = 3,
      border_color = colors.green,
      border_width = 0
    }
  },
  popup = {
    background = {
      border_width = 0,
      corner_radius = 14,
      border_color = colors.popup.border,
      color = colors.popup.bg,
      shadow = { drawing = true },
    },
    blur_radius = 50,
  },
  padding_left = 5,
  padding_right = 5,
  scroll_texts = true,
})
