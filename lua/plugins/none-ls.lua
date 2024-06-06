return {
    'nvimtools/none-ls.nvim',
    dependencies = {
        "nvimtools/none-ls-extras.nvim"
    },
    config = function()
        local null_ls = require('null-ls')
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.biome,
                null_ls.builtins.formatting.cmake_format,
                null_ls.builtins.formatting.csharpier,
                null_ls.builtins.formatting.mdformat,
                null_ls.builtins.formatting.yamlfmt,
            }
        })
    end,
}
