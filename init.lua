vim.pack.add({
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  { src = 'https://github.com/nvim-lua/plenary.nvim', name = 'plenary' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons', name = 'devicons' },
  { src = 'https://github.com/windwp/nvim-autopairs', name = 'autopairs' },
  { src = 'https://github.com/nvim-mini/mini.statusline' , name = 'statusline' },
  { src = 'https://github.com/akinsho/bufferline.nvim', name = 'bufferline' },
  { src = 'https://github.com/kylechui/nvim-surround', name = 'surround' },
  { src = 'https://github.com/folke/which-key.nvim', name = 'which-key' },
  { src = 'https://github.com/smjonas/inc-rename.nvim', name = 'inc-rename' },
})

require('core.options')
require('core.keymaps')
require('core.autocmd')

require('plugins.ai')
require('plugins.zellij')
require('plugins.git')
require('plugins.highlight')
require('plugins.telescope')
require('plugins.lspconfig')
require('plugins.treesitter')

vim.cmd [[colorscheme catppuccin]]

require('mini.statusline').setup()

require('bufferline').setup()

require('nvim-autopairs').setup()

require('nvim-surround').setup()

require('inc_rename').setup()
vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = 'IncRename' })
