vim.pack.add({
  { src = 'https://github.com/catppuccin/nvim',            name = 'catppuccin' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/jiaoshijie/undotree' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/nvim-mini/mini.statusline' , name = 'statusline' },
  { src = 'https://github.com/folke/sidekick.nvim', name = 'sidekick' },
  { src = 'https://github.com/kylechui/nvim-surround' },
  { src = 'https://github.com/folke/which-key.nvim', name = 'which-key' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },

})

require('core.options')
require('core.keymaps')
require('core.autocmd')

require('plugins.git')
require('plugins.highlight')
-- require('plugins.telescope')
require('plugins.lspconfig')
require('plugins.treesitter')
require('plugins.tmux')

vim.cmd [[colorscheme catppuccin]]

require('mini.statusline').setup()

require('nvim-autopairs').setup()

require('nvim-surround').setup()

require('undotree').setup()
vim.keymap.set('n', '<leader>u', function()
  require('undotree').toggle()
end, { desc = 'Undotree' })

vim.keymap.set('n', '<leader>aa', function()
  require('sidekick.cli').toggle()
end, { desc = 'Toggle CLI (Sidekick)' })

require('fzf-lua').setup()
vim.keymap.set('n', '<leader>ff', ':FzfLua files<cr>', { desc = 'Find files (fzf-lua)'})
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<cr>', { desc = 'Buffers (fzf-lua)' })
vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<cr>', { desc = 'Live Grep (fzf-lua)' })
vim.keymap.set('n', '<leader>fg', ':FzfLua helptags<cr>', { desc = 'Help (fzf-lua)' })
vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<cr>', { desc = 'Live Grep (fzf-lua)' })
vim.keymap.set('n', '<leader>fm', ':FzfLua marks<cr>', { desc = 'Marks (fzf-lua)' })
vim.keymap.set('n', '<leader>fj', ':FzfLua jumps<cr>', { desc = 'Jumplist (fzf-lua)' })
vim.keymap.set('n', '<leader>fc', function()
  require('fzf-lua').files({
    cwd = vim.fn.stdpath('config')
  })
end,{ desc = 'Config (fzf-lua)' })
vim.keymap.set('n', '<leader>gg', ':FzfLua git_files<cr>', { desc = 'Git Files (fzf-lua)' })
vim.keymap.set('n', '<leader>gc', ':FzfLua git_commits<cr>', { desc = 'Git Commit (fzf-lua)' })
vim.keymap.set('n', '<leader>gb', ':FzfLua git_branches<cr>', { desc = 'Git Branches (fzf-lua)' })
vim.keymap.set('n', '<leader>gs', ':FzfLua git_status<cr>', { desc = 'Git Status (fzf-lua)' })
vim.keymap.set('n', '<leader>lc', ':FzfLua lsp_code_actions<cr>', { desc = 'Lsp Code Actions (fzf-lua)' })
vim.keymap.set('n', '<leader>ls', ':FzfLua lsp_workspace_symbols<cr>', { desc = 'Lsp Workspace Symbols (fzf-lua)' })
vim.keymap.set('n', '<leader>lr', ':FzfLua lsp_references<cr>', { desc = 'Lsp References (fzf-lua)' })
vim.keymap.set('n', '<leader>lx', ':FzfLua diagnostics_workspace<cr>', { desc = 'Lsp Diagnostics Workspace (fzf-lua)' })
vim.keymap.set('n', '<leader>ld', ':FzfLua diagnostics_documents<cr>', { desc = 'Lsp Diagnostics Documents (fzf-lua)' })
