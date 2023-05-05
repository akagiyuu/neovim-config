local capabilities = require(... .. '.capabilities')
local on_attach = require(... .. '.on_attach')

local _lspconfig = {
    'neovim/nvim-lspconfig',
    lazy = false,
    priority = 100,
    dependencies = {
        'mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    opts = {
        diagnostics = {
            virtual_text = true,
            update_in_insert = true,
            signs = true,
            underline = true,
            severity_sort = true,
            on_init_callback = function(...)
                require('util.lsp').code_lens_attach(...)
            end,
        },
        servers = require(... .. '.servers.generic'),
    }
}

_lspconfig.config = function(_, opts)
    local servers = opts.servers
    local function setup(server)
        local server_opts = servers[server]
        server_opts.capabilities = capabilities
        server_opts.on_attach = on_attach

        require('lspconfig')[server].setup(server_opts)
    end

    local have_mason, mlsp = pcall(require, 'mason-lspconfig')
    local all_mslp_servers = {}
    if have_mason then
        all_mslp_servers = vim.tbl_keys(require('mason-lspconfig.mappings.server').lspconfig_to_package)
    end

    local ensure_installed = {} ---@type string[]
    for server, server_opts in pairs(servers) do
        if server_opts then
            server_opts = server_opts == true and {} or server_opts
            -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
            if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
                setup(server)
            else
                ensure_installed[#ensure_installed + 1] = server
            end
        end
    end

    if have_mason then
        mlsp.setup { ensure_installed = ensure_installed }
        mlsp.setup_handlers { setup }
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
