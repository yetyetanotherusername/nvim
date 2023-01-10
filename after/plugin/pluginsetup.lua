require('monokai').setup({})

require('nvim-autopairs').setup({})

local null_ls = require('null-ls')
null_ls.setup({
        sources = {
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.black
        }
})

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

