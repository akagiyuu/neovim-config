local _luasnip = {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
}
_luasnip.config = function()
    local luasnip = require('luasnip')
    local types = require('luasnip.util.types')

    luasnip.config.setup {
        ext_opts = {
            [types.choiceNode] = {
                active = { virt_text = { { '●', 'Constant' } } }
            },
            [types.insertNode] = {
                active = { virt_text = { { '●', 'Function' } } }
            }
        },
    }

    require('plugins.luasnip.lua')
    require('plugins.luasnip.python')
    require('luasnip.loaders.from_vscode').lazy_load()


    vim.keymap.set({ 'i', 's' }, '<c-l>', function()
        if luasnip.choice_active() then luasnip.change_choice(1) end
    end)
end

return {
    'rafamadriz/friendly-snippets',
    dependencies = { _luasnip },
    event = 'VeryLazy',
}
