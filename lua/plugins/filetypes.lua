local _neorg = {
    'nvim-neorg/neorg',
    ft = 'norg',
}

_neorg.config = function()
    vim.opt.conceallevel = 2

    require('neorg').setup {
        load = {
            ['core.defaults'] = {},
            ['core.norg.completion'] = { config = { engine = 'nvim-cmp' } },
            ['core.norg.concealer'] = {
                config = {
                    dim_code_blocks = {
                        enabled = true,
                        content_only = true,
                        adaptive = true,
                    },
                    icon_preset = 'diamond'
                }
            },
            ['core.norg.dirman'] = {
                config = {
                    workspaces = {
                        notes = '~/Idea',
                    },
                    autochdir = true, -- Automatically change the directory to the current workspace's root every time
                    index = 'main.norg', -- The name of the main (root) .norg file
                }
            },
            ['core.presenter'] = { config = { zen_mode = 'truezen' } }
        }
    }
end

return {
    {
        'simrat39/rust-tools.nvim',
        ft = 'rust',
        config = function()
            require('rust-tools').setup {
                tools = { inlay_hints = { auto = false }, },
                server = { on_attach = require('plugins.lspconfig.on_attach') }
            }
        end
    },
    {
        'jose-elias-alvarez/typescript.nvim',
        ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
        config = function()
            require('typescript').setup {
                server = {
                    capabilities = require('plugins.lspconfig.capabilities'),
                    on_attach = require('plugins.lspconfig.on_attach')
                },
            }
        end
    },
    {
        'kevinhwang91/nvim-bqf',
        event = 'VeryLazy',
    },
    'Hoffs/omnisharp-extended-lsp.nvim',
    {
        'AckslD/nvim-FeMaco.lua',
        ft = 'markdown',
        config = true
    },
    {
        'toppair/peek.nvim',
        ft = 'markdown',
        build = 'deno task --quiet build:fast',
        config = true
    },
    _neorg
}
