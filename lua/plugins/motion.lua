return {
    {
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        config = true
    },
    {
        'ggandor/leap.nvim',
        dependencies = {
            {
                'ggandor/flit.nvim',
                config = true,
            },
            {
                'ggandor/leap-spooky.nvim',
                config = true,
            }
        },
        event = 'VeryLazy',
        config = function() require('leap').add_default_mappings() end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = function()
            local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

            vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
            vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)
        end
    },
    {
        'David-Kunz/treesitter-unit',
        config = true,
        keys = {
            { 'iu', ':lua require"treesitter-unit".select()<CR>',          mode = 'x', desc = 'inside unit' },
            { 'au', ':lua require"treesitter-unit".select(true)<CR>',      mode = 'x', desc = 'outside unit' },
            { 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>',     mode = 'o', desc = 'inside unit' },
            { 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>', mode = 'o', desc = 'outside unit' },
        }
    },
    {
        'ziontee113/syntax-tree-surfer',
        config = true,
        keys = {
            { 'vx', '<cmd>STSSelectMasterNode<cr>',      mode = 'n', noremap = true },
            { 'vn', '<cmd>STSSelectCurrentNode<cr>',     mode = 'n', noremap = true },
            { 'J',  '<cmd>STSSelectNextSiblingNode<cr>', mode = 'x', noremap = true },
            { 'K',  '<cmd>STSSelectPrevSiblingNode<cr>', mode = 'x', noremap = true },
            { 'H',  '<cmd>STSSelectParentNode<cr>',      mode = 'x', noremap = true },
            { 'L',  '<cmd>STSSelectChildNode<cr>',       mode = 'x', noremap = true },
            {
                'vU',
                function()
                    vim.opt.opfunc = 'v:lua.STSSwapUpNormal_Dot'
                    return 'g@l'
                end,
                mode = 'n',
                expr = true,
                desc = 'Swap master node up',
            },
            {
                'vD',
                function()
                    vim.opt.opfunc = 'v:lua.STSSwapDownNormal_Dot'
                    return 'g@l'
                end,
                mode = 'n',
                expr = true,
                desc = 'Swap master node down',
            },
            {
                'vu',
                function()
                    vim.opt.opfunc = 'v:lua.STSSwapCurrentNodePrevNormal_Dot'
                    return 'g@l'
                end,
                mode = 'n',
                expr = true,
                desc = 'Swap current node down',
            },
            {
                'vd',
                function()
                    vim.opt.opfunc = 'v:lua.STSSwapCurrentNodeNextNormal_Dot'
                    return 'g@l'
                end,
                mode = 'n',
                expr = true,
                desc = 'Swap current node down',
            },
        }
    }
}
