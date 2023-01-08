return {
    {
        'xorid/asciitree.nvim',
        cmd = { 'AsciiTree', 'AsciiTreeUndo' }
    },
        {
        'krady21/compiler-explorer.nvim',
        cmd = 'CECompile'
    },
    {
        'samjwill/nvim-unception',
        event = 'VeryLazy',
    },
    {
        '0x100101/lab.nvim',
        build = 'cd js && npm ci',
        config = true
    },
    {
        'nacro90/numb.nvim',
        event = 'VeryLazy',
        config = true
    },
    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime'
    },
    {
        'narutoxy/silicon.lua',
        config = true
    },
    {
        'barrett-ruth/import-cost.nvim',
        build = 'sh install.sh yarn',
        event = 'VeryLazy',
        config = true
    }
}
