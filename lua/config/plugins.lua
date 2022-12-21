return {
    --#region Library
    { 'nvim-lua/plenary.nvim' },
    { 'MunifTanjim/nui.nvim' },
    { 'kevinhwang91/promise-async' },
    { 'ii14/emmylua-nvim' },
    --#endregion

    --#region Themes
    {
        'rebelot/kanagawa.nvim',
    },
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
    { 'sindrets/diffview.nvim', event = 'VeryLazy' },
    --#endregion

    --#region Lsp
    {
        'hrsh7th/cmp-nvim-lsp',
        lazy = false
    },
    {
        'smjonas/inc-rename.nvim',
        event = 'VeryLazy',
        config = function() require('inc_rename').setup() end,
    },
    {
        'adoyle-h/lsp-toggle.nvim',
        event = 'VeryLazy',
        config = function() require('lsp-toggle').setup {} end,
    },
    {
        'Maan2003/lsp_lines.nvim',
        event = 'VeryLazy',
        config = function() require('lsp_lines').setup() end,
    },
    --#endregion

    {
        'rafamadriz/friendly-snippets',
        lazy = false,
    },

    { 'xorid/asciitree.nvim', event = 'VeryLazy' },

    --#region Comment
    {
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        config = function() require('Comment').setup {} end,
    },
    { 'LudoPinelli/comment-box.nvim', event = 'VeryLazy' },
    { 'superhawk610/ascii-blocks.nvim', event = 'VeryLazy' },
    --#endregion

    {
        'folke/trouble.nvim',
        event = 'VeryLazy',
        config = function() require('trouble').setup {} end,
    },
    --#region Misc
    { 'kevinhwang91/nvim-bqf', event = 'VeryLazy' },
    { 'ggandor/lightspeed.nvim', event = 'VeryLazy' },
    { 'krady21/compiler-explorer.nvim', event = 'VeryLazy' },
    { 'samjwill/nvim-unception', event = 'VeryLazy' },
    -- {
    --     '0x100101/lab.nvim',
    --     build = 'cd js && npm ci',
    --     lazy = true,
    --     config = function() require('lab').setup {} end,
    -- },
    {
        'max397574/colortils.nvim',
        event = 'VeryLazy',
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
    { 'dstein64/vim-startuptime', event = 'VeryLazy' },
    {
        'narutoxy/silicon.lua',
        event = 'VeryLazy',
        config = function() require('silicon').setup {} end,
    },
    --#endregion

    --#region Language specific
    { 'Hoffs/omnisharp-extended-lsp.nvim' },
    {
        'AckslD/nvim-FeMaco.lua',
        event = 'VeryLazy',
        config = function() require('femaco').setup() end,
    },
    {
        'toppair/peek.nvim',
        event = 'VeryLazy',
        build = 'deno task --quiet build:fast',
        config = function() require('peek').setup() end,
    },
    --#endregion
}
