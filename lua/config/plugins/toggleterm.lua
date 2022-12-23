return {
    'akinsho/toggleterm.nvim',
    keys = { { '<C-\\>', '<cmd>ToggleTerm<CR>' } },
    config = function() require('toggleterm').setup {} end
}
