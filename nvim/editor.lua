local o = vim.o
local vim = vim

o.title = true
o.termguicolors = false
o.scrolloff = 5
o.showmatch = true
o.matchtime = 2
o.wrap = true
o.linebreak = true
o.breakindent = true 
o.cursorline = false 
o.number = true
o.relativenumber = true
o.clipboard = 'unnamed'
o.hlsearch = false 
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.errorbells = false
o.swapfile = false 
o.updatetime = 250


-- Netrw
-- built-in file explorer
-- -----
vim.api.nvim_set_var("netrw_banner", 0)
vim.api.nvim_set_var("netrw_keepdir", 0)
vim.api.nvim_set_var("netrw_liststyle", 3)
vim.api.nvim_set_var("netrw_altfile", 0)
vim.api.nvim_set_var("netrw_altv", 0)
vim.api.nvim_set_var("netrw_browse_split", 4)
vim.api.nvim_set_var("netrw_winsize", 25)

vim.keymap.set("n", "<leader>e", ":Lex<CR>", { noremap = true })
-- vim.cmd([[
--     augroup netrw_mapping
--         autocmd!
--         autocmd filetype netrw call NetrwMapping()
--     augroup END
-- 
--     function! NetrwMapping()
--         nmap <buffer> . gn
--         nmap <buffer> <backspace> -
--         nmap <buffer> <c-l> <c-w>l
--     endfunction
-- 
-- ]])


