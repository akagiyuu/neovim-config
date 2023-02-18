local capabilities = require(... .. '.capabilities')
local on_attach = require(... .. '.on_attach')

local _lspconfig = {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
    },
    opts = {
        diagnostics = {
            virtual_lines = false,
            virtual_text = true,
            update_in_insert = true,
            signs = true,
            underline = true,
            severity_sort = true,
            float = {
                focused = false,
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
            },
            on_init_callback = function(...)
                require('util.lsp').code_lens_attach(...)
            end,
        },
        servers = {
            clangd = {},
            -- 'denols',
            gopls = {},
            pyright = {},
            cssls = {},
            cssmodules_ls = {},
            emmet_ls = {},
            html = {},
            jsonls = {},
            zls = {},
            -- 'bashls',
            -- 'vimls',
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { neededFileStatus = { ['codestyle-check'] = 'Any' } },
                        workspace = {
                            library = {
                                [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                                [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                                [vim.fn.stdpath('data') .. '/lazy/emmylua-nvim'] = true,
                                -- ['/usr/share/awesome/lib'] = true
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
        }
    }
}

_lspconfig.config = function(_, opts)
    local lspconfig = require('lspconfig')

    for name, config in pairs(opts.servers) do
        config.capabilities = capabilities

        lspconfig[name].setup(config)
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
    vim.diagnostic.config(opts.diagnostics)
    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ', other = '﫠' }

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
                                enable = true,
                                experimental = { enable = true }
                            }
                        }
                    }
                }
            }
        end
    },
    {
        'yioneko/nvim-vtsls',
        ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
        config = function()
            require('lspconfig.configs').vtsls = require('vtsls').lspconfig -- set default server config
            require('lspconfig').vtsls.setup {
                capabilities = capabilities,
            }
        end
    },

}
