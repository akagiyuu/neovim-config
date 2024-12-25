return {
    {
        'chrisgrieser/nvim-spider',
        keys = {
            { 'w',  function() require('spider').motion('w') end,  mode = { 'n', 'o', 'x' } },
            { 'e',  function() require('spider').motion('e') end,  mode = { 'n', 'o', 'x' } },
            { 'b',  function() require('spider').motion('b') end,  mode = { 'n', 'o', 'x' } },
            { 'ge', function() require('spider').motion('ge') end, mode = { 'n', 'o', 'x' } },
        }
    },
    {
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        config = true
    },
    {
        'folke/flash.nvim',
        opts = {},
        keys = {
            {
                's',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').jump {
                        search = {
                            mode = function(str)
                                return '\\<' .. str
                            end,
                        },
                    }
                end,
                desc = 'Flash',
            },
            {
                'S',
                -- mode = 'n',
                function() require('flash').treesitter() end,
                desc = 'Flash Treesitter',
            },
            {
                'r',
                mode = 'o',
                function() require('flash').remote() end,
                desc = 'Remote Flash',
            },
            {
                'R',
                mode = { 'o', 'x' },
                function() require('flash').treesitter_search() end,
                desc = 'Flash Treesitter Search',
            },
        },
    },
    {
        'dsully/treesitter-jump.nvim',
        keys = {
            { '%', function() require('treesitter-jump').jump() end },
        },
        opts = {},
    },
    {
        'Wansmer/sibling-swap.nvim',
        opts = {},
        keys = {
            { '<C-.>', nil },
            { '<C-,>', nil }
        },
    },
    {
        'chrisgrieser/nvim-various-textobjs',
        lazy = false,
        opts = {
            keymaps = {
                useDefaults = true
            }
        },
    },
}
