package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/?.lua"
require("plugins")
require("editor")
require("keybindings")
require("diagnostic")
require("styles")
require("lsp")
require("env")
