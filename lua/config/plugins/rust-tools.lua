local M = {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
}

M.config = function()
    require('rust-tools').setup {
        tools = { inlay_hints = { auto = false }, },
        server = {
            on_attach = require('plugins.config.lspconfig.on_attach')
        }
    }
end

return M
