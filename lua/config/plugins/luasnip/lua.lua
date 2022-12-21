local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets('lua', {
    s('for', {
        t 'for ',
        c(1, {
            sn(nil, { i(1, 'k'), t ', ', i(2, 'v'), t ' in ', c(3, { t 'pairs', t 'ipairs' }), t '(', i(4), t ')' }),
            sn(nil, { i(1, 'i'), t ' = ', i(2), t ', ', i(3), })
        }),
        t { ' do', '\t' },
        i(0),
        t { '', 'end' }
    })
})
