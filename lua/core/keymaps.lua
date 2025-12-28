vim.g.mapleader = ' '
vim.maplocalleader = ' '

vim.keymap.set('n', '<leader>e', '<cmd>Explore<cr>', { desc = 'FileExplorer', silent = true })
vim.keymap.set('n', '<tab>', '<cmd>tabNext<cr>', { desc = 'NextTab', silent = true })
vim.keymap.set('n', '<S-tab>', '<cmd>tabprevious<cr>', { desc = 'PreTab', silent = true })
vim.keymap.set('n', 'L', '<cmd>bNext<cr>', { desc = 'NextBuffer', silent = true })
vim.keymap.set('n', 'H', '<cmd>bprevious<cr>', { desc = 'PreBuffer', silent = true })
vim.keymap.set('n', '<C-w>d', '<cmd>bdelete<cr>', { desc = 'BufDelete', silent = true })
vim.keymap.set('n', '<C-w>bf', '<cmd>bfirst<cr>', { desc = 'BufFirst', silent = true })
vim.keymap.set('n', '<C-w>bl', '<cmd>blast<cr>', { desc = 'BufLast', silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Page Down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Page Up' })
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<cr>', { desc = 'tmux-sessionizer' })
vim.keymap.set('n', 'J', 'maJ`a<cmd>delmarks a<cr>', { desc = 'Join', silent = true })
vim.keymap.set('n', '<esc>', '<cmd>nohls<cr><esc>', { desc = 'No highlight (Normal)' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' })

vim.keymap.set('v', 'J', ':m ">+1<cr>gv=gv', { desc = 'Move text Up' })
vim.keymap.set('v', 'K', ':m "<-2<cr>gv=gv', { desc = 'Move text Down' })

-- Terminal
-- map('t', '<Esc>', '<C-\\><C-n>')
-- map('t', '<C-w>h', '<C-\\><C-n><C-w>h')
-- map('t', '<C-w>j', '<C-\\><C-n><C-w>j')
-- map('t', '<C-w>k', '<C-\\><C-n><C-w>k')
-- map('t', '<C-w>l', '<C-\\><C-n><C-w>l')
