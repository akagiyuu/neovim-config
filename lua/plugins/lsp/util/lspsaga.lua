return {
    'glepnir/lspsaga.nvim',
    event = 'VeryLazy',
    config = {
        lightbulb = {
            virtual_text = false,
        },
        rename_action_quit = '<Esc>',
        border_style = 'rounded',
        rename = {
            quit = 'q',
            exec = '<CR>',
            in_select = false,
        },
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
            colors = {
                --float window normal bakcground color
                normal_bg = 'NONE',
                --title background color
                title_bg = '#afd700',
                red = '#e95678',
                magenta = '#b33076',
                orange = '#FF8700',
                yellow = '#f7bb3b',
                green = '#afd700',
                cyan = '#36d0e0',
                blue = '#61afef',
                purple = '#CBA6F7',
                white = '#d1d4cf',
                black = '#1c1c19',
            },
            kind = {},
        },
    }
}
