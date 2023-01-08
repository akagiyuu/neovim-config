return {
    require(... .. '.inlayhint'),
    require(... .. '.kind'),
    require(... .. '.lspsaga'),
    require(... .. '.refactoring'),
    {
        'Maan2003/lsp_lines.nvim',
        event = 'VeryLazy',
        config = true
    },
    {
        'smjonas/inc-rename.nvim',
        cmd = 'IncRename',
        config = true
    },
    {
        'folke/trouble.nvim',
        event = 'VeryLazy',
        config = true
    },
}
