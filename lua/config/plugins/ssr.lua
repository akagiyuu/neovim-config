return {
    'cshuaimin/ssr.nvim',
    keys = {
        {
            '<leader>sr',
            function() require('ssr').open() end,
            { 'n', 'x' },
            desc = 'Structure search and replace',
        },
    },
    config = {
        min_width = 50,
        min_height = 5,
        keymaps = {
            close = 'q',
            next_match = 'n',
            prev_match = 'N',
            replace_all = '<leader><cr>',
        },
    }
}
