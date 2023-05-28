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
        },
        servers = require(... .. '.servers.generic'),
    }
}

_lspconfig.config = function(_, opts)
    local servers = opts.servers

    for server, server_opts in pairs(servers) do
        server_opts.capabilities = capabilities
        server_opts.on_attach = on_attach

        require('lspconfig')[server].setup(server_opts)
    end

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
    require(... .. '.servers.rust-tools')(capabilities, on_attach),
    require(... .. '.extra'),
}
