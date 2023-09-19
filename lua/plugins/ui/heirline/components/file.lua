local space = { provider = ' ' }

local size = {
    provider = function(self)
        local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
        local index = 1
        local fsize = vim.fn.getfsize(self.filename)

        if fsize < 0 then
            fsize = 0
        end

        while fsize > 1024 and index < 7 do
            fsize = fsize / 1024
            index = index + 1
        end
        return string.format(index == 1 and '%g%s' or '%.2f%s', fsize, suffix[index])
    end,
    hl = { fg = 'grey', },
}

local lock_info = {
    {
        provider  = ' [+]',
        condition = function() return vim.bo.modified end,
        hl        = { fg = 'green' },
    },
    {
        provider = ' ',
        condition = function() return not vim.bo.modifiable or vim.bo.readonly end,
        hl = { fg = 'orange' },
    },
}

local name = {
    init = function(self)
        self.filename = vim.fn.expand('%:~:.')
        if self.filename == '' then return '[No Name]' end
    end,
    {
        flexible = 4,
        { provider = function(self) return self.filename end },
        { provider = function(self) return vim.fn.pathshorten(self.filename) end }
    },
}

local icon = {
    init = function(self)
        local extension = vim.fn.fnamemodify(self.filename, ':e')
        self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(
            self.filename,
            extension,
            { default = true }
        )
    end,
    provider = function(self) return (self.icon or '') .. ' ' end,
    hl = function(self) return { fg = self.icon_color } end,
}

return {
    init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
    flexible = 3,
    { icon, name, lock_info, space, size },
    { icon, name, lock_info },
    { name }
}
