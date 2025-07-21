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
        require("inc_rename").setup {}
        vim.keymap.set("n", "<leader>rn", function()
            return ":IncRename " .. vim.fn.expand("<cword>")
        end, { expr = true })
    end,
}

local Mini_ai = {
    "echasnovski/mini.ai",
    version = false,
    enabled = true,
    opts = {}
}

local AutoClose = {
    "windwp/nvim-autopairs",
    enabled = true,
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
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
        { "<leader>t", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    },
    opts = {
        focus = true,
        auto_preview = true,
    },
}

local LaTex = {
    "lervag/vimtex",
    enabled = true,
    -- lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    ft = "tex",
    init = function()
        -- VimTeX configuration goes here, e.g.
        -- vim.g.vimtex_view_method = "zathura"
        -- vim.g.vimtex_view_method = "mupdf"
        vim.g.vimtex_view_method = "sioyek"
        vim.g.vimtex_view_forward_search_on_start = false
        vim.g.vimtex_compiler_latexmk = {
            aux_dir = ".tex/",
            out_dir = ""
        }
        -- vim.g.vimtex_view_general_viewer = "okular"
        -- vim.g.vimtex_view_general_options = "--unique file:@pdf\#src:@line@tex"
    end
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

return {
    Comment,
    AutoClose,
    Rename,
    ToggleTerm,
    LaTex,
    -- Mini_ai,
    Undotree,
    Session,
    -- Leap,
}
