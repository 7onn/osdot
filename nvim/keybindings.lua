local vim = vim

vim.api.nvim_set_var('mapleader', ' ')

-- Prevent plus and minus from moving cursor
vim.api.nvim_set_keymap('v', '+', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '-', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '+', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '-', '<nop>', { noremap = true, silent = true })


-- Window split
vim.api.nvim_set_keymap('n', '<Leader>_', ':split<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>|', ':vsplit<CR>', {noremap = true})

-- File/Buffer navigation
vim.api.nvim_set_keymap('n', '<Leader>f', ':Files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>b', ':Buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>q', ':close<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>g', ':Goyo<CR>', {noremap = true})

-- Window Resize
vim.api.nvim_set_keymap('n', '<Leader>+', ':vertical resize +10<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>-', ':vertical resize -10<CR>', {noremap = true})

-- Text editing for old emacs user
vim.api.nvim_set_keymap('n', '<C-f>', 'k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-b>', 'h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-a>', '^', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-e>', '$', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-S-A>', 'V^', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-S-E>', 'V$', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-f>', 'k', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-b>', 'h', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-a>', '^', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-e>', '$', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-S-A>', 'V^', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-S-E>', 'V$', {noremap = true})

-- Programming
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'gt', '<Plug>(coc-type-definition)', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})


vim.api.nvim_set_keymap('n', '<Leader>k', ':lua vim.lsp.buf.signature_help()<CR>', {noremap = true})

local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

aucmd("FileType", {
  group = augroup("user", { clear = true }),
  pattern = { "help", "man" },
  desc = "Use q to close the window",
  command = "nnoremap <buffer> q <cmd>quit<cr>",
})


-- Lazy macros
function add_journal_entry()
    local date = os.date("%Y-%m-%d")
     vim.api.nvim_put(
      {
        "# " .. date .. " ",
        "- "
      }, 'l', true, true)
end

vim.api.nvim_set_keymap('n', '<leader>#', ':lua add_journal_entry()<CR>', { noremap = true, silent = true })

