return {
    {
        'rebelot/heirline.nvim',
        lazy = false,
        config = function()
            require('heirline').setup {
                statusline = require('plugins.line.status')
            }
        end,
    },
    require(... .. '.tab'),
    require(... .. '.win'),
}
