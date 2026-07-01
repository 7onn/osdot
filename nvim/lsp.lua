local vim = vim

-- Keybindings
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true, noremap = true})

vim.api.nvim_set_keymap('n', 'gt', '<Plug>(coc-type-definition)', {silent = true, noremap = true})

vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})

vim.api.nvim_set_keymap('n', '<Leader>k', ':lua require("lsp_signature").toggle_float_win()<CR>', {noremap = true})


-- Terraform
vim.lsp.config('terraformls', {})
vim.lsp.enable('terraformls')

local fsgtf = vim.api.nvim_create_augroup("TerraformFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.tf*",
  callback = function()
    vim.cmd[[TerraformFmt]]
  end,
  group = fsgtf,
})


-- Go
vim.lsp.config('gopls', {})
vim.lsp.enable('gopls')

local fsggo = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = fsggo,
})
require('go').setup()


-- Python
-- vim.g.python3_host_prog = "/opt/homebrew/bin/python3.10"
vim.lsp.config('pyright', {})
vim.lsp.enable('pyright')

local fsgpy = vim.api.nvim_create_augroup("PythonFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.cmd("undojoin | Neoformat")
  end,
  group = fsgpy,
})


-- Kotlin
vim.lsp.config('kotlin_language_server', {})
vim.lsp.enable('kotlin_language_server')

local fsgkt = vim.api.nvim_create_augroup("KotlinFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.kt",
  callback = function()
    vim.cmd("undojoin | Neoformat")
  end,
  group = fsgkt,
})

-- Function Signatures <leader>+k
require('lsp_signature').setup({
  bind = true, 
  handler_opts = {
    border = "rounded"
  }
})

