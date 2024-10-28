-- general vim settings

vim.o.colorcolumn = "88"

-- remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file browser" })
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnew, { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose, { desc = "[C]lose current [t]ab" })
vim.keymap.set("n", "<leader>sc", require("telescope.builtin").commands, { desc = "[S]earch [C]ommands" })
vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, { desc = "[S]earch [s]ession" })

-- dap remaps
vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<F5>", require("dap").continue, { desc = "DAP continue" })
vim.keymap.set("n", "<F6>", require("dap").step_over, { desc = "DAP step over" })
vim.keymap.set("n", "<F7>", require("dap").step_into, { desc = "DAP step into" })
vim.keymap.set("n", "<F8>", require("dap").step_out, { desc = "DAP step out" })
vim.keymap.set("n", "<leader>du", require("dap").up, { desc = "DAP go one stackframe up" })
vim.keymap.set("n", "<leader>dd", require("dap").down, { desc = "DAP go one stackframe down" })

-- open .mdx files as markdown
vim.filetype.add({ extension = { mdx = "markdown" } })

-- lsp lines toggle lines on/off
vim.keymap.set("", "<leader>l", require("lsp_lines").toggle, { desc = "Toggle LSP lines" })
