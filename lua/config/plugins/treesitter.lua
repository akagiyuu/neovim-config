return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'VeryLazy' },
        { 'windwp/nvim-ts-autotag', event = 'InsertCharPre' },
        { 'RRethy/nvim-treesitter-endwise', event = 'InsertCharPre' }
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
            endwise = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                        ['ai'] = '@conditional.outer',
                        ['ii'] = '@conditional.inner',
                        ['al'] = '@loop.outer',
                        ['il'] = '@loop.inner',
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
                        [']l'] = '@loop.outer',
                        [']i'] = '@conditional.outer',
                    },
                    goto_next_end = {
                        [']A'] = '@parameter.inner',
                        [']F'] = '@function.outer',
                        [']C'] = '@class.outer',
                        [']L'] = '@loop.outer',
                        [']I'] = '@conditional.outer',
                    },
                    goto_previous_start = {
                        ['[a'] = '@parameter.inner',
                        ['[f'] = '@function.outer',
                        ['[c'] = '@class.outer',
                        ['[l'] = '@loop.outer',
                        ['[i'] = '@conditional.outer',
                    },
                    goto_previous_end = {
                        ['[A'] = '@parameter.inner',
                        ['[F'] = '@function.outer',
                        ['[C'] = '@class.outer',
                        ['[L'] = '@loop.outer',
                        ['[I'] = '@conditional.outer',
                    },
                },
            },
            playground = {
                enable = false,
                disable = {},
                updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = 'o',
                    toggle_hl_groups = 'i',
                    toggle_injected_languages = 't',
                    toggle_anonymous_nodes = 'a',
                    toggle_language_display = 'I',
                    focus_language = 'f',
                    unfocus_language = 'F',
                    update = 'R',
                    goto_node = '<cr>',
                    show_help = '?',
                },
            }
        }
    end,
}
