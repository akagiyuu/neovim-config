return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            python = { 'ruff_fix', 'ruff_format' },
            rust = { 'rustfmt', 'leptosfmt' },
            css = { { 'prettierd', 'prettier' } },
            scss = { { 'prettierd', 'prettier' } },
            less = { { 'prettierd', 'prettier' } },
            html = { { 'prettierd', 'prettier' } },
            json = { { 'prettierd', 'prettier' } },
            typescript = { { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true } },
            typescriptreact = { { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true } },
            javascript = { { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true } },
            java = { 'google-java-format' },
            fish = { 'fish_indent' },
            ['_'] = { 'trim_whitespace' },
            typst = { 'typstfmt' },
            ['*'] = { 'injected' }
        },
        formatters = {
            leptosfmt = {
                command = 'leptosfmt',
                args = { '$FILENAME' },
                stdin = false,
            },
            typstfmt = {
                command = 'typstfmt',
                args = { '$FILENAME' },
                stdin = false,
            },
        }
    },
    config = function(_, opts)
        require('conform').setup(opts)
        local util = require('conform.util')
        util.add_formatter_args(
            require('conform.formatters.prettier'),
            { '--tab-width', '4' }
        )

        util.add_formatter_args(
            require('conform.formatters.google-java-format'),
            { '-a' }
        )
    end
}
