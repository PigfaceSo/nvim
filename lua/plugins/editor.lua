local Comment = {
  "folke/ts-comments.nvim",
  enabled = vim.fn.has("nvim-0.10.0") == 1,
  event = "VeryLazy",
  opts = {},
}

local Mini_ai = {
  "echasnovski/mini.ai",
  version = false,
  enabled = true,
  opts = {}
}

local Undotree = {
  "mbbill/undotree",
  enabled = true,
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
  },
  init = function()
    -- vim.g.undotree_DiffCommand = "fc"
    vim.g.undotree_WindowLayout = 1
    vim.g.undotree_SplitWidth = 20
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}

local Session = {
  "folke/persistence.nvim",
  enabled = true,
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {},
}

local Trouble = {
  "folke/trouble.nvim",
  enabled = true,
  cmd = "Trouble",
  keys = {
    { "<leader>t", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
  },
  opts = {
    focus = true,
    auto_preview = true,
  },
}

local Leap = {
  "ggandor/leap.nvim",
  enabled = true,
  keys = {
    { "s", "<Plug>(leap)" },
    { "S", "<Plug>(leap-from-window)" },
  },
  opts = {},
  config = function()
    local leap = require("leap")
    leap.opts.safe_labels = {}
    leap.opts.preview_filter = function()
      return false
    end

    vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
  end,
}

return {
  Comment,
  -- Mini_ai,
  Undotree,
  -- Session,
  Leap,
}
