return {
    'ziontee113/syntax-tree-surfer',
    config = true,
    keys = {
        { 'vx', '<cmd>STSSelectMasterNode<cr>', mode = 'n', noremap = true },
        { 'vn', '<cmd>STSSelectCurrentNode<cr>', mode = 'n', noremap = true },
        { 'J', '<cmd>STSSelectNextSiblingNode<cr>', mode = 'x', noremap = true },
        { 'K', '<cmd>STSSelectPrevSiblingNode<cr>', mode = 'x', noremap = true },
        { 'H', '<cmd>STSSelectParentNode<cr>', mode = 'x', noremap = true },
        { 'L', '<cmd>STSSelectChildNode<cr>', mode = 'x', noremap = true },
        {
            'vU',
            function() vim.opt.opfunc = 'v:lua.STSSwapUpNormal_Dot' return 'g@l' end,
            mode = 'n',
            expr = true,
            desc = 'Swap master node up',
        },
        {
            'vD',
            function() vim.opt.opfunc = 'v:lua.STSSwapDownNormal_Dot' return 'g@l' end,
            mode = 'n',
            expr = true,
            desc = 'Swap master node down',
        },
        {
            'vu',
            function() vim.opt.opfunc = 'v:lua.STSSwapCurrentNodePrevNormal_Dot' return 'g@l' end,
            mode = 'n',
            expr = true,
            desc = 'Swap current node down',
        },
        {
            'vd',
            function() vim.opt.opfunc = 'v:lua.STSSwapCurrentNodeNextNormal_Dot' return 'g@l' end,
            mode = 'n',
            expr = true,
            desc = 'Swap current node down',
        },
    }
}
