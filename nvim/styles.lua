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


vim.opt.cursorline = false
vim.opt.cursorcolumn = false

vim.cmd[[colorscheme dim]]


vim.api.nvim_set_hl(0, "Normal",     { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC",   { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })

-- Statusline / split chrome: no gray bar, keep filename + ruler text
vim.api.nvim_set_hl(0, "StatusLine",   { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", fg = "none" })
vim.api.nvim_set_hl(0, "VertSplit",    { bg = "none", fg = "none" })
vim.api.nvim_set_hl(0, "SignColumn",   { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr",       { bg = "none" })
vim.api.nvim_set_hl(0, "FoldColumn",   { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = "none" })

vim.opt.fillchars:append({
    vert = " ",
    horiz = " ",
    horizup = " ",
    horizdown = " ",
    vertleft = " ",
    vertright = " ",
    verthoriz = " ",
})

