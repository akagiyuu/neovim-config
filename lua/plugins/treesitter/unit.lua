return {
    'David-Kunz/treesitter-unit',
    config = true,
    keys = {
        { 'iu', ':lua require"treesitter-unit".select()<CR>', mode = 'x', desc = 'inside unit' },
        { 'au', ':lua require"treesitter-unit".select(true)<CR>', mode = 'x', desc = 'outside unit' },
        { 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>', mode = 'o', desc = 'inside unit' },
        { 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>', mode = 'o', desc = 'outside unit' },
    }
}
