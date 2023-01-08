require('config.option')
require('config.lazy')

vim.defer_fn(function()
    require('config.gui')
    require('config.diagnostic')
    require('config.keymap')
    require('config.autocmd')

    vim.cmd.rshada()
    vim.opt.spell = true
end, 750)
