local Dashboard = {}

Dashboard.header = require("core.ui.header_anime").e

Dashboard.footer = ""

Dashboard.plugin = {
    "echasnovski/mini.starter",
    enabled = true,
    version = false,
    event = "VimEnter",
    config = function()
        local starter = require("mini.starter")
        starter.setup({
            autoopen = true,
            evaluate_single = true,
            header = Dashboard.header,
            items = {
                { name = "Find File",       action = "Telescope find_files",                                        section = "Search" },
                { name = "Old File",        action = "Telescope oldfiles",                                          section = "Search" },
                { name = "Config",          action = "Telescope find_files " .. "cwd=" .. vim.fn.stdpath("config"), section = "Search" },
                { name = "Theme",           action = "Telescope colorscheme",                                       section = "Search" },
                { name = "Help",            action = "Telescope help_tags ",                                        section = "Search" },
                { name = "Restore Session", action = "lua require('persistence').load()",                           section = "Action" },
                { name = "Mason",           action = "Mason",                                                       section = "Action" },
                { name = "Lazy",            action = "Lazy",                                                        section = "Action" },
                { name = "Quit",            action = "qall",                                                        section = "Action" },
            },
            footer = Dashboard.footer,
        })
    end,
}

local Statusline = {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    event = "VimEnter",
    opts = {},
}

local Dressing = {
    "stevearc/dressing.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
        input = {
            mappings = {
                n = {
                    ["<Esc>"] = "Close",
                    ["q"] = "Close",
                    ["<CR>"] = "Confirm",
                },
                i = {
                    ["<C-c"] = "Close",
                    ["<C-q>"] = "Close",
                    ["<CR>"] = "Confirm",
                    ["<Up>"] = "HistoryPrev",
                    ["<Down>"] = "HistoryNext",
                },
            },
        },
        select = {
            backend = {},
            builtin = {
                mappings = {
                    ["<Esc>"] = "Close",
                    ["q"] = "Close",
                    ["l"] = "Confirm",
                },
            },
        },
    },
}

local Fidget = {
    "j-hui/fidget.nvim",
    enabled = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local fidget = require("fidget")
        fidget.setup({
            notification = {
                filter = vim.log.levels.TRACE,
                override_vim_notify = true,
                window = {
                    border = "rounded",
                    align = "top",
                    winblend = 0,
                    y_padding = 1,
                },
            },
            logger = {
                level = vim.log.levels.TRACE,
            },
        })
    end,
}

local MiniCursorWord = {
    "echasnovski/mini.cursorword",
    lazy = false,
    enabled = true,
    version = false,
    opts = {},
}

local WhichKey = {
    "folke/which-key.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {},
}


local Indent_Backline = {
    "lukas-reineke/indent-blankline.nvim",
    enabled = true,
    event = "VeryLazy",
    main = "ibl",
    config = function()
        local hooks = require "ibl.hooks"
        local highlight_indent = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        end)

        require("ibl").setup({
            indent = {
                char = "│",
                tab_char = "│",
                highlight = highlight_indent,
            },
            scope = {
                enabled = false,
            },
        })
    end
}

return {
    Dashboard.plugin,
    WhichKey,
    MiniCursorWord,
    -- Statusline,
    Dressing,
    -- Fidget,
    -- Indent_Backline,
}
