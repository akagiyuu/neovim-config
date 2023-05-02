return {
    'rebelot/heirline.nvim',
    lazy = false,
    opts = {
        statusline = ... .. '.statusline',
        colors = ... .. '.colors'
    },
    config = function(_, opts)
        require('heirline').setup {
            statusline = require(opts.statusline),
        }
        require(opts.colors)
    end,
}
