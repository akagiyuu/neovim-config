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
}
