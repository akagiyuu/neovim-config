return {
    {
        'xorid/asciitree.nvim',
        cmd = { 'AsciiTree', 'AsciiTreeUndo' }
    },
    {
        'krady21/compiler-explorer.nvim',
        cmd = 'CECompile'
    },
    {
        '0x100101/lab.nvim',
        build = 'cd js && npm ci',
        config = true
    },
    {
        'nacro90/numb.nvim',
        event = 'VeryLazy',
        config = true
    },
    {
        'narutoxy/silicon.lua',
        config = true
    },
    {
        'm-demare/hlargs.nvim',
        event = 'VeryLazy',
        config = { use_colorpalette = true }
    },
    {
        'cbochs/portal.nvim',
        keys = {
            { '<leader>o', function() require('portal').jump_backward() end, desc = 'Jump backward' },
            { '<leader>i', function() require('portal').jump_forward() end,  desc = 'Jump forward' }
        },
        config = {
            portal = {
                title = {
                    options = {
                        style = 'minimal',
                        border = 'rounded',
                    },
                },

                body = {
                    options = {
                        border = 'rounded',
                    },
                },
            },
        }
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
        config = {
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
        'RaafatTurki/hex.nvim',
        config = true,
        cmd = 'HexToggle'
    },
    {
        'andrewferrier/debugprint.nvim',
        config = true,
        event = 'VeryLazy'
    },
    {
        'toppair/reach.nvim',
        keys = {
            {
                '<leader>b',
                function() require('reach').buffers { show_current = true } end,
            },
        },
        config = true
    },
    {
        'andymass/vim-matchup',
        lazy = false
    },
    {
        'hrsh7th/nvim-insx',
        config = function()
            require('insx.preset.standard').setup()
        end,
        event = 'VeryLazy'
    },
    {
        'zdcthomas/yop.nvim',
        config = function()
            local function search(lines)
                -- Multiple lines can't be searched for
                if #lines > 1 then
                    return
                end
                require('telescope.builtin').grep_string { search = lines[1] }
            end

            require('yop').op_map({ 'n', 'v' }, '<leader>fs', search)
        end,
        event = 'VeryLazy'
    },
    {
        'gen740/SmoothCursor.nvim',
        config = function()
            require('smoothcursor').setup {
                fancy = { enable = true },
                type = 'exp',
                speed = 25,
            }
        end,
        event = 'VeryLazy',
    },
    {
        'tjdevries/sg.nvim',
        build = 'cargo build --workspace',
        config = {
            on_attach = require('plugins.lsp.config.on_attach')
        }
    },
    {
        'jcdickinson/codeium.nvim',
        config = true,
        event = 'VeryLazy'
    },
    {
        'kyazdani42/nvim-tree.lua',
        keys = { { '<leader>nt', '<cmd>NvimTreeToggle<CR>', silent = true, desc = 'Toggle nvim-tree' } },
        config = {
            hijack_cursor = true,
            filesystem_watchers = {
                enable = true,
            },
            view = {
                preserve_window_proportions = true,
                -- float = { enable = true }
                -- signcolumn = 'no',
                mappings = {
                    custom_only = false,
                    list = {
                        { key = 'l', action = 'edit' },
                        { key = 'h', action = 'close_node' },
                    }
                },
            },
            renderer = {
                highlight_opened_files = 'name',
                group_empty = true,
                highlight_git = true,
                indent_markers = { enable = true },
                icons = {
                    git_placement = 'after',
                    symlink_arrow = ' ',
                }
            },
            actions = { open_file = { resize_window = true } },
        }
    },
    {
        'akinsho/toggleterm.nvim',
        dependencies = { 'samjwill/nvim-unception' },
        keys = { { '<C-\\>', '<cmd>ToggleTerm<CR>', 'Toggle terminal' } },
        config = true,
    }
    --     {
    --         'JosefLitos/reform.nvim',
    --         event = 'VeryLazy',
    --         config = true,
    --         build = 'make docfmt',
    --     }
}
