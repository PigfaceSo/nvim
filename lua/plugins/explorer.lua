local NeoTree = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	enabled = true,
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>" },
	},
	opts = {
		close_if_last_window = true,
		window = {
			width = 30,
			mappings = {
				["q"] = "close_window",
				["l"] = "open",
				["<C-s>"] = "open_split",
				["<C-v>"] = "open_vsplit",
				["<C-t>"] = "open_tabnew",
				["h"] = "close_node",
				["H"] = "close_all_nodes",
				["a"] = {
					"add",
					config = {
						show_path = "none",
					},
				},
				["A"] = "add_directory",
				["d"] = "delete",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["r"] = "rename",
				["c"] = "copy",
				["P"] = {
					"toggle_preview",
					config = {
						use_float = true,
						use_image_nvim = true,
					},
				},
				["R"] = "refresh",
				["?"] = "show_help",
			},
		},
		filesystem = {
			window = {
				mappings = {
					["."] = "toggle_hidden",
				},
			},
		},
	},
}

local Oil = {
	"stevearc/oil.nvim",
	enabled = true,
	cmd = "Oil",
	keys = {
		-- { "<leader>e", "<cmd>Oil --float<cr>", desc = "Open parent directory (Float)" },
		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
	},
	config = function()
		require("oil").setup({
			float = {
				padding = 2,
				max_width = 150,
				max_height = 25,
				preview_split = "right",
			},
			use_default_keymaps = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["L"] = "actions.select",
				["-"] = "actions.parent",
				["H"] = "actions.parent",
				["<C-v>"] = {
					"actions.select",
					opts = { vertical = true },
					desc = "Open the entry in a vertical split",
				},
				["<C-s>"] = {
					"actions.select",
					opts = { horizontal = true },
					desc = "Open the entry in a horizontal split",
				},
				["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["q"] = "actions.close",
				["R"] = "actions.refresh",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
		})
	end,
}

local Minifiles = {
	"echasnovski/mini.files",
	version = false,
	enabled = true,
	event = "BufEnter",
	keys = {
		{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "File Explorer (Mini.Files)" },
	},
	opts = {
		windows = {
			preview = false,
		},
	},
}

local Nnn = {
	"luukvbaal/nnn.nvim",
	enabled = true,
	keys = {
		{ "<leader>e", "<cmd>NnnExplorer<cr>", desc = "NnnExplorer" },
	},
	config = function()
		require("nnn").setup({})
	end,
}

local Yazi = {
	"mikavilpas/yazi.nvim",
	version = "*", -- use the latest stable version
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>e",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	---@type YaziConfig | {}
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = false,
		keymaps = {
			show_help = "<f1>",
		},
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		-- mark netrw as loaded so it's not loaded at all.
		--
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		vim.g.loaded_netrwPlugin = 1
	end,
}

return {
	-- Nnn,
	-- NeoTree,
	-- Oil,
	-- Minifiles,
	Yazi,
}
