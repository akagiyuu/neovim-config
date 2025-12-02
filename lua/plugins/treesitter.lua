return {
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        init = function()
            vim.g.skip_ts_context_commentstring_module = true
        end
    },
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
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            indent = { enable = true },
        },
        main = 'nvim-treesitter.configs',
    },
}
