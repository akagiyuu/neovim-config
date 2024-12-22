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
        lazy = false,
        dependencies = 'MunifTanjim/nui.nvim',
        config = function()
            require('competitest').setup {
                testcases_use_single_file = true,
            }
        end,
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
        'GCBallesteros/jupytext.nvim',
        lazy = false,
        opts = {
            style = 'markdown',
            output_extension = 'md',
            force_ft = 'markdown',
        }
    },

    {
        'benlubas/molten-nvim',
        version = '^1.0.0',
        ft = { 'quarto', 'markdown', 'ipynb' },
        dependencies = {
            '3rd/image.nvim',
            {
                'quarto-dev/quarto-nvim',
                dependencies = {
                    'nvim-treesitter/nvim-treesitter',
                },
                opts = {
                    lspFeatures = {
                        enabled = true,
                        languages = { 'r', 'python', 'rust' },
                        chunks = 'all',
                        diagnostics = {
                            enabled = true,
                            triggers = { 'BufWritePost' },
                        },
                        completion = {
                            enabled = true,
                        },
                    },
                    keymap = {
                        hover = 'H',
                        definition = 'gd',
                        rename = '<leader>rn',
                        references = 'gr',
                        format = '<leader>fm',
                    },
                    codeRunner = {
                        enabled = true,
                        default_method = 'molten',
                    },
                }
            },
        },
        build = ':UpdateRemotePlugins',
        config = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = 'image.nvim'
            vim.g.molten_output_win_max_height = 20
            vim.g.molten_virt_text_output = true
            vim.g.molten_virt_lines_off_by_1 = true
            vim.keymap.set('n', '<localleader>e', ':MoltenEvaluateOperator<CR>',
                { desc = 'evaluate operator', silent = true })
            vim.keymap.set('n', '<localleader>os', ':noautocmd MoltenEnterOutput<CR>',
                { desc = 'open output window', silent = true })
            vim.keymap.set('n', '<localleader>rr', ':MoltenReevaluateCell<CR>', { desc = 're-eval cell', silent = true })
            vim.keymap.set('v', '<localleader>r', ':<C-u>MoltenEvaluateVisual<CR>gv',
                { desc = 'execute visual selection', silent = true })
            vim.keymap.set('n', '<localleader>oh', ':MoltenHideOutput<CR>',
                { desc = 'close output window', silent = true })
            vim.keymap.set('n', '<localleader>md', ':MoltenDelete<CR>', { desc = 'delete Molten cell', silent = true })

            -- if you work with html outputs:
            vim.keymap.set('n', '<localleader>mx', ':MoltenOpenInBrowser<CR>',
                { desc = 'open output in browser', silent = true })
            local runner = require('quarto.runner')
            vim.keymap.set('n', '<localleader>rc', runner.run_cell, { desc = 'run cell', silent = true })
            vim.keymap.set('n', '<localleader>ra', runner.run_above, { desc = 'run cell and above', silent = true })
            vim.keymap.set('n', '<localleader>rA', runner.run_all, { desc = 'run all cells', silent = true })
            vim.keymap.set('n', '<localleader>rl', runner.run_line, { desc = 'run line', silent = true })
            vim.keymap.set('v', '<localleader>r', runner.run_range, { desc = 'run visual range', silent = true })
            vim.keymap.set('n', '<localleader>RA', function()
                runner.run_all(true)
            end, { desc = 'run all cells of all languages', silent = true })
        end,
    },
}
