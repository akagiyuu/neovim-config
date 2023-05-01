return {
    'gen740/SmoothCursor.nvim',
    opts = {
        cursor = '',
        fancy = {
            enable = true,
            head = { cursor = '', texthl = 'SmoothCursor', linehl = nil }
        },
        type = 'exp',
        disable_float_win = true,
    },
    config = function(_, opts)
        require('smoothcursor').setup(opts)
        vim.api.nvim_create_autocmd({ 'ModeChanged' }, {
            callback = function()
                local current_mode = vim.fn.mode()
                if current_mode == 'n' then
                    vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })
                    vim.fn.sign_define('smoothcursor', { text = '' })
                elseif current_mode == 'v' then
                    vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
                    vim.fn.sign_define('smoothcursor', { text = '' })
                elseif current_mode == 'V' then
                    vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
                    vim.fn.sign_define('smoothcursor', { text = '' })
                elseif current_mode == '�' then
                    vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
                    vim.fn.sign_define('smoothcursor', { text = '' })
                elseif current_mode == 'i' then
                    vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#668aab' })
                    vim.fn.sign_define('smoothcursor', { text = '' })
                end
            end,
        })
    end,
    event = 'VeryLazy',
}
