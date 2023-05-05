return {
    {
        'yioneko/nvim-vtsls',
        ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    },
    {
        'lvimuser/lsp-inlayhints.nvim',
        config = true
    },
    {
        'onsails/lspkind.nvim',
        opts = {
            preset = 'codicons',
            mode = 'symbol',
            symbol_map = {
                Text = '',
                Method = '',
                Function = '',
                Constructor = '',
            },
        },
        config = function(_, opts)
            require('lspkind').init(opts)
        end,
    },
    {
        'nvimdev/lspsaga.nvim',
        event = 'VeryLazy',
        opts = {
            lightbulb = { virtual_text = false },
            border_style = 'rounded',
            rename = {
                quit = 'q',
                exec = '<CR>',
                in_select = false,
            },
            code_action = { show_server_name = true },
            symbol_in_winbar = { enable = false },
            ui = {
                theme = 'round',
                border = 'rounded',
                winblend = vim.g.neovide and 60 or 0,
            },
            diagnostic = { on_insert = false }
        },
        config = function(_, opts)
            opts.ui.kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind()
            require('lspsaga').setup(opts)
        end
    },
    {
        'kevinhwang91/nvim-ufo',
        event = 'VeryLazy',
        opts = {
            open_fold_hl_timeout = 0,
            close_fold_kinds = { 'imports', 'regions' }
        }
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
    {
        'antosha417/nvim-lsp-file-operations',
        requires = { 'plenary.nvim' },
        config = true
    },
}
