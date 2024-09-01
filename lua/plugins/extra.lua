return {
    {
        'nvim-tree/nvim-web-devicons',
        lazy = false,
    },
    {
        'akinsho/toggleterm.nvim',
        keys = { { '<C-\\>', '<cmd>ToggleTerm<CR>', 'Toggle terminal' } },
        opts = {
            open_mapping = [[<c-\>]],
            winbar = { enabled = true, },
        },
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
                char = '▏',
                show_start = true,
                show_end = true
            },
        }
    },
    {
        'brenoprata10/nvim-highlight-colors',
        event = 'VeryLazy',
        config = true
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            keys = {
                scroll_down = '<Down>',
                scroll_up = '<Up>',
            },
            win = {
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
    {
        'kevinhwang91/nvim-fundo',
        lazy = false,
        dependencies = 'kevinhwang91/promise-async',
        config = true,
        build = function() require('fundo').install() end,
    },
    {
        'andrewferrier/debugprint.nvim',
        config = true,
        keys = {
            { 'g?p', mode = 'n' },
            { 'g?P', mode = 'n' },
            { 'g?v', mode = 'n' },
            { 'g?V', mode = 'n' },
            { 'g?o', mode = 'n' },
            { 'g?O', mode = 'n' },
            { 'g?v', mode = 'x' },
            { 'g?V', mode = 'x' },
        },
    },
    {
        'cshuaimin/ssr.nvim',
        keys = {
            {
                '<leader>sr',
                function() require('ssr').open() end,
                { 'n', 'x' },
                desc = 'Structure search and replace',
            },
        },
        opts = {
            min_width = 50,
            min_height = 5,
            keymaps = {
                close = 'q',
                next_match = 'n',
                prev_match = 'N',
                replace_all = '<leader><cr>',
            },
        }
    },
    {
        'hrsh7th/nvim-insx',
        config = function() require('insx.preset.standard').setup() end,
        event = 'InsertEnter',
    },
    {
        'RaafatTurki/hex.nvim',
        config = true,
        cmd = 'HexToggle'
    },
    {
        'glacambre/firenvim',
        build = function()
            vim.fn['firenvim#install'](0)
        end,
        lazy = not vim.g.started_by_firenvim,
        config = function()
            vim.g.firenvim_config = {
                globalSettings = { alt = 'all' },
                localSettings = {
                    ['.*'] = {
                        cmdline  = 'neovim',
                        content  = 'text',
                        priority = 0,
                        selector = 'textarea',
                        takeover = 'always'
                    }
                }
            }
        end,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end,
        keys = {
            { 'gc', mode = { 'n', 'v' } },
            { 'gb', mode = 'v' },
        }
    },
    {
        'danymat/neogen',
        cmd = 'Neogen',
        opts = {
            snippet_engine = 'luasnip',
            enabled = true,
            languages = {
                cs = { template = { annotation_convention = 'xmldoc', } },
            }
        },
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { { 'nvim-lua/plenary.nvim' } },
        keys = {
            { '<leader>a', function() require('harpoon'):list():append() end },
            { '<C-e>',     function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end },
            { '<C-h>',     function() require('harpoon'):list():select(1) end },
            { '<C-j>',     function() require('harpoon'):list():select(2) end },
            { '<C-k>',     function() require('harpoon'):list():select(3) end },
            { '<C-l>',     function() require('harpoon'):list():select(4) end },
            -- Toggle previous & next buffers stored within Harpoon list
            { '<C-M-H>',   function() require('harpoon'):list():prev() end },
            { '<C-M-L>',   function() require('harpoon'):list():next() end },
        },
        config = true
    },
    {
        'LunarVim/bigfile.nvim',
        lazy = false
    },
    {
        'benlubas/wrapping-paper.nvim',
        keys = {
            {
                'gww', -- see :h gw to figure out why this makes sense.
                function() require('wrapping-paper').wrap_line() end,
                desc = 'fake wrap current line'
            }
        },
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
    },
    {
        '3rd/image.nvim',
        config = true,
        event = 'VeryLazy'
    },
    {
        'folke/todo-comments.nvim',
        config = true,
        event = 'VeryLazy'
    },
    {
        'mistricky/codesnap.nvim',
        build = 'make build_generator',
        cmd = 'CodeSnap',
        opts = {
            mac_window_bar = true,
            title = '',
            code_font_family = 'Monaspace Radon',
            watermark = '',
        }
    },
    {
        'NStefan002/screenkey.nvim',
        cmd = 'Screenkey',
        config = true,
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = true,

        dependencies = {
            {
                'antosha417/nvim-lsp-file-operations',
                requires = {
                    'nvim-lua/plenary.nvim',
                },
                main = 'lsp-file-operations',
                config = true,
            },
        },
        cmd = 'NvimTreeToggle'
    },
    {
        'onsails/lspkind.nvim',
        opts = {
            preset = 'codicons',
            mode = 'symbol',
            symbol_map = {
                Text = '',
                -- Method = '',
                -- Function = '',
                Constructor = '',
            },
        },
        config = function(_, opts)
            require('lspkind').init(opts)
        end,
    },
    {
        'nvimdev/lspsaga.nvim',
        event = 'LspAttach',
        opts = {
            lightbulb = { virtual_text = false },
            border = 'rounded',
            rename = { in_select = false },
            code_action = { show_server_name = true },
            symbol_in_winbar = {
                enable = false,
                respect_root = true,
                separator = ' > ',
            },
            ui = {
                theme = 'round',
                border = 'rounded',
                winblend = vim.g.neovide and 60 or 0,
            },
            diagnostic = { on_insert = false }
        },
        config = function(_, opts)
            opts.ui.kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind()
            opts.ui.kind['Folder'] = { '', 'NONE' }
            require('lspsaga').setup(opts)
        end
    },
    {
        'chrisgrieser/nvim-lsp-endhints',
        event = 'LspAttach',
        opts = {}, -- required, even if empty
    },
    {
        'kevinhwang91/nvim-ufo',
        event = 'LspAttach',
        opts = {
            open_fold_hl_timeout = 0,
            -- close_fold_kinds = { 'imports', 'regions' }
        }
    },
    {
        'henry-hsieh/riscv-asm-vim',
        ft = 'riscv_asm',
    },
    {
        'rasulomaroff/reactive.nvim',
        event = 'VeryLazy',
        opts = {
            load = { 'catppuccin-mocha-cursor', 'catppuccin-mocha-cursorline' }
        }
    },
}
