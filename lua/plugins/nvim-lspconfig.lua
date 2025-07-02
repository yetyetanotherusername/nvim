return { -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        { "mason-org/mason.nvim", opts = {} }, -- NOTE: Must be loaded before dependants
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        "saghen/blink.cmp",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(event)
                -- In this case, we create a function that lets us more easily define mappings specific
                -- for LSP related items. It sets the mode, buffer and description for us each time.
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                -- Find references for the word under your cursor.
                map("gr", require("snacks").picker.lsp_references, "[G]oto [R]eferences")

                -- Jump to the implementation of the word under your cursor.
                --  Useful when your language has ways of declaring types without an actual implementation.
                map("gI", require("snacks").picker.lsp_implementations, "[G]oto [I]mplementation")

                -- Jump to the definition of the word under your cursor.
                --  This is where a variable was first declared, or where a function is defined, etc.
                --  To jump back, press <C-t>.
                map("gd", require("snacks").picker.lsp_definitions, "[G]oto [D]efinition")

                -- WARN: This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header.
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                -- Fuzzy find all the symbols in your current document.
                --  Symbols are things like variables, functions, types, etc.
                map("<leader>ds", require("snacks").picker.lsp_symbols, "[D]ocument [S]ymbols")

                -- Fuzzy find all the symbols in your current workspace.
                --  Similar to document symbols, except searches over your entire project.
                map("<leader>ws", require("snacks").picker.lsp_workspace_symbols, "[W]orkspace [S]ymbols")

                -- Jump to the type of the word under your cursor.
                --  Useful when you're not sure what type a variable is and you want to see
                --  the definition of its *type*, not where it was *defined*.
                map("<leader>D", require("snacks").picker.lsp_type_definitions, "Type [D]efinition")

                -- Rename the variable under your cursor.
                --  Most Language Servers support renaming across files, etc.
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

                -- Execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your LSP for this to activate.
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                -- Opens a popup that displays documentation about the word under your cursor
                --  See `:help K` for why this keymap.
                map("K", vim.lsp.buf.hover, "Hover Documentation")
                -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if
                    client
                    and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
                then
                    local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                        end,
                    })
                end

                -- The following autocommand is used to enable inlay hints in your
                -- code, if the language server you are using supports them
                --
                -- This may be unwanted, since they displace some of your code
                if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                    map(
                        "<leader>th",
                        function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
                        "[T]oggle Inlay [H]ints"
                    )
                end
            end,
        })

        ---@class LspServersConfig
        ---@field mason table<string, vim.lsp.Config>
        ---@field others table<string, vim.lsp.Config>
        local servers = {
            mason = {
                --bash
                bashls = {},

                -- cpp
                clangd = {},
                cmakelang = {},
                codelldb = {},
                neocmake = { init_options = { lint = { enable = false } } },

                -- python
                debugpy = {},
                pyright = {},
                ruff = {},

                -- html
                html = {},

                -- json
                jsonls = {},

                -- lua
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
                stylua = {},

                -- markdown
                marksman = {},

                -- rust
                rust_analyzer = {},

                -- js, ts, asf
                prettierd = {},
                ts_ls = {},

                -- toml
                taplo = {},

                -- yaml
                gitlab_ci_ls = {},
                yamlls = {},

                -- zig
                zls = {},
            },

            others = {},
        }

        local ensure_installed = vim.tbl_keys(servers.mason or {})

        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        -- Either merge all additional server configs from the `servers.mason` and `servers.others` tables
        -- to the default language server configs as provided by nvim-lspconfig or
        -- define a custom server config that's unavailable on nvim-lspconfig.
        for server, config in pairs(vim.tbl_extend("keep", servers.mason, servers.others)) do
            if not vim.tbl_isempty(config) then
                vim.lsp.config(server, config)
            end
        end

        ---@type MasonLspconfigSettings
        ---@diagnostic disable-next-line: missing-fields
        require("mason-lspconfig").setup({
            ensure_installed = {},
            automatic_enable = true,
        })
    end,
}
