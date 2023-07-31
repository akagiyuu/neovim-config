local on_attach = function(client, bufnr)
    require('util.lsp').code_lens_attach(client, bufnr)

    vim.keymap.set('n', '<leader>lf', '<cmd>Lspsaga finder<CR>', {
        desc = '[l]sp [f]inder',
        buffer = bufnr
    })
    vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga show_line_diagnostics<CR>', {
        desc = '[l]ine [d]iagnostic',
        buffer = bufnr
    })
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, {
        desc = '[g]oto [D]eclaration',
        buffer = bufnr
    })
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', {
        desc = '[g]oto [d]efinition',
        buffer = bufnr
    })
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, {
        desc = '[g]oto [i]mplementation',
        buffer = bufnr
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>fm', require('util.lsp').format, {
        desc = 'Format',
        buffer = bufnr
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', {
        desc = '[c]ode [a]ction',
        buffer = bufnr
    })
    vim.keymap.set('n', '<leader>rn', function() return ':IncRename ' .. vim.fn.expand('<cword>') end, {
        expr = true,
        desc = 'Rename',
        buffer = bufnr
    })
    vim.keymap.set('n', 'K', require('util.lsp').hover, {
        desc = 'Hover doc',
        buffer = bufnr
    })
    vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', {
        desc = 'next diagnostic',
        buffer = bufnr
    })
    vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', {
        desc = 'previous diagnostic',
        buffer = bufnr
    })
end

return on_attach
