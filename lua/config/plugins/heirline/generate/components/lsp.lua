local conditions = require('heirline.conditions')
local lsp = {}

lsp.name = {
    condition = conditions.lsp_attached,
    provider = require('config.plugins.heirline.generate.utils.lsp').lsp_client_names,
    on_click = {
        callback = function()
            vim.defer_fn(function() vim.cmd.LspInfo() end, 100)
        end,
        name = 'heirline_LSP',
    },
    hl = { fg = 'nord_blue', bold = true },
    update = { 'LspAttach', 'LspDetach' },
}

lsp.diagnostic = {
    condition = conditions.has_diagnostics,

    static = {
        icon = {
            error = '  ',
            warn  = '  ',
            info  = '  ',
            hint  = '  ',
        }
    },

    init = function(self)
        self.errors   = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints    = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info     = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    {
        provider = function(self) return self.errors > 0 and (self.icon.error .. self.errors .. ' ') end,
        hl = { fg = 'diag_error' }
    },
    {
        provider = function(self) return self.warnings > 0 and (self.icon.warn .. self.warnings .. ' ') end,
        hl = { fg = 'diag_warn' },
    },
    {
        provider = function(self) return self.info > 0 and (self.icon.info .. self.info .. ' ') end,
        hl = { fg = 'diag_info' },
    },
    {
        provider = function(self) return self.hints > 0 and (self.icon.hint .. self.hints) end,
        hl = { fg = 'diag_hint' },
    },
    on_click = {
        callback = function() vim.cmd.TroubleToggle() end,
        name = 'heirline_diagnostics',
    },
    update = { 'DiagnosticChanged', 'BufEnter' },
}

return lsp
