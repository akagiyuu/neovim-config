local M = {
    'monaqa/dial.nvim',
    keys = {
        { '<C-a>', function() require('dial.map').inc_normal() end },
        { '<C-x>', function() require('dial.map').dec_normal() end },
        { '<C-a>', function() require('dial.map').inc_visual('visual') end, 'v' },
        { '<C-x>', function() require('dial.map').dec_visual('visual') end, 'v' }
    }
}

M.config = function()
    local augend = require('dial.augend')
    require('dial.config').augends:register_group {
            -- default augends used when no group name is specified
            default = {
                augend.integer.alias.decimal_int,
                augend.integer.alias.hex,
                augend.date.alias['%d/%m/%Y'],
                augend.date.alias['%m/%d/%Y'],
                augend.date.alias['%H:%M'],
                augend.date.alias['%H:%M:%S'],
                augend.semver.alias.semver,
                augend.hexcolor.new { case = 'lower' },
                augend.hexcolor.new { case = 'upper' },
                augend.constant.new {
                    elements = { 'and', 'or' },
                    word = true,
                    cyclic = true,
                },
                augend.constant.new {
                    elements = { 'true', 'false' },
                    word = true,
                    cyclic = true,
                    preserve_case = true
                },
                augend.constant.new {
                    elements = { '&&', '||' },
                    word = false,
                    cyclic = true,
                },
            },
            visual = {
                augend.case.new { types = {
                    'camelCase',
                    'SCREAMING_SNAKE_CASE',
                    'snake_case',
                    'PascalCase',
                                  } },
            },
    }

    vim.keymap.set('n', '<C-a>', require('dial.map').inc_normal())
    vim.keymap.set('n', '<C-x>', require('dial.map').dec_normal())
    vim.keymap.set('v', '<C-a>', require('dial.map').inc_visual('visual'))
    vim.keymap.set('v', '<C-x>', require('dial.map').dec_visual('visual'))
end

return M
