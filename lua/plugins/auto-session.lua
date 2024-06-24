return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            path_display = { "shorten" },
            previewer = true,
            auto_session_supress_dirs = { "~/", "~/Downloads", "/" },
            session_lens = {},
            post_restore_cmds = {
                function()
                    if os.execute("git rev-parse --is-inside-work-tree") then
                        vim.cmd("0tab G | tabn")
                    end
                end,
            },
        })
        require("telescope").load_extension("session-lens")
    end,
}
