local M = {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'VeryLazy',
}

M.config = function()
    local null_ls = require('null-ls')
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting

    null_ls.setup {
        sources = {
            -- code_actions.eslint_d,
            -- code_actions.cspell,
            formatting.prettier.with {
                extra_args = { '--tab-width', '4', '--single-quote', '--bracket-spacing' }
            },
            formatting.fish_indent,
            formatting.autopep8,
            formatting.markdownlint,
            diagnostics.pylint,
            diagnostics.fish,
            diagnostics.markdownlint,
            diagnostics.cppcheck.with {
                args = {
                    '--enable=warning,style,performance,portability',
                    '--language=c++',
                    '--template=gcc',
                    '$FILENAME',
                },
            },
            -- diagnostics.cspell.with {
            --     diagnostics_postprocess = function(diagnostic)
            --         diagnostic.severity = vim.diagnostic.severity['WARN']
            --     end,
            -- },
            -- diagnostics.cppcheck
            null_ls.builtins.hover.dictionary,
        },
    }
end

return M
