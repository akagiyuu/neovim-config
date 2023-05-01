return {
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
        'LudoPinelli/comment-box.nvim',
        disabled = true,
        -- event = 'VeryLazy',
    },
    {
        'superhawk610/ascii-blocks.nvim',
        cmd = 'AsciiBlockify'
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
}
