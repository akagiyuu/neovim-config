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
    {
        'williamboman/mason.nvim',
        opts = {
            ui = {
                border = 'rounded',
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗'
                }
            },
            pip = {
                upgrade_pip = true,
            }
        },
    },
    {
        'ThePrimeagen/refactoring.nvim',
        config = true,
        opts = {
            prompt_func_return_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
            -- prompt for function parameters
            prompt_func_param_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
        },
        keys = {
            {
                '<leader>rr',
                function() require('refactoring').select_refactor() end,
                mode = 'v',
                expr = false,
                desc = 'Refactor selector',
            },
        }
    },
    require(... .. '.lsp'),
    require(... .. '.cmp'),
    require(... .. '.dap'),
    require(... .. '.lint'),
    require(... .. '.format'),
}
