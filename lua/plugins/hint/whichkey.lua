return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        popup_mappings = {
            scroll_down = '<Down>',
            scroll_up = '<Up>',
        },
        window = {
            border = 'rounded',
        },
        windblend = 10,
        plugins = {
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
        },
        show_help = false,
        show_keys = false
    }
}
