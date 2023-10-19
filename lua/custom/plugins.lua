return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
    },
    'jose-elias-alvarez/null-ls.nvim',
    "folke/trouble.nvim",
    "danymat/neogen",
    "hrsh7th/cmp-buffer",
    "p00f/clangd_extensions.nvim",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "rafamadriz/friendly-snippets",
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    "mfussenegger/nvim-dap-python",
    "mg979/vim-visual-multi",
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({
    --             suggestion = { enabled = false },
    --             panel = { enabled = false },
    --         })
    --     end,
    -- },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     config = function()
    --         require("copilot_cmp").setup()
    --     end
    -- }
}
