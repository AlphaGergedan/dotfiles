local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>vcf", function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end, opts)
end)

-- install lsp using this gui
require('mason').setup({})
require('mason-lspconfig').setup({
  --ensure_installed = {'tsserver', 'angularls', 'bashls', 'clangd', 'cmake', 'cssls', 'dockerls', 'html', 'jsonls', 'ltex', 'lua_ls', 'marksman', 'pyright', 'ruby_ls'},
  handlers = {

    lsp_zero.default_setup,

    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,

    ltex = function()
      local ltex_opts = {
        filetypes = { "markdown", "latex", "plaintext", "mail", "context", "gitcommit", "bib" },
      }
      require('lspconfig').ltex.setup(ltex_opts)
    end
  }
})

-- keymaps
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_format = lsp_zero.cmp_format({ details = true, })
local cmp_compare = cmp.config.compare
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load {
  exclude = {},
}

cmp.setup({

  sources = {
    { name = 'path', priority = 50 },
    { name = 'nvim_lsp', priority = 100 },
    { name = 'nvim_lua', priority = 150 },
    { name = 'luasnip', priority = 120 },
    { name = 'codeium', priority = 200 },
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),

  formatting = cmp_format,

  sorting = {
    priority_weight = 1.0,
    comparators = {
      cmp_compare.score,
      cmp_compare.recently_used,
      cmp_compare.locality,
    }
  },

})
