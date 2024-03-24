return {
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
    -- {
    --     'giusgad/pets.nvim',
    --     dependencies = { 'MunifTanjim/nui.nvim', 'giusgad/hologram.nvim' },
    --     event = 'VeryLazy',
    --     config = {
    --         row = 1,            -- the row (height) to display the pet at (higher row means the pet is lower on the screen), must be 1<=row<=10
    --         col = 0,            -- the column to display the pet at (set to high number to have it stay still on the right side)
    --         speed_multiplier = 1, -- you can make your pet move faster/slower. If slower the animation will have lower fps.
    --         default_pet = 'dog', -- the pet to use for the PetNew command
    --         default_style = 'brown', -- the style of the pet to use for the PetNew command
    --         random = true,      -- whether to use a random pet for the PetNew command, overrides default_pet and default_style
    --         death_animation = true, -- animate the pet's death, set to false to feel less guilt -- currently no animations are available
    --         popup = {           -- popup options, try changing these if you see a rectangle around the pets
    --             width = '30%',  -- can be a string with percentage like "45%" or a number of columns like 45
    --             winblend = 100, -- winblend value - see :h 'winblend' - only used if avoid_statusline is false
    --             hl = { Normal = 'Normal' }, -- hl is only set if avoid_statusline is true, you can put any hl group instead of "Normal"
    --             avoid_statusline = true, -- if winblend is 100 then the popup is invisible and covers the statusline, if that
    --             -- doesn't work for you then set this to true and the popup will use hl and will be spawned above the statusline (hopefully)
    --         }
    --     }
    -- },
    require(... .. '.dial'),
    require(... .. '.motion'),
}
