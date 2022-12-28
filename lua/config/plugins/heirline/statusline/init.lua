local conditions = require('heirline.conditions')
local components = require(... .. '.components')
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

require('heirline').setup {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
        local extension = vim.fn.fnamemodify(self.filename, ':e')
        self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(self.filename, extension,
            { default = true })
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

