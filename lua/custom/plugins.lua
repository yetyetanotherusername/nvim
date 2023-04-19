return function(use)
    -- use({ 'ofirgall/ofirkai.nvim' })
    use({ 'mbbill/undotree' })
    use({ "windwp/nvim-autopairs" })
    use({ 'jose-elias-alvarez/null-ls.nvim' })
    use({ "folke/trouble.nvim" })
    use({ "danymat/neogen" })
    use({ "hrsh7th/cmp-buffer" })
    -- use({ "p00f/clangd_extensions.nvim" })
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use({ "rafamadriz/friendly-snippets" })
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })
    use({ "rebelot/kanagawa.nvim" })
end
