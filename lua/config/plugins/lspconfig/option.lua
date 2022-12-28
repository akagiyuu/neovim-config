local pid = vim.fn.getpid()

return {
    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = { neededFileStatus = { ['codestyle-check'] = 'Any' } },
                workspace = {
                    library = {
                        [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                        [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                        [vim.fn.stdpath('data') .. '/lazy/emmylua-nvim' ] = true,
                        -- ['/usr/share/awesome/lib'] = true
                    },
                    maxPreload = 100000,
                },
                hint = {
                    enable = true,
                },
                -- workspace = {
                --     library = vim.api.nvim_get_runtime_file('', true),
                --     maxPreload = 1000000,
                -- },
            },
        },
    },
    omnisharp = {
        cmd = {
            'omnisharp',
            '--languageserver',
            '--hostPID',
            tostring(pid),
            'RenameOptions:RenameOverloads=true',
            'RoslynExtensionsOptions:InlayHintsOptions:EnableForTypes=true',
            'RoslynExtensionsOptions:InlayHintsOptions:EnableForParameters=true',
            'RoslynExtensionsOptions:InlayHintsOptions:ForImplicitObjectCreation=true',
        },
        handlers = {
            ['textDocument/definition'] = function(err, result, ctx, config)
                require('omnisharp_extended').handler(err, result, ctx, config)
            end,
        },
        enable_editorconfig_support = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        sdk_include_prereleases = true,
    }
}
