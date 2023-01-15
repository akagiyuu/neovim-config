return {
    {
        'kevinhwang91/nvim-bqf',
        event = 'VeryLazy',
    },
    'Hoffs/omnisharp-extended-lsp.nvim',
    {
        'AckslD/nvim-FeMaco.lua',
        ft = 'markdown',
        config = true
    },
    {
        'toppair/peek.nvim',
        ft = 'markdown',
        build = 'deno task --quiet build:fast',
        config = true
    },
    {
        'barrett-ruth/import-cost.nvim',
        build = 'sh install.sh yarn',
        ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
        config = true
    },
    require(... .. '.neorg')
}
