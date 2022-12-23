return {
    'ghillb/cybu.nvim',
    keys = {
        { ']b', '<cmd>CybuNext<cr>', desc = 'Go to next buffer', silent = true },
        { '[b', '<cmd>CybuPre<cr>', desc = 'Go to previous buffer', silent = true }
    },
    config = {
        -- behavior = { -- set behavior for different modes
        --     show_on_autocmd = 'BufEnter', -- event to trigger cybu (eg. "BufEnter")
        -- },
        --
        style = {
            path_abbreviation = 'shortened', -- none, shortened
            border = 'rounded', -- single, double, rounded, none
        }
    }
}
