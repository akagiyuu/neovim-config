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
        'brenoprata10/nvim-highlight-colors',
        lazy = false,
        opts = {
            render = 'virtual',
        },
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            preset = 'modern',
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
        -- event = 'VeryLazy',
        opts = {
            integrations = {},                        -- do whatever you want with image.nvim's integrations
            max_width = 100,                          -- tweak to preference
            max_height = 12,                          -- ^
            max_height_window_percentage = math.huge, -- this is necessary for a good experience
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
        },

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
        'nvzone/showkeys',
        cmd = 'ShowkeysToggle',
        opts = {
            timeout = 1,
            maxkeys = 10,
        }
    },
    {
        'rachartier/tiny-inline-diagnostic.nvim',
        event = 'VeryLazy', -- Or `LspAttach`
        priority = 1000,    -- needs to be loaded in first
        opts = {
            preset = 'powerline',
            options = {
                multilines = true,
                multiple_diag_under_cursor = true,
                show_all_diags_on_cursorline = true,
            }
        }
    },
    {
        'saecki/crates.nvim',
        event = { 'BufRead Cargo.toml' },
        opts = {
            completion = {
                cmp = {
                    enabled = true,
                    use_custom_kind = true,
                },
                crates = {
                    enabled = true,
                    max_results = 8, -- The maximum number of search results to display
                    min_chars = 3    -- The minimum number of charaters to type before completions begin appearing
                }
            },
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
        }
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
        enabled = false,
        -- event = 'VeryLazy',
        opts = {
            load = { 'catppuccin-mocha-cursor', 'catppuccin-mocha-cursorline' }
        }
    },
    {
        'xeluxee/competitest.nvim',
        cmd = { 'CompetiTest' },
        opts = {
            runner_ui = {
                testcases_use_single_file = true,
                interface = 'split',
            }
        }
    },
    {
        'nvim-neorg/neorg',
        ft = 'norg',
        cmd = 'Neorg',
        opts = {
            load = {
                ['core.defaults'] = {},
                ['core.completion'] = { config = { engine = 'nvim-cmp' } },
                ['core.concealer'] = {
                    config = {
                        icon_preset = 'diamond'
                    }
                },
                ['core.dirman'] = {
                    config = {
                        workspaces = {
                            note = '~/Documents/note',
                            todo = '~/Documents/todo',
                        },
                    }
                },
                ['core.export'] = {},
                ['core.summary'] = { config = { strategy = 'by_path' } },
                ['core.ui.calendar'] = {},
                ['core.todo-introspector'] = {},
                ['core.esupports.metagen'] = { config = { update_date = false } }, -- do not update date until https://github.com/nvim-neorg/neorg/issues/1579 fixed
            }
        },
    },
    {
        '0x00-ketsu/autosave.nvim',
        event = { 'InsertLeave' },
        opts = {
            prompt = {
                enable = false
            }
        }
    },
    {
        'sphamba/smear-cursor.nvim',
        -- lazy = false,
        opts = {
            smear_between_buffers = true,
            smear_between_neighbor_lines = true,
            scroll_buffer_space = true,
            legacy_computing_symbols_support = true,
        },
    },
    { 'kevinhwang91/nvim-bqf', ft = 'qf' },
    {
        'ThePrimeagen/refactoring.nvim',
        keys = {
            {
                '<leader>re',
                mode = 'x',
                desc = 'Extract function',
                function() require('refactoring').refactor('Extract Function') end
            },
            {
                '<leader>rf',
                mode = 'x',
                desc = 'Extract function to file',
                function() require('refactoring').refactor('Extract Function To File') end
            },
            {
                '<leader>rv',
                mode = 'x',
                desc = 'Extract variable',
                function() require('refactoring').refactor('Extract Variable') end
            },
            {
                '<leader>rI',
                mode = 'n',
                desc = 'Inline function',
                function() require('refactoring').refactor('Inline Function') end
            },
            {
                '<leader>ri',
                mode = { 'n', 'x' },
                desc = 'Inline variable',
                function() require('refactoring').refactor('Inline Variable') end
            },
            {
                '<leader>rb',
                mode = 'n',
                desc = 'Extract block',
                function() require('refactoring').refactor('Extract Block') end
            },
            {
                '<leader>rbf',
                mode = 'n',
                desc = 'Extract block to file',
                function() require('refactoring').refactor('Extract Block To File') end
            }
        }

    },
    {
        'vyfor/cord.nvim',
        build = './build || .\\build',
        event = 'VeryLazy',
        opts = {
            display = {
                show_time = true,            -- Display start timestamp
                show_repository = true,      -- Display 'View repository' button linked to repository url, if any
                show_cursor_position = true, -- Display line and column number of cursor's position
                swap_fields = false,         -- If enabled, workspace is displayed first
                swap_icons = false,          -- If enabled, editor is displayed on the main image
                workspace_blacklist = {},    -- List of workspace names that will hide rich presence
            },
        },                                   -- calls require('cord').setup()
    },
    {
        'marcussimonsen/let-it-snow.nvim',
        cmd = 'LetItSnow', -- Wait with loading until command is run
        opts = {},
    },
    {
        'chrisgrieser/nvim-rulebook',
        keys = {
            {
                '<leader>lri',
                desc = 'Ignore rule',
                function() require('rulebook').ignoreRule() end,
            },
            {
                '<leader>lrl',
                desc = 'Lookup rule',
                function() require('rulebook').lookupRule() end,
            },
        }
    },
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            indent = {
                enabled = true,
                char = '▏',
                scope = {
                    enabled = true, -- enable highlighting the current scope
                    char = '▏',
                    treesitter = { enabled = true },
                    underline = true, -- underline the start of the scope
                },
            },
            input = { enabled = true },
            -- notifier = {
            --     enabled = true,
            --     style = 'fancy',
            --     history = true,
            -- },
            quickfile = { enabled = true },
            -- scroll = { enabled = true },
        },
    },
    {
        'ptdewey/pendulum-nvim',
        event = 'VeryLazy',
        opts = {
            log_file = vim.fn.expand('$HOME/Documents/log.csv'),
        }
    },
    {
        'm4xshen/hardtime.nvim',
        event = 'VeryLazy',
        opts = {}
    },
}
