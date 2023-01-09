return function(use)
  use(
    { 'mbbill/undotree' },
    { 'tanvirtin/monokai.nvim' },
    { "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup({})
      end
    }
  )
end

--use 'mhartington/formatter.nvim'
