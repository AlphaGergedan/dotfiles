-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- Extensions
  --use('nvim-lua/plenary.nvim')
--
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

  -- local Ollama integration
  use('David-Kunz/gen.nvim')

  --use({ 'MeanderingProgrammer/render-markdown.nvim', ft = { 'markdown', 'codecompanion' }, as = "render-markdown", })
  --use({ 'ravitemer/mcphub.nvim', build = 'npm install -g mcp-hub@latest', } )
  -- LLM companion setup
  --use({
    --'olimorris/codecompanion.nvim',
    --requires = {
      --{ 'OXY2DEV/markview.nvim' },
      --{ 'echasnovski/mini.diff' },
      --{ 'HakonHarnes/img-clip.nvim' },
    --}
  --})



  -- avante for cursor like LLM experience
  --use {
    --'yetone/avante.nvim',
    --branch = 'main',
    --run = 'make',
    --requires = {
      --{ 'stevearc/dressing.nvim' },
      --{ 'nvim-lua/plenary.nvim' },
      --{ 'MunifTanjim/nui.nvim' },
      --{ 'MeanderingProgrammer/render-markdown.nvim' },
      --{ 'hrsh7th/nvim-cmp' },
      --{ 'nvim-tree/nvim-web-devicons' },
      --{ 'HakonHarnes/img-clip.nvim' },
      --{ 'zbirenbaum/copilot.lua' },
    --}
  --}
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
  --use({
    --"exafunction/codeium.nvim",
    --requires = {
      --"nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp",
    --}
  --})

  -- flutter
  use({
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  })

  -- discord presence
  --use({
    --'vyfor/cord.nvim',
    --run = './build',
  --})

  -- colorschemes
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use({ 'Mofiqul/dracula.nvim', as = 'dracula' })
  use({ 'navarasu/onedark.nvim', as = 'onedark' })
  use({ "ellisonleao/gruvbox.nvim", as = 'gruvbox' })
  use({ "morhetz/gruvbox", as = 'gruvbox-morhetz' })
  use({ "sainnhe/gruvbox-material", as = 'gruvbox-material' })
  use({ 'tanvirtin/monokai.nvim', as = 'monokai' })
  use({ 'shaunsingh/nord.nvim', as = 'nord' })
  use({ 'folke/tokyonight.nvim', as = 'tokyonight' })
  use({ 'AhmedAbdulrahman/vim-aylin', as = 'aylin' })
  use({ 'sainnhe/edge', as = 'edge' })
  use({ 'sainnhe/everforest', as = 'everforest' })
  use({ 'shaunsingh/solarized.nvim', as = 'solarized' })
  use({ 'rebelot/kanagawa.nvim', as = 'kanagawa' })
  --use({ 'kepano/flexoki.nvim', as = 'flexoki' })
  use({ 'jacoborus/tender.vim', as = 'tender' })
  use({ 'savq/melange-nvim', as = 'melange' })
  --use({ 'scottmckendry/cyberdream.nvim', as = 'cyberdream' })
  use({ 'patstockwell/vim-monokai-tasty', as = 'mookai-tasty' })
  use({ 'sts10/vim-pink-moon', as = 'pink-moon' })

end)
