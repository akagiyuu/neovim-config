local on_attach = function(_, bufnr)
    vim.keymap.set('n', '<leader>lf', '<cmd>Lspsaga lsp_finder<CR>', {
        desc = '[l]sp [f]inder',
        buffer = bufnr
    })
    vim.keymap.set('n', '<leader>lo', '<cmd>Lspsaga outline<CR>', {
        desc = '[l]sp [o]utline',
        buffer = bufnr
    })
    vim.keymap.set('n', '<leader>lt', function() require('util').lsp.toggle_virtual_lines() end, {
        desc = '[t]oggle virtual [l]ines',
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
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, {
        desc = '[g]oto [r]eferences',
        buffer = bufnr
    })
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, {
        desc = '[g]oto [i]mplementation',
        buffer = bufnr
    })

    vim.keymap.set('n', 'gqq', function() require('util').lsp.format() end, {
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

    vim.keymap.set('n', 'K', require('util').lsp.hover, {
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
