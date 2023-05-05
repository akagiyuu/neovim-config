return {
    'ThePrimeagen/refactoring.nvim',
    config = true,
    requires = {
        { 'plenary.nvim' },
        { 'nvim-treesitter' }
    },
    opts = {
        prompt_func_return_type = {
            go = true,
            cpp = true,
            c = true,
            java = true,
        },
        -- prompt for function parameters
        prompt_func_param_type = {
            go = true,
            cpp = true,
            c = true,
            java = true,
        },
    },
    keys = {
        {
            '<leader>rr',
            function() require('refactoring').select_refactor() end,
            mode = 'v',
            expr = false,
            desc = 'Refactor selector',
        },
        {
            '<leader>ri',
            function() require('refactoring').refactor('Inline Variable') end,
            mode = 'n',
            desc = 'Inline variable',
        },
        {
            '<leader>rv',
            function() require('refactoring').debug.print_var { normal = true } end,
            desc = 'Print variable'
        },
        {
            '<leader>rc',
            function() require('refactoring').debug.cleanup {} end,
            desc = 'Delete print statement'
        }
    }
}
