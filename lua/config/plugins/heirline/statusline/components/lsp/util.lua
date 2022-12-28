local lsp = {}

lsp.clients_name = function()
    local names = {}
    for _, client in pairs(vim.lsp.buf_get_clients(0)) do
        table.insert(names, client.name)
    end

    return '   [' .. table.concat(names, ', ') .. ']'
end

return lsp
