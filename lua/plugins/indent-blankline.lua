return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = { char = "┊" },
        scope = {
            show_end = false,
            highlight = { "Function", "Label" },
            char = "▎",
        },
    },
}
