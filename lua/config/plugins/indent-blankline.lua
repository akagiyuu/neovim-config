return {
    'lukas-reineke/indent-blankline.nvim',
    lazy = false,
    config = {
        char = '▏',
        -- char_blankline = ' ',
        -- context_char = '▏',
        context_char = '▎',
        show_current_context = true,
        show_current_context_start = true,
        use_treesitter = true,
        -- use_treesitter_scope = true,
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
        context_patterns = {
            -- NOTE: indent-blankline's defaults
            'class',
            '^func',
            'method',
            '^if',
            'while',
            'for',
            'with',
            'try',
            'except',
            'arguments',
            'argument_list',
            'object',
            'dictionary',
            'element',
            'table',
            'tuple',

            -- NOTE: better JavaScript/TypeScript support
            'return_statement',
            'statement_block',
        },

        -- char_highlight_list = {
        --     'IndentBlanklineIndent1',
        --     'IndentBlanklineIndent2',
        --     'IndentBlanklineIndent3',
        --     'IndentBlanklineIndent4',
        --     'IndentBlanklineIndent5',
        --     'IndentBlanklineIndent6',
        -- },
    }
}
