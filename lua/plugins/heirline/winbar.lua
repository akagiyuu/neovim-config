local utils = require('heirline.utils')
local conditions = require('heirline.conditions')
local components = require('plugins.heirline.components')

return {
    fallthrough = false,
    {   -- Hide the winbar for special buffers
        condition = function()
            return conditions.buffer_matches({
                buftype = { "nofile", "prompt", "help", "quickfix" },
                filetype = { "^git.*", "fugitive" },
            })
        end,
        init = function()
            vim.opt_local.winbar = nil
        end
    },
    {   -- An inactive winbar for regular files
        condition = function()
            return not conditions.is_active()
        end,
        utils.surround({ "", "" }, "light_bg", { hl = { fg = "gray", force = true }, components.file }),
    },
    -- A winbar for regular files
    utils.surround({ "", "" }, "light_bg", components.file),
}
