return {
  -- {
  --   "oxfist/night-owl.nvim",
  --   priority = 100,
  --   lazy = false,
  --   opts = {},
  --   config = function()
  --     vim.cmd.colorscheme("night-owl")
  --   end,
  -- },

  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd.colorscheme("catppuccin")
  --   end,
  -- },

  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 100,
  --   lazy = false,
  --   opts = {},
  --   config = function()
  --     -- vim.cmd.colorscheme("tokyonight-night")
  --   end,
  -- },

  -- {
  --   'ribru17/bamboo.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('bamboo').setup {
  --       -- optional configuration here
  --       code_style = {
  --         comments = { italic = false },
  --         conditionals = { italic = false },
  --         keywords = {},
  --         functions = {},
  --         namespaces = { italic = false },
  --         parameters = { italic = false },
  --         strings = {},
  --         variables = {},
  --       },
  --     }
  --     require('bamboo').load()
  --   end,
  -- },

  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd[[colorscheme solarized-osaka]]
    end,
  },
}
