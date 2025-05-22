return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            icons_enabled = true,
            theme = "kanagawa",
            component_separators = "|",
            section_separators = "",
        },
        sections = {
            lualine_b = {
                function() return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") end,
                "branch",
                "diff",
                "diagnostics",
            },
        },
    },
}
