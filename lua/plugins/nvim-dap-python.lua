return {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui", },
    config = function()
        require("dap-python").setup(vim.fn.getcwd() .. "/.env/bin/python")
        require("dap-python").test_runner = "pytest"
        table.insert(require('dap').configurations.python, {
            type = 'python',
            request = 'launch',
            name = 'standard',
            module = 'pytest'
        })
    end
}
