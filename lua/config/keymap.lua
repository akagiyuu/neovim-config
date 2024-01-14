vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set(
    { 'i', 'n' },
    '<esc>',
    '<cmd>noh<cr><esc>',
    { desc = 'Escape and clear hlsearch' }
)
