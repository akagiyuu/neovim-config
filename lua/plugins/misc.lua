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
        'akinsho/toggleterm.nvim',
        dependencies = { 'samjwill/nvim-unception' },
        keys = { { '<C-\\>', '<cmd>ToggleTerm<CR>', 'Toggle terminal' } },
        config = true,
    },
    {
        'glacambre/firenvim',
        cond = not not vim.g.started_by_firenvim,
        build = function()
            require('lazy').load { plugins = 'firenvim', wait = true }
            vim.fn['firenvim#install'](0)
        end,
        lazy = false,
        config = function()
            vim.g.firenvim_config = {
                globalSettings = { alt = 'all' },
                localSettings = {
                    ['.*'] = {
                        cmdline  = 'neovim',
                        content  = 'text',
                        priority = 0,
                        selector = 'textarea',
                        takeover = 'never'
                    }
                }
            }
        end,
    },
    {
        'mbbill/undotree',
        cmd = 'UndotreeToggle'
    },
    -- {
    --     "shell-Raining/hlchunk.nvim",
    --     config = true,
    --     event = 'VeryLazy'
    -- }
}
