-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- fuzzy finder
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })
  -- treesitter for code analysis/parsing for better lsp + syntax hl
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')

  -- harpoon for better file navigation instead of vim-wintabs
  use('theprimeagen/harpoon')

  -- undotree for history tracking
  use('mbbill/undotree')

  -- lsp configuration
  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      -- Snippets
      { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' } },
      { 'saadparwaiz1/cmp_luasnip' },
    }
  })

  -- auto-commenting (leader cc)
  use('preservim/nerdcommenter')

  -- git blame (leader s)
  use('zivyangll/git-blame.vim')

  -- interesting..
  use('eandrju/cellular-automaton.nvim')

  -- TODO cloak for encrypting passwords
  -- use("laytan/cloak.nvim")

  -- TODO activate after student account
  --use("github/copilot.vim")


  -- tabnine
  --use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

  -- codeium
  use({
    "Exafunction/codeium.nvim",
    requires = {
      "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp",
    }
  })

  -- flutter
  use({
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  })

  -- colorschemes
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use({ 'Mofiqul/dracula.nvim', as = 'dracula' })
  use({ 'navarasu/onedark.nvim', as = 'onedark' })
  use({ "ellisonleao/gruvbox.nvim", as = 'gruvbox' })
  use({ "morhetz/gruvbox", as = 'gruvbox-morhetz' })
  use({ 'tanvirtin/monokai.nvim', as = 'monokai' })
  use({ 'shaunsingh/nord.nvim', as = 'nord' })
  use({ 'folke/tokyonight.nvim', as = 'tokyonight' })
  use({ 'AhmedAbdulrahman/vim-aylin', as = 'aylin' })
  use({ 'sainnhe/edge', as = 'edge' })
  use({ 'shaunsingh/solarized.nvim', as = 'solarized' })
end)
