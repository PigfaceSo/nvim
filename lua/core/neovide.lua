if vim.g.neovide then
  -- vim.cmd.colorscheme("night-owl")
  -- vim.cmd.colorscheme("tokyonight-night")
  vim.g.neovide_theme = 'tokyonight-night'

  vim.o.guifont = "JetBrainsMonoNL Nerd Font:h12"

  vim.g.neovide_transparency = 1.0

  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  vim.g.neovide_window_blurred = true
  vim.g.neovide_refresh_rate = 60

  vim.g.neovide_scroll_animation_length = 0.2

  vim.g.neovide_cursor_vfx_mode = "railgun"
end
