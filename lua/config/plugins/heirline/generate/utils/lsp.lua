local M = {}

M.lsp_client_names = function()
    local names = {}
    for _, client in pairs(vim.lsp.buf_get_clients(0)) do
        table.insert(names, client.name)
    end

    return '   [' .. table.concat(names, ', ') .. ']'
end

return M
