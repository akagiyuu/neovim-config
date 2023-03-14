vim.api.nvim_create_autocmd({
    'FocusGained',
    'FocusLost',
}, { command = 'checktime' })

vim.api.nvim_create_autocmd('TermOpen', { command = 'setlocal nospell' })

vim.api.nvim_create_autocmd('QuitPre', { command = 'wshada' })

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    desc = 'Highlight on yank',
})

vim.api.nvim_create_autocmd('BufWritePre', {
    command = '%s/\\s\\+$//e',
    desc = 'remove whitespaces on save',
})
