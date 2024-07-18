package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/?.lua"
require("editor")
require("keybindings")
require("diagnostic")
require("plugins")
require("styles")
require("lsp")

