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
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set('n', "<leader>tn", vim.cmd.tabnew, { desc = "Open new tab" })
vim.keymap.set('n', "<leader>tc", vim.cmd.tabclose, { desc = "Close current tab" })
vim.keymap.set('n', "<leader>sc", require('telescope.builtin').commands, { desc = "[S]earch [C]ommands" })

-- dap remaps
vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<F5>', require('dap').continue, { desc = 'DAP continue' })
vim.keymap.set('n', '<F6>', require('dap').step_over, { desc = 'DAP step over' })
vim.keymap.set('n', '<F7>', require('dap').step_into, { desc = 'DAP step into' })
vim.keymap.set('n', '<F8>', require('dap').step_out, { desc = 'DAP step out' })
vim.keymap.set('n', '<leader>du', require('dap').up, { desc = 'DAP go one stackframe up' })
vim.keymap.set('n', '<leader>dd', require('dap').down, { desc = 'DAP go one stackframe down' })

-- open fugitive status in first tab
if os.execute('git rev-parse --is-inside-work-tree') then
    vim.cmd("-tab G | tabn")
end

-- open .mdx files as markdown
vim.filetype.add({ extension = { mdx = "markdown" } })
