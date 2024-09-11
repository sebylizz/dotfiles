return {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'mfussenegger/nvim-jdtls'
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        require('mason').setup({})

        require('mason-lspconfig').setup({
            -- Replace the language servers listed here 
            -- with the ones you want to install
            ensure_installed = {'jdtls', 'ts_ls', 'lua_ls', 'html', 'cssls', 'clangd', 'bashls'},
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
                lua_ls = function()
                    require('lspconfig')['lua_ls'].setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = {'vim'}
                                }
                            }
                        }
                    })
                end,
                ts_ls = function()
                    require('lspconfig')['ts_ls'].setup({
                        handlers = {
                            ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
                                if result and result.diagnostics then
                                    local idx = 1
                                    while idx <= #result.diagnostics do
                                        if result.diagnostics[idx].code == 80001 then
                                            table.remove(result.diagnostics, idx)
                                        else
                                            idx = idx + 1
                                        end
                                    end
                                end
                                vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
                            end,
                        },
                    })
                end,
            }
        })

    end
}

