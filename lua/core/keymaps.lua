-- ###### Prefix ###### --
-- <leader>b - buffer
-- <leader>f - Find
-- <leader>g - Git
-- <leader>h - Git hunk
-- <leader>gd - DiffView
-- <leader>l - Lsp
-- <leader>t - Toggle
-- <leader>u - Undotree
-- <leader>e - Explorer
-- <leader>j - Join/Split NOTE not use
-- ############ --

local map = vim.keymap.set

-- map("n", "<leader>e", "<cmd>Ex<cr>", { desc = "FileExplorer", silent = true })
map("n", "L", "<cmd>bNext<cr>", { desc = "NextBuffer", silent = true })
map("n", "H", "<cmd>bprevious<cr>", { desc = "PreBuffer", silent = true })
map("n", "<C-w>d", "<cmd>bdelete<cr>", { desc = "BufDelete", silent = true })
map("n", "<C-w>bf", "<cmd>bfirst<cr>", { desc = "BufFirst", silent = true })
map("n", "<C-w>bl", "<cmd>blast<cr>", { desc = "BufLast", silent = true })
map("n", "<C-d>", "<C-d>zz", { desc = "Page Down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Page Up" })
-- map("n", "<leader>m", "<cmd>marks<cr>", { desc = "Marks list" })
-- map("n", "<leader>j", "<cmd>jumps<cr>", { desc = "Jumplist" })
map("n", "J", "maJ`a<cmd>delmarks a<cr>", { desc = "Join", silent = true })
map("n", "<esc>", "<cmd>nohls<cr><esc>", { desc = "No highlight (Normal)" })

-- Exit Insert mode
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move text Up" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move text Down" })

-- Terminal
-- map("t", "<Esc>", "<C-\\><C-n>")
-- map("t", "<C-w>h", "<C-\\><C-n><C-w>h")
-- map("t", "<C-w>j", "<C-\\><C-n><C-w>j")
-- map("t", "<C-w>k", "<C-\\><C-n><C-w>k")
-- map("t", "<C-w>l", "<C-\\><C-n><C-w>l")
