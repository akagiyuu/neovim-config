return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'mikavilpas/blink-ripgrep.nvim',
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono'
        },
        sources = {
            default = {
                'lsp',
                'path',
                'snippets',
                'buffer',
                'ripgrep'
            },
            providers = {
                lsp = {
                    async = true,
                },
                ripgrep = {
                    module = 'blink-ripgrep',
                    name = 'Ripgrep',
                    opts = {
                        prefix_min_len = 5,
                    }
                }
            },
        },
        fuzzy = {
            implementation = 'rust',
            sorts = {
                'exact',
                -- defaults
                'score',
                'sort_text',
            },
        },
        completion = {
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            list = {
                selection = {
                    preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
                    auto_insert = function(ctx) return ctx.mode ~= 'cmdline' end
                }
            },
            menu = {
                border = 'rounded',
                draw = { treesitter = { 'lsp' } },
            },
            documentation = {
                auto_show = true,
                treesitter_highlighting = true,
                window = { border = 'rounded' },
            },
            ghost_text = {
                enabled = true
            }
        },
        signature = {
            enabled = true,
            window = { border = 'rounded' }
        }
    },
}
