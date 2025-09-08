local Telescope = {}

Telescope.default = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Icons
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- FzF sorter
		-- "jvgrootveld/telescope-zoxide",                                 -- Zoxide
	},
	enabled = true,
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File (Telescope)" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers (Telescope)" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep (Telescope)" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help (Telescope)" },
		{ "<leader>ft", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme (Telescope)" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "OldFiles (Telescope)" },
		{
			"<leader>fc",
			function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end,
			desc = "Config",
		},
		{ "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks (Telescope)" },
		{ "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist (Telescope)" },
		{ "<leader>gg", "<cmd>Telescope git_files<cr>", desc = "Git Files (Telescope)" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits (Telescope)" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches (Telescope)" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status (Telescope)" },
		{ "<leader>ls", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Lsp Workspace Symbols (Telescope)" },
		{ "<leader>ld", "<cmd>Telescope diagnostics<cr>", desc = "Lsp Diagnostics (Telescope)" },
		{ "<leader>r", "<cmd>Telescope resume<cr>", desc = "Resume (Telescope)" },
	},
	config = function()
		local telescope = require("telescope")
		local telescope_actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "shorten" },
				mappings = {
					n = {
						["q"] = telescope_actions.close,
						["l"] = telescope_actions.select_default,
					},
					i = {
						["<C-q>"] = telescope_actions.close,
						["<C-j>"] = telescope_actions.move_selection_next,
						["<C-k>"] = telescope_actions.move_selection_previous,
					},
				},
			},
			pickers = {
				find_files = {
					prompt_prefix = "   ",
				},
				buffers = {
					theme = "dropdown",
					prompt_prefix = "   ",
				},
				help_tags = {
					theme = "dropdown",
					prompt_prefix = " 󰋖  ",
					previewer = false,
				},
				diagnostics = {
					prompt_prefix = "   ",
				},
				git_files = {
					prompt_prefix = "   ",
				},
				git_commits = {
					prompt_prefix = "   ",
				},
				git_branches = {
					prompt_prefix = "  ",
				},
				git_status = {
					prompt_prefix = "   ",
				},
			},
		})
		telescope.load_extension("fzf")
		-- telescope.load_extension("zoxide")
	end,
}

Telescope.file_explorer = {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	enabled = true,
	keys = {
		{
			"<leader>e",
			function()
				require("telescope").extensions.file_browser.file_browser({
					path = "%:p:h",
					select_buffer = true,
				})
			end,
			desc = "Explorer (Telescope)",
		},
	},
	config = function()
		local telescope = require("telescope")
		local fb_actions = telescope.extensions.file_browser.actions
		telescope.setup({
			extensions = {
				file_browser = {
					theme = "dropdown",
					prompt_prefix = "   ",
					hijack_netrw = true,
					respect_gitignore = true,
					no_ignore = true,
					hidden = false,
					grouped = true,
					hide_parent_dir = true,
					previewer = false,
					initial_mode = "insert",
					layout_config = {
						height = 20,
					},
					mappings = {
						["n"] = {
							["a"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["o"] = fb_actions.open,
							["."] = fb_actions.toggle_hidden,
						},
						["i"] = {
							["<C-h>"] = fb_actions.goto_parent_dir,
							["<C-o>"] = fb_actions.open,
							["<C-.>"] = fb_actions.toggle_hidden,
						},
					},
				},
			},
		})
		telescope.load_extension("file_browser")
	end,
}

return {
	Telescope.default,
	-- Telescope.file_explorer,
}
