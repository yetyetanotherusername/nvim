vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = ".gitlab*",
    callback = function()
        vim.bo.filetype = "yaml.gitlab"
    end,
})
