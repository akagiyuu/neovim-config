return {
    'utilyre/barbecue.nvim',
    event = 'VeryLazy',
    dependencies = {
        {
            'SmiteshP/nvim-navic',
            opts = { highlight = true },
        }
    },
    opts = {
        theme = 'catppuccin',
        show_modified = true,
        -- symbols = {
        --     separator = " ",
        -- }
    }
}
