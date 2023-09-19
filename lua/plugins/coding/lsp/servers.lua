return {
    clangd = {},
    pyright = {},
    cssls = {},
    cssmodules_ls = {},
    emmet_ls = {},
    html = {},
    jsonls = {},
    zls = {},
    bashls = {},
    dockerls = {},
    sqlls = {},
    svelte = {},
    eslint = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { neededFileStatus = { ['codestyle-check'] = 'Any' } },
                workspace = {
                    library = {
                        [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                        [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                        [vim.fn.stdpath('data') .. '/lazy/emmylua-nvim'] = true,
                    },
                    maxPreload = 100000,
                },
                hint = {
                    enable = true,
                },
            },
        },
    },
    omnisharp = {
        cmd = {
            'omnisharp',
            '--languageserver',
            '--hostPID',
            tostring(vim.fn.getpid()),
            'RenameOptions:RenameOverloads=true',
            'RoslynExtensionsOptions:InlayHintsOptions:EnableForTypes=true',
            'RoslynExtensionsOptions:InlayHintsOptions:EnableForParameters=true',
            'RoslynExtensionsOptions:InlayHintsOptions:ForImplicitObjectCreation=true',
        },
        handlers = {
            ['textDocument/definition'] = function(...)
                return require('omnisharp_extended').handler(...)
            end,
        },
        enable_editorconfig_support = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        sdk_include_prereleases = true,
    },
    texlab = {
        settings = {
            texlab = {
                -- auxDirectory = "latex.out",
                build = {
                    -- executable = "latexmk",
                    -- -- Please set $pdf_mode in latexmkrc to enable PDF output.
                    -- args = { "-interaction=nonstopmode", "-synctex=1", "%f" },
                    onSave = true,
                },
                chktex = {
                    onEdit = false,
                    onOpenAndSave = true,
                },
                diagnosticsDelay = 100,
                formatterLineLength = 0,
            },
        },
    },
    gopls = {},
}
