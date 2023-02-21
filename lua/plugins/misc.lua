return {
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
        'm-demare/hlargs.nvim',
        event = 'VeryLazy',
        opts = { use_colorpalette = true }
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
        'RaafatTurki/hex.nvim',
        config = true,
    },
    {
        'andrewferrier/debugprint.nvim',
        config = true,
        keys = { { 'g?', nil } },
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
        config = function() require('insx.preset.standard').setup() end,
        event = 'InsertEnter',
    },
    {
        'gen740/SmoothCursor.nvim',
        opts = {
            cursor = '',
            fancy = {
                enable = true,
                head = { cursor = '', texthl = 'SmoothCursor', linehl = nil }
            },
            type = 'exp',
            disable_float_win = true,
        },
        config = function(_, opts)
            require('smoothcursor').setup(opts)
            vim.api.nvim_create_autocmd({ 'ModeChanged' }, {
                callback = function()
                    local current_mode = vim.fn.mode()
                    if current_mode == 'n' then
                        vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })
                        vim.fn.sign_define('smoothcursor', { text = '' })
                    elseif current_mode == 'v' then
                        vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
                        vim.fn.sign_define('smoothcursor', { text = '' })
                    elseif current_mode == 'V' then
                        vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
                        vim.fn.sign_define('smoothcursor', { text = '' })
                    elseif current_mode == '�' then
                        vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
                        vim.fn.sign_define('smoothcursor', { text = '' })
                    elseif current_mode == 'i' then
                        vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#668aab' })
                        vim.fn.sign_define('smoothcursor', { text = '' })
                    end
                end,
            })
        end,
        event = 'VeryLazy',
    },
    {
        'tjdevries/sg.nvim',
        build = 'cargo build --workspace',
        opts = { on_attach = require('plugins.lsp.config.on_attach') },
    },
    {
        'antosha417/nvim-lsp-file-operations',
        requires = { 'plenary.nvim' },
        config = true
    },
    {
        'kyazdani42/nvim-tree.lua',
        keys = { { '<leader>nt', '<cmd>NvimTreeToggle<CR>', silent = true, desc = 'Toggle nvim-tree' } },
        dependencies = { 'nvim-lsp-file-operations' },
        opts = {
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
                    glyphs = {
                        folder = {
                            arrow_closed = '', -- arrow when folder is closed
                            arrow_open = '', -- arrow when folder is open
                        },
                    }
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
    },
    {
        'glacambre/firenvim',
        build = function() vim.fn['firenvim#install'](0) end,
        config = function()
            vim.cmd [[
                let g:firenvim_config = {
                    \ 'globalSettings': {
                        \ 'alt': 'all',
                    \  },
                    \ 'localSettings': {
                        \ '.*': {
                            \ 'cmdline': 'neovim',
                            \ 'content': 'text',
                            \ 'priority': 0,
                            \ 'selector': 'textarea',
                            \ 'takeover': 'never',
                        \ },
                    \ }
                \ }
            ]]
        end,

        -- Lazy load firenvim
        -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
        cond = not not vim.g.started_by_firenvim,
        lazy = false,
    },
    {
        'giusgad/pets.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'edluffy/hologram.nvim' },
        opts = {
            death_animation = false,
            random = true,
        },
        cond = not vim.g.neovide,
        cmd = 'PetsNew'
    },
    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
}
