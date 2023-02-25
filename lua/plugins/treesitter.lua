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
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false,
        dependencies = { 'nvim-treesitter-textobjects' },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            matchup = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                    },
                    -- You can choose the select mode (default is charwise 'v')
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V', -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                    },
                    -- include_surrounding_whitespace = true,
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        [']a'] = '@parameter.inner',
                        [']f'] = '@function.outer',
                        [']c'] = '@class.outer',
                    },
                    goto_next_end = {
                        [']A'] = '@parameter.inner',
                        [']F'] = '@function.outer',
                        [']C'] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['[a'] = '@parameter.inner',
                        ['[f'] = '@function.outer',
                        ['[c'] = '@class.outer',
                    },
                    goto_previous_end = {
                        ['[A'] = '@parameter.inner',
                        ['[F'] = '@function.outer',
                        ['[C'] = '@class.outer',
                    },
                },
            },
            playground = { enable = false }
        },
        config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end
    },
}
