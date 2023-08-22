return {
    {
        'andrewferrier/debugprint.nvim',
        config = true,
        keys = { { 'g?', nil } },
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
        cmd = 'HexToggle'
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
        }
    },
    require(... .. '.dial'),
    require(... .. '.motion'),
}
