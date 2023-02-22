local conditions = require('heirline.conditions')

local lsp = {}

lsp.name = {
    condition = conditions.lsp_attached,
    provider = function()
        local names = {}
        for _, client in pairs(vim.lsp.get_active_clients()) do
            table.insert(names, client.name)
        end

        return '   [' .. table.concat(names, ', ') .. ']'
    end,
    hl = { fg = 'nord_blue', bold = true },
    update = { 'LspAttach', 'LspDetach' },
}

---Create diagnostic info
---@param severity string
---@return table
local diagnostic_info = function(severity, icon)
    return {
        provider = function()
            local diagnostic_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity:upper()] })
            return diagnostic_count > 0 and (icon .. diagnostic_count .. ' ')
        end,
        hl = { fg = 'diag_' .. severity }
    }
end

lsp.diagnostic = {
    condition = conditions.has_diagnostics,

    diagnostic_info('error', '  '),
    diagnostic_info('warn', '  '),
    diagnostic_info('info', '  '),
    diagnostic_info('hint', '  '),
    update = { 'DiagnosticChanged', 'BufEnter' },
}

return lsp
