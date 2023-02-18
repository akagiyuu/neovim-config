return {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'jay-babu/mason-null-ls.nvim' },
    config = function()
        local null_ls = require('null-ls')
        local builtins = null_ls.builtins

        null_ls.setup {
            sources = {
                builtins.formatting.prettier.with {
                    extra_args = { '--tab-width', '4', '--single-quote', '--bracket-spacing' }
                },
                builtins.formatting.fish_indent,
                builtins.formatting.autopep8,
                builtins.formatting.markdownlint,
                builtins.diagnostics.pylint,
                builtins.diagnostics.fish,
                builtins.diagnostics.markdownlint,
                builtins.diagnostics.cppcheck.with {
                    args = {
                        '--enable=warning,style,performance,portability',
                        '--language=c++',
                        '--template=gcc',
                        '$FILENAME',
                    },
                },
                builtins.hover.dictionary,
            },
        }
        require('mason-null-ls').setup {
            ensure_installed = nil,
            automatic_installation = true,
            automatic_setup = false,
        }
    end,
    event = 'VeryLazy',
}
