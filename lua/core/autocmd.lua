local keymap = vim.keymap

local function Groups(name, opt)
  return vim.api.nvim_create_augroup(name, opt)
end

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = Groups("Highlight_yank", { clear = true }),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

-- Syntax highlight on *.rasi file
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "rasi",
  callback = function()
    vim.opt.filetype = "css"
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end
})
