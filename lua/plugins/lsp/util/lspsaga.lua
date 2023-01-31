return {
    'glepnir/lspsaga.nvim',
    event = 'VeryLazy',
    config = {
        lightbulb = { virtual_text = false },
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
            kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
        },
    }
}
