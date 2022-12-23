local M = {
    'neovim/nvim-lspconfig',
    lazy = false,
}
M.config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('config.plugins.lspconfig.capabilities')
    local on_attach = require('config.plugins.lspconfig.on_attach')
    local option = require('config.plugins.lspconfig.option')


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

    -- Borders for LspInfo window
    require('lspconfig.ui.windows').default_options.border = 'single'
end

return M
