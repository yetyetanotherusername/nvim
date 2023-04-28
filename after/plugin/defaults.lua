-- general vim settings
vim.o.scrolloff = 10

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true

vim.o.relativenumber = true

vim.o.colorcolumn = "88"

vim.o.shiftwidth = 4

-- remaps
vim.keymap.set('n', '<leader>f', vim.cmd.Format, { desc = 'Format current file' })
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open file browser' })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = 'Open undotree' })
vim.keymap.set('n', "<leader>tn", vim.cmd.tabnew, { desc = "Open new tab" })
vim.keymap.set('n', "<leader>tc", vim.cmd.tabclose, { desc = "Close current tab" })

-- dap remaps
vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<F5>', require('dap').continue, { desc = 'DAP continue' })
vim.keymap.set('n', '<F10>', require('dap').step_over, { desc = 'DAP step over' })
vim.keymap.set('n', '<F11>', require('dap').step_into, { desc = 'DAP step into' })
vim.keymap.set('n', '<F12>', require('dap').step_into, { desc = 'DAP step out' })
