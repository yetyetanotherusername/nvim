require('nvim-autopairs').setup({})


local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.prettier,
    }
})

require('trouble').setup { icons = false }

require('neogen').setup { requires = "nvim_treesitter/nvim_treesitter" }

require("luasnip.loaders.from_vscode").lazy_load()

require("dapui").setup()
