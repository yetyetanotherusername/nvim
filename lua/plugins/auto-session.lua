return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            path_display = { "shorten" },
            auto_session_supress_dirs = { "~/", "~/Downloads", "/" },
            close_unsupported_windows = false,
            session_lens = {
                previewer = false,
            },
        })
        vim.keymap.set(
            "n",
            "<leader>ss",
            require("auto-session.session-lens").search_session,
            { desc = "[S]earch [s]ession" }
        )
    end,
}
