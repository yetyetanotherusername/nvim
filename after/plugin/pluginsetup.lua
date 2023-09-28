-- require('monokai').setup({})

vim.cmd("colorscheme kanagawa")
require('nvim-autopairs').setup({})

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.prettier,
    }
})

require('lualine').setup {
    options = {
        icons_enabled = false,
        -- theme = 'onedark',
        -- theme = require('ofirkai.statuslines.lualine').theme,
        theme = "kanagawa",
        component_separators = '|',
        section_separators = '',
    },
}

require("ibl").setup {
    indent = { char = "┊" },
    scope = {
        show_end = false,
        highlight = { "Function", "Label" },
        char = "▎",
    }
}

require('trouble').setup { icons = false }

require('neogen').setup { requires = "nvim_treesitter/nvim_treesitter" }

require("luasnip.loaders.from_vscode").lazy_load()
-- require('clangd_extensions').setup {}

require("dapui").setup()
