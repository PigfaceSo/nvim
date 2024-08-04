local opt = vim.opt

vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

if vim.fn.has("win64") then
  opt.shell = "cmd.exe"
end

opt.encoding = "utf-8"

opt.termguicolors = true

opt.mouse = "a"
opt.cursorline = false
opt.cursorcolumn = false

-- Line number
opt.number = true
opt.relativenumber = true

-- StatusLine
opt.ruler = true
opt.laststatus = 0
opt.cmdheight = 1
opt.showcmd = true
opt.showmode = true


-- Statuscolumn
opt.signcolumn = "yes"
opt.statuscolumn = [[%!v:lua.require('core.statuscolumn').statuscolumn()]]

-- Split position
opt.splitbelow = true
opt.splitright = true

-- Warp text
opt.wrap = false
-- Scrolloff
opt.scrolloff = 10
opt.sidescrolloff = 12

-- Popupmenu
opt.pumheight = 10

-- Tab / Space
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true

-- Indent
opt.autoindent = false
opt.smartindent = true
opt.formatexpr = "v:lua.require('conform').formatexpr()"

-- Fold
opt.foldenable = false
opt.foldexpr = "v:lua.require('core.ui').foldexpr()"
opt.foldmethod = "expr"
opt.foldtext = ""
opt.foldlevel = 99
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- List
opt.listchars = {
  tab = ">>",
  multispace = "·",
  trail = "·",
}
opt.list = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false
opt.inccommand = "split"

-- File
opt.backup = false
opt.swapfile = false
opt.undofile = true

-- Other options
opt.clipboard = "unnamedplus"
opt.timeout = true
opt.timeoutlen = 3000
opt.confirm = true
opt.updatetime = 200
