return {
    { 'nvim-lua/plenary.nvim',      lazy = false },
    { 'MunifTanjim/nui.nvim',       lazy = false },
    { 'kevinhwang91/promise-async', lazy = false },
    { 'ii14/emmylua-nvim' },
    {
        'vhyrro/luarocks.nvim',
        priority = 1000,
        lazy = false,
        opts = {
            rocks = { 'magick' },
        },
    }
}
