if vim.g.vscode then
else

  local Plug = vim.fn['plug#']

  vim.call('plug#begin', '~/.config/nvim/plugged')

  Plug 'neovim/nvim-lspconfig'
  Plug('williamboman/mason.nvim', { ['do'] = ':MasonUpdate' })
  Plug 'navarasu/onedark.nvim'

  -- Treesitter (better syntax highlighting)
  Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

  -- Autocomplete
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  -- Auto-pair parenthesis, bracket, etc.
  Plug 'windwp/nvim-autopairs'

  -- Snippet manager
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  -- Function signature help
  Plug 'ray-x/lsp_signature.nvim'

  -- File explorer
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-tree/nvim-tree.lua'

  -- Indentation rulers
  Plug 'lukas-reineke/indent-blankline.nvim'

  -- Git indicators in margin
  Plug 'lewis6991/gitsigns.nvim'

  -- Floating windows
  Plug 'voldikss/vim-floaterm'

  -- Tab bar
  Plug 'romgrk/barbar.nvim'

  -- Session management
  Plug 'folke/persistence.nvim'

  vim.call('plug#end')

  -- Disable Netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  local set = vim.opt

  -- General
  set.termguicolors = true        -- Enable colors in terminal
  set.mouse = "a"                 -- Enable mouse in all modes
  set.wildmode = "longest,list"   -- Enable bash-like tab completions
  set.clipboard = "unnamedplus"   -- Use system clipboard
  set.swapfile = false            -- Disable creation of swap file
  set.backup = false              -- Disable backup
  set.undofile = true             -- Enable undo history
  set.whichwrap = "<,>,[,]"       -- Enable changing line when moving past EOL

  -- Search
  set.ignorecase = true           -- Case insensitive search
  set.hlsearch = true             -- Highlight search results
  set.incsearch = true            -- Enable incremental search
  set.wrapscan = true             -- Search wraps around the end of the file

  -- Coding
  set.showmatch = true            -- Show matching char
  set.tabstop = 2                 -- How many cols long is a TAB
  set.softtabstop = 2             -- How many spaces are equivalent to a TAB
  set.shiftwidth = 2              -- Width of autoindents
  set.expandtab = true            -- Convert TAB to white space
  set.autoindent = true           -- Indent a new line like the previous one
  set.smartindent = true          -- Adopt indentation of the current file
  set.number = true               -- Show line numbers
  set.cc = "80"                   -- Show ruler
  set.completeopt = {             -- Show completion popup
    'menu',
    'menuone',
    'noselect'
  }

  -- Imports
  --require('core/autocmds')
  --require('core/usercmds')
  --require('core/theme')
  --require('core/keymaps')
  --require('lsp/lspconfig')
  --require('lsp/prolog')
  --require('plugins/mason')
  --require('plugins/nvim-cmp')
  --require('plugins/barbar')
  --require('plugins/nvim-tree')
  --require('plugins/indent-blankline')
  --require('plugins/gitsigns')
  --require('plugins/nvim-treesitter')
  --require('plugins/persistence')
  --require('plugins/nvim-autopairs')
end

