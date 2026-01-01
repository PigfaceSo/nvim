vim.pack.add({
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/kdheepak/lazygit.nvim' },
})

require('gitsigns').setup({
  current_line_blame = true
})
vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', { desc = 'Stage Hunk' })
vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>', { desc = 'Reset Hunk' })
vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<cr>', { desc = 'Stage Buffer' })
vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<cr>', { desc = 'Reset Buffer' })
vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<cr>', { desc = 'Preview Hunk' })
vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<cr>', { desc = 'Git Diff' })
vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<cr>', { desc = 'Toggle Line Blame' })

vim.keymap.set('n', '<leader>go', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     require('lazygit.utils').project_root_dir()
--   end,
-- })
