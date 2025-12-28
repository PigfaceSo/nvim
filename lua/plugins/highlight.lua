vim.pack.add({
  { src = 'https://github.com/echasnovski/mini.hipatterns' },
})

require('mini.hipatterns').setup({
  tailwind = {
    enabled = true,
    ft = {
      "astro",
      "css",
      "heex",
      "html",
      "html-eex",
      "javascript",
      "javascriptreact",
      "rust",
      "svelte",
      "typescript",
      "typescriptreact",
      "vue",
    },
    -- full: the whole css class will be highlighted
    -- compact: only the color will be highlighted
    style = "full",
  },
  highlighters = {
    hex_color = require('mini.hipatterns').gen_highlighter.hex_color({ priority = 2000 }),
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    shorthand = {
      pattern = "()#%x%x%x()%f[^%x%w]",
      group = function(_, _, data)
        ---@type string
        local match = data.full_match
        local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
        local hex_color = "#" .. r .. r .. g .. g .. b .. b

        return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
      end,
      extmark_opts = { priority = 2000 },
    },
  }
})
