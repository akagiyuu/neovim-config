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
        server_config.on_attach = on_attach

        lspconfig[lsp].setup(server_config)
    end

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
                    on_attach = on_attach,
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
                    on_attach = on_attach
                },
            }
        end
    }
}
