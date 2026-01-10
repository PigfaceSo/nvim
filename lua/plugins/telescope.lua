vim.pack.add({
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-file-browser.nvim' },
})

local telescope_actions = require("telescope.actions")
local telescope_fb_actions = require("telescope").extensions.file_browser.actions
require("telescope").setup({
  defaults = {
    -- path_display = { "shorten" },
    mappings = {
      n = {
        ["l"] = telescope_actions.select_default,
      },
      i = {
        ["<C-j>"] = telescope_actions.move_selection_next,
        ["<C-k>"] = telescope_actions.move_selection_previous,
        ["<C-l>"] = telescope_actions.select_default,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = false,
      respect_gitignore = true,
      no_ignore = true,
      hidden = false,
      grouped = true,
      hide_parent_dir = true,
      previewer = true,
      initial_mode = "insert",
      layout_config = {
        height = 10,
      },
      mappings = {
        ["n"] = {
          ["a"] = telescope_fb_actions.create,
          ["h"] = telescope_fb_actions.goto_parent_dir,
          ["o"] = telescope_fb_actions.open,
          ["."] = telescope_fb_actions.toggle_hidden,
        },
        ["i"] = {
          ["<C-h>"] = telescope_fb_actions.goto_parent_dir,
          ["<C-o>"] = telescope_fb_actions.open,
          ["<C-.>"] = telescope_fb_actions.toggle_hidden,
        },
      },
    },
  },
})

require("telescope").load_extension("file_browser")
-- require('telescope').load_extension('lazygit')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find File (Telescope)' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers (Telescope)' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep (Telescope)' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help (Telescope)' })
vim.keymap.set('n', '<leader>ft', builtin.colorscheme, { desc = 'Colorscheme (Telescope)' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'OldFiles (Telescope)' })
vim.keymap.set('n', '<leader>fc', function()
  require('telescope.builtin').find_files({
    cwd = vim.fn.stdpath('config')
  })
end, { desc = 'Config (Telescope)' })
vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Marks (Telescope)' })
vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = 'Jumplist (Telescope)' })
vim.keymap.set('n', '<leader>gg', builtin.git_files, { desc = 'Git Files (Telescope)' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git Commits (Telescope)' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git Branches (Telescope)' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git Status (Telescope)' })
vim.keymap.set('n', '<leader>ls', builtin.lsp_workspace_symbols, { desc = 'Lsp Workspace Symbols (Telescope)' })
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = 'Lsp References (Telescope)' })
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, { desc = 'Lsp Diagnostics (Telescope)' })
vim.keymap.set('n', '<leader>r', builtin.resume, { desc = 'Resume (Telescope)' })
vim.keymap.set('n', '<leader>:', builtin.command_history, { desc = 'Command History (Telescope)' })
vim.keymap.set('n', '<leader>e', function()
  require('telescope').extensions.file_browser.file_browser({
    path = '%:p:h',
    select_buffer = true,
  })
end, { desc = 'Explorer (Telescope)' })
