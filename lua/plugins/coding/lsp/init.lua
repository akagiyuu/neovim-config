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
        on_attach = require(... .. '.on_attach'),
    }
}

_lspconfig.config = function(_, opts)
    for server, server_opts in pairs(opts.servers) do
        server_opts.capabilities = capabilities
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

    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            if not (args.data and args.data.client_id) then
                return
            end

            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            opts.on_attach(client, bufnr)
        end,
    })
    require('lspconfig.ui.windows').default_options.border = 'single'
end

return {
    _lspconfig,
    require(... .. '.servers.rust-tools')(capabilities, on_attach),
    require(... .. '.extra'),
}
