return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
        require("lsp_lines").setup()
        -- disable inline diagnostics
        vim.diagnostic.config({ virtual_text = false, signs = false, underline = false })
    end,
}
