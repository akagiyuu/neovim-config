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
            silent = true,
            expr = false,
            desc = 'Refactor selector',
        },
        {
            '<leader>rv',
            [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
            mode = 'v',
            silent = true,
            desc = 'Extract variable',
        },
        {
            '<leader>rb',
            function() require('refactoring').refactor('Extract Block') end,
            mode = 'n',
            silent = true,
            desc = 'Extract block',
        },
        {
            '<leader>rbf',
            function() require('refactoring').refactor('Extract Block To File') end,
            mode = 'n',
            silent = true,
            desc = 'Extract block to file',
        },
        {
            '<leader>ri',
            function() require('refactoring').refactor('Inline Variable') end,
            mode = 'n',
            silent = true,
            desc = 'Inline variable',
        },
        {
            '<leader>rv',
            function() require('refactoring').debug.print_var { normal = true } end,
            desc = 'Print variable'
        },
        {
            '<leader>rc',
            [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
            function() require('refactoring').debug.cleanup {} end,
            desc = 'Delete print statement'
        }
    }
}
