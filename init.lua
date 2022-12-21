require('config.option')
require('config.lazy')

vim.defer_fn(function()
    require('config.gui')
    require('config.diagnostic')
    require('config.keymap')
    require('icons.nonicons')
    require('config.autocmd')

    --vim.api.nvim_exec_autocmds('Loaded')
    vim.cmd.rshada()
    vim.opt.spell = true
end, 750)
