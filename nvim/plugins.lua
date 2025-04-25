local vim = vim
local Plug = vim.fn['plug#']

vim.api.nvim_exec([[
call plug#begin('~/.config/nvim/autoload/plugged')
  
  Plug('junegunn/goyo.vim')

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug('junegunn/fzf.vim')
  Plug('nvim-treesitter/nvim-treesitter')

  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }


  Plug('neovim/nvim-lspconfig')
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'sbdchd/neoformat'

  
  Plug('hashivim/vim-terraform')
  Plug('ray-x/go.nvim')
  Plug('ray-x/guihua.lua')

  Plug 'mfussenegger/nvim-dap'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'mg979/vim-visual-multi'

  Plug 'nvim-tree/nvim-web-devicons' " optional
  Plug 'nvim-tree/nvim-tree.lua'

  Plug 'Mofiqul/dracula.nvim'

  Plug 'nvim-focus/focus.nvim'

call plug#end()
]], false)

