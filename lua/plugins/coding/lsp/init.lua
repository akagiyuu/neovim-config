local capabilities = require(... .. '.capabilities')
local on_attach = require(... .. '.on_attach')
local _lspconfig = {
    'neovim/nvim-lspconfig',
    lazy = false,
    opts = {
        diagnostics = {
            virtual_text = true,
            update_in_insert = true,
            signs = true,
            underline = true,
            severity_sort = true,
            float = { border = 'rounded' }
        },
        servers = require(... .. '.servers'),
    }
}

_lspconfig.config = function(_, opts)
    for server, server_opts in pairs(opts.servers) do
        server_opts.capabilities = capabilities
        require('lspconfig')[server].setup(server_opts)
    end

    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            if not (args.data and args.data.client_id) then
                return
            end

            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, bufnr)
        end,
    })


    vim.diagnostic.config(opts.diagnostics)
    local signs = {
        Error = ' ',
        Warn = ' ',
        Hint = ' ',
        Info = ' ',
        other = ' ',
    }

    for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    require('lspconfig.ui.windows').default_options.border = 'single'
end

return {
    _lspconfig,
    {
        'simrat39/rust-tools.nvim',
        ft = 'rust',
        opts = {
            tools = { inlay_hints = { auto = false }, },
            server = {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    ['rust-analyzer'] = {
                        checkOnSave = {
                            command = 'clippy',
                        },
                        diagnostics = {
                            enable = true,
                            experimental = { enable = true }
                        }
                    }
                }
            }
        }
    },
    {
        'pmizio/typescript-tools.nvim',
        lazy = false,
        opts = {
            on_attach = on_attach,
            settings = {
                tsserver_file_preferences = {
                    includeInlayParameterNameHints = 'all',
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true
                },
            }
        }
    },
    require(... .. '.extra'),
}
