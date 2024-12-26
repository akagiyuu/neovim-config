local _cmp = {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'lukas-reineke/cmp-rg',
        {
            'tzachar/cmp-fuzzy-buffer',
            dependencies = { 'tzachar/fuzzy.nvim', }
        },
        'FelipeLema/cmp-async-path',
        'ray-x/cmp-sql',
    },
}

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end
_cmp.config = function()
    local cmp = require('cmp')

    cmp.setup {
        duplicates   = {
            nvim_lsp     = 1,
            luasnip      = 1,
            cmp_tabnine  = 1,
            fuzzy_buffer = 1,
            async_path   = 1,
        },
        snippet      = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
        window       = {
            completion = cmp.config.window.bordered {
                winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None',
                scrolloff    = 2,
            },
            documentation = cmp.config.window.bordered {
                winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None',
                scrolloff    = 2,
            },
        },
        mapping      = cmp.mapping.preset.insert {
            ['<C-e>']     = cmp.mapping.close(),
            ['<CR>']      = cmp.mapping.confirm(),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-b>']     = cmp.mapping.scroll_docs(-5),
            ['<C-f>']     = cmp.mapping.scroll_docs(5),
            ['<Tab>']     = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require('luasnip').jumpable(1) then
                    require('luasnip').jump(1)
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>']   = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require('luasnip').jumpable(-1) then
                    require('luasnip').jump(-1)
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        sources      = cmp.config.sources(
            {
                { name = 'luasnip',      max_item_count = 2 },
                { name = 'nvim_lsp' },
                { name = 'crates' },
                { name = 'neorg' },
                -- { name = 'lab.quick_data', keyword_length = 4 },
                { name = 'fuzzy_buffer', max_item_count = 2 },
                { name = 'async_path' },
                { name = 'sql' },
            },
            {
                { name = 'rg', keyword_length = 4 },
            }
        ),

        -- completion = {
        --     completeopt = 'menu,menuone',
        -- },

        formatting   = {
            fields = { 'kind', 'abbr', 'menu' },
            format = require('lspkind').cmp_format {
                mode = 'symbol',
                maxwidth = 50,
                ellipsis_char = '...',
                menu = {
                    fuzzy_buffer = '[buffer]',
                    async_path = '[path]',
                    rg = '[rg]',
                },
                symbol_map = {
                    sql = '',
                    Codeium = '',
                },
                before = function(_, vim_item)
                    vim_item.abbr = ' ' .. vim_item.abbr
                    return vim_item
                end
            },
        },
        experimental = { ghost_text = true },
    }

    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources { { name = 'fuzzy_buffer' } },
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
            { name = 'cmdline' },
            { name = 'async_path' }
        },
    })
end

return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    event = { 'InsertEnter' },
    build = 'cargo build --release',
    opts = {
        keymap = { preset = 'default' },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'normal'
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    },
    opts_extend = { 'sources.default' }
}
