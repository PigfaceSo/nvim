local Cmp = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",                       -- LSP completenion
    "hrsh7th/cmp-buffer",                         -- text completenion
    "hrsh7th/cmp-path",                           -- path completenion
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "roobert/tailwindcss-colorizer-cmp.nvim",     -- Tailwind
    "hrsh7th/cmp-cmdline",                        -- cmd completenion
    "L3MON4D3/LuaSnip",                           -- Snippet
    "saadparwaiz1/cmp_luasnip",                   -- Snippet completenion
    "rafamadriz/friendly-snippets",               -- snippet from vscode
  },
  enabled = true,
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    require("tailwindcss-colorizer-cmp").setup({
      color_sqare_width = 2,
    })
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)           -- For `luasnip` users.
        end,
      },
      completion = {
        completeopt = "menuone,noselect",
      },
      formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),         -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },         -- For luasnip users.
        { name = "buffer" },
        { name = "path" },
        { name = "orgmode" },
        { name = "neorg" },
      }),
    })
  end,
}

local CmpMini = {
  "echasnovski/mini.completion",
  enabled = true,
  version = false,
  event = "BufEnter",
  opts = {
    delay = {
      completion = 100,
      info = 100,
      signature = 50,
    },
  },
  config = function(_, opts)
    require("mini.completion").setup(opts)
    local imap_expr = function(lhs, rhs)
      vim.keymap.set("i", lhs, rhs, { expr = true })
    end
    imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
    imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
    imap_expr("<Cr>", [[pumvisible() ? "\<C-y><Cr>" : "\<Cr>"]])
    -- When use Dressing.nvim plugin
    vim.cmd([[au FileType DressingInput lua vim.b.minicompletion_disable = true]])
  end,
}

local Coq = {
  "ms-jpq/coq_nvim",
  branch = "coq",
  dependencies = {
    -- { "ms-jpq/coq.artifacts", branch = "artifacts" },
  },
  enabled = true,
  init = function()
    vim.g.coq_settings = {
      auto_start = true,
      clients = {
        tabnine = {
          enabled = false,
        },
      },
    }
  end,
}

return {
  Cmp,
  -- CmpMini,
  -- Coq,
}
