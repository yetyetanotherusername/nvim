-- require('monokai').setup({})
require('ofirkai').setup({})

require('nvim-autopairs').setup({})

local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.csharpier,
    -- null_ls.builtins.formatting.prettier,
  }
})

require('lualine').setup {
  options = {
    icons_enabled = false,
    -- theme = 'onedark',
    theme = require('ofirkai.statuslines.lualine').theme,
    component_separators = '|',
    section_separators = '',
  },
}

require('indent_blankline').setup {
  show_current_context = true,
  show_current_context_start = true,
  char = '┊',
  show_trailing_blankline_indent = false,

}

require('trouble').setup { icons = false }

require('neogen').setup { requires = "nvim_treesitter/nvim_treesitter" }

require("luasnip.loaders.from_vscode").lazy_load()
-- require('clangd_extensions').setup {}
