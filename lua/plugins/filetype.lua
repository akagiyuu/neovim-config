return {
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
        config = function()
            require('peek').setup {}
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end
    },
    {
        'nvim-neorg/neorg',
        ft = 'norg',
        opts = {
            load = {
                ['core.defaults'] = {},
                ['core.completion'] = { config = { engine = 'nvim-cmp' } },
                ['core.concealer'] = {
                    config = {
                        icon_preset = 'diamond'
                    }
                },
                ['core.dirman'] = {
                    config = {
                        workspaces = {
                            notes = '~/Notes',
                        },
                        autochdir = true,    -- Automatically change the directory to the current workspace's root every time
                        index = 'main.norg', -- The name of the main (root) .norg file
                    }
                },
                ['core.export'] = {},
                ['core.summary'] = {},
                ['core.ui.calendar'] = {},
            }
        },
    },
    {
        'kaarmu/typst.vim',
        ft = 'typst',
    }
}
