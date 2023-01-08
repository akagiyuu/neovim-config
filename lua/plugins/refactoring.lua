local M = {
    'ThePrimeagen/refactoring.nvim',
    event = 'VeryLazy',
}

M.config = function()
    require('refactoring').setup {}
    vim.keymap.set('v', '<leader>re', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]]
        , {
            silent = true,
            desc = 'Extract function',
        })
    vim.keymap.set('v', '<leader>rf',
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {
            silent = true,
            desc = 'Extract function to file',
        })
    vim.keymap.set('v', '<leader>rv', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]]
        , {
            silent = true,
            desc = 'Extract variable',
        })
    vim.keymap.set('v', '<leader>ri', [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
        {
            silent = true,
            desc = 'Inline variable',
        })
    vim.keymap.set('n', '<leader>rb', function() require('refactoring').refactor('Extract Block') end, {
        silent = true,
        desc = 'Extract block',
    })
    vim.keymap.set('n', '<leader>rbf', function() require('refactoring').refactor('Extract Block To File') end,
        {
            silent = true,
            desc = 'Extract block to file',
        })
    vim.keymap.set('n', '<leader>ri', function() require('refactoring').refactor('Inline Variable') end, {
        silent = true,
        desc = 'Inline variable',
    })
end

return M
