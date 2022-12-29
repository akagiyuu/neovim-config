local M = {
    'glepnir/lspsaga.nvim',
    event = 'VeryLazy',
}

M.config = function()
    local saga = require('lspsaga')
    -- local kind = require('lspsaga.lspkind')
    -- local cmp_kind = require('theme.icon').cmp_kind

    -- kind[1][2] = cmp_kind.File
    -- kind[2][2] = cmp_kind.Module
    -- kind[5][2] = cmp_kind.Class
    -- kind[12][2] = cmp_kind.Function
    -- kind[13][2] = cmp_kind.Variable
    -- kind[23][2] = cmp_kind.Struct
    -- kind[26][2] = cmp_kind.TypeParameter

    saga.init_lsp_saga {
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

return M
