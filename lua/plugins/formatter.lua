local Formatter = {
  "stevearc/conform.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
    })

    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = "*",
      callback = function(args)
        require("conform").format({
          bufnr = args.buf,
          lsp_format = "fallback",
        })
      end,
    })

    vim.keymap.set("n", "<leader>p", function()
      require("conform").format({
        lsp_format = "fallback",
      })
    end, { desc = "Format" })
  end,
}

return {
  -- Formatter,
}
