local icons = require('plugins.heirline.statusline.icon')
return {
    static = {
        name = {
            n      = 'Normal',
            no     = 'Op·Pending',
            nov    = 'Op·Pending',
            noV    = 'Op·Pending',
            niI    = '(Normal)',
            niR    = '(Normal)',
            niV    = '(Normal)',
            nt     = 'Normal',
            v      = 'Visual',
            V      = 'V·Line',
            ['']  = 'V·Block',
            s      = 'Select',
            S      = 'S·Line',
            ['']  = 'S·Block',
            i      = 'Insert',
            ic     = 'Ins·Compl',
            ix     = 'Ins·Compl',
            R      = 'Replace',
            Rv     = 'Replace',
            Rx     = 'Replace',
            c      = 'Command',
            cv     = 'Vim·Ex',
            ce     = 'Ex',
            r      = 'Prompt',
            rm     = 'More',
            ['r?'] = 'Confirm',
            ['!']  = 'Shell',
            t      = 'Terminal',
            ['']   = 'Empty',
        },
    },
    hl = function(self)
        return {
            fg = self:mode_color(),
            bold = true,
        }
    end,
    {
        hl = function(self)
            return {
                fg = 'statusline_bg',
                bg = self:mode_color(),
                bold = true,
            }
        end,
        provider = function(self) return '   %2(' .. self.name[self.mode] .. '%) ' end,
    },
    { provider = function() return icons.right_filled end },
    update = {
        'ModeChanged',
        pattern = '*:*',
        callback = vim.schedule_wrap(function()
            vim.cmd('redrawstatus')
        end),
    },
}
