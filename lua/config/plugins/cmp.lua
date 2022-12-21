return {
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    dependencies = {
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',

        { 'saadparwaiz1/cmp_luasnip', event = 'InsertCharPre' },
        { 'lukas-reineke/cmp-rg', event = 'InsertCharPre' },
        { 'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertCharPre' },
        { 'hrsh7th/cmp-calc', event = 'InsertCharPre' },
        'rcarriga/cmp-dap'

    },
    config = function()
        local cmp = require('cmp')

        cmp.setup {
            duplicates = {
                nvim_lsp    = 1,
                luasnip     = 1,
                cmp_tabnine = 1,
                buffer      = 1,
                path        = 1,
            },
            snippet    = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
            window     = {
                completion = cmp.config.window.bordered {
                    winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
                    scrolloff    = 2,
                },
                documentation = cmp.config.window.bordered {
                    winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
                    scrolloff    = 2,
                },
            },
            mapping    = {
                ['<C-e>']     = cmp.mapping.close(),
                ['<C-p>']     = cmp.mapping.select_prev_item(),
                ['<C-n>']     = cmp.mapping.select_next_item(),
                ['<C-y>']     = cmp.mapping.confirm { select = false },
                ['<CR>']      = cmp.mapping.confirm { select = false },
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-d>']     = cmp.mapping.scroll_docs(5),
                ['<C-f>']     = cmp.mapping.scroll_docs(-5),
                ['<Tab>']     = cmp.mapping(function(fallback)
                    if  cmp.visible() then
                        cmp.select_next_item()
                    elseif require('luasnip').jumpable(1) then
                        require('luasnip').jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's', 'c' }),

                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if  cmp.visible() then
                        cmp.select_prev_item()
                    elseif require('luasnip').jumpable(-1) then
                        require('luasnip').jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's', 'c' }),
            },
            sources    = cmp.config.sources({
                { name = 'luasnip', max_item_count = 2 },
                { name = 'nvim_lsp' },
                { name = 'neorg' },
                -- { name = 'lab.quick_data', keyword_length = 4 },
                { name = 'crates' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'calc' },
            }, {
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'rg', keyword_length = 4 },
                }),

            -- completion = {
            --     completeopt = 'menu,menuone',
            -- },

            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = require('lspkind').cmp_format {
                    mode = 'symbol',
                    maxwidth = 50,
                    ellipsis_char = '...',
                    menu = {
                        buffer = '[buffer]',
                        path = '[path]',
                        rg = '[rg]',
                        calc = '[calc]',
                    },
                    before = function(entry, vim_item)
                        vim_item.abbr = ' ' .. vim_item.abbr
                        return vim_item
                    end
                },
            },
            experimental = { ghost_text = true },
        }

        cmp.setup.cmdline({ '/', '?' }, {
            sources = { { name = 'buffer' } },
        })

        cmp.setup.cmdline(':', {
            sources = {
                { name = 'cmdline' },
                { name = 'path' },
            },
        })

        cmp.setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
            sources = { { name = 'dap' } },
        })
    end,
}
