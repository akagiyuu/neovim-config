package.path = package.path .. ';' .. vim.fn.expand('$HOME') .. '/.luarocks/share/lua/5.1/?/init.lua'
package.path = package.path .. ';' .. vim.fn.expand('$HOME') .. '/.luarocks/share/lua/5.1/?.lua'

require('config.option')
require('config.lazy')

vim.filetype.add { extension = { templ = 'templ', } }
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
