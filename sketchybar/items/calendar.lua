local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", {
  icon = {
    color = colors.magenta,
    padding_left = 5,
    font = {
      style = settings.font.style_map["Black"],
    },
  },
  label = {
    color = colors.magenta,
    padding_right = 8,
    width = 40,
    align = "right",
    font = { family = settings.font.numbers, size=14 },
  },
  position = "right",
  update_freq = 30,
  padding_left = 1,
  padding_right = 1,
})

-- Double border for calendar using a single item bracket
sbar.add("bracket", { cal.name }, {
  background = {
    color = colors.bg2,
  }
})

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
  cal:set({ icon = os.date("%Y-%M-%d"), label = os.date(" %H:%M") })
end)
