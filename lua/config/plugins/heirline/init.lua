return {
    'rebelot/heirline.nvim',
    event = 'VeryLazy',
    config = function() require('config.plugins.heirline.generate') end,
}
