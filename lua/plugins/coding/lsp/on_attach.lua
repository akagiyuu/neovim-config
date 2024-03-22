local on_attach = function(client, bufnr)
    local lsp_util = require('util.lsp');
    lsp_util.code_lens_attach(client, bufnr)
    require('util.lsp').inlay_hint_attach(client, bufnr)

    vim.keymap.set('n', '<leader>lf', '<cmd>Lspsaga finder<CR>', {
        buffer = bufnr
    })
    vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga show_line_diagnostics<CR>', {
        buffer = bufnr
    })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {
        buffer = bufnr
    })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
        buffer = bufnr
    })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {
        buffer = bufnr
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>fm', require('util.lsp').format, {
        buffer = bufnr
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', {
        buffer = bufnr
    })
    vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', {
        buffer = bufnr
    })
    vim.keymap.set('n', 'K', require('util.lsp').hover, {
        buffer = bufnr
    })
    vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', {
        buffer = bufnr
    })
    vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', {
        buffer = bufnr
    })
    if client.name == 'eslint' then
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
        })
    end
end

return on_attach
