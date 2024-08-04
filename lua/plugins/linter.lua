local Linter = {
  "mfussenegger/nvim-lint",
  dependencies = {
    "williamboman/mason.nvim",
  },
  enabled = true,
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linter_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    },
  },
  config = function()
    local lint = require("lint")

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("Lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>lt", function()
      lint.try_lint()
      vim.notify("Lint Complete")
    end, { desc = "Linting" })
  end,
}

return {
  -- Linter,
}
