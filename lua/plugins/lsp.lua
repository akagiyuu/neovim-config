local on_attach = function(client, bufnr)
    local lsp_util = require('util.lsp');
    -- lsp_util.code_lens_attach(client, bufnr)
    require('util.lsp').inlay_hint_attach(client, bufnr)

    vim.keymap.set('n', '<leader>lf', '<cmd>Lspsaga finder<CR>', {
        buffer = bufnr
    })
    vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga show_line_diagnostics<CR>', {
        buffer = bufnr
    })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {
        buffer = bufnr
    })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
        buffer = bufnr
    })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {
        buffer = bufnr
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>fm', require('util.lsp').format, {
        buffer = bufnr
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', {
        buffer = bufnr
    })
    vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', {
        buffer = bufnr
    })
    vim.keymap.set('n', 'K', require('util.lsp').hover, {
        buffer = bufnr
    })
    vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', {
        buffer = bufnr
    })
    vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', {
        buffer = bufnr
    })
    if client.name == 'eslint' then
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
        })
    end
end

local capabilities = {
    offsetEncoding = { 'utf-16' },
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        },

        completion = {
            dynamicRegistration = false,
            completionItem = {
                snippetSupport = true,
                commitCharactersSupport = true,
                deprecatedSupport = true,
                preselectSupport = true,
                tagSupport = {
                    valueSet = {
                        1, -- Deprecated
                    }
                },
                insertReplaceSupport = true,
                resolveSupport = {
                    properties = {
                        'documentation',
                        'detail',
                        'additionalTextEdits',
                    },
                },
                insertTextModeSupport = {
                    valueSet = {
                        1, -- asIs
                        2, -- adjustIndentation
                    }
                },
                labelDetailsSupport = true,
            },
            contextSupport = true,
            insertTextMode = 1,
            completionList = {
                itemDefaults = {
                    'commitCharacters',
                    'editRange',
                    'insertTextFormat',
                    'insertTextMode',
                    'data',
                }
            }
        },
    },
}

local servers = {
    clangd = {},
    basedpyright = {},
    cssls = {},
    cssmodules_ls = {},
    emmet_language_server = {
        filetypes = {
            'css',
            'eruby',
            'html',
            'javascript',
            'javascriptreact',
            'less',
            'sass',
            'scss',
            'svelte',
            'pug',
            'typescriptreact',
            'vue',
            'rust'
        },
    },
    html = {},
    jsonls = {},
    zls = {},
    bashls = {},
    dockerls = {},
    svelte = {},
    eslint = {},
    prismals = {},
    vtsls = {},
    typst_lsp = {
        settings = {
            exportPdf = 'onSave' -- Choose onType, onSave or never.
        }
    },
    templ = {},
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
    -- omnisharp = {
    --     cmd = {
    --         'omnisharp',
    --         '--languageserver',
    --         '--hostPID',
    --         tostring(vim.fn.getpid()),
    --         'RenameOptions:RenameOverloads=true',
    --         'RoslynExtensionsOptions:InlayHintsOptions:EnableForTypes=true',
    --         'RoslynExtensionsOptions:InlayHintsOptions:EnableForParameters=true',
    --         'RoslynExtensionsOptions:InlayHintsOptions:ForImplicitObjectCreation=true',
    --     },
    --     handlers = {
    --         ['textDocument/definition'] = function(...)
    --             return require('omnisharp_extended').handler(...)
    --         end,
    --     },
    --     enable_editorconfig_support = true,
    --     enable_roslyn_analyzers = true,
    --     organize_imports_on_format = true,
    --     enable_import_completion = true,
    --     sdk_include_prereleases = true,
    -- },
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
    ocamllsp = {},
}

return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function(_, opts)
            for server, server_opts in pairs(servers) do
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

            require('lspconfig.ui.windows').default_options.border = 'rounded'
        end

    },

    {
        'mrcjkb/rustaceanvim',
        ft = 'rust',
        init = function()
            vim.g.rustaceanvim = {
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
        end
    },
    { 'mfussenegger/nvim-jdtls' }
    -- {
    --     'pmizio/typescript-tools.nvim',
    --     lazy = false,
    --     opts = {
    --         on_attach = on_attach,
    --         settings = {
    --             -- tsserver_file_preferences = {
    --             --     includeInlayParameterNameHints = 'all',
    --             --     includeInlayEnumMemberValueHints = true,
    --             --     includeInlayFunctionLikeReturnTypeHints = true,
    --             --     includeInlayFunctionParameterTypeHints = true,
    --             --     includeInlayPropertyDeclarationTypeHints = true,
    --             --     includeInlayVariableTypeHints = true
    --             -- },
    --         }
    --     }
    -- },
}
