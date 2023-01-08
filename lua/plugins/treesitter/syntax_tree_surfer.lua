local _syntax_tree_surfer = {
    'ziontee113/syntax-tree-surfer',
    event = 'VeryLazy',
}

_syntax_tree_surfer.config = function()
    require('syntax-tree-surfer').setup {}
    vim.keymap.set('n', 'vU', function()
        vim.opt.opfunc = 'v:lua.STSSwapUpNormal_Dot'
        return 'g@l'
    end, { desc = 'Swap master node up', expr = true })

    vim.keymap.set('n', 'vD', function()
        vim.opt.opfunc = 'v:lua.STSSwapDownNormal_Dot'
        return 'g@l'
    end, { desc = 'Swap master node down', expr = true })

    vim.keymap.set('n', 'vu', function()
        vim.opt.opfunc = 'v:lua.STSSwapCurrentNodePrevNormal_Dot'
        return 'g@l'
    end, { desc = 'Swap current node down', expr = true })

    vim.keymap.set('n', 'vd', function()
        vim.opt.opfunc = 'v:lua.STSSwapCurrentNodeNextNormal_Dot'
        return 'g@l'
    end, { desc = 'Swap current node down', expr = true })

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', 'vx', '<cmd>STSSelectMasterNode<cr>', opts)
    vim.keymap.set('n', 'vn', '<cmd>STSSelectCurrentNode<cr>', opts)
    vim.keymap.set('x', 'J', '<cmd>STSSelectNextSiblingNode<cr>', opts)
    vim.keymap.set('x', 'K', '<cmd>STSSelectPrevSiblingNode<cr>', opts)
    vim.keymap.set('x', 'H', '<cmd>STSSelectParentNode<cr>', opts)
    vim.keymap.set('x', 'L', '<cmd>STSSelectChildNode<cr>', opts)
end

return _syntax_tree_surfer
