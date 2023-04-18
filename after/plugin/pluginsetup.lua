-- require('monokai').setup({})

vim.cmd("colorscheme kanagawa")
require('nvim-autopairs').setup({})

local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.isort,
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

require("dapui").setup()
local dap = require('dap')
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/usr/bin/lldb-vscode',
    args = { "--port", "${port}" },
    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
