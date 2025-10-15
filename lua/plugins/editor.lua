local Comment = {
	"folke/ts-comments.nvim",
	enabled = vim.fn.has("nvim-0.10.0") == 1,
	event = "VeryLazy",
	opts = {
		lang = {
			arduino = "// %s",
		},
	},
}

local Sidekick = {
	"folke/sidekick.nvim",
	opts = {
		-- add any options here
		cli = {
			mux = {
				backend = "tmux",
				enabled = true,
			},
		},
	},
	keys = {
		{
			"<tab>",
			function()
				-- if there is a next edit, jump to it, otherwise apply it if any
				if not require("sidekick").nes_jump_or_apply() then
					return "<Tab>" -- fallback to normal tab
				end
			end,
			expr = true,
			desc = "Goto/Apply Next Edit Suggestion",
		},
		{
			"<c-.>",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick Toggle",
			mode = { "n", "t", "i", "x" },
		},
		{
			"<leader>aa",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick Toggle CLI",
		},
		{
			"<leader>as",
			function()
				require("sidekick.cli").select()
			end,
			-- Or to select only installed tools:
			-- require("sidekick.cli").select({ filter = { installed = true } })
			desc = "Select CLI",
		},
		{
			"<leader>ad",
			function()
				require("sidekick.cli").close()
			end,
			desc = "Detach a CLI Session",
		},
		{
			"<leader>at",
			function()
				require("sidekick.cli").send({ msg = "{this}" })
			end,
			mode = { "x", "n" },
			desc = "Send This",
		},
		{
			"<leader>af",
			function()
				require("sidekick.cli").send({ msg = "{file}" })
			end,
			desc = "Send File",
		},
		{
			"<leader>av",
			function()
				require("sidekick.cli").send({ msg = "{selection}" })
			end,
			mode = { "x" },
			desc = "Send Visual Selection",
		},
		{
			"<leader>ap",
			function()
				require("sidekick.cli").prompt()
			end,
			mode = { "n", "x" },
			desc = "Sidekick Select Prompt",
		},
		-- Example of a keybinding to open Claude directly
		{
			"<leader>ac",
			function()
				require("sidekick.cli").toggle({ name = "claude", focus = true })
			end,
			desc = "Sidekick Toggle Claude",
		},
	},
}

local Avantae = {
	"yetone/avante.nvim",
	build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		instructions_file = "avante.md",
		provider = "gemini-cli",
		providers = {
			gemini = {
				model = "gemini-2.0-pro",
			},
		},
		acp_providers = {
			["gemini-cli"] = {
				command = "gemini",
				args = { "--experimental-acp" },
				env = {
					NODE_NO_WARNINGS = "1",
					GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"nvim-mini/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		-- "ibhagwan/fzf-lua", -- for file_selector provider fzf
		-- "stevearc/dressing.nvim", -- for input provider dressing
		-- "folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}

local ToggleTerm = {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<c-\>]],
		direction = "float",
	},
}

local Rename = {
	"smjonas/inc-rename.nvim",
	enabled = true,
	config = function()
		require("inc_rename").setup({})
		vim.keymap.set("n", "<leader>ln", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end, { desc = "Lsp Rename (Inc Rename)", expr = true })
	end,
}

local Tmux = {
	"christoomey/vim-tmux-navigator",
	enabled = true,
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}

local Mini_ai = {
	"echasnovski/mini.ai",
	version = false,
	enabled = true,
	opts = {},
}

local AutoClose = {
	"windwp/nvim-autopairs",
	enabled = true,
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			map_bs = true,
			map_cr = true,
		})
	end,
}

local Undotree = {
	"mbbill/undotree",
	enabled = true,
	cmd = "UndotreeToggle",
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
	},
	init = function()
		vim.g.undotree_WindowLayout = 1
		vim.g.undotree_SplitWidth = 20
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
}

local Session = {
	"folke/persistence.nvim",
	enabled = true,
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	opts = {},
}

local Trouble = {
	"folke/trouble.nvim",
	enabled = true,
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=true<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
	opts = {
		focus = true,
		auto_preview = true,
	},
}

local LaTex = {
	"lervag/vimtex",
	enabled = true,
	ft = "tex",
	init = function()
		-- vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_view_method = "mupdf"
		-- vim.g.vimtex_view_method = "sioyek"
		-- vim.g.vimtex_view_forward_search_on_start = false
		vim.g.vimtex_compiler_latexmk = {
			aux_dir = ".tex/",
			out_dir = "",
		}
		-- vim.g.vimtex_view_general_viewer = "okular"
		-- vim.g.vimtex_view_general_options = "--unique file:@pdf\#src:@line@tex"
	end,
}

local Leap = {
	"ggandor/leap.nvim",
	enabled = true,
	keys = {
		{ "s", "<Plug>(leap)" },
		{ "S", "<Plug>(leap-from-window)" },
	},
	opts = {},
	config = function()
		local leap = require("leap")
		leap.opts.safe_labels = {}
		leap.opts.preview_filter = function()
			return false
		end
		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
	end,
}

local Dadbod = {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
	end,
}

return {
	-- Dadbod,
	-- Leap,
	-- Mini_ai,
	-- Avantae,
	AutoClose,
	Comment,
	Tmux,
	LaTex,
	Rename,
	Session,
	Sidekick,
	ToggleTerm,
	Undotree,
	Trouble,
}
