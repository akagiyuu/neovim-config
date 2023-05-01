return {
    'ThePrimeagen/refactoring.nvim',
    config = true,
    keys = {
        {
            '<leader>re',
            [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
            mode = 'v',
            silent = true,
            desc = 'Extract function',
        },
        {
            '<leader>rf',
            [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
            mode = 'v',
            silent = true,
            desc = 'Extract function to file',
        },
        {
            '<leader>rv',
            [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
            mode = 'v',
            silent = true,
            desc = 'Extract variable',
        },
        {
            '<leader>ri',
            [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
            mode = 'v',
            silent = true,
            desc = 'Inline variable',
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
        }
    }
}
