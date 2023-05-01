local _misc = {}
local null = { provider = '' }

_misc.fold_method = {
    flexible = 2,
    {
        condition = function() return vim.wo.foldenable end,
        hl = {
            fg = 'green_pale',
            bold = true,
        },
        { provider = '  ' },
        { provider = function() return string.format('%s[%d]', vim.wo.foldmethod, vim.wo.foldlevel) end },
    },
    null
}

_misc.help_file_name = {
    condition = function() return vim.bo.filetype == 'help' end,
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ':t')
    end,
    hl = { fg = 'blue' },
}

_misc.search_result = {
    provider = function()
        local lines = vim.api.nvim_buf_line_count(0)
        if lines > 50000 then return '' end

        local query = vim.fn.getreg('/')
        if query == '' then return '' end

        if query:find('@') then return '' end

        local count = vim.fn.searchcount {
            recompute = 1,
            maxcount = -1,
        }

        local active = false
        if vim.v.hlsearch and vim.v.hlsearch == 1 and count.total > 0 then
            active = true
        end
        if not active then return '' end

        query = query:gsub([[\<]], ''):gsub([[\>]], '')
        return '/' .. query .. '[' .. count.current .. '/' .. count.total .. ']'
    end
}

_misc.ruler = {
    { provider = ' ' },
    {
        provider = function()
            local line = vim.fn.line('.')
            return string.format('%d/%%L|%%c ', line)
        end,
        hl = { bold = true, },
    },
    {
        provider = ' %P ',
        hl = function(self)
            return {
                fg = self:mode_color(),
                bg = 'mid_bg',
            }
        end,
    },
}

return _misc
