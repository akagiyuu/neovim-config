vim.diagnostic.config {
    virtual_lines = false,
    virtual_text = true,
    update_in_insert = true,
    signs = true,
    underline = true,
    severity_sort = true,
    float = {
        focused = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
    on_init_callback = function(...)
        require('util.lsp').code_lens_attach(...)
    end,
}

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ', other = '﫠' }

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
