-- general vim settings
vim.o.scrolloff = 10

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true

vim.o.relativenumber = true

vim.o.colorcolumn = "80"

-- remaps
vim.keymap.set('n', '<leader>f', vim.cmd.Format)
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set('i', 'öö', '<Esc>')
vim.keymap.set('v', 'öö', '<Esc>')
