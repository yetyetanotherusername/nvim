return {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
        { "<leader>ss", "<cmd>SessionSearch<CR>", desc = "[S]earch [s]ession" },
    },
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        path_display = { "shorten" },
        auto_session_supress_dirs = { "~/", "~/Downloads", "/" },
        close_unsupported_windows = false,
        session_lens = {
            previewer = false,
        },
        post_restore_cmds = { function() require("dap-python").setup(vim.fn.getcwd() .. "/.env/bin/python") end },
    },
}
