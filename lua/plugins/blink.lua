return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'mikavilpas/blink-ripgrep.nvim',
        {
            'xzbdmw/colorful-menu.nvim',
            opts = {}
        }
    },
    build = 'cargo build --release',
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono'
        },
        sources = {
            default = {
                'lsp',
                'path',
                'snippets',
                'buffer',
                'ripgrep'
            },
            providers = {
                lsp = {
                    async = true,
                },
                ripgrep = {
                    module = 'blink-ripgrep',
                    name = 'Ripgrep',
                    opts = {
                        prefix_min_len = 5,
                    }
                }
            },
        },
        fuzzy = {
            implementation = 'rust',
            sorts = {
                'exact',
                -- defaults
                'score',
                'sort_text',
            },
        },
        completion = {
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            list = {
                selection = {
                    preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
                    auto_insert = function(ctx) return ctx.mode ~= 'cmdline' end
                }
            },
            menu = {
                border = 'rounded',
                draw = {
                    columns = { { 'kind_icon' }, { 'label', gap = 1 } },
                    components = {
                        label = {
                            width = { fill = true, max = 60 },
                            text = function(ctx)
                                local highlights_info = require('colorful-menu').blink_highlights(ctx)
                                if highlights_info ~= nil then
                                    -- Or you want to add more item to label
                                    return highlights_info.label
                                else
                                    return ctx.label
                                end
                            end,
                            highlight = function(ctx)
                                local highlights = {}
                                local highlights_info = require('colorful-menu').blink_highlights(ctx)
                                if highlights_info ~= nil then
                                    highlights = highlights_info.highlights
                                end
                                for _, idx in ipairs(ctx.label_matched_indices) do
                                    table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
                                end
                                -- Do something else
                                return highlights
                            end,
                        },
                    },
                },
            },
            documentation = {
                auto_show = true,
                treesitter_highlighting = true,
                window = { border = 'rounded' },
            },
            ghost_text = {
                enabled = true
            }
        },
        signature = {
            enabled = true,
            window = { border = 'rounded' }
        }
    },
}
