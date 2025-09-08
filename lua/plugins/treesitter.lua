local TreeSitter = {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects", -- Do with (function,class,argument)
		"nvim-treesitter/nvim-treesitter-context", -- Show function on top line
	},
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	bulid = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"arduino",
				"bash",
				"css",
				"html",
				"htmldjango",
				"javascript",
				"python",
				"tsx",
				"typescript",
				"blade",
				"c",
				"gitcommit",
				"gitignore",
				"json",
				"json5",
				"php",
				"php_only",
				"phpdoc",
				"toml",
				"yaml",
			},
			ignore_install = { "diff", "org" },
			auto_Install = true,
			sync_install = false,
			highlight = {
				enable = false,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = false,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
					},
				},
			},
		})
	end,
}

local Autotag = {
	"windwp/nvim-ts-autotag",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
}

return {
	TreeSitter,
	Autotag,
}
