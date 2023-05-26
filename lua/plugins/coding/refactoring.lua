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
    }
}
