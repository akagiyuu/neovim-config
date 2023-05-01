return {
    {
        'andrewferrier/debugprint.nvim',
        config = true,
        keys = { { 'g?', nil } },
    },
    {
        'nacro90/numb.nvim',
        event = 'VeryLazy',
        config = true
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
        'mbbill/undotree',
        cmd = 'UndotreeToggle'
    },
    {
        'RaafatTurki/hex.nvim',
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
    require(... .. '.comment'),
    require(... .. '.dial'),
    require(... .. '.motion'),
}
