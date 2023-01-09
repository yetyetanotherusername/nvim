require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {

		lua = { require("formatter.filetypes.lua").stylua },

		python = {
			require("formatter.filetypes.python").black,
			require("formatter.filetypes.python").isort,
		},

		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
	},
})
