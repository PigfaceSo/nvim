local Cmp = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- "windwp/nvim-autopairs",
		"hrsh7th/cmp-nvim-lsp", -- LSP completenion
		"hrsh7th/cmp-buffer", -- text completenion
		"hrsh7th/cmp-path", -- path completenion
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"roobert/tailwindcss-colorizer-cmp.nvim", -- Tailwind
		"hrsh7th/cmp-cmdline", -- cmd completenion
		"L3MON4D3/LuaSnip", -- Snippet
		"saadparwaiz1/cmp_luasnip", -- Snippet completenion
		"rafamadriz/friendly-snippets", -- snippet from vscode
		"zbirenbaum/copilot-cmp", -- Copilot
	},
	enabled = true,
	event = "InsertEnter",
	config = function()
		local cmp = require("cmp")
		-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()

		require("copilot_cmp").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})

		require("tailwindcss-colorizer-cmp").setup({
			color_sqare_width = 2,
		})
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			completion = {
				completeopt = "menuone,noselect",
			},
			formatting = {
				format = require("tailwindcss-colorizer-cmp").formatter,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "buffer" },
				{ name = "path" },
				{ name = "orgmode" },
				{ name = "neorg" },
				{ name = "copilot", group_index = 2 },
			}),
		})
		-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}

local CmpMini = {
	"echasnovski/mini.completion",
	enabled = true,
	version = false,
	event = "BufEnter",
	opts = {
		delay = {
			completion = 100,
			info = 100,
			signature = 50,
		},
	},
	config = function(_, opts)
		require("mini.completion").setup(opts)
		local imap_expr = function(lhs, rhs)
			vim.keymap.set("i", lhs, rhs, { expr = true })
		end
		imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
		imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
		imap_expr("<Cr>", [[pumvisible() ? "\<C-y><Cr>" : "\<Cr>"]])
		-- When use Dressing.nvim plugin
		vim.cmd([[au FileType DressingInput lua vim.b.minicompletion_disable = true]])
	end,
}

local Coq = {
	"ms-jpq/coq_nvim",
	branch = "coq",
	dependencies = {
		{ "ms-jpq/coq.artifacts", branch = "artifacts" },
		-- { "ms-jpq/coq.thirdparty", branch = "3p" },
		"windwp/nvim-autopairs",
	},
	enabled = true,
	init = function()
		local remap = vim.api.nvim_set_keymap
		vim.g.coq_settings = {
			auto_start = "shut-up",
			clients = {
				tabnine = { enabled = false },
				tmux = { enabled = false },
			},
			display = {
				pum = {
					fast_close = false,
				},
			},
			keymap = {
				recommended = false,
				pre_select = false,
			},
		}

		-- require("coq_3p") {
		--   { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
		-- }

		remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
		remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
		remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
		remap(
			"i",
			"<CR>",
			[[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
			{ expr = true, silent = true }
		)
		remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
	end,
}

local Blink = {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" },

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = "default" },

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = { documentation = { auto_show = false } },

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}

return {
	Blink,
	-- Cmp,
	-- CmpMini,
	-- Coq,
}
