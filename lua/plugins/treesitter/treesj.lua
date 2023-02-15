return {
    'Wansmer/treesj',
    keys = {
        {
            '<space>m',
            function() require('treesj').toggle() end,
            desc = 'Split or Join code block with autodetect',
        },
    },
    opts = {
        use_default_keymaps = true,
        max_join_length = 300,
    }
}
