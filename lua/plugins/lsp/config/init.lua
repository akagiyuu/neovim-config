local _lspconfig = {
    'neovim/nvim-lspconfig',
    lazy = false,
}

local capabilities = require(... .. '.capabilities')
local on_attach = require(... .. '.on_attach')
local option = require(... .. '.option')

_lspconfig.config = function()
    local lspconfig = require('lspconfig')

    local servers = {
        'sumneko_lua',
        'clangd',
        -- 'denols',
        'omnisharp',
        -- 'texlab',
        'gopls',
        'pyright',
        'cssls',
        'cssmodules_ls',
        'emmet_ls',
        'html',
        'jsonls',
        -- 'bashls',
        -- 'vimls',
    }
    for _, lsp in ipairs(servers) do
        local server_config = option[lsp] and option[lsp] or {}
        server_config.capabilities = capabilities

        lspconfig[lsp].setup(server_config)
    end

    vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'Global lsp on attach',
        callback = function(args)
            if not (args.data and args.data.client_id) then
                return
            end

            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            on_attach(client, bufnr)
        end
    })
    require('lspconfig.ui.windows').default_options.border = 'single'
end

return {
    _lspconfig,
    {
        'simrat39/rust-tools.nvim',
        ft = 'rust',
        config = function()
            require('rust-tools').setup {
                tools = { inlay_hints = { auto = false }, },
                server = {
                    capabilities = capabilities,
                    settings = {
                        ['rust-analyzer'] = {
                            checkOnSave = {
                                command = 'clippy',
                            },
                            diagnostics = {
                                experimental = { enable = true }
                            }
                        }
                    }
                }
            }
        end
    },
    {
        'jose-elias-alvarez/typescript.nvim',
        ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
        config = function()
            require('typescript').setup {
                server = {
                    capabilities = capabilities,
                },
            }
        end
    }
}
