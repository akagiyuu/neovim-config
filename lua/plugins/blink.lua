return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'mikavilpas/blink-ripgrep.nvim',
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    build = 'cargo build --release',
    opts = {
        keymap = {
            preset = 'none',
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        },
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
