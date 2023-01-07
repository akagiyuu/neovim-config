return {
    { 'nvim-lua/plenary.nvim' },
    { 'MunifTanjim/nui.nvim' },
    { 'kevinhwang91/promise-async' },
    { 'ii14/emmylua-nvim' },
    { 'rebelot/kanagawa.nvim' },
    {
        'kyazdani42/nvim-web-devicons',
        lazy = false,
    },
    { 'nvim-treesitter/playground' },
    {
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        config = true
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = true
    },
    {
        'sindrets/diffview.nvim',
        cmd = 'DiffviewOpen'
    },
    {
        'smjonas/inc-rename.nvim',
        cmd = 'IncRename',
        config = true
    },
    -- {
    --     'adoyle-h/lsp-toggle.nvim',
    --     cmd = { 'ToggleLSP', 'ToggleNullLSP' },
    --     config = true
    -- },
    {
        'Maan2003/lsp_lines.nvim',
        event = 'VeryLazy',
        config = true
    },
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
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    {
        'LudoPinelli/comment-box.nvim',
        event = 'VeryLazy',
    },
    {
        'superhawk610/ascii-blocks.nvim',
        cmd = 'AsciiBlockify'
    },
    {
        'folke/trouble.nvim',
        event = 'VeryLazy',
        config = true
    },
    {
        'kevinhwang91/nvim-bqf',
        event = 'VeryLazy',
    },
    {
        'ggandor/lightspeed.nvim',
        event = 'VeryLazy',
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
    {
        'max397574/colortils.nvim',
        cmd = 'Colortils',
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
    'Hoffs/omnisharp-extended-lsp.nvim',
    {
        'AckslD/nvim-FeMaco.lua',
        ft = 'markdown',
        config = true
    },
    {
        'toppair/peek.nvim',
        ft = 'markdown',
        build = 'deno task --quiet build:fast',
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
