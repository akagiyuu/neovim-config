local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'FocusGained', 'FocusLost' }, { command = 'checktime' })

-- autocmd('BufWritePost', { pattern = '**/lua/plugins/init.lua', command = 'silent source | PackerCompile' })

autocmd('TermOpen', { command = 'setlocal nospell' })

autocmd('QuitPre', { command = 'wshada' })

autocmd('User', {
    pattern = 'PackerCompileDone',
    callback = function()
        vim.notify('packer.compile: Complete', vim.log.levels.INFO, { title = 'packer.nvim' })
    end,
    desc = 'Notify after packer.compile completes',
})

autocmd('TextYankPost', { callback = function() vim.highlight.on_yank() end, desc = 'Highlight on yank' })

autocmd('BufWritePre', { command = '%s/\\s\\+$//e', desc = 'remove whitespaces on save' })

autocmd('InsertEnter', { command = 'set norelativenumber', desc = "don't show relative line number in NORNAL mode" })
autocmd('InsertLeave', { command = 'set relativenumber', desc = 'show relative line number in NORNAL mode' })
autocmd('FileType', { pattern = 'dap-repl', command = 'set nobuflisted' })
autocmd('FileType', { pattern = 'qf', command = 'set nobuflisted' })
