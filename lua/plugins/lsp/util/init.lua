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
            symbol_in_winbar = {
                enable = false,
                separator = '   ',
                show_file = true,
            },
            ui = {
                -- currently only round theme
                theme = 'round',
                -- border type can be single,double,rounded,solid,shadow.
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
            enable_get_fold_virt_text = true,
            open_fold_hl_timeout = 0,
            -- provider_selector = function(_, _, _) return { 'treesitter', 'indent' } end,
            -- fold_virt_text_handler = handler,
            -- preview = {
            --     win_config = {
            --         winblend = 0,
            --     },
            -- },
            close_fold_kinds = { 'imports', 'regions' }
        }
    },
    require(... .. '.refactoring'),
    require(... .. '.null-ls'),
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
