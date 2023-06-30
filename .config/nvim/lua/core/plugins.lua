local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- UI
  'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',
  'lewis6991/gitsigns.nvim',
  'nvim-lualine/lualine.nvim',
  'navarasu/onedark.nvim',
  {
       'catppuccin/nvim',
       name = 'catppuccin',
       priority = 1000,
  },
  -- rust
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'simrat39/rust-tools.nvim',

  -- completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  {
  'jose-elias-alvarez/null-ls.nvim',
  ft = {"python"},
  },
  {
	'williamboman/mason.nvim',
	build = ':MasonUpdate',
  opts = {
    ensure_installed = {
      'mypy',
      'ruff',
      'pyright',
      },
    },
  },
  'neovim/nvim-lspconfig',
  'williamboman/mason-lspconfig.nvim',
  'glepnir/lspsaga.nvim',
  {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.0',
	dependencies = { {'nvim-lua/plenary.nvim'} }
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
