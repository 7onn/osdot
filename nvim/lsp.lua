local vim = vim

-- Terraform
require'lspconfig'.terraformls.setup{}
local fsgtf = vim.api.nvim_create_augroup("TerraformFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.tf*",
  callback = function()
    vim.cmd[[TerraformFmt]]
  end,
  group = fsgtf,
})


-- Go
require'lspconfig'.gopls.setup{}
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
require'lspconfig'.pyright.setup{}
local fsgpy = vim.api.nvim_create_augroup("PythonFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.cmd("undojoin | Neoformat")
  end,
  group = fsgpy,
})


-- Kotlin
require'lspconfig'.kotlin_language_server.setup{}
-- require'lspconfig'.kotlin_language_server.setup{
--     cmd = { "kotlin-language-server" },
--     filetypes = { "kotlin" },
--     root_dir = function(fname)
--         return require'lspconfig'.util.root_pattern('settings.gradle')(fname) or
--                require'lspconfig'.util.root_pattern('build.gradle')(fname) or
--                require'lspconfig'.util.root_pattern('pom.xml', '.git')(fname) or
--                require'lspconfig'.util.root_pattern('build.gradle.kts')(fname)
--     end,
-- }

local fsgkt = vim.api.nvim_create_augroup("KotlinFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.kt",
  callback = function()
    vim.cmd("undojoin | Neoformat")
  end,
  group = fsgkt,
})

require('lsp_signature').setup({
  bind = true, 
  handler_opts = {
    border = "rounded"
  }
})

