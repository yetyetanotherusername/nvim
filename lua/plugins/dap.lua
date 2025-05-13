return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mason-org/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            "mfussenegger/nvim-dap-python",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()

            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

            -- debug adapter configs

            -- c/cpp/rust
            dap.adapters.lldb = {
                type = "executable",
                command = "/usr/bin/lldb-dap",
                name = "lldb",
            }

            dap.configurations.cpp = {
                {
                    name = "launch_file",
                    type = "lldb",
                    request = "launch",
                    program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = { "-b" },
                },
                {
                    -- If you get an "Operation not permitted" error using this, try disabling YAMA:
                    --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                    name = "Attach to process",
                    type = "lldb", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
                    request = "attach",
                    pid = require("dap.utils").pick_process,
                    args = { "-b" },
                    program = function() return vim.fn.input("Path to binary: ", vim.fn.getcwd() .. "/", "file") end,
                    preRunCommands = {
                        "process handle -p true -s false -n true SIGPWR",
                        "process handle -p true -s false -n true SIGXCPU",
                    },
                },
            }
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp
            dap.configurations.zig = dap.configurations.cpp

            require("dap-python").setup(vim.fn.getcwd() .. "/.env/bin/python")
            require("dap-python").test_runner = "pytest"
            dap.configurations.python = {
                type = "python",
                request = "launch",
                name = "standard",
                program = "${file}",
            }

            -- dap remaps
            vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint, { desc = "Toggle breakpoint" })
            vim.keymap.set("n", "<F5>", require("dap").continue, { desc = "DAP continue" })
            vim.keymap.set("n", "<F6>", require("dap").step_over, { desc = "DAP step over" })
            vim.keymap.set("n", "<F7>", require("dap").step_into, { desc = "DAP step into" })
            vim.keymap.set("n", "<F8>", require("dap").step_out, { desc = "DAP step out" })
            vim.keymap.set("n", "<leader>du", require("dap").up, { desc = "DAP go one stackframe up" })
            vim.keymap.set("n", "<leader>dd", require("dap").down, { desc = "DAP go one stackframe down" })
        end,
    },
}
