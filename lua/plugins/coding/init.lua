return {
    {
        'krady21/compiler-explorer.nvim',
        cmd = 'CECompile'
    },
    {
        '0x100101/lab.nvim',
        build = 'cd js && npm ci',
        config = true
    },
    require(... .. '.lsp'),
    require(... .. '.cmp'),
    require(... .. '.dap'),
    require(... .. '.null-ls'),
    require(... .. '.refactoring'),
    require(... .. '.mason'),
}
