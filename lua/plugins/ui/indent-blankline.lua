return {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    opts = {
        char = '▏',
        -- char_blankline = ' ',
        -- context_char = '▏',
        context_char = '▎',
        show_current_context = true,
        show_current_context_start = true,
        use_treesitter = true,
        filetype_exclude = {
            'help',
            'lspinfo',
            'packer',
            'checkhealth',
            'telescope',
            '',
        },
        -- show_trailing_blankline_indent = false,
        max_indent_increase = 1,
    }
}
