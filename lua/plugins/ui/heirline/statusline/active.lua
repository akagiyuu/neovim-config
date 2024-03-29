local conditions = require('heirline.conditions')
local utils = require('heirline.utils')

return function(components)
    local left_segment = {
        hl = { fg = 'grey' },
        components.mode,
        -- fold_method,
        { provider = '' },
        components.git,
        { provider = ' ' },
    }

    local middle_segment = {
        condition = function() return vim.fn.expand('%:t') ~= '' end,
        { provider = ' ' },
        components.file,
        { provider = ' ' },
    }

    local right_segment = {
        condition = function() return vim.fn.expand('%:t') ~= '' end,
        hl = { fg = 'grey' },
        -- components.lsp.name,
        components.lsp.diagnostic,
        components.misc.search_result,
        {
            hl = function(self)
                return { fg = 'light_bg', bg = self:mode_color() }
            end,
            {
                provider = components.icon.left_filled,
                hl = function(self)
                    return { fg = self:mode_color(), bg = 'statusline_bg' }
                end,
            },
            components.misc.ruler,
        },
    }

    return {
        condition = conditions.is_active,
        hl = { fg = utils.get_highlight('StatusLine').fg, bg = 'NONE' },
        utils.surround({ '', components.icon.right_filled }, 'statusline_bg', left_segment),
        components.spring,
        utils.surround({ components.icon.left_filled, components.icon.right_filled }, 'statusline_bg', middle_segment),
        components.spring,
        utils.surround({ components.icon.left_filled, '' }, 'statusline_bg', right_segment),
    }
end
