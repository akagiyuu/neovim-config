return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    event = { 'InsertEnter', 'CmdlineEnter' },
    build = 'cargo build --release',
    opts = {
        keymap = {
            preset = 'none',
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide' },
            ['<CR>'] = { 'accept', 'fallback' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
            cmdline = {
                preset = 'enter',
            }
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'normal'
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        completion = {
            list = {
                selection = 'auto_insert',
            },
            menu = {
                border = 'rounded'
            },
            documentation = {
                auto_show = true,
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
    opts_extend = { 'sources.default' }
}
