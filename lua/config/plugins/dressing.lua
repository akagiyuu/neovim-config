return {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    config = function()
        require('dressing').setup {
            input = {
                prompt_align = 'center',
            },
        }
    end
}
