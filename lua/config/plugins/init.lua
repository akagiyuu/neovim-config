return {
    --#region Library
    { 'nvim-lua/plenary.nvim' },
    { 'MunifTanjim/nui.nvim' },
    { 'kevinhwang91/promise-async' },
    { 'ii14/emmylua-nvim' },
    --#endregion

    --#region Themes
    { 'rebelot/kanagawa.nvim' },
    --#endregion

    { 'kyazdani42/nvim-web-devicons' },

    --#region Sidebar
    --#endregion

    --#region Treesitter
    { 'nvim-treesitter/playground' },
    --#endregion

    --#region Text object
    {
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        config = function() require('nvim-surround').setup {} end,
    },
    --#endregion
    --#region Git
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = function() require('gitsigns').setup {} end,
    },
    {
        'sindrets/diffview.nvim',
        cmd = 'DiffviewOpen'
    },
    --#endregion

    --#region Lsp
    {
        'hrsh7th/cmp-nvim-lsp',
        lazy = false
    },
    {
        'smjonas/inc-rename.nvim',
        cmd = 'IncRename',
        config = function() require('inc_rename').setup() end,
    },
    {
        'adoyle-h/lsp-toggle.nvim',
        cmd = { 'ToggleLSP', 'ToggleNullLSP' },
        config = function() require('lsp-toggle').setup {} end,
    },
    {
        'Maan2003/lsp_lines.nvim',
        event = 'VeryLazy',
        config = function() require('lsp_lines').setup() end,
    },
    --#endregion

    {
        'xorid/asciitree.nvim',
        cmd = { 'AsciiTree', 'AsciiTreeUndo' }
    },
    --#region Comment
    {
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        config = function() require('Comment').setup {} end,
    },
    {
        'LudoPinelli/comment-box.nvim',
        event = 'VeryLazy',
    },
    {
        'superhawk610/ascii-blocks.nvim',
        cmd = 'AsciiBlockify'
    },
    --#endregion

    {
        'folke/trouble.nvim',
        event = 'VeryLazy',
        config = function() require('trouble').setup {} end,
    },
    --#region Misc
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
        config = function() require('lab').setup {} end,
    },
    {
        'max397574/colortils.nvim',
        cmd = 'Colortils',
        config = function() require('colortils').setup {} end,
    },
    {
        'levouh/tint.nvim',
        event = 'VeryLazy',
        config = function() require('tint').setup {} end,
    },
    {
        'Pocco81/true-zen.nvim',
        event = 'VeryLazy',
        config = function() require('true-zen').setup {} end
    },
    {
        'nvim-zh/colorful-winsep.nvim',
        event = 'VeryLazy',
        config = function() require('colorful-winsep').setup {} end,
    },
    {
        'nacro90/numb.nvim',
        event = 'VeryLazy',
        config = function() require('numb').setup {} end,
    },
    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime'
    },
    {
        'narutoxy/silicon.lua',
        config = function() require('silicon').setup {} end,
    },
    --#endregion

    --#region Language specific
    { 'Hoffs/omnisharp-extended-lsp.nvim' },
    {
        'AckslD/nvim-FeMaco.lua',
        ft = 'markdown',
        config = function() require('femaco').setup() end,
    },
    {
        'toppair/peek.nvim',
        ft = 'markdown',
        build = 'deno task --quiet build:fast',
        config = function() require('peek').setup() end,
    },
    --#endregion
    -- {
    --     'tamton-aquib/flirt.nvim',
    --     event = 'VeryLazy',
    --     config = function() require("flirt").setup() end
    -- }
}
