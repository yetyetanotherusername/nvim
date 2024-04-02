return {

    'rmagatti/auto-session',
    config = function()
        require('auto-session').setup({
            path_display = { "shorten" },
            previewer = true
        })
    end
}
