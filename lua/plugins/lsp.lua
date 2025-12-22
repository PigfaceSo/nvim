-- NOTE Mason code from folke/LazyVim : Add *ensure_installed* feature
local Mason = {
	"williamboman/mason.nvim",
	enabled = true,
	cmd = "Mason",
	opts_extend = { "ensure_installed" },
	opts = {
		ensure_installed = {
			"eslint_d",
			"prettier",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		local mr = require("mason-registry")
		mr:on("package:install:success", function()
			vim.defer_fn(function()
				-- trigger FileType event to possibly load this newly installed LSP server
				require("lazy.core.handler.event").trigger({
					event = "FileType",
					buf = vim.api.nvim_get_current_buf(),
				})
			end, 100)
		end)

		mr.refresh(function()
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end)
	end,
}

local LSP_Keybind = function()
	local map = vim.keymap.set
	local lsp_Buf = vim.lsp.buf
	local diagnostic = vim.diagnostic
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
		callback = function(event)
			map("n", "gd", function()
				lsp_Buf.definition()
			end, { desc = "Go to Definition (LSP)", buffer = event.buf })
			map("n", "K", function()
				lsp_Buf.hover()
			end, { desc = "Info Hover (LSP)", buffer = event.buf }) -- map("n", "<leader>ls", function() lsp_Buf.workspace_symbol() end, { desc = "Workspace Symbol (LSP)" , buffer = event.buf })
			map("n", "<leader>lf", function()
				diagnostic.open_float()
			end, { desc = "Open Float (LSP)", buffer = event.buf })
			map("n", "]d", function()
				diagnostic.goto_next()
			end, { desc = "Go Next (LSP)", buffer = event.buf })
			map("n", "[d", function()
				diagnostic.goto_prev()
			end, { desc = "Go Prev (LSP)", buffer = event.buf })
			map("n", "<leader>lc", function()
				lsp_Buf.code_action()
			end, { desc = "Action (LSP)", buffer = event.buf })
			-- map("n", "<leader>lr", function()
			-- 	lsp_Buf.references()
			-- end, { desc = "References (LSP)", buffer = event.buf })
			-- map("n", "<leader>ln", function()
			-- 	lsp_Buf.rename()
			-- end, { desc = "Rename (LSP)", buffer = event.buf })
		end,
	})
end

local handlers = {
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
			capabilities = require("blink.cmp").get_lsp_capabilities(),
			-- require("coq").lsp_ensure_capabilities(),
		})
	end,
	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
}

local Lsp = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim", -- Mason
		"williamboman/mason-lspconfig.nvim", -- Mason for lsp
		-- "saghen/blink.cmp",
		-- { "ms-jpq/coq_nvim", branch = "coq" }
	},
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local mason_lsp = require("mason-lspconfig")

		-- Setup Server
		mason_lsp.setup({
			ensure_installed = {
				"bashls",
				"clangd",
				"cssls",
				"eslint",
				"html",
				"lua_ls",
				"phpactor",
				"pyright",
				"tailwindcss",
				-- "ltex",
				-- "texlab",
				-- "ts_ls",
        "ruby_lsp",
			},
			handlers = handlers,
		})

		vim.diagnostic.enable = true
		vim.diagnostic.config({
			virtual_lines = false,
			virtual_text = true,
		})

		-- Keybind
		LSP_Keybind()
	end,
}

return {
	Mason,
	Lsp,
}
