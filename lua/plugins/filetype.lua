return {
    {
        'toppair/peek.nvim',
        ft = 'markdown',
        build = 'deno task --quiet build:fast',
        config = function()
            require('peek').setup {
                app = 'firefox'
            }
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end
    },
    {
        'MeanderingProgrammer/markdown.nvim',
        name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
        ft = 'markdown',
        config = true
    },
    {
        'kaarmu/typst.vim',
        ft = 'typst',
    }
}
