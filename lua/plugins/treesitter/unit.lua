local _treesitter_unit = {
    'David-Kunz/treesitter-unit',
    event = 'VeryLazy',
}

_treesitter_unit.config = function()
    require('treesitter-unit').setup {}
    vim.keymap.set('x', 'iu', ':lua require"treesitter-unit".select()<CR>', {
        noremap = true,
        desc = 'inside unit'
    })
    vim.keymap.set('x', 'au', ':lua require"treesitter-unit".select(true)<CR>', {
        noremap = true,
        desc = 'outside unit'
    })
    vim.keymap.set('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>', {
        noremap = true,
        desc = 'inside unit'
    })
    vim.keymap.set('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>', {
        noremap = true,
        desc = 'outside unit'
    })
end

return _treesitter_unit
