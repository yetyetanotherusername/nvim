return { --   'ofirgall/ofirkai.nvim' ,
    {
        config = function()
            require("telescope").load_extension("undo")
            -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
    },
    'jose-elias-alvarez/null-ls.nvim',
    "folke/trouble.nvim",
    "danymat/neogen",
    "hrsh7th/cmp-buffer",
    --   "p00f/clangd_extensions.nvim" ,
    -- { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
    "rafamadriz/friendly-snippets",

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    "rebelot/kanagawa.nvim",
    "mfussenegger/nvim-dap-python",
    "github/copilot.vim",
    "mg979/vim-visual-multi",
}
