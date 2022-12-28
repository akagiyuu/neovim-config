local misc = {
    search_result = require(... .. '.util')
}

local null = { provider = '' }

misc.fold_method = {
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

misc.spell_check = {
    provider = ' 暈',
    condition = function() return vim.wo.spell end,
    hl = { fg = 'yellow', bold = true },
}

misc.help_file_name = {
    condition = function() return vim.bo.filetype == 'help' end,
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ':t')
    end,
    hl = { fg = 'blue' },
}

misc.search_result = { provider = misc.search_results }

return misc
