-- Netrw Keybind
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("Netrw_keybind", { clear = true }),
  pattern = "netrw",
  callback = function()
    local map = vim.keymap.set
    map("n", "qq", "<C-6>", { buffer = true, remap = true })
    map("n", "l", "<CR>", { buffer = true, remap = true })
    map("n", "h", "-", { buffer = true, remap = true })
    map("n", "a", "%", { buffer = true, remap = true })
    map("n", "r", "R", { buffer = true, remap = true })
  end,
})

vim.g.netrw_keepdir = 0
-- vim.g.netrw_winsize = 30
vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 0
vim.g.netrw_localcopydircmd = "cp -r"
