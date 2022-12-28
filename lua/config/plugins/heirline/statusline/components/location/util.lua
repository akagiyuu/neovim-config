local M = {}

M.locallist_count = function()
    local ll = vim.fn.getloclist(vim.fn.winnr(), {
        idx = 0,
        size = 0,
    })
    local count = ll.size
    local current = ll.idx
    return ('  %d/%d '):format(current, count)
end

return M
