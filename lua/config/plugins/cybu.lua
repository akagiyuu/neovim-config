local M = {
    'ghillb/cybu.nvim',
    event = 'VeryLazy',
}

M.config = function()
    require('cybu').setup {
        -- behavior = { -- set behavior for different modes
        --     show_on_autocmd = 'BufEnter', -- event to trigger cybu (eg. "BufEnter")
        -- },
        --
        style = {
            path_abbreviation = 'shortened', -- none, shortened
            border = 'rounded', -- single, double, rounded, none
        }
    }
    vim.keymap.set('n', ']b', '<cmd>CybuNext<cr>', { desc = 'Go to next buffer', silent = true })
    vim.keymap.set('n', '[b', '<cmd>CybuPre<cr>', { desc = 'Go to previous buffer', silent = true })
end

return M
