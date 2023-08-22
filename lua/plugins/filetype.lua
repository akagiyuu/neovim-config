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
                        autochdir = true,    -- Automatically change the directory to the current workspace's root every time
                        index = 'main.norg', -- The name of the main (root) .norg file
                    }
                },
                ['core.presenter'] = { config = { zen_mode = 'truezen' } }
            }
        },
    }
}
