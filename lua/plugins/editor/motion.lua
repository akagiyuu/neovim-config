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
        'ziontee113/syntax-tree-surfer',
        config = true,
        keys = {
            { 'vx',    '<cmd>STSSelectMasterNode<cr>',      mode = 'n', noremap = true },
            { 'vn',    '<cmd>STSSelectCurrentNode<cr>',     mode = 'n', noremap = true },
            { 'J',     '<cmd>STSSelectNextSiblingNode<cr>', mode = 'x', noremap = true },
            { 'K',     '<cmd>STSSelectPrevSiblingNode<cr>', mode = 'x', noremap = true },
            { 'H',     '<cmd>STSSelectParentNode<cr>',      mode = 'x', noremap = true },
            { 'L',     '<cmd>STSSelectChildNode<cr>',       mode = 'x', noremap = true },
            { '<A-j>', '<cmd>STSSwapNextVisual<cr>',        mode = 'x', noremap = true },
            { '<A-k>', '<cmd>STSSwapPrevVisual<cr>',        mode = 'x', noremap = true },
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
            {
                'gb',
                function()
                    require('flash').jump {
                        matcher = function(win)
                            ---@param diag Diagnostic
                            return vim.tbl_map(function(diag)
                                return {
                                    pos = { diag.lnum + 1, diag.col },
                                    end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
                                }
                            end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
                        end,
                        action = function(match, state)
                            vim.api.nvim_win_call(match.win, function()
                                vim.api.nvim_win_set_cursor(match.win, match.pos)
                                vim.diagnostic.open_float()
                            end)
                            state:restore()
                        end,
                    }
                end,
                desc = 'Goto diagnostic'
            }
        },
    }
}
