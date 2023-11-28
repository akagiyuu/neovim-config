vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'TermResponse' }, {
    desc = 'Reload file if changed outside of nvim',
    command = [[silent! if mode() != 'c' && !bufexists("[Command Line]") | checktime | endif]],
})
vim.api.nvim_create_autocmd('TermOpen', { command = 'setlocal nospell' })

vim.api.nvim_create_autocmd('QuitPre', { command = 'wshada' })

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    desc = 'Highlight on yank',
})
