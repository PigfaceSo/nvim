vim.pack.add({
  { src = 'https://github.com/catppuccin/nvim',            name = 'catppuccin' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/jiaoshijie/undotree' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/nvim-mini/mini.statusline' },
  { src = 'https://github.com/folke/sidekick.nvim' },
})

require('core.options')
require('core.keymaps')
require('core.autocmd')

require('plugins.git')
require('plugins.highlight')
require('plugins.telescope')
require('plugins.lspconfig')
require('plugins.treesitter')
require('plugins.tmux')

vim.cmd [[colorscheme catppuccin]]

require('mini.statusline').setup()

require('nvim-autopairs').setup()

require('undotree').setup()
vim.keymap.set('n', '<leader>u', function()
  require('undotree').toggle()
end, { desc = 'Undotree' })

vim.keymap.set('n', '<leader>aa', function()
  require('sidekick.cli').toggle()
end, { desc = 'Toggle CLI (Sidekick)' })
