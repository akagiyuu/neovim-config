local icons = require('config.plugins.heirline.statusline.icon')
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
    init = function(self)
        if not self.once then
            vim.api.nvim_create_autocmd('ModeChanged', {
                pattern = '*:*o',
                command = 'redrawstatus'
            })
            self.once = true
        end
    end,
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
    {
        provider = function() return icons.right_filled end,
    },
    update = { 'ModeChanged' }
}
