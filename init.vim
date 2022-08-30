" Sebastian, this is your neovim config for python, c++ and latex
" I kept it very minimal so you can extend it easily and I tried
" to explain every setting very detailed. Happy developing :)

" First we will make some basic settings.
" No Plugins yet

" Enables beautiful colors
set termguicolors 

" Enable linenumbers
" If you want relative linenumbers use 'set number relativenumber'
" Relative numbers are very usefull for navigaing vim. try '10j' in normal
" mode
set number

" Column for git signs and lsp stuff
set signcolumn=yes

" Set the default clipboard of neovim to your system clipboard
set clipboard=unnamedplus

" This enables undo across sessions. 
set undodir=~/.vim/undodir
set undofile

" Start scrolling if you are 10 lines before the end of the buffer
set scrolloff=10

" Splitting behavior
set splitright
set splitbelow

" Indentation settings
" filetype plugin indent on
set smartindent
set expandtab

" Define Leader Key as space
" This is one of the most importend keys.
" If you are in normal mode. You can use this key to
" make some kind of fast typed shortcut combo.
" Example: <leader>abc
" This is a defined shortcut but the keys are not pressed
" At the same time. It's like writing a word. 
let mapleader=" "

" Use Esc to get back to normal mode in terminal.
tnoremap <Esc> <C-\><C-n>

" Now lets do Plugins.
" The plugin manager needs to be installed seperatly instructions can
" be found on the official github: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Most important plugin. Enables fast file indexing and is important for
" language servers and colorschemes
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" For installing language server clients
" Plug 'kabouzeid/nvim-lspinstall' this was superseded by mason
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Language Server (LSP)
Plug 'neovim/nvim-lspconfig' " For easy configuration

" Additional Autocomplete
Plug 'hrsh7th/nvim-compe' 

" For creating awesome Snippets usefull snippets can be found here: https://github.com/honza/vim-snippets
Plug 'sirver/ultisnips'

" Git 
Plug 'tpope/vim-fugitive' " Enable commands inside vim
Plug 'mhinz/vim-signify' " See added modified and deleted lines to the left

" Misc
Plug 'nvim-lua/plenary.nvim' " Requiremend for a lot plugins don't know why :(
Plug 'nvim-telescope/telescope.nvim' " Powerfull exendable fuzzy finder

" File tree view
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Diffview
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

" Lualine
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
" Plug 'kyazdani42/nvim-web-devicons'

" indend-blankline
Plug 'lukas-reineke/indent-blankline.nvim'

" Your favourite colorscheme
Plug 'tanvirtin/monokai.nvim'

" root dir plugin
Plug 'airblade/vim-rooter'

call plug#end()

"Colorscheme
colorscheme monokai

" Now we configure our plugins this lua configs can also be made
" in seperate files, but for readability and simplicity i'll keep 
" them here for now.

" Mason config
lua << EOF
require'mason'.setup{}
require'mason-lspconfig'.setup{}
EOF

" Treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Language server configs
" I'll leave this as default you can change the settings
" with the documentation from here: https://github.com/neovim/nvim-lspconfig
" The language servers can be installed with :LspInstall <language>
" Example1: :LspInstall cpp
" Example2: :LspInstall python 
" Cool lsps are json, bash
" For each language a default lsp will be installed. The alternatives can be
" looked up in the repository above
lua << EOF
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.pyright.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'basic',
        autoSearchPaths = true,
        useLibraryCodeForTypes = true
      }
    }
  }
}
require'lspconfig'.clangd.setup{
  capabilities = capabilities
}
require'lspconfig'.texlab.setup{
  capabilities = capabilities
}
EOF


" Tree configuration
lua << EOF
require'nvim-tree'.setup{
sort_by = "case_sensitive",
  view = {
    side = "left",  
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
  folder = false,
  file = false
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
  folder = {
        arrow_closed = "",
        arrow_open = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
        }, 
      },
    },
  },
  filters = {
    dotfiles = false,
  },
}
EOF

" Lualine config
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF

" indent-blankline
lua << EOF
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" Autocomplete configureations:
lua << EOF
require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'always',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    resolve = true,

    source = {
        ultisnips = {kind = "  ", priority=3}, 
        nvim_lsp = {kind = "   (LSP)", priority=2},
        buffer = {kind = "   (Buffer)", priority=1},
        path = {kind = "   (Path)", priority=0},
        emoji = {kind = " ﲃ  (Emoji)", filetypes={"markdown", "text"}, priority=0},
    }
}

-- CTRL+Space to trigger autocomplete window
-- CTRL+e to exit autocomplete window
-- ENTER to confirm autocomplete
vim.cmd("inoremap <silent><expr> <C-Space> compe#complete()")
vim.cmd("inoremap <silent><expr> <C-e>     compe#close('<C-e>')")
vim.cmd("inoremap <silent><expr> <CR>      compe#confirm('<CR>')")
EOF

" Now we have everything set up, but we still haven't set some keymappings
" Let's do some:

" Navigation across files
" <leader>ff to find files 
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" <leader>fg to find all occuarences of a word
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" <leader>fb to navigate between buffers
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" <leader>fw to find occuarences of word under cursor
nnoremap <leader>fw <cmd>lua require('telescope.builtin').grep_string()<cr>


" Telescope Git
" <leader>ggs git status, files can be added with TAB
nnoremap <leader>ggs <cmd>lua require('telescope.builtin').git_status()<cr> 
" <leader>gsc git search commits open fuzzy finder over commits, see diff on
" ENTER over commit
nnoremap <leader>gsc <cmd>lua require('telescope.builtin').git_commits()<cr>
" <leader>ggb search git branches. switch to branch on ENTER
nnoremap <leader>ggb <cmd>lua require('telescope.builtin').git_branches()<cr> 
