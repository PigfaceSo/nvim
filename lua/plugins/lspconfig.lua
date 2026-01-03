vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/saghen/blink.cmp',              version = vim.version.range('^1') },
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' }
})

vim.diagnostic.enable = true
vim.diagnostic.config({
  virtual_lines = true,
  virtual_text = false,
})

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'bashls',
    'bashls',
    'clangd',
    'clangd',
    'cssls',
    'eslint',
    'html',
    'lua_ls',
    'phpactor',
    'pyright',
    'ruby_lsp',
    'rust_analyzer',
    'tailwindcss',
    'ts_ls',
  },
  handlers = function(server_name)
    require('lspconfig')[server_name].setup({
      capabilities = require('blink.cmp').get_lsp_capabilities(),
    })
  end,
  ['lua_ls'] = function()
    require('lspconfig').lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', 'gd', function()
      vim.lsp.buf.definition()
    end, { desc = 'Go to Definition (LSP)', buffer = event.buf })
    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover()
    end, { desc = 'Info Hover (LSP)', buffer = event.buf }) -- vim.keymap.set('n', '<leader>ls', function() vim.lsp.buf.workspace_symbol() end, { desc = 'Workspace Symbol (LSP)' , buffer = event.buf })
    vim.keymap.set('n', '<leader>lf', function()
      vim.diagnostic.open_float()
    end, { desc = 'Open Float (LSP)', buffer = event.buf })
    vim.keymap.set('n', ']d', function()
      vim.diagnostic.goto_next()
    end, { desc = 'Go Next (LSP)', buffer = event.buf })
    vim.keymap.set('n', '[d', function()
      vim.diagnostic.goto_prev()
    end, { desc = 'Go Prev (LSP)', buffer = event.buf })
    vim.keymap.set('n', '<leader>lc', function()
      vim.lsp.buf.code_action()
    end, { desc = 'Action (LSP)', buffer = event.buf })
    -- vim.keymap.set('n', '<leader>lr', function()
    --   vim.lsp.buf.references()
    -- end, { desc = 'References (LSP)', buffer = event.buf })
    -- vim.keymap.set('n', '<leader>ln', function()
    --   vim.lsp.buf.rename()
    -- end, { desc = 'Rename (LSP)', buffer = event.buf })
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format()
  end,
})

require('luasnip.loaders.from_vscode').lazy_load()

require('blink.cmp').setup({
  keymap = { preset = 'super-tab' },
  completion = {
    documentation = { auto_show = true },
    list = { selection = { preselect = true } }
  },
  fuzzy = { implementation = 'prefer_rust' },
  signature = { enabled = true }
})
