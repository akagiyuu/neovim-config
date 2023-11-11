return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            python = { 'ruff_fix', 'ruff_format' },
            -- Use a sub-list to run only the first available formatter
            css = { { 'prettierd', 'prettier' } },
            scss = { { 'prettierd', 'prettier' } },
            less = { { 'prettierd', 'prettier' } },
            html = { { 'prettierd', 'prettier' } },
            json = { { 'prettierd', 'prettier' } },
            fish = { 'fish_indent' },
            ['_'] = { 'trim_whitespace' },
            typst = { 'typstfmt' },
        },
        formatters = {
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
    end
}
