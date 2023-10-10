return {
    'JoosepAlviste/nvim-ts-context-commentstring',
    {
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
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false,
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
        },
        main = 'nvim-treesitter.configs'
    },
}
