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
        dependencies = { 'samjwill/nvim-unception' },
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
            stages = 'fade_in_slide_out',
            background_colour = '#000000',
        },
        config = function(_, opts)
            require('notify').setup(opts)
            vim.keymap.set('n', '<leader>un', function()
                require('notify').dismiss { silent = true, pending = true }
            end, { desc = 'Delete all Notifications' })
        end
    },
    {
        'utilyre/barbecue.nvim',
        event = 'VeryLazy',
        dependencies = {
            {
                'SmiteshP/nvim-navic',
                opts = { highlight = true },
            }
        },
        opts = {
            theme = 'catppuccin',
            show_modified = true,
        }
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'VeryLazy',
        opts = {
            char = '▏',
            -- char_blankline = ' ',
            -- context_char = '▏',
            context_char = '▎',
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
        'nvim-colortils/colortils.nvim',
        cmd = 'Colortils',
        config = true
    },
    {
        'NvChad/nvim-colorizer.lua',
        event = 'VeryLazy',
        opts = {
            user_default_options = {
                RGB = true,          -- #RGB hex codes
                RRGGBB = true,       -- #RRGGBB hex codes
                names = true,        -- "Name" codes like Blue or blue
                RRGGBBAA = true,     -- #RRGGBBAA hex codes
                AARRGGBB = true,     -- 0xAARRGGBB hex codes
                rgb_fn = true,       -- CSS rgb() and rgba() functions
                hsl_fn = true,       -- CSS hsl() and hsla() functions
                css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes for `mode`: foreground, background,  virtualtext
                mode = 'background', -- Set the display mode.
            },
        }
    },
    require(... .. '.noice'),
    require(... .. '.nvim-tree'),
    require(... .. '.telescope'),
    require(... .. '.whichkey'),
    require(... .. '.hydra'),
    require(... .. '.smoothcursor'),
    require(... .. '.treesitter'),
    require(... .. '.heirline'),
}
