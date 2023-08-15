return {
    'mfussenegger/nvim-lint',
    init = function()
        vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePost' }, {
            callback = function()
                require('lint').try_lint()
            end,
        })
    end,
    config = function()
        local lint = require('lint')
        lint.linters.cppcheck.args = {
            '--enable=warning,style,performance,portability',
            '--language=c++',
            '--template=gcc',
            '$FILENAME',
        }

        lint.linters_by_ft = {
            markdown = { 'markdownlint' },
            python = { 'pylint' },
            cpp = { 'cppcheck' },
            c = { 'cppcheck' }
        }
    end
}
