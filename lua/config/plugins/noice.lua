return {
    'folke/noice.nvim',
    cond = function() return not vim.g.neovide end,
    event = 'VeryLazy',
    config = function()
        local noice = require('noice')

        noice.setup {
            cmdline = {
                -- view = 'cmdline',
                format = {
                    -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                    -- view: (default is cmdline view)
                    -- opts: any options passed to the view
                    -- icon_hl_group: optional hl_group for the icon
                    -- cmdline = { icon = ' ' },
                    cmdline = { icon = ':' },
                    search_down = { icon = '🔍' },
                    search_up = { icon = '🔍' },
                    -- help = { icon = ' ' },
                    -- lua = { icon = vim.fn.nr2char(58473) },
                    -- lua = false, -- to disable a format, set to `false`
                },
                view = 'cmdline',
            },
            presets = {
                -- you can enable a preset by setting it to true, or a table that will override the preset config
                -- you can also add custom presets that you can enable/disable with enabled=true
                bottom_search = true, -- use a classic bottom cmdline for search
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = true, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true
            },
            lsp = {
                signature = {
                    enabled = false,
                },
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
            },
            views = {
                -- hover = {
                --     size = {
                --         max_height = 20,
                --         max_width = 80,
                --     },
                --     win_options = {
                --         winblend = 10,
                --         wrap = true,
                --         linebreak = true,
                --     },
                -- },
                cmdline_popup = {
                    position = {
                        row = 5,
                        col = '50%',
                    },
                    size = {
                        width = 'auto',
                        height = 'auto',
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
        }

        vim.keymap.set('n', '<c-f>', function() if not require('noice.lsp').scroll(4) then return '<c-f>' end end, {
            desc = 'Scroll down noice.nvim popup',
        })
        vim.keymap.set('n', '<c-b>', function() if not require('noice.lsp').scroll(-4) then return '<c-b>' end end, {
            desc = 'Scroll up noice.nvim popup',
        })
    end,
}
