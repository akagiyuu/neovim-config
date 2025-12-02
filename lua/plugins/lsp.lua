local on_attach = function(client, bufnr)
    require('util.lsp').inlay_hint_attach(client, bufnr)

    vim.keymap.set({ 'n', 'v' }, '<leader>fm', require('util.lsp').format, {
        buffer = bufnr
    })
    vim.keymap.set('n', 'K', require('util.lsp').hover, {
        buffer = bufnr
    })
end

local servers = {
    clangd = {},
    basedpyright = {},
    cssls = {},
    cssmodules_ls = {},
    emmet_language_server = {
        filetypes = {
            'templ',
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
            -- 'rust'
        },
    },
    html = {},
    jsonls = {},
    zls = {},
    bashls = {},
    dockerls = {},
    svelte = {},
    vtsls = {},
    tinymist = {
        settings = {
            exportPdf = 'onType',
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
    dartls = {},
}

return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
            for server, server_opts in pairs(servers) do
                server_opts.capabilities = capabilities
                vim.lsp.config(server, server_opts)
                vim.lsp.enable(server)
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
        end

    },
    {
        'mrcjkb/rustaceanvim',
        ft = 'rust',
        init = function()
            vim.g.rustaceanvim = {
                tools = { inlay_hints = { auto = false }, },
                server = {
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
    { 'nanotee/sqls.nvim' },
    {
        'dmmulroy/ts-error-translator.nvim',
        ft = { 'typescript', 'typescriptreact' }
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
