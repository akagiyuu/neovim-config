return {
    'nvim-treesitter/playground',
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
        'https://gitlab.com/HiPhish/nvim-ts-rainbow2',
        event = 'VeryLazy',
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false,
        dependencies = {
        },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            rainbow = { enable = true },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            playground = { enable = false }
        },
        config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end
    },
}
