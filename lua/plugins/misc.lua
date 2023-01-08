return {
    -- {
    --     'adoyle-h/lsp-toggle.nvim',
    --     cmd = { 'ToggleLSP', 'ToggleNullLSP' },
    --     config = true
    -- },

    {
        'xorid/asciitree.nvim',
        cmd = { 'AsciiTree', 'AsciiTreeUndo' }
    },
    {
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        config = function()
            require('Comment').setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end
    },
    {
        'LudoPinelli/comment-box.nvim',
        event = 'VeryLazy',
    },
    {
        'superhawk610/ascii-blocks.nvim',
        cmd = 'AsciiBlockify'
    },
    {
        'krady21/compiler-explorer.nvim',
        cmd = 'CECompile'
    },
    {
        'samjwill/nvim-unception',
        event = 'VeryLazy',
    },
    {
        '0x100101/lab.nvim',
        build = 'cd js && npm ci',
        config = true
    },
    -- {
    --     'levouh/tint.nvim',
    --     event = 'VeryLazy',
    --     config = true,
    -- },
    -- {
    --     'Pocco81/true-zen.nvim',
    --     cmd = {
    --         'TZFocus',
    --         'TZNarrow',
    --         'TZAtaraxis',
    --         'TZMinimalist'
    --     },
    --     config = true
    -- },
    -- {
    --     'nvim-zh/colorful-winsep.nvim',
    --     event = 'VeryLazy',
    --     config = true
    -- },
    {
        'nacro90/numb.nvim',
        event = 'VeryLazy',
        config = true
    },
    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime'
    },
    {
        'narutoxy/silicon.lua',
        config = true
    },
    {
        'barrett-ruth/import-cost.nvim',
        build = 'sh install.sh yarn',
        event = 'VeryLazy',
        config = true
    }
    -- {
    --     'tamton-aquib/flirt.nvim',
    --     event = 'VeryLazy',
    --     config = function() require("flirt").setup() end
    -- }
}
