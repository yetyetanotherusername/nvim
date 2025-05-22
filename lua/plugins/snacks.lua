return { -- Fuzzy Finder (files, lsp, etc)
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
        -- Useful for getting pretty icons, but requires a Nerd Font.
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    ---@type snacks.Config
    opts = {
        ---@class snacks.picker.Config
        picker = {
            sources = { files = { ignored = false, hidden = true } },
            matcher = { frecency = true },
            filter = { cwd = true },
        },

        ---@class snacks.indent.Config
        indent = {
            indent = {
                enabled = true,
                char = "┊",
            },
            ---@class snacks.indent.animate: snacks.animate.Config
            animate = {
                enabled = false,
            },
            ---@class snacks.indent.Scope.Config: snacks.scope.Config
            scope = {
                underline = true,
                char = "▎",
                hl = {
                    "SnacksIndent1",
                    "SnacksIndent2",
                    "SnacksIndent3",
                    "SnacksIndent4",
                    "SnacksIndent5",
                    "SnacksIndent6",
                    "SnacksIndent7",
                    "SnacksIndent8",
                },
            },
        },
        ---@class snacks.notifier.Config
        notifier = {},
    },
    keys = {
        -- picker key configs
        { "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[S]earch [K]eymaps" },
        { "<leader>sf", function() Snacks.picker.smart() end, desc = "[S]earch [F]iles" },
        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "[S]earch [J]umps" },
        { "<leader>sp", function() Snacks.picker.lsp_symbols() end, desc = "[S]earch LS[P] symbols" },
        -- { "<leader>ss", function() Snacks.picker.pickers() end, desc = "[S]earch [S]elect Snacks" },
        {
            "<leader>sw",
            function() Snacks.picker.grep_word() end,
            desc = "[S]earch current [W]ord",
            mode = { "n", "x" },
        },
        { "<leader>sg", function() Snacks.picker.grep() end, desc = "[S]earch by [G]rep" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "[S]earch [D]iagnostics" },
        { "<leader>sr", function() Snacks.picker.resume() end, desc = "[S]earch [R]esume" },
        { "<leader>s.", function() Snacks.picker.recent() end, desc = '[S]earch Recent Files ("." for repeat)' },
        { "<leader><leader>", function() Snacks.picker.buffers() end, desc = "[ ] Find existing buffers" },
        { "<leader>/", function() Snacks.picker.lines({}) end, desc = "[/] Fuzzily search in current buffer" },
        { "<leader>s/", function() Snacks.picker.grep_buffers() end, desc = "[S]earch [/] in Open Files" },
        {
            "<leader>sn",
            function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
            desc = "[S]earch [N]eovim files",
        },
        { "<leader>sl", function() Snacks.picker.git_log() end, desc = "[S]earch git [l]og" },
    },
}
