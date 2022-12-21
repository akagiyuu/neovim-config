return {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    config = function()
        require('toggleterm').setup {}
        vim.keymap.set('n', '<C-\\>', '<cmd>ToggleTerm<CR>')
    end
}
