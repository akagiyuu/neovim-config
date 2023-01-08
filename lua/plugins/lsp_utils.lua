return {
    {
        'onsails/lspkind.nvim',
        config = function()
            require('lspkind').init {
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
            }
        end,

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
        config = true
    },
    {
        'glepnir/lspsaga.nvim',
        event = 'VeryLazy',
        config = function()
            require('lspsaga').init_lsp_saga {
                move_in_saga = {
                    prev = '<Up>',
                    next = '<Down>',
                },
                code_action_keys = {
                    quit = 'q',
                    exec = '<CR>',
                },
                code_action_lightbulb = {
                    virtual_text = false,
                },
                rename_action_quit = '<Esc>',
                border_style = 'rounded',
                rename_in_select = false,

                symbol_in_winbar = {
                    in_custom = false,
                    enable = not vim.g.started_by_firenvim,
                    separator = '   ',
                    show_file = true,
                },
            }
        end
    }
}
