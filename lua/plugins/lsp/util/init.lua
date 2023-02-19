return {
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
                Constructor = '',
                Key = '',
                Null = 'NULL',
                Object = '⦿',
                Package = '',
                Property = '',
                Reference = '',
                Snippet = '',
                String = '𝓐',
                TypeParameter = '',
                Unit = '',
            },
        },
        config = function(_, opts)
            require('lspkind').init(opts)
        end,
    },
    {
        'glepnir/lspsaga.nvim',
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
                kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
            },
        }
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
    require(... .. '.refactoring'),
    require(... .. '.null-ls'),
}
