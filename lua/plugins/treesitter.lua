vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/windwp/nvim-ts-autotag' },
})

local treesitter_ensure_install = {
  'arduino',
  'bash',
  'blade',
  'c',
  'css',
  'gitcommit',
  'gitignore',
  'html',
  'htmldjango',
  'javascript',
  'json',
  'php',
  'phpdoc',
  'python',
  'toml',
  'tsx',
  'typescript',
  'yaml',
  'ruby',
}
require('nvim-treesitter').install(treesitter_ensure_install)
vim.api.nvim_create_autocmd('FileType', {
  pattern = treesitter_ensure_install,
  callback = function()
    vim.treesitter.start()
    -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

require('nvim-ts-autotag').setup()
