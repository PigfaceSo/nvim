vim.opt.background = 'dark'
vim.opt.encoding = 'utf-8'
vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- Autocomplete
vim.opt.autocomplete = false
vim.opt.completeopt = 'menu,menuone,popup,fuzzy'
vim.opt.complete = '.,w,b,u,t'
vim.opt.pumheight = 10

-- Line number
vim.opt.number = true
vim.opt.relativenumber = true

-- StatusLine
vim.opt.ruler = true
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.showmatch = true

-- Statuscolumn
vim.opt.signcolumn = 'yes:2'

-- Split position
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Warp text
vim.opt.wrap = false

-- Scrolloff
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 12

-- Tab / Space
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true

-- Indent
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Fold
vim.opt.foldenable = false
vim.opt.foldtext = ''
vim.opt.foldlevel = 99
vim.opt.fillchars = {
  foldopen = '',
  foldclose = '',
  -- fold = ' ',
  -- foldsep = ' ',
  diff = '╱',
  eob = ' ',
}

-- List
vim.opt.listchars = {
  tab = '  ',
  multispace = '·',
  trail = '·',
}
vim.opt.list = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.inccommand = 'split'

-- File
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true

-- Other vim.options
-- vim.opt.clipboard = 'unnamedplus'
vim.opt.timeout = true
vim.opt.timeoutlen = 3000
vim.opt.ttimeoutlen = 10
vim.opt.confirm = true
vim.opt.updatetime = 200
