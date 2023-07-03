return {
    {
        'yioneko/nvim-vtsls',
        ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    },
    {
        'lvimuser/lsp-inlayhints.nvim',
        init = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    if not (args.data and args.data.client_id) then
                        return
                    end

                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    require('lsp-inlayhints').on_attach(client, bufnr)
                end,
            })
        end,
        config = function()
            require('lsp-inlayhints').setup()
            vim.api.nvim_set_hl(0, 'LspInlayHint', { link = 'Comment', bg = 'NONE' })
        end
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
        event = 'LspAttach',
        opts = {
            lightbulb = { virtual_text = false },
            border_style = 'rounded',
            rename = {
                quit = 'q',
                exec = '<CR>',
                in_select = false,
            },
            code_action = { show_server_name = true },
            symbol_in_winbar = {
                enable = true,
                respect_root = true,
                separator = ' > ',
            },
            ui = {
                theme = 'round',
                border = 'rounded',
                winblend = vim.g.neovide and 60 or 0,
            },
            diagnostic = { on_insert = false }
        },
        config = function(_, opts)
            opts.ui.kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind()
            opts.ui.kind['Folder'] = { '', 'NONE' }
            require('lspsaga').setup(opts)
        end
    },
    {
        'kevinhwang91/nvim-ufo',
        event = 'LspAttach',
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
        'antosha417/nvim-lsp-file-operations',
        config = true
    },
}
