return {
    'Wansmer/treesj',
    event = 'VeryLazy',
    config = function()
        require('treesj').setup { max_join_length = 300 }
    end,
}
