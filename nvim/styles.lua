local vim = vim
local o = vim.o

o.syntax = "enable"
vim.g.editorconfig = true

local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

aucmd("TextYankPost", {
    group = augroup("highlightyank", { clear = true }),
    desc = "Highlight on yank",
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 500 })
    end,
})


vim.opt.cursorline = true
vim.opt.cursorcolumn = true


vim.cmd[[colorscheme dracula]]

vim.api.nvim_set_hl(0, "Normal",     { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC",   { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })

