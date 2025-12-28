vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/jiaoshijie/undotree' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/nvim-mini/mini.statusline' },
})
require('core.options')
require('core.keymaps')
require('core.autocmd')

require('plugins.highlight')
require('plugins.telescope')
require('plugins.git')
require('plugins.lspconfig')
require('plugins.treesitter')
require('plugins.tmux')

require('mini.statusline').setup()

require('nvim-autopairs').setup()

require('undotree').setup()
vim.keymap.set('n', '<leader>u', function()
  require('undotree').toggle()
end, { desc = 'Undotree' })
