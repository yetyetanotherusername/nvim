return {
    "mbbill/undotree",
    init = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        vim.cmd("let g:undotree_SetFocusWhenToggle = 1")
    end
}
