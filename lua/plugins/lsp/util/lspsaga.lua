return {
    'glepnir/lspsaga.nvim',
    event = 'VeryLazy',
    config = {
        lightbulb = { virtual_text = false },
        border_style = 'rounded',
        rename = { in_select = false },
        symbol_in_winbar = {
            enable = false,
            separator = '   ',
            show_file = true,
        },
        ui = {
            -- currently only round theme
            theme = 'round',
            -- border type can be single,double,rounded,solid,shadow.
            border = 'rounded',
            winblend = vim.g.neovide and 60 or 0,
            expand = '',
            collaspe = '',
            preview = ' ',
            code_action = '💡',
            diagnostic = '🐞',
            incoming = ' ',
            outgoing = ' ',
            colors = { normal_bg = 'NONE' },
        },
    }
}
