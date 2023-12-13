return {
    'nvimtools/none-ls.nvim',
    config = function()
        local null_ls = require('null-ls')
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.ruff,
                null_ls.builtins.formatting.csharpier,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.cmake
            }
        })
    end,
}
