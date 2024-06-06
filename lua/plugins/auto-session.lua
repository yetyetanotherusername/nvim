return {
    'rmagatti/auto-session',
    config = function()
        require('auto-session').setup({
            path_display = { "shorten" },
            previewer = true,
            auto_session_supress_dirs = { "~/", "~/Downloads", "/" }
        })
    end
}
