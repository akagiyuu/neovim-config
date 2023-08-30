local on_attach = function(client, bufnr)
    local lsp_util = require('util.lsp');
    lsp_util.code_lens_attach(client, bufnr)
    lsp_util.inlay_hint_attach(client, bufnr)

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
    vim.keymap.set('n', '<leader>rn', function() return ':IncRename ' .. vim.fn.expand('<cword>') end, {
        expr = true,
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
    vim.keymap.set('n', 'gr', function()
            local prev_timeout = vim.opt.timeout

            vim.opt.timeout = false

            require('flash').jump {
                action = function(match, state)
                    state:hide()

                    local row, col = unpack(vim.api.nvim_win_get_cursor(0))

                    vim.api.nvim_set_current_win(match.win)
                    vim.api.nvim_win_set_cursor(match.win, match.pos)

                    local key = vim.api.nvim_replace_termcodes('<Ignore>' .. 'g', true, true, true)

                    vim.api.nvim_feedkeys(key, 'i', false)

                    vim.schedule(function()
                        vim.api.nvim_win_set_cursor(match.win, { row, col })
                        vim.opt.timeout = prev_timeout
                    end)
                end,
                search = {
                    max_length = 2,

                    mode = function(str)
                        return '\\<' .. str
                    end,
                },
                label = {
                    before = { 0, 2 },
                    after = false,
                }
            }
        end,
        { desc = 'Remote lsp action' }
    )
end

return on_attach
