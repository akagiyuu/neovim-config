return {
    {
        'xorid/asciitree.nvim',
        cmd = { 'AsciiTree', 'AsciiTreeUndo' }
    },
    {
        'krady21/compiler-explorer.nvim',
        cmd = 'CECompile'
    },
    {
        'samjwill/nvim-unception',
        event = 'VeryLazy',
    },
    {
        '0x100101/lab.nvim',
        build = 'cd js && npm ci',
        config = true
    },
    {
        'nacro90/numb.nvim',
        event = 'VeryLazy',
        config = true
    },
    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime'
    },
    {
        'narutoxy/silicon.lua',
        config = true
    },
    {
        'barrett-ruth/import-cost.nvim',
        build = 'sh install.sh yarn',
        event = 'VeryLazy',
        config = true
    },
    {
        'm-demare/hlargs.nvim',
        event = 'VeryLazy',
        config = { use_colorpalette = true }
    },
    {
        'cbochs/portal.nvim',
        keys = {
            { '<leader>o', function() require('portal').jump_backward() end, desc = 'Jump backward' },
            { '<leader>i', function() require('portal').jump_forward() end, desc = 'Jump forward' }
        },
        config = {
            portal = {
                title = {
                    options = {
                        style = 'minimal',
                        border = 'rounded',
                    },
                },

                body = {
                    options = {
                        border = 'rounded',
                    },
                },
            },
        }
    },
    {
        'cshuaimin/ssr.nvim',
        keys = {
            {
                '<leader>sr',
                function() require('ssr').open() end,
                { 'n', 'x' },
                desc = 'Structure search and replace',
            },
        },
        config = {
            min_width = 50,
            min_height = 5,
            keymaps = {
                close = 'q',
                next_match = 'n',
                prev_match = 'N',
                replace_all = '<leader><cr>',
            },
        }
    },
    {
        'akinsho/toggleterm.nvim',
        keys = { { '<C-\\>', '<cmd>ToggleTerm<CR>', 'Toggle terminal' } },
        config = true
    },
}
