return {
    {
        'nvim-tree/nvim-web-devicons',
        lazy = false,
    },
    {
        'm-demare/hlargs.nvim',
        event = 'VeryLazy',
        opts = { use_colorpalette = true }
    },
    {
        'akinsho/toggleterm.nvim',
        keys = { { '<C-\\>', '<cmd>ToggleTerm<CR>', 'Toggle terminal' } },
        config = true,
    },
    {
        'stevearc/dressing.nvim',
        event = 'VeryLazy',
        opts = { input = { title_pos = 'center' } }
    },
    {
        'rcarriga/nvim-notify',
        keys = {
            {
                '<leader>un',
                function()
                    require('notify').dismiss { silent = true, pending = true }
                end,
                desc = 'Dismiss all Notifications',
            },
        },
        opts = {
            stages = 'slide',
            background_colour = 'NONE',
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
            end,
        },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'VeryLazy',
        main = 'ibl',
        opts = {
            indent = {
                char = '▏',
                tab_char = '▏',
            },
            scope = {
                show_start = true,
                show_end = true
            },
        }
    },
    {
        'uga-rosa/ccc.nvim',
        cmd = 'CccHighlighterToggle',
        opts = {
            highlighter = {
                auto_enable = true,
                lsp = true,
            },
        },
        config = true
    },
    {
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
            show_help = false,
            show_keys = false
        }
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        main = 'rainbow-delimiters.setup',
        config = true,
        event = 'VeryLazy',
    },
    require(... .. '.noice'),
    require(... .. '.telescope'),
    require(... .. '.heirline'),
}
