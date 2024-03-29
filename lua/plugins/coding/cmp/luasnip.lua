return {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
    },
    config = function()
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

        vim.keymap.set({ 'i', 's' }, '<c-l>', function()
            if luasnip.choice_active() then luasnip.change_choice(1) end
        end)
    end
}
