return {
    'glepnir/lspsaga.nvim',
    event = 'VeryLazy',
    config = function()
        require('lspsaga').init_lsp_saga {
            move_in_saga = {
                prev = '<Up>',
                next = '<Down>',
            },
            code_action_keys = {
                quit = 'q',
                exec = '<CR>',
            },
            code_action_lightbulb = {
                virtual_text = false,
            },
            rename_action_quit = '<Esc>',
            border_style = 'rounded',
            rename_in_select = false,

            symbol_in_winbar = {
                in_custom = false,
                enable = not vim.g.started_by_firenvim,
                separator = '   ',
                show_file = true,
            },
        }
    end
}
