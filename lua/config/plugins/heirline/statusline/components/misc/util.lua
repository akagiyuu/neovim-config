local misc = {}

misc.search_results = function()
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

return misc
