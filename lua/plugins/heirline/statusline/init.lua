local conditions = require('heirline.conditions')
local components = require('plugins.heirline.components')
require(... .. '.colors')

local disabled_buffers = {
    condition = function()
        return conditions.buffer_matches {
            filetype = {
                'NvimTree',
                'packer',
            },
            buftype = {
                'nofile',
                'help',
                'quickfix',
                'terminal'
            },
        }
    end,
    provider = ' ',
}

return {
    init = function(self)
        self.mode = vim.fn.mode(1)
    end,
    static = {
        mode_color_map = {
            n = 'green',
            i = 'red',
            v = 'nord_blue',
            V = 'nord_blue',
            ['\22'] = 'nord_blue',
            c = 'yellow',
            s = 'purple',
            S = 'purple',
            ['\19'] = 'purple',
            R = 'orange',
            r = 'orange',
            ['!'] = 'red',
            t = 'red',
        },
        mode_color = function(self)
            return self.mode_color_map[self.mode]
        end,
    },

    stop_when = function(_, out)
        return out ~= ''
    end,
    components.misc.help_file_name,
    disabled_buffers,
    require(... .. '.active'),
    require(... .. '.inactive')
}
