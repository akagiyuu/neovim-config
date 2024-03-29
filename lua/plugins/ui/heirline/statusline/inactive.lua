local conditions = require('heirline.conditions')

return function(components)
    local left_slant = {
        provider = components.icon.slant_right_2,
        hl       = { fg = 'short_bg', bg = 'mid_bg' },
    }

    local right_slant = {
        provider = components.icon.slant_right_2,
        hl       = { fg = 'mid_bg', bg = 'short_bg' },
    }
    local right_segment = {
        condition = function() return vim.fn.expand('%:t') ~= '' end,
        hl = { fg = 'mid_bg', bg = 'green_pale', },
        {
            {
                provider = components.icon.slant_left,
                hl = { fg = 'green_pale', bg = 'short_bg', },
            },
            components.misc.ruler,
        },
    }

    return {
        condition = conditions.is_not_active,
        hl = { fg = 'white', bg = 'short_bg' },
        {
            hl = { bg = 'mid_bg' },
            components.git,
            components.space,
            right_slant,
        },
        components.spring,
        {
            left_slant,
            components.space,
            hl = {
                bg = 'mid_bg',
            },
            components.file,
            components.space,
            right_slant,
        },
        components.spring,
        right_segment,
    }
end
