return {
    require(... .. '.inlayhint'),
    require(... .. '.kind'),
    require(... .. '.lspsaga'),
    require(... .. '.ufo'),
    require(... .. '.refactoring'),
    require(... .. '.null-ls'),
    require(... .. '.mason'),
    {
        'Maan2003/lsp_lines.nvim',
        config = true
    },
    {
        'smjonas/inc-rename.nvim',
        cmd = 'IncRename',
        config = true
    },
    {
        'folke/trouble.nvim',
        cmd = 'Touble',
        config = true
    },
    -- {
    --     'adoyle-h/lsp-toggle.nvim',
    --     cmd = { 'ToggleLSP', 'ToggleNullLSP' },
    --     config = true
    -- },
}
