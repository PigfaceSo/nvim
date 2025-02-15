local Git = {
  "tpope/vim-fugitive",
  enabled = true,
  cmd = { "G","Git" },
  keys = {
    { "<leader>go", "<cmd>Git<cr>", desc = "Git" }
  },
}

local GitSign = {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  event = "VeryLazy",
  cmd = "Gitsigns",
  keys = {
    { "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>",                desc = "Stage Hunk" },
    { "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>",                desc = "Reset Hunk" },
    { "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>",              desc = "Stage Buffer" },
    { "<leader>hR", "<cmd>Gitsigns reset_buffer<cr>",              desc = "Reset Buffer" },
    { "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>",              desc = "Preview Hunk" },
    { "<leader>hd", "<cmd>Gitsigns diffthis<cr>",                  desc = "Git Diff" },
    { "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Line Blame" },
  },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
  },
}

local Diffview = {
  "sindrets/diffview.nvim",
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Icons
  },
  cmd = "DiffviewOpen",
  keys = {
    { "<leader>gdo", "<cmd>DiffviewOpen<cr>",  desc = "DiffviewOpen" },
    { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "DiffviewClose" },
  },
}

local Copilot = {
  "github/copilot.vim",
  enabled = true,
  cmd = "Copilot",
}

return {
  -- Git,
  -- GitSign,
  -- Copilot,
  -- Diffview,
}
