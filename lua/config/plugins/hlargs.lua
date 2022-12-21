return {
    'm-demare/hlargs.nvim',
    event = 'VeryLazy',
    config = function()
        require('hlargs').setup {
            use_colorpalette = true,
        }
    end
}
