local dap, dapui = require("dap"), require("dapui")

-- auto open/close dap ui
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- debug adapter configs

-- c/cpp/rust
dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb"
}
dap.configurations.cpp = {
    {
        name = "launch_file",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = { "-b" }
    },
    {
        -- If you get an "Operation not permitted" error using this, try disabling YAMA:
        --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        name = "Attach to process",
        type = 'lldb', -- Adjust this to match your adapter name (`dap.adapters.<name>`)
        request = 'attach',
        pid = require('dap.utils').pick_process,
        args = {},
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- python
require("dap-python").setup(vim.fn.getcwd() .. "/.env/bin/python")
require("dap-python").test_runner = "pytest"
table.insert(require('dap').configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'standard',
    module = 'pytest'
})
