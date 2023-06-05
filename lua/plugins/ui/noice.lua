return {
    'folke/noice.nvim',
    cond = function() return not vim.g.neovide end,
    event = 'VeryLazy',
    opts = {
        cmdline = {
            view = 'cmdline',
            format = {
                cmdline = { icon = '' },
                search_down = {
                    icon = '',
                    view = 'cmdline',
                },
                search_up = {
                    icon = '',
                    view = 'cmdline',
                },
                -- help = { icon = ' ' },
                -- lua = { icon = vim.fn.nr2char(58473) },
                IncRename = {
                    pattern = '^:%s*IncRename%s+',
                    icon = ' ',
                    conceal = true,
                    opts = {
                        relative = 'cursor',
                        size = {
                            width = '20%',
                            maxwidth = 40,
                        },
                        position = { row = -3, col = 0 },
                        border = 'rounded'
                    },
                },
            },
        },
        popupmenu = { backend = 'cmp' },
        lsp = {
            -- progress = { view = 'notify' },
            signature = { enabled = true },
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
                ['cmp.entry.get_documentation'] = true,
            },
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
            hover = {
                border = { style = 'rounded' },
                position = { row = 2, col = 2 },
                size = {
                    max_height = 20,
                    max_width = 100,
                },
                win_options = {
                    winblend = 10,
                    wrap = true,
                    linebreak = true,
                },
            },
            popupmenu = {
                relative = 'editor',
                position = {
                    row = 8,
                    col = '50%',
                },
                size = {
                    width = 60,
                    height = 'auto',
                    max_height = 15,
                },
                border = {
                    style = 'rounded',
                    padding = { 0, 1 },
                },
                win_options = {
                    winhighlight = {
                        Normal = 'Normal',
                        FloatBorder = 'NoiceCmdlinePopupBorder',
                    },
                },
            },
        },
        format = {
            spinner = {
                name = 'aesthetic',
            },
        }
    }
}
