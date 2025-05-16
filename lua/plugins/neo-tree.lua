return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        { "miversen33/netman.nvim", opts = {} },
    },
    lazy = false,
    keys = {
        { "<leader>pv", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
    },
    opts = {
        filesystem = {
            window = {
                position = "float",
            },
        },
        sources = {
            "filesystem",
            "netman.ui.neo-tree",
        },
    },
}
