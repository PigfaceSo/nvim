local function hl(a, part, opts)
  vim.api.nvim_set_hl(a, part, opts)
end

hl(0, "Normal", {
  bg = "none",
  ctermbg = "none",
})
hl(0, "NormalNC", {
  bg = "none",
  ctermbg = "none",
})
-- hl(0, "NormalFloat", {
--   bg = "none",
--   ctermbg = "none",
-- })
hl(0, "EndOfBuffer", {
  bg = "none",
  ctermbg = "none",
})
hl(0, "FloatBorder", {
  bg = "none",
  ctermbg = "none",
})
hl(0, "WinSeparator", {
  bg = "none",
  ctermbg = "none",
})
hl(0, "SignColumn", {
  bg = "none",
  ctermbg = "none",
})
-- hl(0, "Winbar" , {
--   bg = "red"
-- })
-- hl(0, "WinbarNC" , {
--   bg = "none"
-- })
