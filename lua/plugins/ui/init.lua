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
        opts = {
            stages = 'slide',
            background_colour = 'NONE',
        },
        config = function(_, opts)
            require('notify').setup(opts)
            vim.keymap.set('n', '<leader>un', function()
                require('notify').dismiss { silent = true, pending = true }
            end, { desc = 'Delete all Notifications' })
        end
    },
    -- {
    --     'utilyre/barbecue.nvim',
    --     event = 'VeryLazy',
    --     dependencies = {
    --         {
    --             'SmiteshP/nvim-navic',
    --             opts = { highlight = true },
    --         }
    --     },
    --     opts = {
    --         theme = 'catppuccin',
    --         show_modified = true,
    --     }
    -- },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'VeryLazy',
        opts = {
            char = '▏',
            -- char_blankline = ' ',
            context_char = '▏',
            -- context_char = '▎',
            show_current_context = true,
            show_current_context_start = true,
            use_treesitter = true,
            filetype_exclude = {
                'help',
                'lspinfo',
                'packer',
                'checkhealth',
                'telescope',
                '',
            },
            -- show_trailing_blankline_indent = false,
            max_indent_increase = 1,
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
    require(... .. '.noice'),
    require(... .. '.telescope'),
    require(... .. '.hydra'),
    require(... .. '.heirline'),
}
