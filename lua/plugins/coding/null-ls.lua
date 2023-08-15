return {
    'jose-elias-alvarez/null-ls.nvim',
    enabled = false,
    -- event = 'VeryLazy',
    config = function()
        local null = require('null-ls')
        local builtins = null.builtins

        null.setup {
            sources = {
                builtins.formatting.prettier.with {
                    extra_args = { '--tab-width', '4', '--single-quote', '--bracket-spacing' }
                },
                builtins.formatting.fish_indent,
                builtins.formatting.autopep8,
                builtins.formatting.markdownlint,
                builtins.diagnostics.markdownlint,
                builtins.diagnostics.pylint,
                builtins.diagnostics.fish,
                builtins.diagnostics.cppcheck.with {
                    args = {
                        '--enable=warning,style,performance,portability',
                        '--language=c++',
                        '--template=gcc',
                        '$FILENAME',
                    },
                },
                builtins.code_actions.refactoring,
                builtins.hover.dictionary,
                -- null.builtins.diagnostics.cspell,
                -- null.builtins.code_actions.cspell
            },
        }
    end,
}
