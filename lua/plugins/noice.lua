return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
        cmdline = {
            view = 'cmdline',
            format = {
                cmdline = { icon = '' },
                help = { icon = ' ' },
                lua = { icon = vim.fn.nr2char(58473) },
            },
        },
        popupmenu = { backend = 'cmp' },
        lsp = {
            signature = { enabled = false },
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
                -- ['cmp.entry.get_documentation'] = true,
            },
        },
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false,   -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        routes = {
            {
                view = 'notify',
                filter = { event = 'msg_showmode' },
            },
            {
                filter = {
                    event = 'msg_show',
                    kind = '',
                    find = 'written',
                },
                opts = { skip = true },
            },
            {
                filter = { event = 'msg_show', min_height = 20 },
                view = 'cmdline_output',
            },
        },
        views = {
            -- hover = {
            --     border = { style = 'rounded' },
            --     position = { row = 2, col = 2 },
            --     size = {
            --         max_height = 20,
            --         max_width = 100,
            --     },
            --     win_options = {
            --         winblend = 10,
            --         wrap = true,
            --         linebreak = true,
            --     },
            -- },
            -- popupmenu = {
            --     relative = 'editor',
            --     position = {
            --         row = 8,
            --         col = '50%',
            --     },
            --     size = {
            --         width = 60,
            --         height = 'auto',
            --         max_height = 15,
            --     },
            --     border = {
            --         style = 'rounded',
            --         padding = { 0, 1 },
            --     },
            --     win_options = {
            --         winhighlight = {
            --             Normal = 'Normal',
            --             FloatBorder = 'NoiceCmdlinePopupBorder',
            --         },
            --     },
            -- },
            mini = { win_options = { winblend = 0 } },
        },
        format = {
            spinner = {
                name = 'aesthetic',
            },
        }
    }
}
