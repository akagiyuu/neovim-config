return {
    'utilyre/barbecue.nvim',
    event = 'VeryLazy',
    dependencies = {
        {
            'SmiteshP/nvim-navic',
            config = {
                highlight = true
            }
        }
    },
    config = function()
        require('barbecue').setup {
            theme = 'catppuccin',
            show_modified = true,
            -- symbols = {
            --     separator = " ",
            -- }
        }
    end
}
