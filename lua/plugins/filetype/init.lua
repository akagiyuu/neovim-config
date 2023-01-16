return {
    {
        'kevinhwang91/nvim-bqf',
        event = 'VeryLazy',
    },
    'Hoffs/omnisharp-extended-lsp.nvim',
    {
        'barrett-ruth/import-cost.nvim',
        build = 'sh install.sh yarn',
        ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
        config = true
    },
    require(... .. '.markdown'),
    require(... .. '.neorg')
}
