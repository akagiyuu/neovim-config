return {
    require(... .. '.inlayhint'),
    require(... .. '.kind'),
    require(... .. '.lspsaga'),
    require(... .. '.ufo'),
    require(... .. '.refactoring'),
    require(... .. '.null-ls'),
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
    -- {
    --     'adoyle-h/lsp-toggle.nvim',
    --     cmd = { 'ToggleLSP', 'ToggleNullLSP' },
    --     config = true
    -- },
}
