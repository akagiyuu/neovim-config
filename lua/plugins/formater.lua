return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            python = { 'ruff_fix', 'ruff_format' },
            rust = { 'rustfmt', 'leptosfmt' },
            css = { 'prettierd', 'prettier' },
            scss = { 'prettierd', 'prettier' },
            less = { 'prettierd', 'prettier' },
            html = { 'prettierd', 'prettier' },
            json = { 'prettierd', 'prettier' },
            typescript = { 'prettierd', 'prettier', stop_after_first = true },
            typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
            javascript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
            java = { 'google-java-format' },
            fish = { 'fish_indent' },
            ['_'] = { 'trim_whitespace' },
            typst = { 'typstyle' },
            ['*'] = { 'injected' }
        },
        formatters = {
            typstyle = {
                prepend_args = {
                    '--tab-width',
                    '4',
                }
            },
            prettier = {
                prepend_args = {
                    '--tab-width',
                    '4',
                }
            },
            ['google-java-format'] = {
                prepend_args = {
                    '-a'
                }
            }
        }
    },
}
