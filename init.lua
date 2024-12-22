require('config.option')
require('config.lazy')

vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    once = true,
    callback = function()
        require('config.gui')
        require('config.keymap')
        require('config.autocmd')

        vim.cmd.rshada()
        vim.opt.spell = true
    end,
})
