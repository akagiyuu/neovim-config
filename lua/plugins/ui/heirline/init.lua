return {
    'rebelot/heirline.nvim',
    lazy = false,
    config = function()
        require('heirline').setup {
            statusline = require('plugins.ui.heirline.statusline'),
        }
    end,
}
