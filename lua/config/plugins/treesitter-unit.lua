return {
    'David-Kunz/treesitter-unit',
    event = 'VeryLazy',
    config = function()
        require('treesitter-unit').setup {}
        vim.keymap.set('x', 'iu', ':lua require"treesitter-unit".select()<CR>', { noremap = true })
        vim.keymap.set('x', 'au', ':lua require"treesitter-unit".select(true)<CR>', { noremap = true })
        vim.keymap.set('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>', { noremap = true })
        vim.keymap.set('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>', { noremap = true })
    end,
}
